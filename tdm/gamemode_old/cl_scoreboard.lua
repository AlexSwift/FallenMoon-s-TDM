local clbackground = Color(235,235,235,255) 	// Default color is 235,235,235,255
local topbackground = Color(38,38,38,255) 		// Default color is 63,67,78,255
local tagsbackground = Color(54,54,54,255) 		// Default color is 54,54,54,255
local rowcolor = Color(79,83,95,255)			// Default color is 79,83,95,255
local rowhovercolor = Color(255,255,255,0)		// Default color is 255,255,255,0
local colorrowteam = false						// Default false, if it is set to true the player row color will be changed based on the team color.
local logo = 0			

/*-------*\
| Warning |
\*-------*/
local w,h = ScrW(),ScrH()
local y,y2 = 0,0

	-- 16:9
if w == 1280 and h == 720 then y = 75 end
if w == 1360 and h == 768 then y = 35 end
if w == 1366 and h == 768 then y = 35 end
if w == 1600 and h == 900 then y = 0 y2 = 80 end
if w == 1920 and h == 1080 then y = 0 y2 = 235 end
	-- 16:10
if w == 1680 and h == 1050 then y = 0 y2 = 120 end	
if w == 1600 and h == 1024 then y = 0 y2 = 80 end	
if w == 1440 and h == 900 then y = 0 y2 = 0 end	
if w == 1280 and h == 800 then y = 80 y2 = 0 end	
if w == 1280 and h == 768 then y = 80 y2 = 0 end		
	-- 4:3
if w == 1280 and h == 1024 then y = 80 y2 = 0 end	
if w == 1280 and h == 900 then y = 80 y2 = 0 end	
if w == 1152 and h == 864 then y = 140 y2 = 0 end	
--[[ Doesn't support the next resolutions
	1024x768
	800x600
	720x576
	640x480
]]
surface.CreateFont( "Info", {
 font = "Bebas",
 size = 19,
 weight = 500,
 antialias = true
})

surface.CreateFont( "Title", {
 font = "Bebas",
 size = 30,
 weight = 500,
 antialias = true
})

surface.CreateFont( "OtherInfo", {
 font = "Bebas",
 size = 24,
 weight = 500,
 antialias = true
})

surface.CreateFont( "NameRank", {
 font = "Bebas",
 size = 17,
 weight = 500,
 antialias = true
})

local function formatNumber(n)
	n = tonumber(n)
	if (!n) then
		return 0
	end
	if n >= 1e14 then return tostring(n) end
    n = tostring(n)
    sep = sep or ","
    local dp = string.find(n, "%.") or #n+1
	for i=dp-4, 1, -3 do
		n = n:sub(1, i) .. sep .. n:sub(i+1)
    end
    return n
end

function playercom(parent,x,y,text,image,color,name,command)
		
local userbtn = vgui.Create("DButton",parent)
	userbtn:SetPos(x,y)
	userbtn:SetSize(120,35)
	userbtn:SetTextColor(Color(255,255,255))
	userbtn:SetText(text)
	userbtn:SetImage(image)
	userbtn.Paint = function(self)
			draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),Color(51,51,51,255))
			surface.SetDrawColor(color)
			surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
	end

	userbtn.DoClick = function()
		surface.PlaySound("buttons/button9.wav")
		chat.AddText(Color(255,60,60),"["..name.."]",Color(255,255,255)," was copied, just use CTRL+V to paste it.")
		SetClipboardText(command)
	end
	return userbtn
end

function command(parent,x,y,text,image,color,command,...)
		
local btn = vgui.Create("DButton",parent)
	btn:SetPos(x,y)
	btn:SetSize(120,35)
	btn:SetTextColor(Color(255,255,255))
	btn:SetText(text)
	btn:SetImage(image)
	btn.Paint = function(self)
			draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),Color(51,51,51,255))
			surface.SetDrawColor(color)
			surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
	end
	
	local cmdArgs = {...}
	btn.DoClick = function()
		surface.PlaySound("buttons/button9.wav")
		RunConsoleCommand(command,unpack(cmdArgs))
	end
	return btn
end

function kick(parent,x,y,text,reason,image,color,command,ply)
			
	local cbtn = vgui.Create("DButton",parent)
		cbtn:SetSize(120,35)
		cbtn:SetPos(x,y)
		cbtn:SetTextColor(Color(255,255,255))
		cbtn:SetText(text)
		cbtn:SetImage(image)
		cbtn.Paint = function(self)
			draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),Color(51,51,51,255))
			surface.SetDrawColor(color)
			surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
		end
		cbtn.DoClick = function()	
			surface.PlaySound("buttons/button9.wav")		
		local reportmsg = vgui.Create( "DFrame" )
			reportmsg:SetPos(ScrW() / 2 - 200, ScrH() / 2 - 120)
			reportmsg:SetSize(400,100)
			reportmsg:SetTitle("")
			reportmsg:SetVisible(true)
			reportmsg:SetDraggable(false)
			reportmsg:SetBackgroundBlur(true)
			reportmsg:ShowCloseButton(true)
			reportmsg:MakePopup()	
			
		local tellad = vgui.Create("DLabel",reportmsg)
			tellad:SetPos(reportmsg:GetWide()/2-100,22)
			tellad:SetText(reason)
			tellad:SizeToContents()		
		
		story = vgui.Create("DTextEntry",reportmsg)
			story:SetPos(10,42)
			story:SetTall(20)
			story:SetWide(reportmsg:GetWide()-20)
			story:RequestFocus()	

		local accept = vgui.Create("DButton",reportmsg)
			accept:SetPos(100,65)
			accept:SetSize(80,30)
			accept:SetImage('icon16/accept.png')	
			accept:SetText('Accept')
			accept.DoClick = function()
				if IsValid(reportmsg) then
					reportmsg:Close()
				end		
				AlertMessage = story:GetValue()	
				RunConsoleCommand("ulx",command,ply,AlertMessage)	
			end
		
		local cancel = vgui.Create("DButton",reportmsg)
			cancel:SetPos(230,65)
			cancel:SetSize(80,30)
			cancel:SetImage('icon16/cross.png')	
			cancel:SetText('Cancel')
			cancel.DoClick = function()
				if IsValid(reportmsg) then
					reportmsg:Close()
				end
			end
		end
	return btn
end

function ban(parent,x,y,text,reason,image,color,command,ply)
			
	local cbtn = vgui.Create("DButton",parent)
		cbtn:SetSize(120,35)
		cbtn:SetPos(x,y)
		cbtn:SetTextColor(Color(255,255,255))
		cbtn:SetText(text)
		cbtn:SetImage(image)
		cbtn.Paint = function(self)
			draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),Color(51,51,51,255))
			surface.SetDrawColor(color)
			surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
		end
		cbtn.DoClick = function()	
			surface.PlaySound("buttons/button9.wav")		
			local menu = DermaMenu()
			local Title = vgui.Create("DLabel")
				Title:SetText("  Ban Time:\n")
				Title:SetFont("UiBold")
				Title:SizeToContents()
				Title:SetTextColor(color_black)
					menu:AddPanel(Title)
					menu:AddOption("1 Hour", function() RunConsoleCommand("ulx",command,ply,60) end)
					menu:AddOption("5 Hour", function() RunConsoleCommand("ulx",command,ply,300) end)
					menu:AddOption("1 day", function() RunConsoleCommand("ulx",command,ply,1440) end)
					menu:AddOption("1 week", function() RunConsoleCommand("ulx",command,ply,10080) end)
					menu:AddOption("1 month", function() RunConsoleCommand("ulx",command,ply,40320) end)
					menu:AddOption("Permanently", function() RunConsoleCommand("ulx",command,ply,0) end)
				menu:Open()
		end
	return btn
end

function GM:ScoreboardShow()
gui.EnableScreenClicker(true)

	bg = vgui.Create("DFrame")
		bg:SetSize(800,700)
		bg:SetPos(ScrW()/2-400+y,ScrH()/2-350)
		bg:SetDraggable(false)
		bg:ShowCloseButton(false)
		bg:SetTitle("")
		bg.Paint = function(self)		
			draw.RoundedBox(8,0,0,self:GetWide(),self:GetTall(),Color(0,0,0,255))
			draw.RoundedBox(8,1,1,self:GetWide()-2,self:GetTall()-2,clbackground)
			draw.RoundedBox(0,0,0,self:GetWide(),75,topbackground)
			surface.SetDrawColor(61,61,61,255)
			surface.DrawLine(0,0,self:GetWide(),0)
			surface.SetFont("Title")
			draw.DrawText(GetHostName(),"Title",5,2.5,color_white,TEXT_ALIGN_LEFT)
			draw.DrawText("Time: "..os.date( "%I:%M:%S %p" ),"Info",5,35,color_white,TEXT_ALIGN_LEFT)
			draw.DrawText("Players: "..table.Count(player.GetAll()),"Info",5,55,color_white,TEXT_ALIGN_LEFT)
		end
		
	local plytext = vgui.Create("DPanel",bg)
		plytext:SetSize(bg:GetWide()-2,25)
		plytext:SetPos(1,75)
		plytext.Paint = function(self)
			draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),tagsbackground)
			surface.SetDrawColor(0,255,0,255)
			surface.DrawLine(0,0,self:GetWide(),0)
			surface.SetDrawColor(61,61,61,255)
			surface.DrawLine(0,1,self:GetWide(),1)
			draw.DrawText("Name","Info",5,2.5,color_white,TEXT_ALIGN_LEFT)
			draw.DrawText("Kills  /  Deaths","Info",self:GetWide()/1.2,2.5,color_white,TEXT_ALIGN_CENTER)
			draw.DrawText("Ping","Info",self:GetWide()/1.03,2.5,color_white,TEXT_ALIGN_RIGHT)
			draw.DrawText("Faction","Info",self:GetWide()/1.65,2.5,color_white,TEXT_ALIGN_RIGHT)
		end
		
		
	plist = vgui.Create("DScrollPanel",bg) 		
		plist:SetSize(bg:GetWide()-2,599)	
		plist:SetPos(1,100)
		plist:SetPadding(5)
		plist.Paint = function(self)
			draw.RoundedBoxEx(6,0,0,self:GetWide(),self:GetTall(),Color(0,0,0,0),false,false,true,true)
		end
		
local plys = player.GetAll()
table.sort(plys, function(a, b) return a:Team() > b:Team() end)	
	for k,v in pairs(plys) do
	
		local group = LocalPlayer():GetNWString("usergroup")
		
		local row = vgui.Create("DButton",plist)
			row:SetSize(plist:GetWide(),36)
			row:Dock(TOP)
			row:SetText("")
			row.Paint = function(self)
				if colorrowteam == true then
					draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),team.GetColor(v:Team()))
				else
					draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),rowcolor)
				end
				if v == LocalPlayer() then
					surface.SetDrawColor(255,255,255,math.Clamp(math.sin(RealTime()*4)*100,0,255))
					surface.DrawRect(0,0,self:GetWide(),self:GetTall())
				end					
				draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),rowhovercolor)	
				surface.SetDrawColor(0,0,0,255)
				surface.DrawLine(0,0,self:GetWide(),0)
				surface.SetDrawColor(61,61,61,255)
				surface.DrawLine(0,1,self:GetWide(),1)
				color = color_white
				if v:SteamID() == "STEAM_0:1:33431972" then color = Color(0,204,255,255) end
				draw.DrawText(v:Nick(),"NameRank",38,4,color,TEXT_ALIGN_LEFT)				
				draw.DrawText(v:GetNWString("usergroup"),"NameRank",38,19,color,TEXT_ALIGN_LEFT)				
				--draw.DrawText(team.GetName(v:Team()),"OtherInfo",self:GetWide()/2,5,color,TEXT_ALIGN_CENTER)	
				draw.DrawText(v:Frags(),"OtherInfo",self:GetWide()/1.2-27,2.5,color,TEXT_ALIGN_CENTER)
				draw.DrawText(v:Deaths(),"OtherInfo",self:GetWide()/1.2+20,2.5,color,TEXT_ALIGN_CENTER)
				draw.DrawText(v:Ping(),"OtherInfo",self:GetWide()/1.03,2.5,color,TEXT_ALIGN_RIGHT)				
				draw.DrawText(team.GetName(v:Team()),"OtherInfo",self:GetWide()/1.55,2.5,Color(244,244,0),TEXT_ALIGN_RIGHT)							
			end
		if LocalPlayer():IsAdmin() then
			row.DoRightClick = function()
				surface.PlaySound("buttons/button9.wav")
				local options = DermaMenu()
					options:AddOption("Kick", function() RunConsoleCommand("ulx","kick",v:Nick(),"You were kicked by "..LocalPlayer():Nick()) surface.PlaySound("buttons/button9.wav") end):SetImage("icon16/door_out.png")
					options:AddOption("Ban", function() RunConsoleCommand("ulx","ban",v:Nick(),"You were banned by "..LocalPlayer():Nick(),60) surface.PlaySound("buttons/button9.wav") bg:Close() end):SetImage("icon16/delete.png")
					options:AddSpacer()
					options:AddOption("Spectate", function() RunConsoleCommand("ulx","spectate",v:Nick()) surface.PlaySound("buttons/button9.wav") end):SetImage("icon16/zoom.png")
					options:AddSpacer()
				options:Open()
			end
		end
			row.DoClick = function()
				surface.PlaySound("buttons/button9.wav")
				if IsValid(info) then info:SetVisible(false) end
				
			if LocalPlayer():IsAdmin() then infoy = 700 comy = 270 combgy = 295 combgh = 404 else infoy = 300 comy = 170 combgy = 195 combgh = 99 end
				info = vgui.Create("DFrame")
					info:SetSize(263,infoy)
					info:SetPos(bg:GetWide()-760+y2,ScrH()/2-350)
					info:SetDraggable(false)
					info:ShowCloseButton(false)
					info:SetTitle("")
					info.Paint = function(self)
						draw.RoundedBox(8,0,0,self:GetWide(),self:GetTall(),Color(0,0,0,255))
						draw.RoundedBox(8,1,1,self:GetWide()-2,self:GetTall()-2,clbackground)
						if logo == 0 then
							draw.RoundedBox(0,0,0,self:GetWide(),75,topbackground)
						else
							surface.SetDrawColor(255,255,255,255)
							surface.SetMaterial(logo)
							surface.DrawTexturedRect(0,0,self:GetWide(),75)
						end
						surface.SetDrawColor(61,61,61,255)
						surface.DrawLine(0,0,self:GetWide(),0)
					end
				
				local infotab = vgui.Create("DPanel",info)
					infotab:SetSize(info:GetWide()-2,25)
					infotab:SetPos(1,75)
					infotab.Paint = function(self)
						draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),tagsbackground)
						surface.SetDrawColor(0,0,0,255)
						surface.DrawLine(0,0,self:GetWide(),0)
						surface.SetDrawColor(61,61,61,255)
						surface.DrawLine(0,1,self:GetWide(),1)
						draw.DrawText("Information","Info",5,2.5,color_white,TEXT_ALIGN_LEFT)
					end	

				local infobg = vgui.Create("DPanel",info)
					infobg:SetSize(info:GetWide()-2,170)
					infobg:SetPos(1,100)
					infobg.Paint = function(self)
						draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),clbackground)
						surface.SetDrawColor(0,0,0,255)
						surface.DrawLine(0,0,self:GetWide(),0)
						surface.SetDrawColor(61,61,61,255)
						surface.DrawLine(0,1,self:GetWide(),1)
						draw.DrawText(v:Nick(),"Info",70,5,Color(60,60,60),TEXT_ALIGN_LEFT)
						draw.DrawText(v:GetNWString("usergroup"),"Info",69,25,Color(60,60,60),TEXT_ALIGN_LEFT)
						draw.DrawText(team.GetName(v:Team()),"Info",69,45,Color(60,60,60),TEXT_ALIGN_LEFT)
						if LocalPlayer():IsAdmin() then
							draw.DrawText("Health: "..(v:Health() or 0).."%","Info",69,110,Color(60,60,60),TEXT_ALIGN_LEFT)
							draw.DrawText("Armor: "..(v:Armor() or 0).."%","Info",69,130,Color(60,60,60),TEXT_ALIGN_LEFT)
						end
					end
					
					local selavatar = vgui.Create("AvatarImage",infobg)
						selavatar:SetSize(64,64)
						selavatar:SetPos(2,4)
						selavatar:SetPlayer(v,64)
						AvatarShouldDraw = 0
						
				if LocalPlayer():IsAdmin() then 				
					local model = vgui.Create("DModelPanel",infobg)
						model:SetSize(150,150)
						model:SetPos(-40,20)
						model:SetModel(v:GetModel())
						model:SetCamPos( Vector(50,-5,65))
						model:SetLookAt( Vector(0,0,66))
					function model:LayoutEntity( Entity ) return end				
				end
				
				local commandstab = vgui.Create("DPanel",info)
					commandstab:SetSize(info:GetWide()-2,25)
					commandstab:SetPos(1,comy)
					commandstab.Paint = function(self)
						draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),tagsbackground)
						surface.SetDrawColor(0,0,0,255)
						surface.DrawLine(0,0,self:GetWide(),0)
						surface.SetDrawColor(61,61,61,255)
						surface.DrawLine(0,1,self:GetWide(),1)
						draw.DrawText("Commands","Info",5,2.5,color_white,TEXT_ALIGN_LEFT)
					end
					
				local commandsbg = vgui.Create("DScrollPanel",info)
					commandsbg:SetSize(info:GetWide()-2,combgh)
					commandsbg:SetPos(1,combgy)
					commandsbg:SetPadding(5)
					commandsbg.Paint = function(self)
						draw.RoundedBoxEx(8,0,0,self:GetWide(),self:GetTall(),clbackground,false,false,true,true)
						surface.SetDrawColor(0,0,0,255)
						surface.DrawLine(0,0,self:GetWide(),0)
						surface.SetDrawColor(61,61,61,255)
						surface.DrawLine(0,1,self:GetWide(),1)
					end	
					
				if LocalPlayer():IsAdmin() then 
				
					kick(commandsbg,5,10,"Kick","Enter the reason for kicking him.","icon16/door_out.png",Color(255,50,50,255),"kick",v:Nick())
					ban(commandsbg,135,10,"Ban","Enter the reason for banning him.","icon16/door.png",Color(255,50,50,255),"ban",v:Nick())	
					command(commandsbg,5,50,"Freeze","icon16/tag_blue.png",Color(50,50,250,255),"ulx","freeze",v:Nick())
					command(commandsbg,135,50,"Un Freeze","icon16/tag_blue_delete.png",Color(50,50,250,255),"ulx","unfreeze",v:Nick())
					command(commandsbg,5,90,"Slay","icon16/wand.png",Color(250,150,0,255),"ulx","slay",v:Nick())
					command(commandsbg,135,90,"Slap","icon16/sport_raquet.png",Color(250,150,0,255),"ulx","slap",v:Nick())
					command(commandsbg,5,130,"GoTo","icon16/arrow_up.png",Color(50,250,50,255),"ulx","goto",v:Nick())
					command(commandsbg,135,130,"Bring","icon16/arrow_redo.png",Color(50,250,50,255),"ulx","bring",v:Nick())
					command(commandsbg,5,170,"Teleport","icon16/arrow_out.png",Color(50,250,50,255),"ulx","teleport",v:Nick())		
					command(commandsbg,135,170,"NoClip","icon16/weather_sun.png",Color(255,250,255,255),"ulx","noclip",v:Nick())
					command(commandsbg,5,210,"Mute Chat","icon16/user_delete.png",Color(255,200,0,255),"ulx","mute",v:Nick())
					command(commandsbg,135,210,"UnMute Chat","icon16/user_comment.png",Color(255,200,0,255),"ulx","unmute",v:Nick())
					command(commandsbg,5,250,"Mute Mic","icon16/sound_mute.png",Color(178,0,255,255),"ulx","gag",v:Nick())
					command(commandsbg,135,250,"UnMute Mic","icon16/sound.png",Color(178,0,255,255),"ulx","ungag",v:Nick())
					
					command(commandsbg,5,290,"Strip","icon16/gun.png",Color(128,128,128,255),"ulx","strip",v:Nick())
					command(commandsbg,135,290,"Spectate","icon16/world.png",Color(128,128,128,255),"ulx","spectate",v:Nick())
					command(commandsbg,5,330,"Jail","icon16/text_align_justify.png",Color(0,0,0,255),"ulx","jail",v:Nick())
					
					local setteam = vgui.Create("DButton",commandsbg)
						setteam:SetSize(120,35)
						setteam:SetPos(135,330)
						setteam:SetTextColor(Color(255,255,255))
						setteam:SetText("Set Team")	
						setteam:SetImage("icon16/application_view_tile.png")	
						setteam.Paint = function()
							draw.RoundedBox(0,0,0,setteam:GetWide(),setteam:GetTall(),Color(51,51,51,255))
							surface.SetDrawColor(0,0,0,255)
							surface.DrawOutlinedRect(0,0,setteam:GetWide(),setteam:GetTall())
						end
						setteam.DoClick = function()
							surface.PlaySound("buttons/button9.wav")
						local menu = DermaMenu()
						local Title = vgui.Create("DLabel")
						Title:SetText("  Teams:\n")
						Title:SetFont("UiBold")
						Title:SizeToContents()
						Title:SetTextColor(color_black)
							menu:AddPanel(Title)
							for k,pls in SortedPairsByMemberValue(team.GetAllTeams(), "Name") do
								menu:AddOption(pls.Name, function() RunConsoleCommand("_FAdmin", "setteam", v:Nick(), k) end)
							end
							menu:Open()
						end
					else
						playercom(commandsbg,5,10,"Copy SteamID","icon16/tag_blue.png",Color(255,200,0,255),"The SteamID",v:SteamID())
						playercom(commandsbg,135,10,"Copy Name","icon16/user_edit.png",Color(255,200,0,255),"The Name",v:Nick())
						playercom(commandsbg,5,50,"Copy Rank","icon16/shield.png",Color(255,200,0,255),"The Rank",v:GetNWString("usergroup"))
						
						local userbtn = vgui.Create("DButton",commandsbg)
							userbtn:SetSize(120,35)
							userbtn:SetPos(135,50)
							userbtn:SetTextColor(Color(255,255,255))
							userbtn:SetText("Steam Profile")
							userbtn:SetImage("icon16/world.png")
							userbtn.Paint = function(self)
									draw.RoundedBox(0,0,0,self:GetWide(),self:GetTall(),Color(51,51,51,255))
									surface.SetDrawColor(Color(255,50,50,255))
									surface.DrawOutlinedRect(0,0,self:GetWide(),self:GetTall())
							end

							userbtn.DoClick = function()
								surface.PlaySound("buttons/button9.wav")
								chat.AddText(Color(255,60,60),"[Steam Profile]",Color(255,255,255)," you opened "..v:Nick().."'s steam profile.")
								v:ShowProfile()
							end
				end -- End if Player is Admin
			end -- End Row DoClick
			
		local avatar = vgui.Create("AvatarImage",row)
			avatar:SetSize(30,30)
			avatar:SetPos(2,4)
			avatar:SetPlayer(v,64)
			AvatarShouldDraw = 0
			
		function row:Think() 
			if not IsValid(v) then 
				row:Remove()
				if IsValid(avatar) then avatar:Remove() end	
				if IsValid(info) then info:Remove() end
			end	
		end -- End Row Think	
	end -- End For Loop
end // End Scoreboard

function GM:ScoreboardHide()
gui.EnableScreenClicker(false)
	if IsValid(bg) then bg:Remove() end
	if IsValid(info) then info:Remove() end
end