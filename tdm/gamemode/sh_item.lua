local _ITEMS = {}

class 'Item' {

	public {
	
		static {
			
			Add = function( i_aData )
		
				local item = Item.new( )
				_ITEMS[ i_aData[ 'i_sName' ] ] = item
				
				for k,v in pairs( i_aData ) do
					item:SetData( k, v)
				end
			
			end;
			
			Exists = function( i_sName )
				
				return IsValid( _ITEMS[ i_sName ] )
			
			end;
			
		};
	
		Use = function( self, ply, ent )
		
			if not ply:IsValid( ) then return end
			
			ply:Give( self.i_eEntity )
			
			if ent and IsValid( ent ) then
				ent:Remove( )
			end
			
		end;
	
	};
	
	private {
	
		SetData = function( self, d_sName, d_zValue )
			self[ d_sName ] = d_zValue
		end;
	
		i_sName			= '';
		i_iSlot			= 0;
		i_sDescription	= '';
		i_eEntity		= Entity( 0 );
		i_aPrices		= { i_iBuy = 0, i_iSell = 0 };
		i_sModel		= '';
		i_iSkin			= 0;
		i_iButtonDist	= 68;
		
	
	};
	
};

local function AddItem( i_sName, i_eEntity, i_sModel, i_iSlot )

	local i_aData = {
		i_sName		= i_sName,
		i_eEntity	= i_eEntity,
		i_sModel	= i_sModel,
		i_iSlot		= i_iSlot
	}
	
	Item.Add( i_aData )
	
end

AddItem("Acr", "m9k_acr", "models/weapons/w_masada_acr.mdl", 1)
AddItem("Famas", "bb_famas", "models/weapons/w_masada_acr.mdl", 1)
AddItem("AUG", "bb_aug", "models/weapons/w_rif_aug.mdl", 1)
AddItem("AWP", "bb_awp", "models/weapons/w_snip_awp.mdl", 1)
AddItem("Smoke Grenade", "bb_css_smoke", "models/weapons/w_eq_smokegrenade.mdl", 1)
AddItem("Frag Grenade", "bb_cssfrag", "models/weapons/w_eq_fraggrenade.mdl", 1)
AddItem("Dual Elites", "bb_dualelites", "models/weapons/w_pist_elite.mdl", 1)
AddItem("Five Seven", "bb_fiveseven", "models/weapons/w_pist_fiveseven.mdl", 2)
AddItem("G3SG1", "bb_g3sg1", "models/weapons/w_snip_g3sg1.mdl", 1)
AddItem("Galil", "bb_galil", "models/weapons/w_rif_galil.mdl", 1)
AddItem("M249", "bb_m249", "models/weapons/w_mach_m249para.mdl", 1)
AddItem("MAC10", "bb_mac10", "models/weapons/w_smg_mac10.mdl", 1)
AddItem("P90", "bb_p90", "models/weapons/w_smg_p90.mdl", 1)
AddItem("P228", "bb_p228", "models/weapons/w_pist_p228.mdl", 1)
AddItem("Scout", "bb_scout", "models/weapons/w_snip_scout.mdl", 1)
AddItem("SG550", "bb_sg550", "models/weapons/w_snip_sg550.mdl", 1)
AddItem("SG552", "bb_sg552", "models/weapons/w_rif_sg552.mdl", 1)
AddItem("TMP", "bb_tmp", "models/weapons/w_smg_tmp.mdl", 1)
AddItem("XM1014", "bb_xm1014", "models/weapons/w_shot_xm1014.mdl", 1)
AddItem("1897 Winchester", "m9k_1897winchester", "models/weapons/w_winchester_1897_trench.mdl", 1)
AddItem("ACR", "m9k_acr", "models/weapons/w_masada_acr.mdl", 1)
AddItem("AK47", "m9k_ak47", "models/weapons/w_ak47_m9k.mdl", 1)
AddItem("AK74", "m9k_ak74", "models/weapons/w_tct_ak47.mdl", 1)
AddItem("AMD65", "m9k_amd65", "models/weapons/w_amd_65.mdl", 1)
AddItem("AN94", "m9k_an94", "models/weapons/w_rif_an_94.mdl", 1)
AddItem("Ares Shrike", "m9k_ares_shrike", "models/weapons/w_ares_shrike.mdl", 1)
AddItem("AUGA3", "m9k_auga3", "models/weapons/w_auga3.mdl", 1)
AddItem("AW50", "m9k_aw50", "models/weapons/w_acc_int_aw50.mdl", 1)
AddItem("Barret M82", "m9k_barret_m82", "models/weapons/w_barret_m82.mdl", 1)
AddItem("Bizon P19", "m9k_bizonp19", "models/weapons/w_pp19_bizon.mdl", 1)
AddItem("Browning Auto 5", "m9k_browningauto5", "models/weapons/w_browning_auto.mdl", 1)
AddItem("Colt1911", "m9k_colt1911", "models/weapons/s_dmgf_co1911.mdl", 1)
AddItem("Python", "m9k_coltpython", "models/weapons/w_colt_python.mdl", 1)
AddItem("Contender", "m9k_contender", "models/weapons/w_g2_contender.mdl", 1)
AddItem("Damascus", "m9k_damascus", "models/weapons/w_damascus_sword.mdl", 1)
AddItem("Double Barrel", "m9k_dbarrel", "models/weapons/w_double_barrel_shotgun.mdl", 1)
AddItem("Desert Eagle", "m9k_deagle", "models/weapons/w_tcom_deagle.mdl", 1)
AddItem("Dragunov", "m9k_dragunov", "models/weapons/w_svd_dragunov.mdl", 1)
AddItem("EX41", "m9k_ex41", "models/weapons/w_ex41.mdl", 1)
AddItem("F2000", "m9k_f2000", "models/weapons/w_fn_f2000.mdl", 1)
AddItem("FAL", "m9k_fal", "models/weapons/w_fn_fal.mdl", 1)
AddItem("Famas", "m9k_famas", "models/weapons/w_tct_famas.mdl", 1)
AddItem("FG42", "m9k_fg42", "models/weapons/w_fg42.mdl", 1)
AddItem("G3A3", "m9k_g3a3", "models/weapons/w_hk_g3.mdl", 1)
AddItem("G36", "m9k_g36", "models/weapons/w_hk_g36c.mdl", 1)
AddItem("Glock", "m9k_glock", "models/weapons/w_dmg_glock.mdl", 1)
AddItem("HK45", "m9k_hk45", "models/weapons/w_hk45c.mdl", 1)
AddItem("Intervention", "m9k_intervention", "models/weapons/w_snip_int.mdl", 1)
AddItem("Jack Hammer", "m9k_jackhammer", "models/weapons/w_pancor_jackhammer.mdl", 1)
AddItem("PDW", "m9k_kac_pdw", "models/weapons/w_kac_pdw.mdl", 1)
AddItem("Knife", "m9k_knife", "models/weapons/w_extreme_ratio.mdl", 1)
AddItem("L85", "m9k_l85", "models/weapons/w_l85a2.mdl", 1)
AddItem("Luger", "m9k_luger", "models/weapons/w_luger_p08.mdl", 1)
AddItem("M3", "m9k_m3", "models/weapons/w_benelli_m3.mdl", 1)
AddItem("M4A1", "m9k_m4a1", "models/weapons/w_m4a1_iron.mdl", 1)
AddItem("M14 SP", "m9k_m14sp", "models/weapons/w_snip_m14sp.mdl", 1)
AddItem("M16A4 Acog", "m9k_m16a4_acog", "models/weapons/w_dmg_m16ag.mdl", 1)
AddItem("M24", "m9k_M24", "models/weapons/w_snip_m24_6.mdl", 1)
AddItem("M29 Satan", "m9k_m29satan", "models/weapons/w_m29_satan.mdl", 1)
AddItem("M60", "m9k_m60", "models/weapons/w_m60_machine_gun.mdl", 1)
AddItem("M61 Frag", "m9k_m61_frag", "models/weapons/w_grenade.mdl", 1)
AddItem("M79GL", "m9k_m79gl", "models/weapons/w_m79_grenadelauncher.mdl", 1)
AddItem("M92 Beretta", "m9k_m91beretta", "models/weapons/w_beretta_m92.mdl", 1)
AddItem("M98B", "m9k_m98b", "models/weapons/w_barrett_m98b.mdl", 1)
AddItem("M202", "m9k_m202", "models/weapons/w_rocket_launcher.mdl", 1)
AddItem("M249LMG", "m9k_m249lmg", "models/weapons/w_m249_machine_gun.mdl", 1)
AddItem("M416", "m9k_m416", "models/weapons/w_hk_416.mdl", 1)
AddItem("M1918 Bar", "m9k_m1918bar", "models/weapons/w_m1918_bar.mdl", 1)
AddItem("Machete", "m9k_machete", "models/weapons/w_fc2_machete.mdl", 1)
AddItem("Matador", "m9k_matador", "models/weapons/w_GDCW_MATADOR_RL.mdl", 1)
AddItem("Model500", "m9k_model500", "models/weapons/w_sw_model_500.mdl", 1)
AddItem("Model627", "m9k_model627", "models/weapons/w_sw_model_627.mdl", 1)
AddItem("Mossberg590", "m9k_mossberg590", "models/weapons/w_mossberg_590.mdl", 1)
AddItem("MP5", "m9k_mp5", "models/weapons/w_hk_mp5.mdl", 1)
AddItem("MP5 SD", "m9k_mp5sd", "models/weapons/w_hk_mp5sd.mdl", 1)
AddItem("MP7", "m9k_mp7", "models/weapons/w_mp7_silenced.mdl", 1)
AddItem("MP9", "m9k_mp9", "models/weapons/w_brugger_thomet_mp9.mdl", 1)
AddItem("MP40", "m9k_mp40", "models/weapons/w_mp40smg.mdl", 1)
AddItem("PKM", "m9k_pkm", "models/weapons/w_mach_russ_pkm.mdl", 1)
AddItem("PSG1", "m9k_psg1", "models/weapons/w_hk_psg1.mdl", 1)
AddItem("Raging Bull", "m9k_ragingbull", "models/weapons/w_taurus_raging_bull.mdl", 1)
AddItem("Remington870", "m9k_remington870", "models/weapons/w_remington_870_tact.mdl", 1)
AddItem("Remington1858", "m9k_remington1858", "models/weapons/w_remington_1858.mdl", 1)
AddItem("Remington7615", "m9k_remington7615", "models/weapons/w_remington_7615p.mdl", 1)
AddItem("RPG7", "m9k_rpg7", "models/weapons/w_rl7.mdl", 1)
AddItem("Scar", "m9k_scar", "models/weapons/w_fn_scar_h.mdl", 1)
AddItem("Scoped Raging Bull", "m9k_scoped_tuarus", "models/weapons/w_raging_bull_scoped.mdl", 1)
AddItem("SIG P229R", "m9k_sig_p229r", "models/weapons/w_sig_229r.mdl", 1)
AddItem("SL8", "m9k_sl8", "models/weapons/w_hk_sl8.mdl", 1)
AddItem("P90", "m9k_smgp90", "models/weapons/w_fn_p90.mdl", 1)
AddItem("Spas12", "m9k_spas12", "models/weapons/w_spas_12.mdl", 1)
AddItem("Sten", "m9k_sten", "models/weapons/w_sten.mdl", 1)
AddItem("Sticky Grenade", "m9k_sticky_grenade", "models/weapons/w_sticky_grenade.mdl", 1)
AddItem("Striker12", "m9k_striker12", "models/weapons/w_striker_12g.mdl", 1)
AddItem("SVT40", "m9k_svt40", "models/weapons/w_svt_40.mdl", 1)
AddItem("SVU", "m9k_svu", "models/weapons/w_dragunov_svu.mdl", 1)
AddItem("Tar21", "m9k_tar21", "models/weapons/w_imi_tar21.mdl", 1)
AddItem("Tec9", "m9k_tec9", "models/weapons/w_intratec_tec9.mdl", 1)
AddItem("Thompson", "m9k_thompson", "models/weapons/w_tommy_gun.mdl", 1)
AddItem("UMP45", "m9k_ump45", "models/weapons/w_hk_ump45.mdl", 1)
AddItem("USAS", "m9k_usas", "models/weapons/w_usas_12.mdl", 1)
AddItem("USC", "m9k_usc", "models/weapons/w_hk_usc.mdl", 1)
AddItem("USP", "m9k_usp", "models/weapons/w_pist_fokkususp.mdl", 1)
AddItem("UZI", "m9k_uzi", "models/weapons/w_uzi_imi.mdl", 1)
AddItem("VAL", "m9k_val", "models/weapons/w_dmg_vally.mdl", 1)
AddItem("Vector", "m9k_vector", "models/weapons/w_kriss_vector.mdl", 1)
AddItem("Vikhr", "m9k_vikhr", "models/weapons/w_dmg_vikhr.mdl", 1)
AddItem("Winchester73", "m9k_winchester73", "models/weapons/w_winchester_1873.mdl", 1)
