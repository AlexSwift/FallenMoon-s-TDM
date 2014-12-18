SWEP.Base = "bobs_blacklisted"
-- Variables that are used on both client and server
SWEP.Gun = ("m9k_davy_crockett") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "M9K Specialties"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Davy Crockett"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 102			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- set false if you want no crosshair
SWEP.Weight				= 30			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "rpg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and ar2 make for good sniper rifles

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_RL7.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_RL7.mdl"	-- Weapon world model
SWEP.Base				= "bobs_gun_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater 		= true

SWEP.Primary.Sound			= Sound("")		-- Script that calls the primary fire sound
SWEP.Primary.RPM				= 20		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 1		-- Bullets you start with
SWEP.Primary.KickUp				= 0		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0		-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "Nuclear_Warhead"				
-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a metal peircing shotgun slug

SWEP.Primary.Round 			= ("m9k_launched_davycrockett")	--NAME OF ENTITY GOES HERE

SWEP.Secondary.IronFOV			= 40		-- How much you 'zoom' in. Less is more! 	

SWEP.Primary.NumShots	= 0		-- How many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 0	-- Base damage per bullet
SWEP.Primary.Spread		= 0	-- Define from-the-hip accuracy (1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0 -- Ironsight accuracy, should be the same for shotguns
--none of this matters for IEDs and other ent-tossing sweps

-- Enter iron sight info and bone mod info below
SWEP.IronSightsPos = Vector (-3.7384, -5.7481, -0.2713)
SWEP.IronSightsAng = Vector (1.1426, 0.0675, 0)
SWEP.SightsPos = Vector (-3.7384, -5.7481, -0.2713)
SWEP.SightsAng = Vector (1.1426, 0.0675, 0)
SWEP.RunSightsPos = Vector (2.4946, -1.5644, 1.699)
SWEP.RunSightsAng = Vector (-20.1104, 35.1164, -12.959)


if GetConVar("M9K_Davy_Crockett_Timer") == nil then
SWEP.NextFireTime = 20
SWEP.Countdown = 20
else
SWEP.NextFireTime = GetConVarNumber("M9K_Davy_Crockett_Timer")
SWEP.Countdown = GetConVarNumber("M9K_Davy_Crockett_Timer")
end

--and now to the nasty parts of this swep...

function SWEP:Deploy()

	if timer.Exists("davy_crocket_"..self.Owner:UniqueID()) then timer.Destroy("davy_crocket_"..self.Owner:UniqueID()) end
	self:SetIronsights(false, self.Owner)					-- Set the ironsight false
	self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
	if (gmod.GetGamemode().Name == "Murderthon 9000") or GetConVar("DebugM9K"):GetBool() then
		self.NextFireTime = (CurTime() + self.NextFireTime)
		self.Owner:PrintMessage( HUD_PRINTCENTER, "Warhead will be armed in "..self.Countdown.." seconds." )
		self.Owner.DCCount = self.Countdown
		self.Owner.DCCount = self.Owner.DCCount - 1
		timer.Create("davy_crocket_"..self.Owner:UniqueID(), 1, self.Countdown, 
			function()
			if not IsValid(self) then return end
			if not IsValid(self.Owner) then return end
			if not IsValid(self.Weapon) then return end
			if self.Owner:GetActiveWeapon():GetClass() != self.Gun then timer.Destroy("davy_crocket_"..self.Owner:UniqueID()) return end
			self:DeployCountDownFunc(self.Owner.DCCount)
			self.Owner.DCCount = self.Owner.DCCount - 1
			end)
	else
		self.NextFireTime = (CurTime()+3)
		if (GetConVar("DavyCrockettAllowed"):GetBool()) then
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Warhead will be armed in 3 seconds." )
		else
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Nukes are not allowed on this server." )
		end
		if !self.Owner:IsNPC() then self.ResetSights = CurTime() + self.Owner:GetViewModel():SequenceDuration() end
	end
	self:SetWeaponHoldType(self.HoldType)
	self.Weapon:SetNetworkedBool("Reloading", false)
	return true
end

function SWEP:DeployCountDownFunc(count)
	if not IsValid(self) then return end
	if not IsValid(self.Owner) then return end
	if not IsValid(self.Weapon) then return end
	if self.Owner:GetActiveWeapon():GetClass() != self.Gun then timer.Destroy("davy_crocket_"..self.Owner:UniqueID()) return end
	if count == 0 then
		self.Owner:PrintMessage(HUD_PRINTTALK, "WARHEAD IS ARMED AND READY TO FIRE" )
	elseif count == 1 then
		self.Owner:PrintMessage(HUD_PRINTTALK, count.." second remaining!" )
	else
		self.Owner:PrintMessage(HUD_PRINTTALK, count.." seconds remaining" )
	end 
	if count <= 5 then
		self.Weapon:EmitSound("C4.PlantSound")
	end
end

function SWEP:PrimaryAttack()
	if self:CanPrimaryAttack() and self.NextFireTime <= CurTime() and not self.Owner:KeyPressed(IN_SPEED) then
	if self.Owner:IsPlayer() then
		if GetConVar("DavyCrockettAllowed") == nil or (GetConVar("DavyCrockettAllowed"):GetBool()) then
			self:FireRocket()
			self.Weapon:EmitSound("RPGF.single")
			self.Weapon:TakePrimaryAmmo(1)
			self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			self.Owner:SetAnimation( PLAYER_ATTACK1 )
			self.Owner:MuzzleFlash()
			self.Weapon:SetNextPrimaryFire(CurTime()+1/(self.Primary.RPM/60))
		else
			self.Owner:PrintMessage( HUD_PRINTCENTER, "Nukes are not allowed on this server." )
		end
	end
	self:CheckWeaponsAndAmmo()
	end
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local pos = self.Owner:GetShootPos()

	if SERVER then
	local rocket = ents.Create(self.Primary.Round)
	if !rocket:IsValid() then return false end
	rocket:SetAngles(aim:Angle()+Angle(90,0,0))
	rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket.Owner = self.Owner
	rocket:Spawn()
	rocket:Activate()
	end
end

function SWEP:SecondaryAttack()
end	

function SWEP:CheckWeaponsAndAmmo()
	if SERVER and self.Weapon != nil then 
		if self.Weapon:Clip1() == 0 && self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) == 0 and (GetConVar("M9KWeaponStrip"):GetBool()) then
			timer.Simple(.1, function() if SERVER then if not IsValid(self) then return end 
				if not IsValid(self.Owner) then return end
				self.Owner:StripWeapon(self.Gun)
			end end)
		else
			self:Reload()
		end
	end
end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) and not self.Owner:IsNPC() then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	if timer.Exists("davy_crocket_"..self.Owner:UniqueID()) then timer.Destroy("davy_crocket_"..self.Owner:UniqueID()) end
	return true
end

SWEP.VElements = {
	["bomb"] = { type = "Model", model = "models/Failure/MK6/m62.mdl", bone = "Rocket", rel = "", pos = Vector(-2.779, 3.219, -2.961), angle = Angle(-43.498, 0, 90), size = Vector(0.563, 0.563, 0.563), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["nuke"] = { type = "Model", model = "models/failure/mk6/m62.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(28.506, 3.726, -4.689), angle = Angle(-90, 0, 0), size = Vector(0.712, 0.712, 0.712), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


