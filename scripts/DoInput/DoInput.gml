/// @description Do keyboard and gamepad input
function DoInput() {

	// Keyboard first - it's the simplest
	if( keyboard_check(vk_left)){
		input_left = true;
	}else if( keyboard_check(vk_right)){
		input_right=true;
	}
	if( keyboard_check(vk_up)){
		input_up=true;
	}else if( keyboard_check(vk_down)){
		input_down=true;
	}




	// do controllers - loop around all active ones.
	// really a player should be allocated a single controller....
	var len = ds_list_size(mActiveControllers);
	for(var i=0;i<len;i++){
		var pad = ds_list_find_value(mActiveControllers,i);
	
		if( gamepad_button_check(pad,gp_padl) ) input_left=true;
		else if( gamepad_button_check(pad,gp_padr) ) input_right=true;

		if( gamepad_button_check(pad,gp_padu) ) input_up=true;
		else if( gamepad_button_check(pad,gp_padd) ) input_down=true;
	
	
	
		if( gamepad_axis_value(pad,gp_axislh)<-0.5 ){
			input_left=true;
		}else if( gamepad_axis_value(pad,gp_axislh)>0.5 ){
			input_right=true;
		}
		if( gamepad_axis_value(pad,gp_axislv)<-0.5 ){
			input_up=true;
		}else if( gamepad_axis_value(pad,gp_axislv)>0.5 ){
			input_down=true;
		}	
		
		//action buttons
		if(gamepad_button_check(pad, gp_face1)) input_face1=true;
		if(gamepad_button_check(pad, gp_face2)) input_face2=true;
		if(gamepad_button_check(pad, gp_face3)) input_face3=true;
		if(gamepad_button_check(pad, gp_face4)) input_face4=true;

	}


}
