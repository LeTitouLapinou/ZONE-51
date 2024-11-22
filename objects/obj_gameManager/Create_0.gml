/// @description Insert description here
// You can write your code in this editor
life = 3;
fAlpha = 2;
draw_set_alpha(fAlpha);
bActive = false;
bActive2 = false;
test = 0.1;


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