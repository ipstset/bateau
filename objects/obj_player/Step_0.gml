/// @description Player step event
//---------UPDATE INPUT

input_left = false;
input_right = false;
input_up = false;
input_down = false;

input_face1 = false;
input_face2 = false;
input_face3 = false;
input_face4 = false;

input_walk = false;
input_run = false;

DoInput();

//---------ACTIONS
if(input_face1) show_debug_message("Face 1 pressed...");
if(input_face2) show_debug_message("Face 2 pressed...");
if(input_face3) show_debug_message("Face 3 pressed...");
if(input_face4) show_debug_message("Face 4 pressed...");

//---------ALTER SPEED
if(input_walk || input_run) {
	spd = abs((input_walk * walk_spd) - (input_run * run_spd));
} else {
	spd = norm_spd;
}

//---------RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

//---------INTENDED MOVEMENT
moveX = (input_right - input_left) * spd;
moveY = (input_down - input_up) * spd;

//---------COLLISION CHECKS
//horizontal
if(moveX != 0) {
	if(place_meeting(x + moveX,y,obj_collision)) {
	repeat(abs(moveX)) {
		if(!place_meeting(x + sign(moveX),y,obj_collision)) { x += sign(moveX); } 
		else { break; }
	}
		moveX = 0;
	}
}

//vertical
if(moveY != 0) {
	if(place_meeting(x,y + moveY,obj_collision)) {
		repeat(abs(moveY)) {
			if(!place_meeting(x,y + sign(moveY),obj_collision)) { y += sign(moveY); } 
			else { break; }
		}
		moveY = 0;
	}
}

//---------SPRITE
//set sprite
if(moveY < 0)	{ sprite_index = spr_Alex_up };
if(moveY > 0)	{ sprite_index = spr_Alex_down };
if(moveX < 0)	{ sprite_index = spr_Alex_left };
if(moveX > 0)	{ sprite_index = spr_Alex_right };

if(moveX == 0 && moveY == 0) { 
	sprite_index = spr_Alex_idle
	image_speed = 0;
	image_index = 0;
} else {
	//adjust image speed
	image_speed = spd * 0.5;
}


//---------APPLY MOVEMENT
x += moveX;
y += moveY;
