  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_

 ~ SittingDuck's CRT shader ~

A lightweight and flexible CRT shader that aims to be scalable and easy to implement.

To implement with your existing game:
 - Place a preset object in the first room of your game or create & destroy one via code in your game's menu.
 - Ensure that your game's aspect ratio matches that of the preset object.
 - That's it!

Advanced use:
 - All parameters of the shader are addressable from any object just by referencing the crt object.
	- For example: "crt.glow_amount += 0.1"
	- Just make sure to update the shader uniforms afterward with "crt.update_uniforms()"
 - Learn to use effects that retro game developers used with CRT TVs in mind.
	- Exploit interlacing, blending, or subpixels for your game's benefit!

Notes:
 - This asset expects your game to fill the entire application surface. It is then scaled down to the appropriate size and aspect ratio.
	- As an example, a game targeting 4:3 might have a view of size 320x240, with a viewport that must be set to stetch to fill the whole screen at something like 1920x1080.
	- 3D games can simply read the CRT setting, like so: "matrix_build_projection_perspective_fov( fov, crt.aspect_ratio, znear, zfar)"
 - GUI elements in your game can be drawn using the draw gui event like normal.
	- However, the aspect ratio must be taken into account. An orthographic projection may be necessary.

  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_

Methods:
 - crt.resize_surfaces()
	- Ensures that the view and application surfaces are the size that the CRT shader expects.
	- This method is more useful when integrating the shader with an existing game, at the start of every room.
 - crt.update_uniforms()
	- This function simply passes all of the preset object's parameters into the shader as uniforms.
	- It should be called whenever these parameters change.
 - crt.apply_crt()
	- This method draws the application surface with the CRT shader applied.
	- It should typically be done in the Draw GUI End event.
 - crt.set_shader()
	- This method allows you to change the shader being used. It also updates the uniforms for you.
	- Included are 3 options:
		- shd_crt - This is the full CRT shader with high quality blur and advanced interpolation.
		- shd_crt_fast - This is a lower-quality but still fully-featured shader that is easier to run on low-spec machines, using only half as many texture lookups per pixel.
		- shd_raw - This is a shader with curvature and nothing else. It's useful for comparing unfiltered to filtered gameplay.
 - crt.get_mouse_coords()
    - This method returns the in-game mouse coordinates, correcting for the screen curvature and aspect ratio.
	- It was added to restore mouse_x and mouse_y functionality for ease of integrating with existing projects.
	

  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_

Shader parameters (in the variable definitions of each preset object):

 - shader
	- Which shader to use for rendering. Included are 2 quality levels of the CRT shader and one raw shader.
		- shd_crt - This is the full CRT shader with high quality blur and advanced interpolation.
		- shd_crt_fast - This is a lower-quality but still fully-featured shader that is easier to run on low-spec machines, using only half as many texture lookups per pixel.
		- shd_raw - This is a shader with curvature and nothing else. It's useful for comparing unfiltered to filtered gameplay.
 - game_width
	- The width of the game content in pixels.
		- As an example, Street Fighter II has a resolution of 384 pixels across.
		- The maximum resolvable width depends on the display resolution and the content aspect ratio, but anything is supported.
 - game_height
 	- The height of the game content in pixels.
		- As an example, Street Fighter II has a resolution of 224 pixels tall.
		- The maximum resolvable height depends on the display resolution, but anything is supported.
		- At resolutions above 240, scanlines may begin to look ugly on 1080p displays.
 - display_width
	- The width of the host display in pixels.
		- Most desktop monitors are 1920 pixels across, but anything is supported, including resolutions lower than the host display.
		- Setting this to -1 will result in the game using whatever display_get_width() returns.
 - display_height
 	- The height of the host display in pixels.
		- Most desktop monitors are 1080 pixels tall, but anything is supported, including resolutions lower than the host display.
		- Setting this to -1 will result in the game using whatever display_get_height() returns.
 - display_zoom
	- A scaling factor to zoom in or out from the simulated CRT screen.
		- This is very useful when using overlays.
		- Attempting to use zoom while do_int_scale is on will result in non-integer scaling.
 - aspect_ratio
	- The aspect ratio that the game content should be displayed at.
		- This is represented as a fraction, so an aspect ratio of 4:3 would be represented as 1.333333
		- This is 4:3 for the vast majority of retro games, even if this means pixels are squashed or stretched.
			- For example, Street Fighter II's pixels are taller than they are wide to accomodate a 4:3 aspect ratio.
			- This behavior is taken care of by the shader automatically.
 - do_int_scale
	- Whether or not to scale to the nearest integer multiple of the game content height.
		- Setting this to true will ensure every pixel is the exact same vertical size across the height of the display.
			- However, the selected aspect ratio may still squash or stretch pixels horizontally.
		- This setting is useful for low-resolution displays.
 - curvature_amount
	- How much the simulated CRT screen should warp the game content.
	- Lower values tend to look better, typically between 0.0 and 0.3.
 - phosphor_mask
	- What texture to use for the simulated RGB phosphor triads. Included are 4 textures, each with 2 variations (explained further below in 'flip_rgb_layout')
		- mask_aperturegrille - This texture consists of vertical stripes that span the whole TV.
		- mask_fakeaperture - This texture consists of smaller vertical stripes that look much better on lower-res displays.
		- mask_shadow - This texture consists of tiny RGB dots, like what would be seen in a VGA monitor.
		- mask_slot - This texture consists of tiny RGB dots, like what would be seen on most low-end consumer TVs and arcade machines.
 - phosphor_mask_scale
	- Amount to scale the phosphor mask by.
		- By default, 1 pixel of the host display represents one phosphor dot or line on the simulated CRT.
		- This works out to a TVL of about 500 on a 1080p display.
		- On a high-resolution display, you may wish to reduce the TVL of the simulated CRT, so you can upscale the mask with this parameter.
 - phosphor_mask_brightness
	- The strength of the phosphor effect.
		- Generally, values close to 1.0 work the best.
 - flip_rgb_layout
	- Whether or not to enable a BGR phosphor triad instead of RGB.
		 - Each mask texture has two variations: one with an RGB layout, and one with a BGR layout.
		 - You want to use whatever option is the oposite of your display.
			- Generally, PC monitors use a BGR layout, so you would want to use an RGB mask for the best result.
			- On most TVs, an RGB layout is used, so you would want to enable this option and use a BGR mask instead.
			- On OLED displays, the subpixel layout is unique. Your mileage may vary.
 - scanline_intensity
	- How strong the scanline effect should be.
		- Generally, smaller values look better, typically between 0.0 and 0.3.
		- On most consumer TVs, scanlines weren't really visible at normal viewing distances; this setting should be adjusted so that they are just barely visible.
		- If wanting to emulate the look of a PVM or computer monitor, then stronger scanlines may be desired.
 - rotate_scanlines
	- Whether to rotate the simulated CRT 90 degrees so that scanlines appear vertical.
		- This setting is useful if wanting to emulate the look of portrait (TATE) games such as Pac-man or Galaga.
 - do_interlacing
	- Whether or not to simulate interlaced content.
		- When this setting is enabled, only every other scanline is drawn each frame on an alternating basis.
		- New lines are weaved in and blended with the last frame's, so the application surface and view surface cannot be cleared each frame or else this will break.
		- Generally, scanlines should be turned off when using this setting, and your game's resolution should be 480i or greater.
 - do_overlay
	- Whether or not to display an overlay image around the border of the CRT.
		- One example image is included to demonstrate this effect.
		- The display_zoom parameter is often needed to line everything up perfectly.
		- The default reflection border can be blended with the overlay if the overlay image has transparency.
 - overlay_image
	- What image to use for the overlay if enabled.
		- Overlay images are drawn over everything else, so they'll need to have an alpha channel to determine where the CRT screen is.
		- An alpha of less than 1.0 on the border regions can be utilized to show a slight reflection from the game content.
 - deconvergence
	- How much to deconverge the RGB electron beams of the CRT.
		- Increasing this value results in the RGB channels of the game content separating in an effect similar to chromatic aberration.
		- A value of 0.0 means perfect convergence, while 1.0 means one content-pixel worth of deconvergence.
		- This effect should be subtle, so smaller values work best.
 - halation
	- How much halation to apply to the image.
		- This setting simulates a slight desaturation of content caused by the electron beam exciting phosphors of the wrong color.
		- A value of 0.0 means no halation (1:1 saturation), while values up to 1.0 cause more halation (up to complete grayscale).
 - glow_amount
	- How much glow to apply to the image.
		- CRT's often had a glow to them around bright content that made the dark lines between scans disappear and provided natural anti-aliasing.
		- A value of 0.0 means no glow, while 1.0 is pretty intense.
		- Values between 0.3 and 0.6 typically work best.
 - final_brightness
	- How much brightness to add to the final output image.
		- This can be used to compensate for other parameters.
		- A value of 1.0 represents no change, while 0.5 is half brightness and 2.0 is double brightness.
		- This setting may clip colors, but will not reduce contrast.
 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_
__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/ 
  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \__/  \_