draw_self();

if( spr_icon != noone ){
	
	draw_sprite(spr_icon, 0 , x,y);
}

draw_set_color(c_black);
draw_set_halign( fa_center);
draw_set_valign(fa_center);

draw_text( x +175,y+50, text);