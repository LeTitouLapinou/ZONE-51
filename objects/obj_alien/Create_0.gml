/// @description Insert description here
// You can write your code in this editor
fric = 0.3;
init_slowdown = false;
init_slowdown2 = false;
init_slowdown3 = false;
init_slowdown4 = false;
iVitesse = 1;
image_angleH = 0;
image_angleV = 0;
image_speed = 0;
moveSpeed = 4;
targetRoom = room;


/*
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
}*/

fct_MoveH = function(iDirection)//iDirection = -1 ou 1
{
		var lay_id = layer_get_id("Tiles_Walls");
		var map_id = layer_tilemap_get_id(lay_id);
		if(iDirection == 1)
		{
			var right_Top = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_top);
			var right_Bot = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_bottom);
			if (right_Top == 0 and right_Bot == 0)
			{
				hspeed = lerp(hspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else{ hspeed = 0}
		}
		if(iDirection == -1)
		{
			var left_Top = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_top); //coin haut gauche
			var left_Bot = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_bottom);
			if (left_Top == 0 and left_Bot == 0)
			{
				hspeed = lerp(hspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else{ hspeed = 0}
		}
		//x+= hspeed*iDirection
		//if(iDirection==1){droite=true}else{if(iDirection==-1){gauche=true}}
		
}

fct_MoveV = function(iDirection)//iDirection = -1 ou 1
{
		var lay_id = layer_get_id("Tiles_Walls");
		var map_id = layer_tilemap_get_id(lay_id);
		
		if(iDirection == -1)
		{
			var up_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_top -moveSpeed);
			var up_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_top -moveSpeed);
			
			if (up_Left == 0 and up_Right == 0)
			{
				vspeed = lerp(vspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else
			{
				vspeed = 0;
			}
		}
		if(iDirection == 1)
		{
			var down_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_bottom +moveSpeed);
			var down_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_bottom +moveSpeed);
   
			if (down_Left == 0 and down_Right == 0)
			{
				vspeed = lerp(vspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else{ vspeed = 0}
		}
		
		//x+= hspeed*iDirection
		//if(iDirection==1){droite=true}else{if(iDirection==-1){gauche=true}}
		
}

fct_Angle = function()
{
	if((keyboard_check(vk_right)) || (keyboard_check(vk_left))){image_angle = image_angleH}
	if((keyboard_check(vk_up)) || (keyboard_check(vk_down))){image_angle = image_angleV}
	
	if(keyboard_check(vk_up) && (keyboard_check(vk_left)) || (keyboard_check(vk_up)) &&  (keyboard_check(vk_right)))
	{
		image_angle = (image_angleV + image_angleH)*0.5
	}
	if((keyboard_check(vk_down)) &&  (keyboard_check(vk_left)))
	{
		image_angle = (image_angleV + image_angleH)*0.5
	}
		if(keyboard_check(vk_down) && (keyboard_check(vk_right)))
	{
		image_angle = 320
	}
}
