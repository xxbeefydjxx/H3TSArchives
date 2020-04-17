(global boolean b_methane_01 FALSE)
(script static void (th_methane_01)
	(cs_stow (performance_get_actor grunt1) TRUE)
	(performance_play_line "stow1")
	(performance_play_line "enter1")
	(performance_play_line "idle1")
	(performance_play_line "block")
	(performance_play_line "sleep")
	(sleep_until (> (ai_combat_status (performance_get_actor grunt1)) 2))
	(performance_play_line "exit1")
)

(global boolean b_methane_02 FALSE)
(script static void (th_methane_02)
	(cs_stow (performance_get_actor grunt1) TRUE)
	(performance_play_line "stow1")
	(performance_play_line "enter1")
	(performance_play_line "idle1")
	(performance_play_line "block")
	(performance_play_line "sleep")
	(sleep_until (> (ai_combat_status (performance_get_actor grunt1)) 2))
	(performance_play_line "exit1")
)

(global boolean b_methane_03 FALSE)
(script static void (th_methane_03)
	(cs_stow (performance_get_actor grunt1) TRUE)
	(performance_play_line "stow1")
	(performance_play_line "enter1")
	(performance_play_line "idle1")
	(performance_play_line "block")
	(performance_play_line "sleep")
	(sleep_until (> (ai_combat_status (performance_get_actor grunt1)) 2))
	(performance_play_line "exit1")
)

(global boolean b_methane_04 FALSE)
(script static void (th_methane_04)
	(cs_stow (performance_get_actor grunt1) TRUE)
	(performance_play_line "stow1")
	(performance_play_line "enter1")
	(performance_play_line "idle1")
	(performance_play_line "block")
	(performance_play_line "sleep")
	(sleep_until (> (ai_combat_status (performance_get_actor grunt1)) 2))
	(performance_play_line "exit1")
)

(script static void (th_dirt_emile_cliff)
	(performance_play_line "goto_3")
	(sleep_until (>= objcon_dirt 20) 5)
	(performance_play_line "wait_for_player_1")
	(set b_dirt_emile_look TRUE)
	(performance_play_line "emile_look")
	(cs_crouch (performance_get_actor emile) TRUE)
	(performance_play_line "crouch")
	(performance_play_line "point")
	(performance_play_line "crouch_anim")
	(sleep_until (volume_test_players tv_dirt_emile_player_clifftop) 3 150)
	(performance_play_line "wait_for_player_2")
	(set b_dirt_emile_moveon TRUE)
	(performance_play_line "emile_moveon")
	(performance_play_line "goto_4")
	(performance_play_line "goto_5")
	(performance_play_line "goto_6")
	(performance_play_line "goto_7")
)

(script static void (th_dirt_grunt_check_1)
	(performance_play_line "move_01")
	(performance_play_line "anim_enter")
	(performance_play_line "anim_look")
	(performance_play_line "anim_exit")
)

(script static void (th_dirt_grunt_check_2)
	(performance_play_line "move_01")
	(performance_play_line "anim_enter")
	(performance_play_line "anim_look")
	(performance_play_line "anim_exit")
)

(script static void (th_dirt_grunt_check_3)
	(performance_play_line "move_01")
	(performance_play_line "anim_enter")
	(performance_play_line "anim_look")
	(performance_play_line "anim_exit")
)

(script static void (th_catwalk_entry_1)
	(performance_play_line "marine_01_move_01")
	(performance_play_line "marine_01_beckon")
)

(script static void (th_catwalk_entry_2)
	(performance_play_line "marine_01_move_01")
	(performance_play_line "marine_01_beckon")
)

(script static void (th_catwalk_entry_3)
	(performance_play_line "marine_01_move_01")
	(performance_play_line "marine_01_beckon")
)

