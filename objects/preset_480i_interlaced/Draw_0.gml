/// @description DEBUG

if keyboard_check_pressed(ord("T")) {
	if game_get_speed(gamespeed_fps) == 60 game_set_speed(5, gamespeed_fps); else game_set_speed(60, gamespeed_fps);
}

draw_text(10, 10, "Wiggle the mouse to demonstrate interlacing artifacts!\nPress <T> to toggle the game speed.");

draw_rectangle_color(mouse_x*aspect_ratio-16, mouse_y-16, mouse_x*aspect_ratio+16, mouse_y+16, c_red, c_blue, c_lime, c_yellow, false);

