/// @description Insert description here
// You can write your code in this editor

deplacement = 16*deplacement

x_start = x
y_start = y

b_aller = true
default_sprite_index = 0

if b_bleu
	default_sprite_index = 2


image_index = default_sprite_index
image_speed = 0

fct_Destination = function()
{
	if vertical
	{
		if b_aller //Si on est en aller
		{
			destination_x = x_start + deplacement //La destination est le point defini 
			destination_y = y_start
		}
		else destination_x = x_start //Sinon, on est en retour donc la destination est le point de depart
		
		if abs(x - destination_x) <= 3 //Check si la difference entre les 2 points est inferieure a 3px
		{
			b_aller = !b_aller //On inverse aller et retour quand on atteint la destination
		}
	}
	else
	{
		if b_aller
		{
			destination_x = x_start
			destination_y = y_start + deplacement
		}
		else destination_y = y_start
		
		if abs(y - destination_y) <= 3
		{
			b_aller = !b_aller
		}
	}
}

