/// @description Insert description here
// You can write your code in this editor
if(obj_alien.dead == true)
{
	bActive2 = true;
	if(keyboard_check(vk_enter))
	{
		bActive2 = false;
		life--;
		room_restart();
	}
}
if(life <= 0)
{
	game_restart()
}