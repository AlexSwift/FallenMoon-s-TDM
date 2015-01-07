include( 'sh_simploo.lua' )
include( 'sh_item.lua' )
include( 'sh_teams.lua' )

GM.Name		= "Team Deathmatch"
GM.Author	= "Robheadshot & FallenMoons & Alex Swift"
GM.Email	= "N/A"
GM.Website	= "N/A"

function LoadDirectory( dir )
	
	for k,v in pairs( file.Find( GM.Folder .. '/gamemode/' .. dir .. "*/.lua", "LUA" ) ) do
		include( dir .. '/' .. v )
	end
	
end

function GM:PlayerInitialSpawn( ply )

	Profile.LoadProfile( ply )
	
	if CLIENT then
		mainMenuScreen( )
	end
	
end

