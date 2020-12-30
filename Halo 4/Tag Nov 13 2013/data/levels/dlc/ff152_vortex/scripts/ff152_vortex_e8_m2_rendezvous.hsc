//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434
//
// 	Mission: 					SPARTAN OPS: E8M2 - Artillery
//										
//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434

// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** E8M2: RENDEZVOUS ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// DEFINES --------------------------------------------------------------------------------------------------------------------------------------------------

// VARIABLES ------------------------------------------------------------------------------------------------------------------------------------------------

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
// === f_e8_m2_rendezvous_init::: Init
script dormant f_e8_m2_rendezvous_init()
	dprint( "f_e8_m2_rendezvous_init" );
	
	// initialize sub-modules
	
	// setup trigger
	wake( f_e8_m2_rendezvous_trigger );

end

// === f_e8_m2_rendezvous_trigger::: Trigger
script dormant f_e8_m2_rendezvous_trigger()
local long l_blip = 0;
	dprint( "f_e8_m2_rendezvous_trigger" );
	
	// ARTILLERY COMPLETE
	sleep_until( f_e8_m2_artillery_state() == DEF_E8M2_ARTILLERY_STATE_COMPLETE, 1 );
	wake ( f_e8_m2_rendezvous_action_start );

	// RENDEZVOUS LZ
	sleep_until( f_e8_m2_rendezvous_state() >= DEF_E8M2_RENDEZVOUS_STATE_START, 1 );
	l_blip = f_blip_auto_flag_trigger( flg_e8_m2_rendezvous_lz_loc, "default", tv_e8_m2_lz_area, FALSE );

end

// === f_e8_m2_rendezvous_action_start::: Action
script dormant f_e8_m2_rendezvous_action_start()
	dprint( "f_e8_m2_rendezvous_action_start" );

	sleep_s( 1.0 );
	wake( f_e8_m2_dialog_rendezvous_start );

end


// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** E8M2: rendezvous: STATE ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// DEFINES --------------------------------------------------------------------------------------------------------------------------------------------------

global short DEF_E8M2_RENDEZVOUS_STATE_NONE = 											0;
global short DEF_E8M2_RENDEZVOUS_STATE_START = 											1;
global short DEF_E8M2_RENDEZVOUS_STATE_ATTACK = 										2;

// VARIABLES ------------------------------------------------------------------------------------------------------------------------------------------------
static short S_e8m2_rendezvous_state = 															DEF_E8M2_RENDEZVOUS_STATE_NONE;

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
// === f_e8_m2_rendezvous_state::: Sets the state of the rendezvous
script static void f_e8_m2_rendezvous_state( short s_state )

	if ( s_state > S_e8m2_rendezvous_state ) then
		dprint( "f_e8_m2_rendezvous_state" );
		inspect( s_state );
		S_e8m2_rendezvous_state = s_state;
	end
	
end

// === f_e8_m2_rendezvous_state::: Gets the state of the rendezvous
script static short f_e8_m2_rendezvous_state()
	S_e8m2_rendezvous_state;
end