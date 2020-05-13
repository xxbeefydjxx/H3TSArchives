//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434
//
// 	Mission: 					SPARTAN OPS: E7M1 - Abort
//										
//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434

// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** E7M1: NARRATIVE ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// DEFINES --------------------------------------------------------------------------------------------------------------------------------------------------

// VARIABLES ------------------------------------------------------------------------------------------------------------------------------------------------

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
// === f_e7_m1_narrative_init::: Init
script dormant f_e7_m1_narrative_init()
	dprint( "f_e7_m1_narrative_init" );
	
	// initialize sub-modules
	wake( f_e7_m1_narrative_intro_init );
	wake( f_e7_m1_narrative_outro_init );

end


// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** E7M1: NARRATIVE: INTRO ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
// === f_e7_m1_narrative_intro_init::: Init
script dormant f_e7_m1_narrative_intro_init()
	dprint( "f_e7_m1_narrative_intro_init" );

	// setup trigger
	wake( f_e7_m1_narrative_intro_trigger );

end

// === f_e7_m1_narrative_intro_trigger::: Trigger
script dormant f_e7_m1_narrative_intro_trigger()
	sleep_until( f_spops_mission_ready_complete(), 1 );
	dprint( "f_e7_m1_narrative_intro_trigger" );

	// trigger action
	wake( f_e7_m1_narrative_intro_action );

end

// === f_e7_m1_narrative_intro_action::: Action
script dormant f_e7_m1_narrative_intro_action()
local long l_pup_id = -1;
	dprint( "f_e7_m1_narrative_intro_action" );

	// prep for pup
//	ai_enter_limbo( ai_ff_all );

	if ( not editor_mode() ) then
	
		// fade out
		fade_out( 0, 0, 0, 1 );
	
		cinematic_start();
		f_e7_m1_audio_intro_start();

		// XXX TEMP
		wake( f_e7_m1_dialog_intro );
		
		l_pup_id = pup_play_show( 'pup_e7_m1_intro' );
		sleep_until( not pup_is_playing(l_pup_id), 1 );
		sleep_s( 1 );

		f_e7_m1_audio_intro_end();
		cinematic_stop();

		f_spops_mission_intro_complete( TRUE );

		// fade in
		sleep_s( 0.5 );
		fade_in( 0, 0, 0, 15 );
		
	else
	
		sleep( 1 );
		f_spops_mission_intro_complete( TRUE );
		
	end

end


// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** E7M1: NARRATIVE: OUTRO ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
// === f_e7_m1_narrative_outro_init::: Init
script dormant f_e7_m1_narrative_outro_init()
	dprint( "f_e7_m1_narrative_outro_init" );
	
end