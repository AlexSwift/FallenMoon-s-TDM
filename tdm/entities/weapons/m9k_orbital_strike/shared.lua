-- Variables that are used on both client and server
SWEP.Gun = ("m9k_orbital_strike")					-- must be the name of your swep
if (GetConVar(SWEP.Gun.."_allowed")) == nil then 
	if (GetConVar("DebugM9K"):GetBool()) then	print("Blacklist Convar for "..SWEP.Gun.." is missing! You may have hit the lua limit, or incorrectly modified the autorun file!")	end
elseif not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "bobs_blacklisted" SWEP.PrintName = SWEP.Gun return end
SWEP.Category				= "M9K Specialties"
SWEP.Author				= ""
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "Orbital Strike Marker"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 101			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.Weight				= 50			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= false		-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.HoldType 				= "camera"

SWEP.ViewModelFOV			= 70
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_invisib.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_binos.mdl"	-- Weapon world model
SWEP.Base 				= "bobs_scoped_base"
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("weapons/satellite/targaquired.mp3")		-- script that calls the primary fire sound
SWEP.Primary.RPM				= 50		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 1		-- Bullets you start with
SWEP.Primary.KickUp			= 1				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 1			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal			= 1		-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "SatCannon"

SWEP.Secondary.ScopeZoom			= 5
SWEP.Secondary.UseParabolic		= false	-- Choose your scope type, 
SWEP.Secondary.UseACOG			= false
SWEP.Secondary.UseMilDot		= true		
SWEP.Secondary.UseSVD			= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	

SWEP.data 				= {}				--The starting firemode
SWEP.data.ironsights			= 1
SWEP.ScopeScale 			= 1

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-3.589, -8.867, -4.124)
SWEP.IronSightsAng = Vector(50.353, 17.884, -19.428)
SWEP.SightsPos = Vector(-3.589, -8.867, -4.124)
SWEP.SightsAng = Vector(50.353, 17.884, -19.428)
SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-21.994, 0, 0)

SWEP.ViewModelBoneMods = {
	["l-ring-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-19.507, 0, 0) },
	["r-ring-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-17.507, 0, 0) },
	["r-pinky-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-47.32, 0, 0) },
	["r-ring-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-54.065, 0, 0) },
	["r-middle-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-37.065, 0, 0) },
	["r-thumb-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-4.74, 17.732, -30.143) },
	["r-index-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-49.646, 0, 0) },
	["r-index-mid"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-71.792, 0, 0) },
	["r-middle-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-21.483, 1.309, 0) },
	["r-pinky-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-21.526, 0, 0) },
	["l-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -0.88), angle = Angle(0, 0, 0) },
	["Da Machete"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.263, -1.826), angle = Angle(0, 0, 0) },
	["r-upperarm-movement"] = { scale = Vector(1, 1, 1), pos = Vector(7.395, 2.101, -9.54), angle = Angle(-10.502, -12.632, 68.195) },
	["r-thumb-low"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-0.621, 0, 0) }
}

SWEP.VElements = {
	["binos"] = { type = "Model", model = "models/weapons/binos.mdl", bone = "r-thumb-low", rel = "", pos = Vector(3.908, -0.108, -1.125), angle = Angle(-2.829, 27.281, 105.792), size = Vector(0.665, 0.665, 0.665), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.PoorBastard = false
SWEP.NextShoot = 0

function SWEP:PrimaryAttack()
	self.PoorBastard = false
	if not IsFirstTimePredicted() then return end
	if self:CanPrimaryAttack() and self.Owner:IsPlayer() and self.NextShoot <= CurTime() then
	if !self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_RELOAD) then
		local mark = self.Owner:GetEyeTrace()
		if mark.HitSky then 
			self.Owner:EmitSound("player/suit_denydevice.wav")
		end
	
		local skytrace = {}
		skytrace.start = mark.HitPos
		skytrace.endpos = mark.HitPos + Vector(0,0,65000)
		skycheck = util.TraceLine(skytrace)
		if skycheck.HitSky then
			if SERVER then
				local Sky = skycheck.HitPos - Vector(0,0,10)
				local Ground = mark.HitPos
				Satellite = ents.Create("m9k_oribital_cannon")
				Satellite.Ground = Ground
				Satellite.Sky = Sky
				Satellite.Owner = self.Owner
				Satellite:SetPos(Sky) //was sky but for testing, its this
				Satellite:Spawn()
			end
			if SERVER then self.Owner:EmitSound(self.Primary.Sound) end
			self.Weapon:TakePrimaryAmmo(1)
			self.Weapon:SetNextPrimaryFire(CurTime()+15)
			self.NextShoot = CurTime() + 15
			self:CheckWeaponsAndAmmo()
			self:Reload()
		elseif mark.Entity:IsPlayer() or mark.Entity:IsNPC() then
			self.PoorBastard = true
			thetarget = mark.Entity
			skytrace2 = {}
			skytrace2.start = thetarget:GetPos()
			skytrace2.endpos = thetarget:GetPos() + Vector(0,0,65000)
			skytrace2.filter = thetarget
			skycheck2 = util.TraceLine(skytrace2)
			if skycheck2.HitSky then //someone's gonna be in big trouble
				sky2 = skycheck2.HitPos - Vector(0,0,10)
				if SERVER then
					Satellite = ents.Create("m9k_oribital_cannon")
					--Satellite.Ground = Ground
					Satellite.PoorBastard = true
					Satellite.Target = thetarget
					Satellite.Sky = sky2
					Satellite.Owner = self.Owner
					Satellite:SetPos(sky2)
					Satellite:Spawn()
				end
				self.Owner:EmitSound(self.Primary.Sound)
				self.Weapon:TakePrimaryAmmo(1)
				self.Weapon:SetNextPrimaryFire(CurTime()+15)
				self.NextShoot = CurTime() + 15
				self:CheckWeaponsAndAmmo()
				self:Reload()
			else
				self.Owner:EmitSound("player/suit_denydevice.wav")
			end
		else
			self.Owner:EmitSound("player/suit_denydevice.wav")
		end
	end
	end
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


if GetConVar("M9KDefaultClip") == nil then
	print("M9KDefaultClip is missing! You may have hit the lua limit!")
else
	if GetConVar("M9KDefaultClip"):GetFloat() >= 0 then
	SWEP.Primary.DefaultClip = SWEP.Primary.DefaultClip * GetConVar("M9KDefaultClip"):GetFloat()
	PainMulti = GetConVar("M9KDefaultClip"):GetFloat()
	else return end
end