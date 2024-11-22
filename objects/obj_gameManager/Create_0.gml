/// @description Insert description here
// You can write your code in this editor
life = 3;
fAlpha = 2;
draw_set_alpha(fAlpha);
bActive = false;
bActive2 = false;
test = 0.1;
audio_pause_sound(snd_ambient_music)

DrawPoints = function(hexCol = c_aqua)//affichage nombre de  vie
{
	draw_text_color(x+room_width*0.1,y+room_height*0.1,$"VIE : {life}",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}

DrawPoints2 = function(hexCol = c_silver)//affichage mort
{
	draw_text_color(x+room_width*0.5,y+room_height*0.5,$"press Enter to retry",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}

audio_play_sound(snd_music_base, 10, true, 0.5)
audio_play_sound(snd_music_chase, 10, true, 0.5)
audio_sound_gain(snd_music_base,7,0)