//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434
//										
// *** UNSC_RADIO_RVB_SPOPS ***
//										
//34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434334343434343434343434343434343434343434343434343434343434

// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// *** UNSC_RADIO_RVB_SPOPS: MANAGER ***
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------------------------------

// VARIABLES ------------------------------------------------------------------------------------------------------------------------------------------------
instanced boolean B_interacted =	FALSE;
instanced string STR_notify_msg = "RVB_INTERACTED";

// FUNCTIONS ------------------------------------------------------------------------------------------------------------------------------------------------
script startup instanced manage()

	// init
	dprint( "UNSC_RADIO_RVB_SPOPS: manage: INIT" );
	object_cannot_die( this, TRUE );

	// interaction
	sleep_until( (object_get_health(this) < 1.0) or B_interacted, 1 );
	dprint( "UNSC_RADIO_RVB_SPOPS: manage: INTERACTED" );
	sound_impulse_start( 'sound\dialog\storm_multiplayer\pve\global_dialog\redvsblue_maintitletheme', NONE, 1 );
	interacted( TRUE );
	NotifyLevel( notify_msg() );
	
end

script static instanced boolean interacted()
	B_interacted;
end
script static instanced void interacted( boolean b_val )
	B_interacted = b_val;
end

script static instanced string notify_msg()
	STR_notify_msg;
end
script static instanced void notify_msg( string str_msg )
	STR_notify_msg = str_msg;
end
