-- Variables that are used on both client and server
SWEP.Gun = ("bb_css_c4") -- must be the name of your swep but NO CAPITALS!
if (GetConVar(SWEP.Gun.."_allowed")) == nil then 
	if (GetConVar("DebugM9K"):GetBool()) then	print("Blacklist Convar for "..SWEP.Gun.." is missing! You may have hit the lua limit, or incorrectly modified the autorun file!")	end
elseif not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
SWEP.Category				= "CS:S Weapons"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= "Right click:set time"
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "C4"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 117			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "slam"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and ar2 make for good sniper rifles

SWEP.ViewModelFOV			= 65
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_c4.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_c4.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater 		= true

SWEP.Primary.Sound			= Sound("")		-- Script that calls the primary fire sound
SWEP.Primary.RPM				= 10		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 1		-- Bullets you start with
SWEP.Primary.KickUp				= 0		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "cssc4"				
-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a metal peircing shotgun slug

SWEP.Primary.Round 			= ("bb_planted_css_c4")	--NAME OF ENTITY GOES HERE

SWEP.Secondary.IronFOV			= 0		-- How much you 'zoom' in. Less is more! 

SWEP.Timer				= 10	

SWEP.Primary.NumShots	= 0		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 0	-- Base damage per bullet
SWEP.Primary.Spread		= 0	-- Define from-the-hip accuracy (1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0 -- Ironsight accuracy, should be the same for shotguns
--none of this matters for IEDs and other ent-tossing sweps

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector(0, 0, 0)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.SightsPos = Vector(0, 0, 0)	-- These are the same as IronSightPos and IronSightAng
SWEP.SightsAng = Vector(0, 0, 0)	-- No, I don't know why
SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(0, 0, 0)

--and now to the nasty parts of this swep...


if not (IsMounted("cstrike")) then 
	SWEP.Spawnable				= false
	SWEP.AdminSpawnable			= false
	SWEP.ViewModel = "models/weapons/2_c4.mdl"	-- Weapon view model
end

function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() then
	self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))

	local tr = {}
	tr.start = self.Owner:GetShootPos()
	tr.endpos = self.Owner:GetShootPos() + 100 * self.Owner:GetAimVector()
	tr.filter = {self.Owner}
	local trace = util.TraceLine(tr)
	
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	
	timer.Simple(self.Owner:GetViewModel():SequenceDuration(), function()
	if SERVER and self.Weapon != nil then if self.Weapon:GetOwner():GetActiveWeapon():GetClass() == self.Gun then
		if self:CanPrimaryAttack() then
			self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)
	
			local tr = {}
			tr.start = self.Owner:GetShootPos()
			tr.endpos = self.Owner:GetShootPos() + 100 * self.Owner:GetAimVector()
			tr.filter = {self.Owner}
			local trace = util.TraceLine(tr)

			self:TakePrimaryAmmo(1)

			if (CLIENT) then return end
			
			if !(IsMounted("cstrike")) then
				self.Primary.Round = "bb_planted_alt_c4"
			end	
			
			C4 = ents.Create(self.Primary.Round)
			C4:SetPos(trace.HitPos)
			trace.HitNormal.z = -trace.HitNormal.z
			C4:SetAngles(trace.HitNormal:Angle() - Angle(90, 180, 0))
			C4.Owner = self.Owner
			C4.Timer = self.Timer
			C4.DefaultModel = true
			C4:Spawn()
			
			local boxes
			parentme = {}
			parentme[1] = "m9k_ammo_40mm"
			parentme[2] = "m9k_ammo_c4"
			parentme[3] = "m9k_ammo_frags"
			parentme[4] = "m9k_ammo_ieds"
			parentme[5] = "m9k_ammo_nervegas"
			parentme[6] = "m9k_ammo_nuke"
			parentme[7] = "m9k_ammo_proxmines"
			parentme[8] = "m9k_ammo_rockets"
			parentme[9] = "m9k_ammo_stickynades"
			parentme[10] = "m9k_ammo_357"
			parentme[11] = "m9k_ammo_ar2"
			parentme[12] = "m9k_ammo_buckshot"
			parentme[13] = "m9k_ammo_pistol"
			parentme[14] = "m9k_ammo_smg"
			parentme[15] = "m9k_ammo_sniper_rounds"
			parentme[16] = "m9k_ammo_winchester"
			
			if trace.Entity != nil and trace.Entity:IsValid() then
				for k, v in pairs (parentme) do
					if trace.Entity:GetClass() == v then
						boxes = trace.Entity
					end
				end
			end
			
			if trace.Entity and trace.Entity:IsValid() then
				if boxes and trace.Entity:GetPhysicsObject():IsValid() then
				C4:SetParent(trace.Entity)
				trace.Entity.Planted = true
			elseif not trace.Entity:IsNPC() and not trace.Entity:IsPlayer() and trace.Entity:GetPhysicsObject():IsValid() then
					constraint.Weld(C4, trace.Entity)
				end
			else
				C4:SetMoveType(MOVETYPE_NONE)
			end
			
			if not trace.Hit then
				C4:SetMoveType(MOVETYPE_VPHYSICS)
			end

			end
		self.Weapon:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
			self.Owner:SetAnimation(PLAYER_ATTACK1)
	end
	end 
	end)
	local wait = self.Owner:GetViewModel():SequenceDuration() + .75 
	self:CheckWeaponsAndAmmo(wait)
end
end

function SWEP:SecondaryAttack()

	if self.Owner:IsNPC() then return end
	if CLIENT then return end

	self.Weapon:SetNextPrimaryFire(CurTime() + 0.1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 0.1)

	if self.Timer == 10 then
		if (SERVER) then
			self.Owner:PrintMessage(HUD_PRINTTALK, "20 Seconds.")
		end
		self.Timer = 20
		self.Owner:EmitSound("C4.PlantSound")
		
	elseif self.Timer == 20 then
		if (SERVER) then
			self.Owner:PrintMessage(HUD_PRINTTALK, "30 Seconds.")
		end
		self.Timer = 30
		self.Owner:EmitSound("C4.PlantSound")
		
	elseif self.Timer == 30 then
		if (SERVER) then
			self.Owner:PrintMessage(HUD_PRINTTALK, "45 Seconds.")
		end
		self.Timer = 45
		self.Owner:EmitSound("C4.PlantSound")
		
	elseif self.Timer == 45 then
		if (SERVER) then
			self.Owner:PrintMessage(HUD_PRINTTALK, "10 Seconds.")
		end
		self.Timer = 10
		self.Owner:EmitSound("C4.PlantSound")
			
	end
end

function SWEP:Think()

end

function SWEP:CheckWeaponsAndAmmo(wait)
	timer.Simple(wait, function() 
		if IsValid(self) then
			if IsValid(self.Owner) and IsValid(self.Weapon) then 
				if self.Weapon:GetOwner():GetActiveWeapon():GetClass() == self.Gun then 
					if self.Weapon:Clip1() == 0 && self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) == 0 then
						timer.Simple(.01, function() if SERVER then
							if self.Owner == nil then return end
							self.Owner:StripWeapon(self.Gun)
						end end)
					else timer.Simple(.25, function()
						if IsValid(self.Weapon) and IsValid(self.Owner) then
							if self.Weapon:GetClass() == self.Gun then
								self.Weapon:DefaultReload( ACT_VM_DRAW )
							end 
						end 
					end) end
				end 
			end
		end 
	end)
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
	
end