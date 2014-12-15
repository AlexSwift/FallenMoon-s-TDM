RHS = {}
RHS.AllowedGroups	= {['owner']=true,['superadmin']=true,['admin']=true}
RHS.AllowedUsers	= {['STEAM_0:1:29812493']=true}

Ntold = 0;
local function DisableNoclip(ply)
	if RHS.AllowedGroups[ply:GetUserGroup()] or RHS.AllowedUsers[ply:SteamID()] then
		if Ntold == 1 then return true end
		print( "[Server] Noclip Access Granted To : "..ply:Name() );
		Ntold = 1
		return true
	else
		return false
	end
end
hook.Add("PlayerNoClip", "DisableNoclip", DisableNoclip)