/// @description Insert description here
// You can write your code in this editor
life = 3;
fAlpha = 2;
draw_set_alpha(fAlpha);
bActive = true;


DrawPoints = function(hexCol = c_aqua)
{
	draw_text_color(x,y,$"VIE : {life}",
				hexCol,
				hexCol,
				hexCol,
				hexCol,
				fAlpha)
}
