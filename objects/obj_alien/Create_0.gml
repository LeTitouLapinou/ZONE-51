/// @description Insert description here
// You can write your code in this editor

moveSpeed = 4;
targetRoom = room


fct_Move = function()
{
	var left  = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up    = keyboard_check(ord("W"));
	var down  = keyboard_check(ord("S"));


	// On recupere les ID des tiles
	var lay_id = layer_get_id("Tiles_Walls");
	var map_id = layer_tilemap_get_id(lay_id);


	// Collision check
	if (left == 1)
	{ 
		// Collision check sur la gauche 
		var left_Top = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_top); //coin haut gauche
		var left_Bot = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_bottom); //coin bas gauche
   
	    // Avancer si pas de collision
	    if (left_Top == 0 and left_Bot == 0) 
		{ 
		   x -= moveSpeed;	
		}
	}

	if (right == 1)
	{ 
		var right_Top = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_top);
		var right_Bot = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_bottom);
  
	    if (right_Top == 0 and right_Bot == 0)
		{
		   x += moveSpeed;
		}
	}
	
	if (up == 1)
	{   
		var up_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_top -moveSpeed);
		var up_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_top -moveSpeed);
    
		if (up_Left == 0 and up_Right == 0)
		{
			y -= moveSpeed;
		}
	}
	
	if (down == 1){ 
	
		var down_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_bottom +moveSpeed);
		var down_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_bottom +moveSpeed);
   
		if (down_Left == 0 and down_Right == 0)
		{
			y += moveSpeed;
		}
	}
}
