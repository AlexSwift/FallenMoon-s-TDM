class 'Profile' {

	public {
	
		LoadProfile = function( ply )
			
			ply.Profile = Profile.new()
			
		end;
	
		NetworkReceive = function( self )
		
			local p_aData = net.ReadTable()
			
			for k,v in pairs( p_aData ) do
				if self[ k ] then self[ k ] = v end
			end
			
		end;
	
		SetCredit = function( self, p_iCredit )
		
			if not p_iCredit or type( p_iCredit ) ~= 'number' then return false end
			self.p_iCredit = p_iCredit
			
			return true
		end;
		
		SetGold = function( self, p_iGold )
		
			if not p_iGold or type( p_iGold ) ~= 'number' then return false end
			self.p_iGold = p_iGold
			
			return true
		end;
		
		SetXP = function( self, p_iXP )
		
			if not p_iXP or type( p_iXP ) ~= 'number' then return false end
			self.p_iXP = p_iXP
			
			return true
		end;
		
		SetInventory = function( self, p_aInventory )
			
			if not p_aInventory or type( p_aInventory ) ~= 'table' then return false end
			self.p_aInventory = p_aInventory
			
			return true
		
		end;
	
		GetInventory = function( self )
			if not self.p_aInventory then return end
			return self.p_aInventory
		end;
		
		GetCredit = function( self )
			if not self.p_iCredit then return false end
			return self.p_iCredit
		end;
		
		GetGold = function( self )
			if not self.p_iGold then return false end
			return self.p_iGold
		end;
		
		GetXP = function( self )
			if not self.p_iXP then return false end
			return self.p_iXP
		end
	
	};

	private {
		
		p_iCredit 	= 0;
		p_iGold 	= 0;
		p_iXp		= 0;
		P_aInventory= { }; -- { [item_name] = amount , ... }
		
	};
	
};

net.Receive( 'profile_network', function( )
	
	local ply = net.ReadEntity( )
	ply.Profile:NetworkReceive( )
	
end)