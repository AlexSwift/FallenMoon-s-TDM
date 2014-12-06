ENT.Type = "anim"
ENT.PrintName			= "Nitro Glycerine"
ENT.Author			= "Generic Default did most of this, i just modified it"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions			= ""


if SERVER then

AddCSLuaFile( "shared.lua" )

function ENT:Initialize()
	self.CanTool = false

	self.Entity:SetModel("models/weapons/w_nitro.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	
	self.Entity:DrawShadow( false )
		
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:SetMass(5)
	phys:Wake()
	phys:AddAngleVelocity(Vector(0, 500, 0))
	end
	self:Think()
end

 function ENT:Think()

	self.Entity:NextThink( CurTime() )
	return true
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/
function ENT:PhysicsCollide(data,phys)
	
	self.Entity:EmitSound(Sound("GlassBottle.Break"))
	
	self:QueueExplosion()
	
end

function ENT:QueueExplosion()
	
	ParticleEffect("nitro_main_m9k", self.Entity:GetPos(), Angle(0,0,0), nil)
	
	local vaporize = ents.Create("m9k_nitro_vapor")
	vaporize:SetPos(self.Entity:GetPos() )
	vaporize:SetOwner(self.Owner)
	vaporize.Owner = self.Owner
	vaporize:Spawn()
	
	self.Entity:Remove()

end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
	if not IsValid(dmginfo) then return end if not IsValid(dmginfo:GetInflictor()) then return end
	if dmginfo:GetInflictor() == "m9k_released_poison" then return end
	self:QueueExplosion()
	self.Entity:EmitSound(Sound("GlassBottle.Break"))
end

end

if CLIENT then

 function ENT:Draw()             
 self.Entity:DrawModel()       // Draw the model.   
 end

end