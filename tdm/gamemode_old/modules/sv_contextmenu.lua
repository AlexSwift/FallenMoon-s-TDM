RHS = {}
RHS.AllowedGroups	= {['owner']=true,['superadmin']=true,['admin']=true}
RHS.AllowedUsers	= {['STEAM_0:1:29812493']=true}

told = 0;
local function OnContextMenuOpen(ply)
	if RHS.AllowedGroups[ply:GetUserGroup()] or RHS.AllowedUsers[ply:SteamID()] then
		if told == 1 then return true end
		print( "[Server] Context Menu Access Granted To : "..ply:Name() );
		told = 1
		return true
	else
		return false
	end
end
hook.Add( "ContextMenuOpen", "OnContextMenuOpen", OnContextMenuOpen )