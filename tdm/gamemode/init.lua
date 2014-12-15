include( 'sh_init.lua' )
include( 'sv_mysql.lua' )
include( 'sh_profile.lua' )

AddCSLuaFile( 'sh_init.lua' )
AddCSLuaFile( 'sh_simploo.lua' )
AddCSLuafile( 'cl_profile.lua' )

function GM:Initialize( )

	GM.MySQL = MySQL.new()

	if GM.MySQL:Initialize() then
		GM.MySQL:Connect()
	end
	
end

function GM:PlayerConnect( p_sName, p_sIP )

	print("Player " .. p_sName .. " Has Connected To the server with IP: " .. p_sIP )
	
end

function GM:PlayerAuthed( ply, steamID, uniqueID )

	print("Player: "..ply:Nick().." (" .. ply:SteamID() .. " ; " .. ply:UniqueID() ..") has passed authorisation.")
	
	Profile.LoadProfile( ply )
	
end

function GM:PlayerDisconnected( ply )

	ply.Profile:DestroyProfile( )
	
end

function GM:PlayerShouldTakeDamage( victim, ply )

	if ply:IsPlayer() then
		if ply:Team() == victim:Team()  then
			return false
		end
	end
	
	return true
end


