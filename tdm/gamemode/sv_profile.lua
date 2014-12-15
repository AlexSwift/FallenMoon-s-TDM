util.AddNetworkString( "profile" )

class 'Profile' {
	
	public {
	
		LoadProfile = function( ply )
		
			if not GM.MySQL then return false end
		
			local db_aResult = GM.MySQL:Query( "SELECT * from `tdm_profile` WHERE `steamid` = `" .. ply:SteamID() .. "`" )[1]
			
			ply.Profile = Profile.new()
			ply.Profile:SetOwner( ply )
			ply.Profile:SetGold( db_aResult[ 'gold' ] or 1000  )
			ply.Profile:SetXP( db_aResult[ 'xp' ] or 0 )
			ply.Profile:SetCredit( db_aResult[ 'credit' ] or 0)
			ply.Profile:SetInventory( db_aresult[ 'inventory' ] or {} )
			
		end;
		
		SaveProfile = function( self )
		
			if not GM.MySQL then return false end
		
			local db_aData = {
				'gold'		= self:GetGold( ),
				'credit'	= self:GetCredit( ),				
				'xp'		= self:GetXP( ),
				'inventory'	= self:GetInventory( )
			}
			
			GM.MySQL:Update( 'tdm_profile', db_aData, "WHERE `steamid` = `" .. ply:SteamID() .. "`" )
			
		end;
		
		DestroyProfile( self ) --PLEASE DO NOT CALL BY MISTAKE
			
			self:SaveProfile( )
			self = nil
			
		end;
		
		Network = function( self, p_aData )
			
			net.Start( 'profile' )
				net.WriteTable( p_aData )
			net.Broadcast( )
			
		end;
		
		SetOwner = function( self, ply )
			self.p_ePlayer = ply
		end;
		
		GetOwner = function( self )
			return self.p_ePlayer
		end;
		
		SerializeInventory = function( self )
			
			local str = ''
			
			for i = 1, #self:GetInventory( ) do
				if i == #self:GetInventory( ) then 
					str = str .. k .. ',' .. v
				else
					str = str .. k .. ',' .. v .. ';'
				end
			end
			
			return str
			
		end;
		
		HasItem = function( self, i_sName )
		
			if not Item.Exists( i_sName ) then return end
			
			return IsValid( self:GetInventory( )[ i_sName] )
			
		end;
		
		TakeItem = function( self, i_sItem, i_iAmount )
		
			if not Item.Exists( i_sName ) then return end
			
			if not self:HasItem( i_sItem ) then return end
			
			local p_aInventory = self:GetInventory( )
			p_aInventory[ i_sItem ] = _aInventory[ i_sItem ] == i_iAmount and nil or _aInventory[ i_sItem ] - i_iAmount
			
			self:SetInventory( p_aInventory )
			
		end;
		
		GiveItem = function( self, i_sItem, i_iAmount )
		
			if not Item.Exists( i_sName ) then return end
		
			local p_aInventory = self:GetInventory( )
			p_aInventory[ i_sItem ] = p_aInventory[ i_sItem ] and p_aInventory[ i_sItem ] + i_iAmount or i_iAmount
			
			self:SetInventory( p_aInventory )
			
		end;
		
		SetCredit = function( self, p_iCredit )
		
			if not p_iCredit or type( p_iCredit ) ~= 'number' then return false end
			self.p_iCredit = p_iCredit
			
			self:SaveProfile( )
			self:Network( { p_iCredit = p_iCredit } )
			
			return true
		end;
		
		SetGold = function( self, p_iGold )
		
			if not p_iGold or type( p_iGold ) ~= 'number' then return false end
			self.p_iGold = p_iGold
			
			self:SaveProfile( )
			self:Network( { p_iGold = p_iGold } )
			
			return true
		end;
		
		SetXP = function( self, p_iXP )
		
			if not p_iXP or type( p_iXP ) ~= 'number' then return false end
			self.p_iXP = p_iXP
			
			self:SaveProfile( )
			self:Network( { p_iXP = p_iXP } )
			
			return true
		end;
		
		SetInventory = function( self, p_aInventory )
			
			if not p_aInventory or type( p_aInventory ) ~= 'table' then return false end
			self.p_aInventory = p_aInventory
			
			self:SaveProfile( )
			self:Network( { p_aInventory = p_aInventory } )
			
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
		p_ePlayer	= Entity( 0 ); --Set this to work for now until player is intialized
		
	};
	
}