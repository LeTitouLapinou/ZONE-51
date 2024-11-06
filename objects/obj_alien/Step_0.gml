/// @description Insert description here
// You can write your code in this editor

var reset = keyboard_check(vk_space);

if(keyboard_check(vk_left))
{
	image_angleH = 180
	fct_MoveH(-1);
	
}
if(keyboard_check(vk_right))
{
	image_angleH = 0
	fct_MoveH(1);
	
}

if(keyboard_check(vk_down))
{
	image_angleV = 270
	fct_MoveV(1);
	
}

if(keyboard_check(vk_up))
{
	image_angleV = 90
	fct_MoveV(-1);
	
}
fct_Angle();
if(!keyboard_check(vk_anykey) && (gamepad_axis_value(0,gp_axislh)==0))
{
	image_index = 1;
	image_speed = 0;
}


if (keyboard_check_released(vk_right) && init_slowdown == false) {
    init_slowdown = true;
}

if ( init_slowdown )
{
	var lay_id = layer_get_id("Tiles_Walls");
	var map_id = layer_tilemap_get_id(lay_id);
	var right_Top = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_top);
	var right_Bot = tilemap_get_at_pixel(map_id, bbox_right +moveSpeed, bbox_bottom);
  
	if (right_Top == 0 and right_Bot == 0)
	{
		show_debug_message("init slow Droite")
		hspeed -= fric;
		if( hspeed <= 0 )
		{
			hspeed = 0;
		    init_slowdown = false;
		}
	}
	else
	{
		hspeed = 0;
		init_slowdown = false;
	}
	
}

if (keyboard_check_released(vk_left)  && init_slowdown2 == false){
    init_slowdown2 = true;

}

if ( init_slowdown2 )
{
		var lay_id = layer_get_id("Tiles_Walls");
	var map_id = layer_tilemap_get_id(lay_id);
	var left_Top = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_top); //coin haut gauche
	var left_Bot = tilemap_get_at_pixel(map_id, bbox_left-moveSpeed, bbox_bottom); //coin bas gauche
   
	    // Avancer si pas de collision
	if (left_Top == 0 and left_Bot == 0) 
	{ 
		show_debug_message("init slow Gauche")
	    hspeed += fric;

	    if ( hspeed >= 0 )
	    {
			hspeed = 0;
	        init_slowdown2 = false;
	    }
	}
	else
	{
		hspeed = 0;
		init_slowdown2 = false;
	}
}

if (keyboard_check_released(vk_up)  && init_slowdown3 == false){
    init_slowdown3 = true;

}

if ( init_slowdown3 )
{
		var lay_id = layer_get_id("Tiles_Walls");
	var map_id = layer_tilemap_get_id(lay_id);
	var up_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_top -moveSpeed);
	var up_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_top -moveSpeed);
    
	if (up_Left == 0 and up_Right == 0)
	{
		show_debug_message("init slow haut")
	    vspeed += fric;

	    if ( vspeed >= 0 )
	    {
			vspeed = 0;
	        init_slowdown3 = false;
	    }
	}
	else
	{
		vspeed = 0;
		init_slowdown3 = false;
	}
}

if (keyboard_check_released(vk_down) && init_slowdown4 == false) {
    init_slowdown4 = true;
}

if ( init_slowdown4 )
{
		var lay_id = layer_get_id("Tiles_Walls");
	var map_id = layer_tilemap_get_id(lay_id);
	var down_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_bottom +moveSpeed);
	var down_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_bottom +moveSpeed);
   
	if (down_Left == 0 and down_Right == 0)
	{
		show_debug_message("init slow bas")
	    vspeed -= fric;
	    if( vspeed <= 0 )
	    {
			vspeed = 0;
	        init_slowdown4 = false;
	    }
	}
	else
	{
		vspeed = 0;
		init_slowdown4 = false;
	}
	

}
//fct_Move()

//Juste pour tester
if (reset == 1)
	game_restart()