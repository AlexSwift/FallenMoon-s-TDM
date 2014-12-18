-- Variables that are used on both client and server
SWEP.Gun = ("bb_tmp")					-- must be the name of your swep
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "TMP"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 141			-- Position in the slot
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
SWEP.ViewModel				= "models/weapons/v_smg_tmp.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_tmp.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_TMP.1")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 875			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"

SWEP.SelectiveFire		= true

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	-- Base damage per bullet
SWEP.Primary.Spread		= .022	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .012 -- Ironsight accuracy, should be the same for shotguns

	SWEP.IronSightsPos = Vector(5.239, -3.837, 2.569)
	SWEP.IronSightsAng = Vector(0.694, 0, 0)
	SWEP.SightsPos = Vector(5.239, -3.837, 2.569)
	SWEP.SightsAng = Vector(0.694, 0, 0)
	SWEP.RunSightsPos = Vector(-2.296, -3.116, 1.31)
	SWEP.RunSightsAng = Vector(-10.903, -26.967, 0)
	
if not (IsMounted("cstrike")) then
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.ViewModel = "models/weapons/2_smg_tmp.mdl"
	SWEP.Primary.Sound			= Sound("Alt_Weapon_TMP.1")
	SWEP.IronSightsPos = Vector(2.599, -2.385, 2.026)
	SWEP.IronSightsAng = Vector(0, -0.129, 0.291)
	SWEP.SightsPos = Vector(2.599, -2.385, 2.026)
	SWEP.SightsAng = Vector(0, -0.129, 0.291)
	SWEP.RunSightsPos = Vector(-6.693, -6.378, 2.282)
	SWEP.RunSightsAng = Vector(-17.914, -49.882, 0)
end

if GetConVar("M9KUnified_CSS_vms") == nil then
	
elseif GetConVar("M9KUnified_CSS_vms"):GetBool() then
	SWEP.UseHands = true	
	local oldvm = SWEP.ViewModel
	local newvm = string.gsub(oldvm, "v_", "cstrike/c_")
	SWEP.ViewModel = newvm
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false 
	
SWEP.IronSightsPos = Vector(-6.841, 0, 2.24)
SWEP.IronSightsAng = Vector(1.23, 0, 0)
SWEP.SightsPos = Vector(-6.841, 0, 2.24)
SWEP.SightsAng = Vector(1.23, 0, 0)
SWEP.RunSightsPos = Vector(9.135, -4.999, 0)
SWEP.RunSightsAng = Vector(-9.282, 21.198, 0)
	
end



