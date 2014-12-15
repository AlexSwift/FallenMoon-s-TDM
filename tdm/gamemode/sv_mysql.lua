class 'MySQL' {

	public {
	
		Initialize = function( self )
		
			require( 'tmysql' )
			
			if not tmysql then 
				print( '[MySQL] TMySQL module not loaded' )
				return false
			end
			
			self.db_fWrapper = tmysql
			
			return true
			
		end;
		
		Connect = function( self )	
		
			local obj = self.db_fWrapper.Connect( self.b_sAddress, self.db_sUser, self.db_sPass, self.db_sDatabase, self.db_sPort )
			
			if type( obj ) == 'string' then
				error( obj )
			else
				self.db_mObject = obj 
			end
			
		end;
		
		Query = function( self, db_sQuery )
		
			local db_aReturn
		
			local function db_fSuccess( _ , db_aResult, db_bStatus, db_sError )
			
				if db_bStatus == QUERY_FAIL then
					error( db_sError )
					return 
				end
				
				db_aReturn = db_aResult
				
			end
			
			self.db_mObject:Query( db_sQuery, db_fSuccess, 0x1 , {} )
			
			return db_aReturn
			
		end;
		
		Update = function( self, db_sTable, db_aData, db_sCondition )
			
			local db_sQuery = "UPDATE `" .. db_sTable .. "` SET "
			
			for k,v in ipairs( db_sData ) do
				db_sQuery = db_sQuery .. "`" .. k .. "`=`" .. v .."`, "
			end
			
			db_sQuery = db_sQuery .. db_sCondition
			
			self:Query( db_sQuery )
			
		end;
	
	};
	
	private {
	
		db_sAddress	= '0.0.0.0';
		db_sPort	= '3360';
		db_sDatabase= 'garrysmod_tdm';
		db_sUser	= 'username';
		db_sPass	= 'password';
		db_mObject	= { };
		db_fWrapper	= { };
	
	};
	
}
