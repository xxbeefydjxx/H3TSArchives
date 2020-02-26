; Decompiled with Assembly
; 
; Source file: mainmenu.hsc
; Start time: 2018-06-29 1:44:13 AM
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
(global short ui_location 65535)
(global real mainmenu_offset 0)
(global long wait_ticks 0)
(global short ui_location_clock_start 65535)

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
    (award_skull)
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
    (sound_impulse_start none none 1)
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
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 1 (real_random_range 0 0.035))
    (sound_impulse_start none none 1)
    (sleep (random_range 2 5))
    (chud_cinematic_fade 0 (real_random_range 0 0.035))
)

(script static boolean award_skull
    (if (and (>= (game_difficulty_get_real) normal) (= (game_insertion_point_get) 0))
        true
        false
    )
)

(script static void (sleep_ui (long timer_ticks))
    (print "sleep ui script")
    (set ui_location_clock_start ui_location)
    (set wait_ticks 0)
    (sleep_until 
        (begin
            (set wait_ticks (+ wait_ticks 1))
            (if (!= ui_location ui_location_clock_start)
                (set wait_ticks timer_ticks)
            )
            (>= wait_ticks timer_ticks)
        )
        1
    )
)

(script static void (set_ui_location (short location))
    (set ui_location location)
    (sleep 1)
)

(script static void kill_camera_scripts
    (print "kill camera scripts")
    (kill_active_scripts)
    (if (!= ui_location 0)
        (sleep_forever mainmenu_cam)
    )
    (if (!= ui_location 1)
        (sleep_forever campaign_cam)
    )
    (if (!= ui_location 2)
        (sleep_forever matchmaking_cam)
    )
    (if (!= ui_location 3)
        (sleep_forever custom_cam)
    )
    (if (!= ui_location 4)
        (sleep_forever editor_cam)
    )
    (if (!= ui_location 5)
        (sleep_forever theater_cam)
    )
)

(script startup void mainmenu
    (print "mainmenu statup script")
    (wake appearance_characters)
    (wake sc_bridge_cruiser)
    (fade_out 0 0 0 0)
    (set ui_location 65535)
    (sleep 8)
    (texture_camera_set_aspect_ratio 0.676)
    (fade_in 0 0 0 22)
    (camera_control true)
)

(script dormant void appearance_characters
    (print "appearance characters [static script]")
    (pvs_set_object "chief")
    (pvs_set_object "elite")
    (sleep 1)
    (objects_attach "chief" "right_hand" "appearance_ar" "")
    (objects_attach "elite" "right_hand_elite" "apperance_pr" "")
    (sleep 1)
    (custom_animation_loop "chief" "objects\characters\masterchief\masterchief" "ui:rifle:idle:var1" false)
    (custom_animation_loop "elite" "objects\characters\elite\elite" "combat:pistol:idle:var0" false)
    (texture_camera_enable_dynamic_lights true)
)

(script static void campaign_characters
    (print "campaign characters [static script]")
    (object_create_containing "campaign_")
    (set_ui_location 1)
    (pvs_set_object "campaign_chief")
    (pvs_set_object "campaign_aribter")
    (set_ui_location 1)
    (objects_attach "campaign_chief" "right_hand" "campaign_ar" "")
    (objects_attach "campaign_aribter" "right_hand_elite" "campaign_pr" "")
    (set_ui_location 1)
    (custom_animation_loop "campaign_chief" "objects\characters\masterchief\masterchief" "ui:rifle:idle:var2" false)
    (custom_animation_loop "campaign_aribter" "objects\characters\elite\elite" "ui:pistol:idle:var1" false)
    (texture_camera_enable_dynamic_lights true)
)

(script static void custom_characters
    (print "campaign characters [static script]")
    (object_create_containing "custom_")
    (set_ui_location 1)
    (pvs_set_object "custom_chief_01")
    (pvs_set_object "custom_elite_01")
    (set_ui_location 1)
    (objects_attach "custom_chief_01" "right_hand" "custom_ar_01" "")
    (objects_attach "custom_elite_01" "right_hand_elite" "custom_pr_01" "")
    (objects_attach "custom_elite_01" "left_hand_elite" "custom_pr_02" "")
    (set_ui_location 1)
    (custom_animation_loop "custom_chief_01" "objects\characters\masterchief\masterchief" "ui:rifle:idle:var3" false)
    (custom_animation_loop "custom_elite_01" "objects\characters\elite\elite" "ui:dual:idle:var1" false)
    (texture_camera_enable_dynamic_lights true)
)

(script static void mainmenu_cam
    (print "mainmenu camera")
    (set_ui_location 10)
    (kill_camera_scripts 0)
    (mainmenu)
    (object_destroy_containing "campaign_")
    (object_destroy_containing "custom_")
    (object_destroy_containing "editor_")
    (object_destroy "cruiser3")
    (object_create_anew "banshee1")
    (object_create_anew "banshee2")
    (cinematic_light_object "ark" "" lighting_ark "light_anchor")
    (cinematic_light_object "storm" "" lighting_storm "light_anchor")
    (cinematic_light_object "cruiser1" "" lighting_ships "light_anchor")
    (cinematic_light_object "cruiser2" "" lighting_ships "light_anchor")
    (cinematic_light_object "cruiser3" "" lighting_ships "light_anchor")
    (cinematic_light_object "cruiser4" "" lighting_ships "light_anchor")
    (cinematic_light_object "clouds_ark" "" lighting_clouds "light_anchor")
    (cinematic_lighting_rebuild_all)
    (sleep_until 
        (begin_random
            (begin
                (print "mainmenu: camera track 1")
                (camera_set_animation_relative_with_speed "objects\characters\cinematic_camera\ui\main_menu\main_menu" "camera_path_main1" none "xxxanchorxxx" 0.5)
                (scenery_animation_start "banshee1" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee1")
                (object_set_custom_animation_speed "banshee1" 0.5)
                (object_cinematic_visibility "banshee1" true)
                (scenery_animation_start "banshee2" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee2")
                (object_set_custom_animation_speed "banshee2" 0.5)
                (object_cinematic_visibility "banshee2" true)
                (sleep 1599)
                false
            )
            (begin
                (print "mainmenu: camera track 2")
                (camera_set_animation_relative_with_speed "objects\characters\cinematic_camera\ui\main_menu\main_menu" "camera_path_main2" none "xxxanchorxxx" 0.5)
                (scenery_animation_start "banshee1" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee3")
                (object_set_custom_animation_speed "banshee1" 0.5)
                (object_cinematic_visibility "banshee1" true)
                (scenery_animation_start "banshee2" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee4")
                (object_set_custom_animation_speed "banshee2" 0.5)
                (object_cinematic_visibility "banshee2" true)
                (sleep 1599)
                false
            )
            (begin
                (print "mainmenu: camera track 3")
                (camera_set_animation_relative_with_speed "objects\characters\cinematic_camera\ui\main_menu\main_menu" "camera_path_main3" none "xxxanchorxxx" 0.5)
                (scenery_animation_start "banshee1" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee5")
                (object_set_custom_animation_speed "banshee1" 0.5)
                (object_cinematic_visibility "banshee1" true)
                (scenery_animation_start "banshee2" "objects\vehicles\banshee\cinematics\ui\mainmenu\mainmenu" "cin_banshee6")
                (object_set_custom_animation_speed "banshee2" 0.5)
                (object_cinematic_visibility "banshee2" true)
                (sleep 1599)
                false
            )
        )
        1
    )
    (sleep_forever)
)

(script static void campaign_cam
    (print "campaign camera")
    (set_ui_location 10)
    (kill_camera_scripts 1)
    (mainmenu)
    (object_destroy_containing "custom_")
    (object_destroy_containing "editor_")
    (object_destroy "cruiser3")
    (object_destroy "banshee1")
    (object_destroy "banshee2")
    (custom_characters)
    (camera_set "campaign_in" 0)
    (sleep 0)
    (camera_set "campaign" 11)
    (set_ui_location 30)
    (camera_set "campaign_path_02" 700)
    (set_ui_location 250)
    (camera_set "campaign_path_03" 700)
    (set_ui_location 250)
    (camera_set "campaign_path_04" 700)
    (set_ui_location 250)
    (camera_set "campaign" 700)
    (set_ui_location 250)
    (sleep_forever)
)

(script static void matchmaking_cam
    (print "matchmaking camera")
    (set_ui_location 10)
    (kill_camera_scripts 2)
    (mainmenu)
    (object_destroy_containing "campaign_")
    (object_destroy_containing "custom_")
    (object_destroy_containing "editor_")
    (object_destroy "cruiser3")
    (object_destroy "banshee1")
    (object_destroy "banshee2")
    (camera_set "matchmaking_in" 0)
    (sleep 0)
    (camera_set "matchmaking" 11)
    (set_ui_location 30)
    (camera_set "mm_path_02" 700)
    (set_ui_location 250)
    (camera_set "mm_path_03" 700)
    (set_ui_location 250)
    (camera_set "mm_path_04" 700)
    (set_ui_location 250)
    (camera_set "matchmaking" 700)
    (set_ui_location 250)
    (sleep_forever)
)

(script static void custom_cam
    (print "custom camera")
    (set_ui_location 10)
    (kill_camera_scripts 3)
    (mainmenu)
    (object_create_containing "custom_")
    (object_destroy_containing "editor_")
    (object_destroy "cruiser3")
    (object_destroy "banshee1")
    (object_destroy "banshee2")
    (mainmenu_cam)
    (camera_set "custom_in" 0)
    (sleep 0)
    (camera_set "custom_games" 11)
    (set_ui_location 30)
    (camera_set "custom_path_02" 700)
    (set_ui_location 250)
    (camera_set "custom_path_03" 700)
    (set_ui_location 250)
    (camera_set "custom_path_04" 700)
    (set_ui_location 250)
    (camera_set "custom_games" 700)
    (set_ui_location 250)
    (sleep_forever)
)

(script static void editor_characters
    (object_create_anew_containing "editor_")
    (sleep 1)
    (scenery_animation_start_loop "editor_monitor" "levels\ui\mainmenu\objects\monitor_cheap\monitor_cheap" "ui:idle:var1")
)

(script static void editor_cam
    (print "editor camera")
    (set_ui_location 10)
    (kill_camera_scripts 4)
    (mainmenu)
    (object_destroy_containing "campaign_")
    (object_destroy_containing "custom_")
    (object_destroy "banshee1")
    (object_destroy "banshee2")
    (editor_cam)
    (camera_set "editor_in" 0)
    (sleep 0)
    (camera_set "editor" 11)
    (set_ui_location 30)
    (camera_set "editor_path_02" 500)
    (set_ui_location 250)
    (camera_set "editor_path_03" 700)
    (set_ui_location 250)
    (camera_set "editor_path_04" 700)
    (set_ui_location 250)
    (camera_set "editor" 700)
    (set_ui_location 250)
    (sleep_forever)
)

(script static void theater_cam
    (print "theater camera")
    (set_ui_location 10)
    (kill_camera_scripts 5)
    (mainmenu)
    (object_destroy_containing "campaign_")
    (object_destroy_containing "custom_")
    (object_destroy_containing "editor_")
    (object_destroy "banshee1")
    (object_destroy "banshee2")
    (object_create "cruiser3")
    (cinematic_light_object "cruiser3" "" lighting_ships "light_anchor")
    (cinematic_lighting_rebuild_all)
    (camera_set "theater_in" 0)
    (sleep 0)
    (camera_set "theater" 11)
    (set_ui_location 30)
    (camera_set "theater_path_02" 700)
    (set_ui_location 250)
    (camera_set "theater_path_03" 700)
    (set_ui_location 250)
    (camera_set "theater_path_04" 700)
    (set_ui_location 250)
    (camera_set "theater" 700)
    (set_ui_location 250)
    (sleep_forever)
)

(script dormant void sc_bridge_cruiser
    (print "cruiser is awake")
    (scenery_animation_start_loop "cruiser1" "objects\vehicles\cov_cruiser\cinematics\vignettes\030vb_excavation\030vb_excavation" "cinematic_cov_cruiser")
    (object_set_custom_animation_speed "cruiser1" 0.009)
    (object_cinematic_visibility "cruiser1" true)
    (scenery_animation_start_at_frame_loop "cruiser2" "objects\vehicles\cov_cruiser\cinematics\vignettes\030vb_excavation\030vb_excavation" "cinematic_cov_cruiser1" (random_range 35 40))
    (object_set_custom_animation_speed "cruiser2" 0.01)
    (object_cinematic_visibility "cruiser2" true)
)

; Decompilation finished in ~0.0225239s
