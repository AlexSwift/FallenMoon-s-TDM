function mainMenuScreen( )

	local mainMenu = vgui.Create("DFrame")
	mainMenu:SetSize( ScrW(), ScrH() )
	mainMenu:SetPos( 0, 0 )
	mainMenu:SetTitle("")
	mainMenu:SetDraggable(false)
	mainMenu:ShowCloseButton(false)
	mainMenu:MakePopup()
	mainMenu.Paint = function()
						draw.RoundedBox( 4, 0, 0, ScrW(), ScrH(), Color( 10, 10, 10, 250 ) )
						draw.RoundedBox( 4, 0, 0, ScrW(), ScrH(), Color( 10, 10, 10, 250 ) )
					end
	local Exit = vgui.Create("DButton", mainMenu)
	Exit:SetSize(120, 40)
	Exit:SetPos(ScrW() - 120, ScrH() - 40)
	Exit:SetText("")
	Exit.DoClick = function()
						LocalPlayer():ConCommand("disconnect")
					end
	Exit.Paint = function()
					surface.SetDrawColor(255,255,255,255)
					surface.SetMaterial(Material("materials/tdm/vgui/logos/disconnect.png"))
					surface.DrawTexturedRect(0,0,120,40)
				end
	
	local CreditsIcon = vgui.Create("DButton", mainMenu)
	CreditsIcon:SetSize(42, 42)
	CreditsIcon:SetPos( ScrW() -320, 0)
	CreditsIcon:SetText("")
	CreditsIcon.DoClick = function()return end
	CreditsIcon.Paint = function()
							surface.SetDrawColor(255,255,255,255)
							surface.SetMaterial(Material("materials/tdm/vgui/logos/credits.png"))
							surface.DrawTexturedRect(0,0,42,42)
						end

	local Credits = vgui.Create("DLabel", mainMenu)
	Credits:SetPos( ScrW() -275, 10)
	Credits:SetText("")
	Credits.Paint = function()
						surface.SetTextColor( 200, 200, 200, 255 )
						surface.SetTextPos( 0, 0 )
						surface.SetFont("CreditFont")
						surface.DrawText( LocalPlayer().Profile:GetCredits( ) )	
					end
	
	local GoldIcon = vgui.Create("DButton", mainMenu)
	GoldIcon:SetSize(42, 42)
	GoldIcon:SetPos( ScrW() -160, 0)
	GoldIcon:SetText("")
	GoldIcon.DoClick = function() return end
	GoldIcon.Paint = function()
						surface.SetDrawColor(255,255,255,255)
						surface.SetMaterial(Material("materials/tdm/vgui/logos/gold.png"))
						surface.DrawTexturedRect(0,0,42,42)
					end

	local Gold = vgui.Create("DLabel", mainMenu)
	Gold:SetPos( ScrW() -115, 10)
	Gold:SetText("")
	Gold.Paint = function()
					surface.SetTextColor( 200, 200, 0, 255 )
					surface.SetTextPos( 0, 0 )
					surface.SetFont("CreditFont")
					surface.DrawText( LocalPlayer().Profile:GetGold( ) )	
				end
	
	local Team0 = vgui.Create("DButton", mainMenu)
	Team0:SetSize( 320, 80 )
	Team0:SetPos( 60, 160 )
	Team0:SetText("")
	Team0.DoClick = function()
						RunConsoleCommand("SetGamemodeTeam", "0")
						RunConsoleCommand("inventory")
						mainMenu:Close()
					end
	Team0.Paint = function()
						surface.SetDrawColor(255,255,255,255)
						surface.SetMaterial(Material("materials/tdm/vgui/logos/bloodsworn.png"))
						surface.DrawTexturedRect(0,0,320,80)
					end	
	
	local Team1 = vgui.Create("DButton", mainMenu)
	Team1:SetSize( 320, 80 )
	Team1:SetPos( 60, 290 )
	Team1:SetText("")
	Team1.DoClick = function()
						RunConsoleCommand("SetGamemodeTeam", "1")
						RunConsoleCommand("inventory")
						mainMenu:Close()
					end
	Team1.Paint = function()
						surface.SetDrawColor(255,255,255,255)
						surface.SetMaterial(Material("materials/tdm/vgui/logos/pheonix.png"))
						surface.DrawTexturedRect(0,0,320,80)
					end	
	
	local Team2 = vgui.Create("DButton", mainMenu)
	Team2:SetSize( 320, 80 )
	Team2:SetPos( 60, 420 )
	Team2:SetText("")
	Team2.DoClick = function()
						RunConsoleCommand("SetGamemodeTeam", "2")
						RunConsoleCommand("inventory")
						mainMenu:Close()
					end
	Team2.Paint = function()
						surface.SetDrawColor(255,255,255,255)
						surface.SetMaterial(Material("materials/tdm/vgui/logos/alphaomega.png"))
						surface.DrawTexturedRect(0,0,320,80)
					end	
	
	local Team3 = vgui.Create("DButton", mainMenu)
	Team3:SetSize( 320, 80 )
	Team3:SetPos( 60, 550 )
	Team3:SetText("")
	Team3.DoClick = function()
						RunConsoleCommand("SetGamemodeTeam", "3")
						RunConsoleCommand("inventory")
						mainMenu:Close()
					end
	Team3.Paint = function()
						surface.SetDrawColor(255,255,255,255)
						surface.SetMaterial(Material("materials/tdm/vgui/logos/terra.png"))
						surface.DrawTexturedRect(0,0,320,80)
					end
	
end