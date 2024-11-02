/// @description Insert description here
// You can write your code in this editor

var left  = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up    = keyboard_check(vk_up);
var down  = keyboard_check(vk_down);

var reset = keyboard_check(vk_space);

// get tileset to check
var lay_id = layer_get_id("Tiles_Walls");
var map_id = layer_tilemap_get_id(lay_id);



/// collision check
if (left == 1){ 
	
	// is there a "collision" on the right side 
var left_Top = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_top);
var left_Bot = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_bottom);
   
   // is there no tile block, you can  move
   if (left_Top == 0 and left_Bot == 0) { x -= moveSpeed;	}
	}

if (right == 1){ 
	
	// is there a "collision" on the left side 
var right_Top = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_top);
var right_Bot = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_bottom);
   
   // is there no tile block, you can  move
   if (right_Top == 0 and right_Bot == 0) { x += moveSpeed;	}
	}
	
	
	
if (up == 1){ 
	
	// is there a "collision" on the top  
var up_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_top -moveSpeed);
var up_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_top -moveSpeed);
   
   // is there no tile block, you can  move
   if (up_Left == 0 and up_Right == 0) { y -= moveSpeed;	}
	}
	
if (down == 1){ 
	
	// is there a "collision" on the bottom side
var down_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_bottom +moveSpeed );
var down_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_bottom +moveSpeed);
   
   // is there no tile block, you can  move
   if (down_Left == 0 and down_Right == 0) { y += moveSpeed;	}
	}
	
if (reset == 1)
	room_goto(rm_W_E_01)