/// @description Insert description here
// You can write your code in this editor


if point_distance(x,y, obj_alien.x, obj_alien.y) <= 100
{
	if image_index != 3 //si porte non ouverte
	{
		image_speed = 1
	}
	else
	{
		isOpen = true
		image_index = 3
		image_speed = 0
	}
}

else
{
	if floor(image_index) == 0
	{
		image_speed = 0
	}
	else image_speed = -1
}