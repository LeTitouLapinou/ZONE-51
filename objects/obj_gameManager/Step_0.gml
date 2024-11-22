/// @description gestion de mort du joueur et de l'audio du jeu (ingame)
// You can write your code in this editor
bActive = true;

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

if(instance_exists(obj_warden))
{
	audio_sound_gain(snd_music_chase,8,0)
	
}
if(!instance_exists(obj_warden)){audio_sound_gain(snd_music_chase,0,0)}

if(instance_exists(obj_spike))
{
	if(obj_spike.image_index == 11)
	{
		audio_play_sound(snd_spike,10,false,0.5)
	}
}

if(room == rm_ENDING_SCREEN)//entrer pour reset le jeu
{
	if(keyboard_check(vk_space))
	{
		game_restart();
	}
}