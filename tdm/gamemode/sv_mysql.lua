class 'MySQL' {

	public {
	
		Initialize = function( self )
		
			require( 'tmysql4' )
			
			if not tmysql then 
				print( '[MySQL] TMySQL module not loaded' )
				return false
			end
			
			self.db_fWrapper = tmysql
			
			return true
			
		end;
		
		Connect = function( self )
			
			local obj = self.db_fWrapper.Connect( self.db_sAddress, self.db_sUser, self.db_sPass, self.db_sDatabase, self.db_sPort )
			
			if type( obj ) == 'string' or not obj then
				ErrorNoHalt( type( obj ) == 'string' and obj or 'Failed to connect to database\n' )
			end
			
			self.db_mObject = obj
			self.db_bIsConnected = true
			
		end;
		
		IsConnected = function( self )
			
			return self.db_bIsConnected
			
		end;
		
		Query = function( self, db_sQuery )
		
			if not self.db_mObject then 
				ErrorNoHalt( 'Databse not connected\n' )
				return
			end
		
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
			
			for k,v in ipairs( db_aData ) do
				db_sQuery = db_sQuery .. "`" .. k .. "`=`" .. v .."`, "
			end
			
			db_sQuery = db_sQuery .. db_sCondition
			
			self:Query( db_sQuery )
			
		end;
	
	};
	
	private {
	
		db_bIsConnected = false;
		db_sAddress	= '0.0.0.0';
		db_sPort	= 3360;
		db_sDatabase= 'garrysmod_tdm';
		db_sUser	= 'username';
		db_sPass	= 'password';
		db_mObject	= { };
		db_fWrapper	= { };
	
	};
	
}
