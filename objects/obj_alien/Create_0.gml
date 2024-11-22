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
dash = false;
dashDuration = 10;
invisible = false;
inv = false;
vectorY = 0;
vectorX = 0;
dir = 0
vect2 = 0;
dead = false;
deadpit = false;
cooldown = false;


fct_MoveH = function(iDirection)//deplacement horizontal
{
	if(!dead){
		var lay_id = layer_get_id("Tiles_Walls");
		var map_id = layer_tilemap_get_id(lay_id);
		if(iDirection == 1)
		{
			var right_Top = tilemap_get_at_pixel(map_id, bbox_right +hspeed, bbox_top);
			var right_Bot = tilemap_get_at_pixel(map_id, bbox_right +hspeed, bbox_bottom);
			if (right_Top == 0 and right_Bot == 0)
			{
				hspeed = lerp(hspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else{ hspeed = 0
				x -= 4*iDirection}
		}
		if(iDirection == -1)
		{
			var left_Top = tilemap_get_at_pixel(map_id, bbox_left-hspeed, bbox_top); //coin haut gauche
			var left_Bot = tilemap_get_at_pixel(map_id, bbox_left-hspeed, bbox_bottom);
			if (left_Top == 0 and left_Bot == 0)
			{
				hspeed = lerp(hspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
			}
			else{ hspeed = 0
				x -= 3*iDirection}
		}
	}
}

fct_MoveV = function(iDirection)//deplacement vertical
{
	
	if(!dead)
	{
		var lay_id = layer_get_id("Tiles_Walls");
		var map_id = layer_tilemap_get_id(lay_id);
		if(iDirection == -1)
		{
			var up_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_top -vspeed);
			var up_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_top -vspeed);
			
			if (up_Left == 0 and up_Right == 0)
			{
				
				vspeed = lerp(vspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)
				
			}
			else
			{
				vspeed = 0;
				y += 4*!iDirection
			}
		}
		if(iDirection == 1)
		{
			var down_Left  = tilemap_get_at_pixel(map_id, bbox_left,  bbox_bottom +vspeed);
			var down_Right = tilemap_get_at_pixel(map_id, bbox_right, bbox_bottom +vspeed);
   
			if (down_Left == 0 and down_Right == 0)
			{
				if(!place_meeting(x,y+vspeed,map_id)){
				vspeed = lerp(vspeed,moveSpeed*iDirection,0.02)
				image_speed = lerp(image_speed,iVitesse,0.05)}
			}
			else{ vspeed = 0
				y -= 3*iDirection}
		}
	}	
}


fct_Angle = function()//gerer l'angle de l'image de l'alien
{
		var lay_id = layer_get_id("Tiles_Walls");
		var map_id = layer_tilemap_get_id(lay_id);

	if(!dead){
	
		direction = point_direction(0,0,vectorX,vectorY)
		image_angle = direction
		if(place_meeting(x,y+vspeed,map_id)){vspeed = 0}
		if(place_meeting(x,y+hspeed,map_id)){hspeed = 0}
		if(place_meeting(x+hspeed, y+vspeed,map_id))
		{
			hspeed = 0;
			vspeed = 0;
			
		}
		if(place_meeting(x-hspeed, y-vspeed,map_id))
		{
			hspeed = 0;
			vspeed = 0;
		}
	}
}

fct_Damage = function()//degats pris = mort
{

	dead = true;
	image_speed = 1;
}