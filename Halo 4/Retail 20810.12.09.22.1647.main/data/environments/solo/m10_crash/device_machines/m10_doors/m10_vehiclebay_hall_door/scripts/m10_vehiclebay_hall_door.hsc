//343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
//
// Mission: 					m10_crash_end
// script for the device machine
//										
//343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343

// -------------------------------------------------------------------------------------------------
// INIT
// -------------------------------------------------------------------------------------------------
// === f_init: init function
script startup instanced init()
	//dprint_door( "init" );
	// set it's base overlay animation to 'any:idle'
	device_set_position_track( this, 'any:idle', 0 );
	device_animate_position(this, 1, 0, 0.1, 0.1, TRUE);
	
	// initialize variables
	speed_set_open( DEF_SPEED_DEFAULT );
	speed_set_close( DEF_SPEED_DEFAULT );
	
	sound_open_set( 'sound\environments\solo\m010\placeholder\doors\m_m10_placeholder_door_open' );
	sound_close_set( 'sound\environments\solo\m010\placeholder\doors\m_m10_placeholder_door_close' );

//	set_jittering( FALSE );
	
//	weaponpickup_set( -1, -1 );
	
	chain_delay_set( DEF_SPEED_DEFAULT / 8 );
	
//	animate( 0.0, R_door_start_position );

end