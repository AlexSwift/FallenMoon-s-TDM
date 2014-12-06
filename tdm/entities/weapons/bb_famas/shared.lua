-- Variables that are used on both client and server
SWEP.Gun = ("bb_famas")					-- must be the name of your swep
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
SWEP.PrintName				= "FAMAS"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 134			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_rif_famas.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_famas.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_FAMAS.1")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 950			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 25		-- Size of a clip
SWEP.Primary.DefaultClip		= 50		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 25	-- Base damage per bullet
SWEP.Primary.Spread		= .025	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns
SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below
	SWEP.IronSightsPos = Vector(-4.682, -2.296, 1.215)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.SightsPos = Vector(-4.682, -2.296, 1.215)
	SWEP.SightsAng = Vector(0, 0, 0)
	SWEP.RunSightsPos = Vector(3.934, -2.623, 0)
	SWEP.RunSightsAng = Vector(-10.329, 40.737, -3.444)

if not (IsMounted("cstrike")) then 
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.Primary.Sound = Sound("Alt_Weapon_FAMAS.1")
	SWEP.ViewModel = "models/weapons/2_rif_famas.mdl"	-- Weapon view model
	SWEP.IronSightsPos = Vector(-2.813, -0.713, 1.154)
	SWEP.IronSightsAng = Vector(0.384, 0.451, 0)
	SWEP.SightsPos = Vector(-2.813, -0.713, 1.154)
	SWEP.SightsAng = Vector(0.384, 0.451, 0)
	SWEP.RunSightsPos = Vector(5.906, -3.386, 2.44)
	SWEP.RunSightsAng = Vector(-18.466, 64.212, 0)
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
	
SWEP.IronSightsPos = Vector(-6.24, -3.324, 1.138)
SWEP.IronSightsAng = Vector(0.187, 0, -0.433)
SWEP.SightsPos = Vector(-6.24, -3.324, 1.138)
SWEP.SightsAng = Vector(0.187, 0, -0.433)
SWEP.RunSightsPos = Vector(8.27, -5.498, 0.243)
SWEP.RunSightsAng = Vector(-7.789, 51.139, 0)
	
end

if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetFloat() >= 0 then
	SWEP.Primary.DefaultClip = SWEP.Primary.DefaultClip * GetConVar("M9KDefaultClip"):GetFloat()
	PainMulti = GetConVar("M9KDefaultClip"):GetFloat()
	else return end
end
