-- Variables that are used on both client and server
SWEP.Gun = ("bb_m4a1")					-- must be the name of your swep
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "M4A1"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 125			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_rif_m4a1.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_rif_m4a1.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_M4A1.1")		-- Script that calls the primary fire sound
SWEP.Primary.SilencedSound = Sound("Weapon_M4A1.2")
SWEP.Primary.RPM			= 825			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 30	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

SWEP.CanBeSilenced		= true
SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below
	SWEP.IronSightsPos = Vector(5.925, -4.85, 1.131)
	SWEP.IronSightsAng = Vector(2.937, 1.361, 3.719)
	SWEP.SightsPos = Vector(5.925, -4.85, 1.131)
	SWEP.SightsAng = Vector(2.937, 1.361, 3.719)
	SWEP.RunSightsPos = Vector(-1.476, -4.263, 1.31)
	SWEP.RunSightsAng = Vector(-11.476, -41.312, 0)

if not (IsMounted("cstrike")) then
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.ViewModel = "models/weapons/2_rif_m4a1.mdl"
	SWEP.Primary.Sound			= Sound("Alt_Weapon_M4A1.1")		-- Script that calls the primary fire sound
	SWEP.Primary.SilencedSound = Sound("Alt_Weapon_M4A1.2")
	SWEP.IronSightsPos = Vector(3.043, -1.38, 0.859)
	SWEP.IronSightsAng = Vector(0.172, 0, 0)
	SWEP.SightsPos = Vector(3.043, -1.38, 0.859)
	SWEP.SightsAng = Vector(0.172, 0, 0)
	SWEP.RunSightsPos = Vector(-3.543, -2.126, -0.866)
	SWEP.RunSightsAng = Vector(-12.954, -58.151, 10.748)
end

if GetConVar("M9KUnified_CSS_vms") == nil then
	
elseif GetConVar("M9KUnified_CSS_vms"):GetBool() then
	SWEP.UseHands = true	
	local oldvm = SWEP.ViewModel
	local newvm = string.gsub(oldvm, "v_", "cstrike/c_")
	SWEP.ViewModel = newvm
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false 
	
SWEP.IronSightsPos = Vector(-7.875, -1.772, 0.159)
SWEP.IronSightsAng = Vector(3.144, -1.412, -3.07)
SWEP.SightsPos = Vector(-7.875, -1.772, 0.159)
SWEP.SightsAng = Vector(3.144, -1.412, -3.07)
SWEP.RunSightsPos = Vector(8.145, -8.968, -1.969)
SWEP.RunSightsAng = Vector(-1.667, 66.777, 0)
	
end

