Teams = {}

team.SetUp( 0,	"Blood-Sworn",		Color( 255, 0, 0 ) )
team.SetUp( 1,	"Phoenix",			Color( 255, 255, 0 ) )
team.SetUp( 2,	"Alpha & Omega",	Color( 0, 255, 255 ) )
team.SetUp( 3,	"Terra",			Color( 0, 255, 0 ) )

function Teams.SelectTeam( )

	local _AlivePlayers = {}
	local _AssignTeam = 0
	
	for i = 0, 3 do
		_AlivePlayers[ i ] = Teams.GetAlivePlayers( i )
	end
	
	for i = 0, 3 do
		
		if _AlivePlayers[ _AssignTeam ] > _AlivePlayers[ i ] then
			_AssignTeam = i
		end
	
	end
	
	return _AssignTeam
	
end

function Teams.GetAlivePlayers( team )

	local count = 0

	for k,v in pairs( player.GetAll() ) do
		
		if not v:Alive() then continue end
		if v:Team() ~= team then continue end
		
		count = count + 1
		
	end
	
	return count
	
end

function Teams.BalanceTeams()

	local _teams = {}
	local _data = {}
	
	for i = 0,3 do
		
		_teams[ i ] = { i, Teams.GetAlivePlayers( i ) }
		
	end
	
	local function SwapEntries( t, a, b )
	
		local c = t[a]
		local d = t[b]
		t[b] = c
		t[a] = d
		
	end
	
	for i = 0, 6 do
		
		if  _teams[ i % 4 ][2] - _teams[ (i+1) % 4 ][2] >= 2 then
			SwapEntries( _teams, i % 4, (i+1) % 4 )
		elseif _teams[ i % 4 ][2] - _teams[ (i+1) % 4 ][2] <= -2
			SwapEntries( _teams, (i + 1) % 4, (i) % 4 )
		end
		
	end
	
	table.Random( team.GetPlayers( _teams[1][1] ) ):SetTeam( team.GetPlayers( _teams[4][1] )
	
	local maxdiff = 0

end

timer.Create( 15, 0, 'TeamBalance', function() 
	Teams.BalanceTeams()
end)

hook.Add( 'PlayerInitialSpawn', 'AssignTeam', function( ply )

	ply:SetTeam( Teams.SelectTeam( ) )
	
end)

