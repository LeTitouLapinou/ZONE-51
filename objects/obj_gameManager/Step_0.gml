/// @description Insert description here
// You can write your code in this editor
if(obj_alien.dead == true)
{

		life--;
		room_restart();
	
}
if(life <= 0)
{
	game_restart()
}