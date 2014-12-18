-- Variables that are used on both client and server
SWEP.Gun = ("bb_ump45")					-- must be the name of your swep
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "HK UMP45"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 130			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/v_smg_ump45.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_smg_ump45.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false

SWEP.Primary.Sound			= Sound("Weapon_UMP45.1")		-- Script that calls the primary fire sound
SWEP.Primary.RPM			= 650			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30		-- Size of a clip
SWEP.Primary.DefaultClip		= 60		-- Bullets you start with
SWEP.Primary.KickUp				= 0.3		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.3		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.3		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1"

SWEP.Secondary.IronFOV			= 55		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1

SWEP.Primary.NumShots	= 1		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 24	-- Base damage per bullet
SWEP.Primary.Spread		= .02	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .01 -- Ironsight accuracy, should be the same for shotguns

SWEP.SelectiveFire		= true

-- Enter iron sight info and bone mod info below
	SWEP.IronSightsPos = Vector(7.308, -3.28, 3.24)
	SWEP.IronSightsAng = Vector(-1.407, 0.28, 2.344)
	SWEP.SightsPos = Vector(7.308, -3.28, 3.24)
	SWEP.SightsAng = Vector(-1.407, 0.28, 2.344)
	SWEP.RunSightsPos = Vector(0, -4.263, 0)
	SWEP.RunSightsAng = Vector(-4.016, -29.837, -6.311)

if not (IsMounted("cstrike")) then 
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.ViewModel = "models/weapons/2_smg_ump45.mdl"	-- Weapon view model
	SWEP.Primary.Sound			= Sound("Alt_Weapon_UMP45.1")
	SWEP.IronSightsPos = Vector(2.822, -1.224, 1.245)
	SWEP.IronSightsAng = Vector(-0.044, -0.055, 0.43)
	SWEP.SightsPos = Vector(2.822, -1.224, 1.245)
	SWEP.SightsAng = Vector(-0.044, -0.055, 0.43)
	SWEP.RunSightsPos = Vector(-6.378, -6.064, 2.598)
	SWEP.RunSightsAng = Vector(-17.914, -66.97, 0.275)
end

if GetConVar("M9KUnified_CSS_vms") == nil then
	
elseif GetConVar("M9KUnified_CSS_vms"):GetBool() then
	SWEP.UseHands = true	
	local oldvm = SWEP.ViewModel
	local newvm = string.gsub(oldvm, "v_", "cstrike/c_")
	SWEP.ViewModel = newvm
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false 
	
SWEP.IronSightsPos = Vector(-8.754, -5.351, 4.219)
SWEP.IronSightsAng = Vector(-1.331, -0.28, -2.112)
SWEP.SightsPos = Vector(-8.754, -5.351, 4.219)
SWEP.SightsAng = Vector(-1.331, -0.28, -2.112)
SWEP.RunSightsPos = Vector(8.135, -7.776, 0)
SWEP.RunSightsAng = Vector(-5.575, 39.759, 0)
	
end

