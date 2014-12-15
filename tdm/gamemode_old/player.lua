local ply = FindMetaTable("Player")

PlayerLoadoutTable = {}
function ply:SpawnPlayerLoadout()
	for k, v in pairs(PlayerLoadoutTable) do
		ply:Give(v)
	end
end

function GM:PlayerDeath(ply)
	ply:Spectate( OBS_MODE_CHASE )
	ply:SpectateEntity( ent )
	timer.Create("Deathtimer", 5, 1, function() if !ply:Alive()  then ply:Spawn() end end)
end