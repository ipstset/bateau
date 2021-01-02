walk_spd = 1;
norm_spd = 1;
run_spd = 3;

spd = norm_spd;

//input
mActiveControllers = ds_list_create();
mMaxGamePads = gamepad_get_device_count();

// Get initial list of gamepads....
for(var i=0;i<mMaxGamePads;i++){
	if( gamepad_is_connected(i) ){
		AddGamePad(i);
	}
}
