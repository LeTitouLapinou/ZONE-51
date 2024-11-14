if (global.mon = 1) 
{
audio_pause_sound(snd_ambient_music)

image_index = 1;
} 
if (global.mon = 0) 
{
audio_resume_sound(snd_ambient_music)

image_index = 0;
} 

global.mon = !global.mon