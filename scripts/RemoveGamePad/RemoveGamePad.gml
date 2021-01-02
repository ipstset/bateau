/// @description Remove a controller
/// @param index index of pad to remove
function RemoveGamePad(argument0) {

	var len = ds_list_size(mActiveControllers);
	for(var i=0;i<len;i++){
		if( ds_list_find_value(mActiveControllers,i)==argument0 ) {
			ds_list_delete(mActiveControllers,i);
			show_debug_message("Controller removed: "+string(argument0));
		}
	}

	// get the "new" max (may or may not change)
	mMaxGamePads = gamepad_get_device_count();

	// not found... so ignore....



}
