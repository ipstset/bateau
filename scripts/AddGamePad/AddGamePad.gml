/// @description Add a new controller
/// @param index index of found pad
function AddGamePad(argument0) {

	// get the "new" max (may or may not change)
	mMaxGamePads = gamepad_get_device_count();

	var len = ds_list_size(mActiveControllers);
	for(var i=0;i<len;i++){
		if( ds_list_find_value(mActiveControllers,i)==argument0 ) return; // alreday in?
	}
	// not found... so add it
	ds_list_add(mActiveControllers,argument0);
	show_debug_message("Controller added: "+string(argument0));
}
