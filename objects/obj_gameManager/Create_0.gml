/// @description Insert description here
// You can write your code in this editor
life = 3;
fAlpha = 2;
ffAlpha = 0;
draw_set_alpha(fAlpha);
bActive = false;
bActive2 = false;
bActive3 = false;
test = 0.1;
audio_pause_sound(snd_ambient_music)

DrawPoints = function(hexCol = c_lime)//affichage nombre de  vie
{
	draw_set_font(Font1);
	draw_text_color(x+room_width*0.1,y+room_height*0.1,$"VIE : {life}",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}

DrawPoints2 = function(hexCol = c_aqua)//affichage mort
{
	draw_set_font(Font1_1);
	
	draw_text_color(x+room_width*0.5,y+room_height*0.5,$"press 'Enter' to retry",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}

DrawPoints3 = function(hexCol = c_aqua)//touches
{
	draw_set_font(Font1_1);
	
	draw_text_color(x+room_width*0.5,y+room_height*0.5,$"Deplacement : WASD\nDash : Shift (au dessus des trous)",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				ffAlpha)
}

audio_play_sound(snd_music_base, 10, true, 0.5);
audio_play_sound(snd_music_chase, 10, true, 0.5);
audio_sound_gain(snd_music_base,7,0);