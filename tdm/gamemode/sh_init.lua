GM.Name		= "Team Deathmatch"
GM.Author	= "Robheadshot & FallenMoons"
GM.Email	= "N/A"
GM.Website	= "N/A"

team.SetUp( 0,	"Blood-Sworn",		Color( 255, 0, 0 ) )
team.SetUp( 1,	"Phoenix",			Color( 255, 255, 0 ) )
team.SetUp( 2,	"Alpha & Omega",	Color( 0, 255, 255 ) )
team.SetUp( 3,	"Terra",			Color( 0, 255, 0 ) )

local ply = FindMetaTable("Player")

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

function ForceRespawn()
ply:Spawn()
end
concommand.Add("ForceRespawn", ForceRespawn)

// Load all files
GM.LuaFolder = string.sub(GM.Folder,11,-1)

function IsValid( object )
	local object = object or nil
	local etype = type(object);
	if etype == "number" or etype == "function" or etype == "string" or etype == "boolean" or etype == "thread" then
		error("What the fuck just passed me a non-ent? "..etype,2)
	end
	if (not (object and object.IsValid)) then return false end
	return object:IsValid()
end

function validfile(filename) -- A curse brought on by editing things in mac/linux - Unwanted files!
	return filename:sub(1,1) ~= "." and not filename:find"~";
end

local function doload(path, name) -- path must be the relative path from the Server/gamemode/ folder
	if (path:sub(-1) ~= "/") then
		path = path.."/";
	end
	
	print("[Server] Loading "..name.."'s");
	local count = 0;
	local failcount = 0;
	local subd, fname;
	
	for k, v in pairs( file.Find(GM.LuaFolder.."/gamemode/"..path.."*.lua", "LUA") ) do
		if (validfile(v)) then
			subd = v:sub(1, 3);
			fname = v:sub(4,-5);
			failname = v:sub(1, 99);
			if (subd == "sh_") then
				include(path..v);
				AddCSLuaFile(path..v);
				print(" Loaded the shared "..fname.." "..name..".");
				count = count + 1;
			end
			if (subd == "sv_") then
				include(path..v);
				print(" Loaded the serverside "..fname.." "..name..".");
				count = count + 1;
			end
			if (subd == "cl_") then
				include(path..v);
				count = count + 1;
				print(" Loaded the clientside "..fname.." "..name..".");
			end
			if !(subd == "cl_" or subd == "sv_" or subd == "sh_") then
				print(" File: "..failname.." in the "..name.."'s folder could not be identifyed.");
				failcount = failcount + 1;
			end
		end
	end
	print("[Server] Loaded "..count.." "..name.."'s.")
	if failcount == 0 then
		print("[Server] All files successfully loaded in the "..name.."'s Folder.\n")
	else
		print("[Server] Could Not Load "..failcount.." Files In The "..name.."'s Folder.\n")
	end
end
doload("modules/",     "Module");

function AddDir(dir) // Recursively adds everything in a directory to be downloaded by client 
	for k,v in pairs(file.Find(dir.."/*", "GAME")) do
		resource.AddFile(dir.."/"..v)
		//Debug remember to remove
		print(v.." Added To Resource's")
	end
end
AddDir("materials/tdm/vgui/logos")
AddDir("materials/lavadeeto/weapon hud")
AddDir("materials/lavadeeto/minimap")
AddDir("materials/lavadeeto/extras")