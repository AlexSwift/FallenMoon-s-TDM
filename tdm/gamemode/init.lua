include("sh_init.lua")
include("player.lua")
include("rounds.lua")
include("database/sv_database.lua")
include("database/sh_items.lua")

AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("sh_init.lua")

AddCSLuaFile("database/cl_database.lua")
AddCSLuaFile("database/sh_items.lua")

local oldPrint = print

local function print(s)
	oldPrint("[Server] "..tostring(s))
end

function GM:PlayerConnect( name, ip )
	print("Player Has Connected To the server.")
	print("Player Name: "..name)
	print("Player IP: "..ip)
end

function GM:PlayerInitialSpawn( ply )
	timer.Create( ply:SteamID().."weapontimer", 5, 0, function() giveRandomSwep( ply ) end )
	ply:ConCommand("MainMenu")
end

function GM:PlayerSpawn( ply )
	local model = {}
	model[0] = "models/player/group01/male_01.mdl"
	model[1] = "models/player/group01/male_02.mdl"
	model[2] = "models/player/group01/male_03.mdl"
	model[3] = "models/player/group01/male_04.mdl"
	
	local n = ply:Team()
	ply:SetModel(tostring(model[n]))
	
	ply:SpawnPlayerLoadout()
	
	ply:UnSpectate()
end

function GM:PlayerAuthed( ply, steamID, uniqueID )
	print("Player: "..ply:Nick().." has passed authorisation.")
	print("SteamID: "..ply:SteamID())
	print("UniqueID: "..ply:UniqueID())
	ply:databaseCheck()
end

function GM:PlayerDisconnected( ply )
	print("Player: "..ply:Nick().." has disconnected.")
	print("SteamID: "..ply:SteamID())
	print("UniqueID: "..ply:UniqueID())
	ply:databaseDisconnect()
	print(" ")
	print(ply:Nick().." database saved.")
	timer.Destroy( ply:SteamID().."weapontimer" )
	print("Timer sucesfully destroyed.")
end

local teams = {}

teams[0] = { name = "Blood-Sworn", color = Vector( 1.0, 0.1, 0.1 ) }
teams[1] = { name = "Phoenix", color = Vector( 1.0, 1.0, 0.1 ) }
teams[2] = { name = "Alpha & Omega", color = Vector( 0.1, 1.0, 1.0 ) }
teams[3] = { name = "Terra", color = Vector( 0.1, 1.0, 0.1 ) }

function SetGamemodeTeam( ply, command, args )
	n = args[1]
	n = tonumber(n)
	print(n)
	
	ply:SetTeam( n )
	ply:SetPlayerColor( teams[n].color )
end
concommand.Add("SetGamemodeTeam", SetGamemodeTeam)

function giveRandomSwep( ply )
	chance = math.random(1, 100)
	if chance > 75 then
		rWeap = math.random(1, #weaponsTable)
		ply:inventoryGiveItem(weaponsTable[rWeap])
	end
end
 
function GM:PlayerShouldTakeDamage( victim, ply )
	if ply:IsPlayer() then
		if ply:Team() == victim:Team()  then
			return false
		end
	end
	return true
end

function BF4Spawn()
	for k, ply in pairs(player.GetAll()) do
		ply:SetNetworkedNumber("FBKills",-1)
		ply:SetNetworkedNumber("FBDeaths",-1)		
	end
end
hook.Add( "PlayerInitialSpawn", "BF4Spawn", BF4Spawn )

function BF4NPCDie(NPC,attacker)
	NPC:SetNWBool("FB_ISDEAD", true)
	if attacker:IsPlayer() then 
		attacker:SetNetworkedNumber("FBKills",attacker:GetNWInt("FBKills") + 1)
	end
end
hook.Add("OnNPCKilled","BF4NPCDie",BF4NPCDie)

function BF4KillCountPlayer(ply, attacker, dmginfo) -- Kill count stuff for players 
	ply:SetNetworkedNumber("FBDeaths",ply:GetNWInt("FBDeaths") + 1)
	if attacker:IsPlayer() and ply != attacker then
		attacker:SetNetworkedNumber("FBKills",attacker:GetNWInt("FBKills") + 1)

	end
end
hook.Add("DoPlayerDeath","BF4KillCountPlayer",BF4KillCountPlayer)