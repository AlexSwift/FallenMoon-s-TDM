-- Variables that are used on both client and server
SWEP.Gun = ("bb_scout")					-- must be the name of your swep
if (GetConVar(SWEP.Gun.."_allowed")) == nil then 
	if (GetConVar("DebugM9K"):GetBool()) then	print("Blacklist Convar for "..SWEP.Gun.." is missing! You may have hit the lua limit, or incorrectly modified the autorun file!")	end
elseif not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Scout"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 122			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.HoldType 				= "rpg"

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_snip_scout.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_snip_scout.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("Weapon_Scout.1")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 60		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 10		-- Size of a clip
SWEP.Primary.DefaultClip			= 60	-- Bullets you start with
SWEP.Primary.KickUp			= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "SniperPenetratedRound"

SWEP.Secondary.ScopeZoom			= 8	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= true		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	

SWEP.data 				= {}
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 0.7

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 45	--base damage per bullet
SWEP.Primary.Spread		= .01	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .0001 -- ironsight accuracy, should be the same for shotguns
SWEP.BoltAction	=	true

-- enter iron sight info and bone mod info below
	SWEP.IronSightsPos = Vector(2.319, -1.803, 0.639)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.SightsPos = Vector(2.319, -1.803, 0.639)
	SWEP.SightsAng = Vector(0, 0, 0)
	SWEP.RunSightsPos = Vector(-4.755, -3.77, 0.984)
	SWEP.RunSightsAng = Vector(-9.181, -48.197, 0)
	
if not (IsMounted("cstrike")) then 
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.ViewModel = "models/weapons/2_snip_scout.mdl"	-- Weapon view model
	SWEP.Primary.Sound			= Sound("Alt_Weapon_Scout.1")
	SWEP.IronSightsPos = Vector(3.319, 0, 1.559)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.SightsPos = Vector(3.319, 0, 1.559)
	SWEP.SightsAng = Vector(0, 0, 0)
	SWEP.RunSightsPos = Vector(-7.165, -10.157, 2.756)
	SWEP.RunSightsAng = Vector(-19.017, -70, 0)
end

if GetConVar("M9KUnified_CSS_vms") == nil then
	print("A console variable for the M9K CSS addon cannot be found, this means you probably hit the lua limit. Disable some addons if you want things to work.")
elseif GetConVar("M9KUnified_CSS_vms"):GetBool() then
	SWEP.UseHands = true	
	local oldvm = SWEP.ViewModel
	local newvm = string.gsub(oldvm, "v_", "cstrike/c_")
	SWEP.ViewModel = newvm
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false 
	
SWEP.IronSightsPos = Vector(-6.72, -3.826, 3)
SWEP.IronSightsAng = Vector(0.809, -0.25, -1.542)
SWEP.SightsPos = Vector(-6.72, -3.826, 3)
SWEP.SightsAng = Vector(0.809, -0.25, -1.542)
SWEP.RunSightsPos = Vector(9.027, -15.131, 0)
SWEP.RunSightsAng = Vector(-2.777, 70, 0)
	
end

if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetFloat() >= 0 then
	SWEP.Primary.DefaultClip = SWEP.Primary.DefaultClip * GetConVar("M9KDefaultClip"):GetFloat()
	PainMulti = GetConVar("M9KDefaultClip"):GetFloat()
	else return end
end
