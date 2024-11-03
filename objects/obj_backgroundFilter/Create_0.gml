/// @description Insert description here
// You can write your code in this editor


var _fx_fractal = fx_create("_filter_fractal_noise");
fx_set_parameter(_fx_fractal, "g_FractalNoiseSpeed", .25);
fx_set_parameter(_fx_fractal, "g_FractalNoiseScale", 537);
fx_set_parameter(_fx_fractal, "g_FractalNoiseTintColour", [0,.3,.5,1]);

layer_set_fx("Background", _fx_fractal);


/*
var _fx_poster = fx_create("_filter_posterise");
fx_set_parameter(_fx_poster, "g_ColourLevels", 11);

layer_set_fx("Background", _fx_poster);


var _fx_pixel = fx_create("_filter_pixelate");
fx_set_parameter(_fx_pixel, "g_Cellsize", 16)

layer_set_fx("Background", _fx_pixel);

