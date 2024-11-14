/// @description Insert description here
// You can write your code in this editor


if place_meeting(x, y, obj_alien) //Si l'alien est sur la porte, alors elle est ouverte
{
	image_index = 3
}

else //Sinon elle est fermee
{
	if floor(image_index) == 0
		image_speed = 0
	else image_speed = -1	

}