; Decompiled with Assembly
; 
; Source file: armory.hsc
; Start time: 2018-06-29 7:41:46 AM
; 
; Remember that all script code is property of Bungie/343 Industries.
; You have no rights. Play nice.

; Globals
(global string data_mine_mission_segment "")
(global boolean perspective_running false)
(global boolean perspective_finished false)
(global boolean g_cortana_header false)
(global boolean g_cortana_footer false)
(global boolean g_gravemind_header false)
(global boolean g_gravemind_footer false)

; Scripts
(script static unit player0
    (unit (list_get (players) 0))
)

(script static unit player1
    (unit (list_get (players) 1))
)

(script static unit player2
    (unit (list_get (players) 2))
)

(script static unit player3
    (unit (list_get (players) 3))
)

(script static short player_count
    (list_count (players))
)

(script static void print_difficulty
    (game_save_immediate)
    (if (= (game_difficulty_get_real) easy)
        (print "easy")
        (if (= (game_difficulty_get_real) normal)
            (print "normal")
            (if (= (game_difficulty_get_real) heroic)
                (print "heroic")
                (if (= (game_difficulty_get_real) legendary)
                    (print "legendary")
                )
            )
        )
    )
)

(script static boolean difficulty_legendary
    (= (game_difficulty_get) legendary)
)

(script static boolean difficulty_heroic
    (= (game_difficulty_get) heroic)
)

(script static boolean difficulty_normal
    (= (game_difficulty_get) normal)
)

(script static boolean players_not_in_combat
    (player_action_test_reset)
    (sleep 30)
    (if (and (not (player_action_test_primary_trigger)) (not (player_action_test_grenade_trigger)) (if (= (game_coop_player_count) 4)
        (begin
            (>= (object_get_shield (player0)) 1)
            (>= (object_get_shield (player1)) 1)
            (>= (object_get_shield (player2)) 1)
            (>= (object_get_shield (player3)) 1)
        )
        (if (= (game_coop_player_count) 3)
            (begin
                (>= (object_get_shield (player0)) 1)
                (>= (object_get_shield (player1)) 1)
                (>= (object_get_shield (player2)) 1)
            )
            (if (= (game_coop_player_count) 2)
                (begin
                    (>= (object_get_shield (player0)) 1)
                    (>= (object_get_shield (player1)) 1)
                )
                (if true
                    (begin
                        (>= (object_get_shield (player0)) 1)
                    )
                )
            )
        )
    ))
        true
        false
    )
)

(script static boolean cinematic_skip_start
    (cinematic_skip_start_internal)
    (game_save_cinematic_skip)
    (sleep_until (not (game_saving)) 1)
    (not (game_reverted))
)

(script static void cinematic_skip_stop
    (cinematic_skip_stop_internal)
    (if (not (game_reverted))
        (game_revert)
    )
)

(script static void cinematic_fade_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (player_control_fade_out_all_input 1)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 0 0.5)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0 0 0 30)
    (sleep 30)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
)

(script static void cinematic_snap_to_black
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (fade_out 0 0 0 0)
    (player_control_fade_out_all_input 0)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (object_hide (player0) true)
    (object_hide (player1) true)
    (object_hide (player2) true)
    (object_hide (player3) true)
    (chud_cinematic_fade 0 0)
    (campaign_metagame_time_pause true)
    (sleep 1)
    (cinematic_start)
    (camera_control true)
    (player_enable_input false)
    (player_disable_movement false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (sleep 1)
)

(script static void cinematic_fade_to_title
    (sleep 15)
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0 0 0 15)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_fade_to_title_slow
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0 0 0 150)
    (sleep 15)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
)

(script static void cinematic_title_to_gameplay
    (sleep 30)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1)
    (player_disable_movement false)
    (sleep 110)
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1 1)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (game_save)
)

(script static void cinematic_fade_to_gameplay
    (cinematic_stop)
    (camera_control false)
    (cinematic_show_letterbox_immediate true)
    (object_hide (player0) false)
    (object_hide (player1) false)
    (object_hide (player2) false)
    (object_hide (player3) false)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 1)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (fade_in 0 0 0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (chud_cinematic_fade 1 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (player_enable_input true)
    (player_control_fade_in_all_input 1)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_disable_movement false)
    (game_save)
)

(script static void chapter_start
    (chud_cinematic_fade 0 0.5)
    (cinematic_show_letterbox true)
    (sleep 30)
)

(script static void chapter_stop
    (cinematic_show_letterbox false)
    (sleep 15)
    (chud_cinematic_fade 1 0.5)
    (game_save)
)

(script static void perspective_start
    (game_save_cancel)
    (cinematic_skip_start_internal)
    (ai_disregard (player0) true)
    (ai_disregard (player1) true)
    (ai_disregard (player2) true)
    (ai_disregard (player3) true)
    (object_cannot_take_damage (player0))
    (object_cannot_take_damage (player1))
    (object_cannot_take_damage (player2))
    (object_cannot_take_damage (player3))
    (player_control_fade_out_all_input 2)
    (unit_lower_weapon (player0) 30)
    (unit_lower_weapon (player1) 30)
    (unit_lower_weapon (player2) 30)
    (unit_lower_weapon (player3) 30)
    (chud_cinematic_fade 0 0.5)
    (sleep 15)
    (cinematic_show_letterbox true)
    (sleep 5)
    (fade_out 0 0 0 10)
    (sleep 10)
    (camera_control true)
    (cinematic_start)
    (sleep 15)
)

(script static void perspective_stop
    (cinematic_stop)
    (camera_control false)
    (sleep 1)
    (cinematic_show_letterbox_immediate true)
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (player_control_fade_in_all_input 0.5)
    (fade_in 0 0 0 10)
    (sleep 5)
    (cinematic_show_letterbox false)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (sleep 10)
    (chud_cinematic_fade 1 0.5)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (game_save)
)

(script static void perspective_skipped
    (cinematic_stop)
    (camera_control false)
    (ai_disregard (player0) false)
    (ai_disregard (player1) false)
    (ai_disregard (player2) false)
    (ai_disregard (player3) false)
    (object_can_take_damage (player0))
    (object_can_take_damage (player1))
    (object_can_take_damage (player2))
    (object_can_take_damage (player3))
    (player_control_unlock_gaze (player0))
    (player_control_unlock_gaze (player1))
    (player_control_unlock_gaze (player2))
    (player_control_unlock_gaze (player3))
    (sleep 5)
    (player_control_fade_in_all_input 1)
    (fade_in 0 0 0 15)
    (sleep 15)
    (unit_raise_weapon (player0) 15)
    (unit_raise_weapon (player1) 15)
    (unit_raise_weapon (player2) 15)
    (unit_raise_weapon (player3) 15)
    (game_save)
)

(script static boolean perspective_skip_start
    (player_action_test_reset)
    (sleep_until (or (not perspective_running) (player_action_test_cinematic_skip)) 1)
    perspective_running
)

(script static void insertion_start
    (fade_out 0 0 0 0)
    (sound_class_set_gain "object" 0 0)
    (sound_class_set_gain "vehicle" 0 0)
    (cinematic_show_letterbox_immediate true)
    (chud_cinematic_fade 0 0)
    (player_disable_movement true)
    (player_enable_input false)
    (campaign_metagame_time_pause true)
    (unit_lower_weapon (player0) 1)
    (unit_lower_weapon (player1) 1)
    (unit_lower_weapon (player2) 1)
    (unit_lower_weapon (player3) 1)
    (sleep 1)
    (sound_class_set_gain "object" 1 30)
    (sound_class_set_gain "vehicle" 1 30)
)

(script dormant void insertion_end
    (sleep 30)
    (fade_in 0 0 0 15)
    (sleep 15)
    (cinematic_show_letterbox false)
    (player_control_fade_in_all_input 1)
    (sleep 15)
    (chud_cinematic_fade 1 1)
    (unit_raise_weapon (player0) 30)
    (unit_raise_weapon (player1) 30)
    (unit_raise_weapon (player2) 30)
    (unit_raise_weapon (player3) 30)
    (campaign_metagame_time_pause false)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (player_enable_input true)
    (player_disable_movement false)
    (game_save)
)

(script static ai (ai_get_driver (ai vehicle_starting_location))
    (object_get_ai (vehicle_driver (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static ai (ai_get_gunner (ai vehicle_starting_location))
    (object_get_ai (vehicle_gunner (ai_vehicle_get_from_starting_location vehicle_starting_location)))
)

(script static boolean any_players_in_vehicle
    (or (unit_in_vehicle (unit (player0))) (unit_in_vehicle (unit (player1))) (unit_in_vehicle (unit (player2))) (unit_in_vehicle (unit (player3))))
)

(script static void (shut_door_forever (device machine_door))
    (device_operates_automatically_set machine_door false)
    (device_set_position machine_door 0)
    (sleep_until (<= (device_get_position machine_door) 0) 30 300)
    (if (> (device_get_position machine_door) 0)
        (device_set_position_immediate machine_door 0)
    )
    (sleep 1)
    (device_set_power machine_door 0)
)

(script static void (shut_door_forever_immediate (device machine_door))
    (device_operates_automatically_set machine_door false)
    (device_set_position_immediate machine_door 0)
    (device_set_power machine_door 0)
)

(script dormant void reset_map_reminder
    (sleep_until 
        (begin
            (print "press a to play again!")
            false
        )
        90
    )
)

(script static void end_segment
    (print "end gameplay segment!  thank you for playing!")
    (sleep 15)
    (print "grab paul or rob to give feedback!")
    (sleep 15)
    (player_action_test_reset)
    (sleep_until 
        (begin
            (print "press the a button to reset!")
            (sleep_until (player_action_test_accept) 1 90)
            (player_action_test_accept)
        )
        1
    )
    (print "reloading map...")
    (sleep 15)
    (chud_cinematic_fade 1 0)
    (fade_in 0 0 0 0)
    (map_reset)
)

(script static void end_mission
    (if global_playtest_mode
        (begin
            (data_mine_set_mission_segment "questionaire")
            (cinematic_fade_to_gameplay)
            (sleep 1)
            (print "end mission!")
            (sleep 15)
            (hud_set_training_text "playtest_raisehand")
            (hud_show_training_text true)
            (sleep 90)
            (player_action_test_reset)
            (sleep_until 
                (begin
                    (sleep_until (player_action_test_accept) 1 90)
                    (player_action_test_accept)
                )
                1
            )
            (hud_show_training_text false)
            (print "loading next mission...")
            (sleep 15)
        )
        (begin
            (fade_out 0 0 0 0)
            (cinematic_stop)
            (camera_control false)
        )
    )
    (game_won)
)

(script startup void beginning_mission_segment
    (data_mine_set_mission_segment "mission_start")
)

(script continuous void gs_cortana_header
    (sleep_until g_cortana_header 1)
    (print "cortana header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 0.5)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (damage_players "cinematics\cortana_channel\cortana_effect")
    (gs_hud_flicker_out)
    (set g_cortana_header false)
)

(script continuous void gs_cortana_footer
    (sleep_until g_cortana_footer 1)
    (print "cortana footer")
    (sleep 1)
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1 0.5)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (game_save)
    (chud_cinematic_fade 1 1.5)
    (sound_impulse_start "sound\visual_fx\cortana_hud_on" none 1)
    (set g_cortana_footer false)
)

(script continuous void gs_gravemind_header
    (sleep_until g_gravemind_header 1)
    (print "gravemind header")
    (game_save_cancel)
    (game_safe_to_respawn false)
    (player_control_scale_all_input 0.15 2)
    (ai_dialogue_enable false)
    (ai_disregard (players) true)
    (object_cannot_take_damage (players))
    (sleep 1)
    (set g_gravemind_header false)
)

(script continuous void gs_gravemind_footer
    (sleep_until g_gravemind_footer 1)
    (print "gravemind footer")
    (game_safe_to_respawn true)
    (player_control_scale_all_input 1 1)
    (ai_dialogue_enable true)
    (ai_disregard (players) false)
    (object_can_take_damage (players))
    (sleep 1)
    (set g_gravemind_footer false)
    (sleep 30)
    (game_save)
)

(script static void gs_hud_flicker_out
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start "sound\visual_fx\sparks_medium" none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
)

(script static boolean award_skull
    (if (and (>= (game_difficulty_get_real) normal) (= (game_insertion_point_get) 0))
        true
        false
    )
)

(script continuous void armory_main
    (add_recycling_volume "garbage" 0 5)
    (sleep 300)
)

; Decompilation finished in ~0.9684288s
