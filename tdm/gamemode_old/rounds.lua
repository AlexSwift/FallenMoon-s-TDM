round = {}
MapList = {}

MapList[1] = "gm_construct"
MapList[2] = "gm_flatgrass"

-- Variables
round.Break	= 60	-- 60 second breaks
round.Time	= 15	-- 15 minutes 

-- Read Variables
round.TimeLeftM = -1
round.TimeLeftS = -1
round.Breaking = false

function round.Broadcast(Text)
	for k, v in pairs(player.GetAll()) do
		v:ConCommand("play buttons/button17.wav")
		v:ChatPrint("[Server] "..Text)
	end
end

function round.Begin()
	round.TimeLeftS = 0
	round.Broadcast("Round starting! Round ends in " .. round.Time .. " minutes!")
	round.TimeLeftM = round.Time
end

function round.End()
	for k, v in pairs( player.GetAll() ) do
		v:databaseSetValue( "credit", v:databaseGetValue( "credit" ) + (10 * v:Frags()) )
	end
	
	round.Broadcast("Round over! Next map in " .. round.Break .. " seconds!")
	round.TimeLeft = round.Break
end

function round.Handle()
	if (round.TimeLeftM == -1 and round.TimeLeftS == -1) then -- Start the first round
		round.Begin()
		return
	end
	
	if round.TimeLeftS == 0 and TimeLeftM > 0 then
		round.TimeLeftS = 60
		round.TimeLeftM = round.TimeLeftM - 1
	end
	
	for k, v in pairs( player.GetAll() ) do
		v:SetNWInt( "RoundTimeLeftS", round.TimeLeftS )
		v:SetNWInt( "RoundTimeLeftM", round.TimeLeftM )
	end
	
	round.TimeLeftS = round.TimeLeftS - 1
	
	if (round.TimeLeftM == 0 and round.TimeLeftS == 0) then
		if changeLevel then
			mapChoose = math.random( 1, #MapList )
			RunConsoleCommand("ulx", "changelevel", MapList[mapChoose])
		end
	end
end
timer.Create("round.Handle", 1, 0, round.Handle)