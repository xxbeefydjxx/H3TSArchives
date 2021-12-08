-- Copyright (c) Microsoft. All rights reserved.

-- THIS CODE IS GENERATED BY THE VISUAL ANIMATION GRAPH EDITOR -- 

-- GENERATED LUA DECLARATIONS --



-- GENERATED LUA CODE --

function control_airborne()

	local ReturnBool_IBDHAEGGIIHHBGDD:table = nil;
	local boolparameter_FCDHIDGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("airborne");

	
	

	return boolparameter_FCDHIDGGIIHHBGDD;
end

function control_ground()

	local ReturnBool_HFGDBEGGIIHHBGDD:table = nil;
	local boolparameter_CCCBAEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("ground");

	
	

	return boolparameter_CCCBAEGGIIHHBGDD;
end

function control_airborne_progress_n1to1()

	local ReturnNumber_FBCBCEGGIIHHBGDD:table = nil;
	local floatparameter_IAJDJDGGIIHHBGDD:table = AnimGraph.CreateFloatControlParameter("airborne_progress_n1to1");

	
	

	return floatparameter_IAJDJDGGIIHHBGDD;
end

function control_airborne_progress_0to1()

	local ReturnNumber_EFFHCEGGIIHHBGDD:table = nil;
	local floatparameter_EDCBHDGGIIHHBGDD:table = AnimGraph.CreateFloatControlParameter("airborne_progress_0to1");

	
	

	return floatparameter_EDCBHDGGIIHHBGDD;
end

function control_stationary_turn_rate()

	local ReturnNumber_BCFIEEGGIIHHBGDD:table = nil;
	local floatparameter_IFBDEEGGIIHHBGDD:table = AnimGraph.CreateFloatControlParameter("stationary_turn_rate");

	
	

	return floatparameter_IFBDEEGGIIHHBGDD;
end

function control_dive()

	local ReturnBool_GGCIHEGGIIHHBGDD:table = nil;
	local boolparameter_DDHJGEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("dive");

	
	

	return boolparameter_DDHJGEGGIIHHBGDD;
end

function control_dead()

	local ReturnBool_JGJJIEGGIIHHBGDD:table = nil;
	local boolparameter_BGDEIEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("dead");

	
	

	return boolparameter_BGDEIEGGIIHHBGDD;
end

function control_evade()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("evade");

	
	

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function control_ping()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("ping");

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function control_ping_type()

	local ReturnInt_HJGAAFGGIIHHBGDD:table = nil;
	local intparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateIntControlParameter("ping_type");

	return intparameter_HHFFJEGGIIHHBGDD;
end

function control_ping_body_part()

	local ReturnInt_HJGAAFGGIIHHBGDD:table = nil;
	local intparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateIntControlParameter("ping_body_part");

	return intparameter_HHFFJEGGIIHHBGDD;
end

function control_ping_yaw()

	local ReturnFloat_HJGAAFGGIIHHBGDD:table = nil;
	local floatparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateFloatControlParameter("ping_yaw");

	return floatparameter_HHFFJEGGIIHHBGDD;
end

function control_ping_pitch()

	local ReturnFloat_HJGAAFGGIIHHBGDD:table = nil;
	local floatparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateFloatControlParameter("ping_pitch");

	return floatparameter_HHFFJEGGIIHHBGDD;
end

function control_ping_direction()

	local ReturnInt_HJGAAFGGIIHHBGDD:table = nil;
	local intparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateIntControlParameter("ping_direction");

	return intparameter_HHFFJEGGIIHHBGDD;
end

function control_reset_fullbody_ping()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("reset_fullbody_ping");

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function control_reset_custom_animation()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("reset_custom_animation");

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function is_full_body_ping()

	local FunctionNode_control_ping:table = control_ping();
	local FunctionNode_control_ping_type:table = control_ping_type();
	local softPingTypeInt:table = AnimGraph.CreateConstantInt(1);

	local isNotSoftPing = AnimGraph.CreateNumericalLogic(NG.NumCond.NotEqual);
	NG.CreateLink(FunctionNode_control_ping_type.Out, isNotSoftPing.Left);
	NG.CreateLink(softPingTypeInt.Out, isNotSoftPing.Right);

	local isFullBodyPing:table = AnimGraph.CreateBooleanLogic(NG.BoolOp.AND);
	NG.CreateLink(FunctionNode_control_ping.Out, isFullBodyPing.MultiIn);
	NG.CreateLink(isNotSoftPing.Out, isFullBodyPing.MultiIn);

	return isFullBodyPing;
end

function control_crouch()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("crouch");

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function airSwim()

	local deadCP:table = control_dead();
	local airborneCP:table = control_airborne();

	local airSwimBool:table = AnimGraph.CreateBooleanLogic(NG.BoolOp.AND);
	NG.CreateLink(deadCP.Out, airSwimBool.MultiIn);
	NG.CreateLink(airborneCP.Out, airSwimBool.MultiIn);

	return airSwimBool;
end

function control_sping_damage_part()

	local ReturnInt_HJGAAFGGIIHHBGDD:table = nil;
	local intparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateIntControlParameter("sping_damage_part");

	
	

	return intparameter_HHFFJEGGIIHHBGDD;
end

function control_sping_yaw()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local floatCP:table = AnimGraph.CreateFloatControlParameter("sping_yaw");

	
	

	return floatCP;
end

function control_sping_pitch()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local floatCP:table = AnimGraph.CreateFloatControlParameter("sping_pitch");

	
	

	return floatCP;
end

function control_sping_normalized_input()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local floatCP:table = AnimGraph.CreateFloatControlParameter("sping_normalized_input");

	
	

	return floatCP;
end

function control_custom_animation_start()
	local boolCP:table = AnimGraph.CreateBoolControlParameter("custom_animation_start");
	return boolCP;
end


function control_put_away()

	local ReturnBool_JGJJIEGGIIHHBGDD:table = nil;
	local boolparameter_BGDEIEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("weapon_put_away");

	
	

	return boolparameter_BGDEIEGGIIHHBGDD;
end

function control_ready()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("weapon_ready");

	
	

	return boolparameter_HHFFJEGGIIHHBGDD;
end

function control_brace()

	local ReturnBool_HJGAAFGGIIHHBGDD:table = nil;
	local boolparameter_HHFFJEGGIIHHBGDD:table = AnimGraph.CreateBoolControlParameter("brace");
	return boolparameter_HHFFJEGGIIHHBGDD;
end
