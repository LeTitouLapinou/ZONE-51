/// @description Insert description here
// You can write your code in this editor
if(obj_alien.dead == true)
{
	if(keyboard_check(vk_enter))
	{
		life--;
		room_restart();
	}
}
if(life <= 0)
{
	game_restart()
}