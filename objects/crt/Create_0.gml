/// @description Initialize

#region Function definitions

function get_mouse_coords()
{
    var intScale = 1.0 + (crt.do_int_scale * (-1.0 + crt.display_height / (crt.game_height * floor(crt.display_height / crt.game_height))));
    
    var aspect = crt.display_width / (crt.display_height * crt.aspect_ratio);
    
	var u = display_mouse_get_x() / crt.display_width;
	var v = display_mouse_get_y() / crt.display_height;
	
	u = ((u - 0.5) * intScale * crt.display_zoom) + 0.5;
	v = ((v - 0.5) * intScale * crt.display_zoom) + 0.5;
	u = ((u - 0.5) * aspect) + 0.5;
	
	var centered_u = u - 0.5;
	var centered_v = v - 0.5;
    
	var r = point_distance(0, 0, centered_u, centered_v);
	var r2 = r * r;
    
    var distortionFactor = 1.0 + crt.curvature_amount * r2;
    
	u = centered_u * distortionFactor;
	v = centered_v * distortionFactor;
    
    var scaleFactor = 1.0 / (1.0 + crt.curvature_amount * 0.25);
    u *= scaleFactor;
	v *= scaleFactor;
    
	u += 0.5;
	v += 0.5;
	
	u *= crt.game_width;
	v *= crt.game_height;
	
	u += camera_get_view_x(view_get_camera(0));
	v += camera_get_view_y(view_get_camera(0));
    
    return [u,v];
}



function resize_surfaces()
{
	/// This should be called anytime view zero or the default surfaces may have been resized
	
	// Get the display size if not specified
	if display_width == -1
		display_width = display_get_width();
	if display_height == -1
		display_height = display_get_height();

	// Resize view zero's camera to the game size, and make it fill the whole application surface
	view_set_wport(0, display_width);
	view_set_hport(0, display_height);
	camera_set_view_size(view_get_camera(0), game_width, game_height);

	// Ensure the application and GUI surfaces are the size of the display
	surface_resize(application_surface, display_width, display_height);
	display_set_gui_size(display_width, display_height);

	// Disable automatic drawing of the application surface
	application_surface_draw_enable(false);
	
	// Update the uniforms just to be safe
	update_uniforms();
}

function update_uniforms()
{
	/// This should be called any time that settings change
	shader_set( shader);

	shader_set_uniform_f( shader_get_uniform( shader, "uDisplaySize"), display_width, display_height);
	shader_set_uniform_f( shader_get_uniform( shader, "uGameSize"), game_width, game_height);
	shader_set_uniform_f( shader_get_uniform( shader, "uAspect"), aspect_ratio);
	shader_set_uniform_f( shader_get_uniform( shader, "uWarp"), curvature_amount);
	shader_set_uniform_f( shader_get_uniform( shader, "uDoIntScale"), do_int_scale);

	shader_set_uniform_f( shader_get_uniform( shader, "uMaskBrightness"), phosphor_mask_brightness);
	shader_set_uniform_f( shader_get_uniform( shader, "uDoBGR"), flip_rgb_layout);
	shader_set_uniform_f( shader_get_uniform( shader, "uMaskScale"), phosphor_mask_scale);

	shader_set_uniform_f( shader_get_uniform( shader, "uScanIntensity"), scanline_intensity);
	shader_set_uniform_f( shader_get_uniform( shader, "uVerticalScan"), rotate_scanlines);
	shader_set_uniform_f( shader_get_uniform( shader, "uDoInterlace"), do_interlacing);

	shader_set_uniform_f( shader_get_uniform( shader, "uGlowAmount"), glow_amount);
	shader_set_uniform_f( shader_get_uniform( shader, "uDeconverge"), deconvergence);
	shader_set_uniform_f( shader_get_uniform( shader, "uHalation"), halation);
	shader_set_uniform_f( shader_get_uniform( shader, "uBorderWidth"), border_width);
	
	shader_set_uniform_f( shader_get_uniform( shader, "uDoBackimg"), do_overlay);
	shader_set_uniform_f( shader_get_uniform( shader, "uZoom"), display_zoom);
	shader_set_uniform_f( shader_get_uniform( shader, "uBrightness"), final_brightness);

	shader_reset();
}

function crt_apply()
{
	/// This function actually draws the CRT
	
	// Alternate the interlacing ticker
	interlace_tick = not interlace_tick;
	
	// Make sure that relfections work outside of the CRT screen
	gpu_set_tex_repeat(true);
	
	// Set the shader
	shader_set( shader);
	
	// Present the phosphor mask texture to the shader
	texture_set_stage( shader_get_sampler_index( shader, "uMaskSampler"), sprite_get_texture( phosphor_mask, flip_rgb_layout));
	gpu_set_tex_repeat_ext( shader_get_sampler_index( shader, "uMaskSampler"), true);
	
	// Present the noise texture to the shader
	texture_set_stage( shader_get_sampler_index( shader, "uNoiseSampler"), sprite_get_texture( rgb_noise, 0));
	
	// Present the overlay texture to the shader
	texture_set_stage( shader_get_sampler_index( shader, "uBackimg"), sprite_get_texture( overlay_image, 0));

	// Pass the interlacing tick
	shader_set_uniform_f( shader_get_uniform( shader, "uInterlaceTick"), interlace_tick);
	
	// Draw the application surface
	draw_surface(application_surface, 0, 0);

	// All done!
	shader_reset();
}

function set_shader( shader_id)
{
	/// A quick way to swap the shader and update uniforms in one call
	/// Useful for settings menus!
	shader = shader_id;
	update_uniforms();
	
	// Use nearest-neighbor filtering if looking at raw pixel art
	if shader_id == shd_raw
		gpu_set_tex_filter( false);
	else
		gpu_set_tex_filter( true);
}

#endregion

#region Initial Setup

// This variable will alternate between 0 and 1 every frame to drive the interlacing effect
interlace_tick = 0;

// This is the only time this function is *required* to be called
resize_surfaces();

#endregion