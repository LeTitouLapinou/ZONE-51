/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_warden)//piege s eteint quand le warden est la
	{
		image_index=1;
		image_speed=0;
	}
else
	{
		fct_Destination()
		move_towards_point(destination_x, destination_y, var_speed)
	}