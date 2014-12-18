-- Variables that are used on both client and server
SWEP.Gun = ("bb_galil_alt")					-- must be the name of your swep
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Galil"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 156			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/2_rif_galil.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/3_rif_galil.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Alt_Weapon_Galil.1")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 685			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 35		-- Size of a clip
SWEP.Primary.DefaultClip		= 70		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "ar2"

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 28	-- Base damage per bullet
SWEP.Primary.Spread		= .028	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .018 -- Ironsight accuracy, should be the same for shotguns

SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below

	SWEP.IronSightsPos = Vector(-2.964, -1.611, 1.527)
	SWEP.IronSightsAng = Vector(0.041, 0, 0)
	SWEP.SightsPos = Vector(-2.964, -1.611, 1.527)
	SWEP.SightsAng = Vector(0.041, 0, 0)
	SWEP.RunSightsPos = Vector(5.906, -3.386, 2.44)
	SWEP.RunSightsAng = Vector(-18.466, 64.212, 0)

if IsMounted("cstrike") then
	SWEP.Category				= "CS:S Weapon Alternates"
	SWEP.PrintName = "Alt Galil"
end

