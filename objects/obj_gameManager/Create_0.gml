/// @description Insert description here
// You can write your code in this editor
life = 3;
fAlpha = 2;
draw_set_alpha(fAlpha);
bActive = true;
bActive2 = false;


DrawPoints = function(hexCol = c_aqua)
{
	draw_text_color(x+room_width*0.1,y+room_height*0.1,$"VIE : {life}",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}

DrawPoints2 = function(hexCol = c_silver)
{
	draw_text_color(x+room_width*0.5,y+room_height*0.5,$"press Enter to retry",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}