include( 'sh_simploo.lua' )
include( 'sh_item.lua' )

GM.Name		= "Team Deathmatch"
GM.Author	= "Robheadshot & FallenMoons & Alex Swift"
GM.Email	= "N/A"
GM.Website	= "N/A"

team.SetUp( 0,	"Blood-Sworn",		Color( 255, 0, 0 ) )
team.SetUp( 1,	"Phoenix",			Color( 255, 255, 0 ) )
team.SetUp( 2,	"Alpha & Omega",	Color( 0, 255, 255 ) )
team.SetUp( 3,	"Terra",			Color( 0, 255, 0 ) )

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

