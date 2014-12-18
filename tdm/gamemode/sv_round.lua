class 'Round' {

	public {
	
		__construct = function( self )
			
			hook.Add( 'Think', 'RoundThink' , function( )
				self:Think()
			end)
			
		end;
		
		__finalize = function( self )
			
			hook.Remove( 'Think' , 'RoundThink' )
			
		end;
	
		Think = function( self )
		
			if #player.GetAll() < self.r_iMinimumPly and self.r_bRoundActive then
				self:End()
				return
			end
			
			if #player.GetAll() >= self.r_iMinimumPly and not self.r_bRoundActive then
				self:Start()
				return
			end
		
			if self.r_iPhaseStart + self.r_aRoundPhases[ self.r_iPhaseNumber ][ 'Time' ] <= SysTime() and self.r_bRoundActive then
				
				if self.r_iPhaseNumber == 3 then
					self:Start()
					return
				end
				
				self.r_iPhaseStart = SysTime()
				self.r_iPhaseNumber = self.r_iPhaseNumber + 1
				
			end
			
			self.r_aRoundPhases[ self.r_iPhaseNumber ].Function( )
		
		end;
		
		Start = function( self )
			
			self.r_iRoundNumber	= self.r_iRoundNumber + 1
			self.r_iPhaseStart 	= SysTime( )
			self.r_iPhaseNumber	= 0
			self.r_bRoundActive = true
			
		end;
		
		End = function( self )
		
			self.r_iPhaseNumber = 0
			self.r_iPhaseStart	= SysTime()
			self.r_bRoundActive	= false
			
		end;
	
	};
	
	private {
	
		r_bRoundActive	= false;
		r_iRoundNumber	= 0;
		r_iPhaseStart	= 0;
		r_iPhaseNumber	= 0;
		r_iMinimumPly	= 2;
		r_aRoundPhases	= {
			[0] = {
				['Name']	= 'Waiting for players',
				['Time']	= 0,
				['PvP']		= false,
				['Frozen']	= false,
				['Function']= function( )
				end
			},
			[1] = {
				['Name'] 	= 'Preperation Phase',
				['Time'] 	= 5,
				['PvP']		= false,
				['Frozen']	= true,
				['Function']= function( )
				end
			},
			[2] = {
				['Name'] 	= 'Combat Phase',
				['Time']	= 3,
				['PvP']		= true,
				['Frozen']	= false,
				['Function']= function( )
				end
			},
			[3] = {
				['Name']	= 'Post-Combat phase',
				['Time']	= 10,
				['PvP']		= false,
				['Frozen']	= false,
				['Function']= function( )
				end
			}
		};
	
	};
	
}
	