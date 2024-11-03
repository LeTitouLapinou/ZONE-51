//
// SittingDuck's all-in-one CRT shader
//
// Includes emulation of:
//	- Scanlines (both horizontal and vertical)
//	- Phosphor masks (aperture, shadow, and slot)
//	- Curvature
//	- Arbitrary aspect ratios
//	- Glow and halation
//	- Post-process interlacing
//

varying vec2 v_vTexcoord;
uniform vec2 uDisplaySize;
uniform vec2 uGameSize;
uniform float uAspect;
uniform sampler2D uMaskSampler;
uniform float uMaskBrightness;
uniform float uMaskScale;
uniform float uDoBGR;
uniform float uVerticalScan;
uniform float uScanIntensity;
uniform float uWarp;
uniform float uBorderWidth;
uniform float uGlowAmount;
uniform float uDoIntScale;
uniform float uInterlaceTick;
uniform float uDoInterlace;
uniform float uDeconverge;
uniform float uHalation;
uniform sampler2D uNoiseSampler;
uniform sampler2D uBackimg;
uniform float uDoBackimg;
uniform float uZoom;
uniform float uBrightness;

vec4 quinticTexture2D( sampler2D sampler, vec2 p )
{
	/// This is the fast version of the shader, so no fancy texture filtering
    return texture2D( sampler, p);
}

vec2 geometryCorrection()
{
	/// Handles aspect ratio, scaling, and curvature
	
	// Get a scale factor that corrects to the nearest integer scale of the game screen (vertically)
    float intScale = 1.0 + (uDoIntScale * (-1.0 + uDisplaySize.y / (uGameSize.y * floor(uDisplaySize.y / uGameSize.y))));
    
	// Figure out how the game screen needs to be warped given the aspect ratios of the game and display
    float aspect = uDisplaySize.x / (uDisplaySize.y * uAspect);
    
	// Get UVs of the crt screen
    vec2 uv = ((v_vTexcoord - 0.5) * intScale * uZoom) + 0.5;
    uv.x = ((uv.x - 0.5) * aspect) + 0.5;
    
	// Curvature via barrel distortion
    vec2 centered = uv - 0.5;
    float r = length(centered);
    float r2 = r * r;
    
    float distortionFactor = 1.0 + uWarp * r2;
    
    vec2 distortedUV = centered * distortionFactor;
    
    float scaleFactor = 1.0 / (1.0 + uWarp * 0.25);
    distortedUV *= scaleFactor;
    
    distortedUV += 0.5;
    
    return distortedUV;
}


void applyMask( inout vec4 color)
{
	/// Gets a color from the phosphor mask and brightens the shadowed regions if desired
	/// Multiplies the resulting color into the output
	
	// Repeat for as many textures fit in the display window
	vec2 maskUV = v_vTexcoord * ( uDisplaySize / 256.0) * ( 1.0 / uMaskScale);
	
	// Get color from the mask texture
	vec4 maskColor = texture2D( uMaskSampler, maskUV);
	
	// Brighten the black parts of the mask to improve overall brightness
	maskColor.rgb += color.rgb * uMaskBrightness;
	
	// Apply the result
	color *= maskColor;
}

void applyScanlines( inout vec4 color, in vec2 uv)
{
	/// Gets the brightness of the current fragment with respect to scanlines
	/// Multiplies the resulting brightness into the output
	
	// Linear sawtooth wave applied either horizontally or vertically
	float scanLum = ( mod( uv.x, 1.0 / uGameSize.x) * uGameSize.x * uVerticalScan) + ( mod( uv.y * uZoom, 1.0 / uGameSize.y) * uGameSize.y * ( 1.0 - uVerticalScan));
	
	// Turn the sawtooth into a triangle wave, smoothen it, and scale by the intensity uniform
	scanLum = ( smoothstep( 0.0, 0.5, abs( scanLum - 0.5)) * ( -2.0 * uScanIntensity)) + 1.0;
	
	// Apply the result
	color.rgb *= scanLum;
}

void applyGlow( inout vec4 color, in vec2 uv)
{
	/// Applies a short-range bloom effect to bleed bright pixels into the surrounding area
	/// Should typically be applied after scanlines and the phosphor mask
	
	// See if the fragment is on the border
	bool is_border = ( (uv.x > 1.0) || (uv.x < 0.0) || (uv.y > 1.0) || (uv.y < 0.0) );
	
	// Only do the expensive blur effect if it will be seen
	if (!is_border)
		{
			// Simple one-pass blur using 9 samples
			// Save the size of a texel into a vec2
			vec2 texelSize = 1.0 / uGameSize;
			
			// Accumulate samples from the surrounding texels
			vec4 glowColor = texture2D( gm_BaseTexture, uv);
			// Only diagonals since this is the fast version of the shader
			glowColor += texture2D( gm_BaseTexture, uv + vec2( -texelSize.x, -texelSize.y));
			glowColor += texture2D( gm_BaseTexture, uv + vec2( -texelSize.x,  texelSize.y));
			glowColor += texture2D( gm_BaseTexture, uv + vec2(  texelSize.x, -texelSize.y));
			glowColor += texture2D( gm_BaseTexture, uv + vec2(  texelSize.x,  texelSize.y));
			// Reduce the values back down to 0-1
			glowColor *= 0.2;
	
			// Add the result to the output
			color.rgb += glowColor.rgb * uGlowAmount;
		}
}

void borderEffects( inout vec4 color, in vec2 uv)
{
	
	float borderWidth = uBorderWidth;
    
    if (uBorderWidth < 0.0) {
        // If borderWidth is negative, calculate it based on the size of a fragment
        vec2 fragSize = 1.0 / uGameSize;
        borderWidth = max(fragSize.x, fragSize.y) * 1.5; // Adjust the multiplier (1.5) as needed
    }
    
    float distanceFromBorder = min(
        min(uv.x, 1.0 - uv.x),
        min(uv.y, 1.0 - uv.y)
    );
    
    float borderMask = smoothstep(0.0, borderWidth, distanceFromBorder);
    
    uv = -abs(1.0 - abs(uv)) + 1.0;
    
    vec4 noise = texture2D( uNoiseSampler, uv);
    
    vec2 texelSize = vec2( 0.005 * noise.r + 0.005 * noise.b, 0.005 * noise.g + 0.005 * noise.b);
    
    vec4 borderColor = texture2D( gm_BaseTexture, uv);
	
	if (borderMask < 0.9) {
		// Basic one-pass blur on the reflective screen edges
		// Only diagonals since this is the fast version of the shader
		borderColor += texture2D( gm_BaseTexture, clamp( uv + vec2( texelSize.x, texelSize.y), 0.01, 0.99));
		borderColor += texture2D( gm_BaseTexture, clamp( uv + vec2( -texelSize.x, texelSize.y), 0.01, 0.99));
		borderColor += texture2D( gm_BaseTexture, clamp( uv + vec2( texelSize.x, -texelSize.y), 0.01, 0.99));
		borderColor += texture2D( gm_BaseTexture, clamp( uv + vec2( -texelSize.x, -texelSize.y), 0.01, 0.99));
		// Reduce the values back down to 0-1
		borderColor *= 0.2;
	}
    
    noise = texture2D( uNoiseSampler, uv * 8.0);
    float black = clamp( abs( ( v_vTexcoord.x - 0.5 + (noise.r * 0.01)) * 2.0), 0.0, 1.0);
    
    borderColor = mix( borderColor, vec4( 0.0, 0.0, 0.0, 1.0), black);
    borderColor.a = 1.0;
    
    color = mix(color, borderColor, 1.0 - borderMask);
}


void interlace( inout vec4 color, in vec2 uv)
{
	/// Makes transparent any fragments that belong to a scanline that is not being updated this frame
	
	// Linear square wave applied either horizontally or vertically
	// This is very similar to the scanline implementation, only scaled to every other line and rounded to 0 or 1
	float scan = clamp( ((floor( ( mod(( v_vTexcoord.y * uZoom) + (1.0 / uGameSize.y) * uInterlaceTick, 2.0 / uGameSize.y) * ( uGameSize.y / 2.0)) + 0.5)) * ( 1.0 - uVerticalScan)) 
			+ ((floor( ( mod(uv.x + (1.0 / uGameSize.x) * uInterlaceTick, 2.0 / uGameSize.x) * ( uGameSize.x / 2.0)) + 0.5)) * uVerticalScan) +  (1.0 - uDoInterlace), 0.0, 1.0);
	
	// Apply the result
	color.a = 0.5 + (scan * 0.5);
}

vec4 getColor( in vec2 uv)
{
	/// Gets a base color from the game and applies color corrections
	
	// Get a starting color using better-than-bilinear filtering
	vec4 col = quinticTexture2D( gm_BaseTexture, uv);
	
	// Offset the UVs for the red and blue channels to simulate deconvergence
	col.r = quinticTexture2D( gm_BaseTexture, uv - ( uDeconverge / uGameSize)).r;
	col.b = quinticTexture2D( gm_BaseTexture, uv + ( uDeconverge / uGameSize)).b;
	
	// Calculate a grayscale color, keeping luminosity relatively constant
	float grayf = (0.2989 * col.r) + (0.5870 * col.g) + (0.1140 * col.b);
	vec4 gray = vec4( grayf, grayf, grayf, 1.0);
	
	// Return the final color
	return mix(col, gray, uHalation);
}

void overlay( inout vec4 color)
{
	vec4 backColor = texture2D( uBackimg, v_vTexcoord);
			
	color = mix( color, backColor, backColor.a * uDoBackimg);
}

void main()
{
	// Get the corresponding position on the CRT for the current fragment
	vec2 uv = geometryCorrection();
	
	// Get the base color from the game
	vec4 color = getColor( uv);
	
	// Apply the phosphor mask
	applyMask( color);

	// Make alternating fragments transparent due to interlacing
	interlace( color, uv);
	
	// Apply scanlines
	applyScanlines( color, uv);
	
	// Apply glow
	applyGlow( color, uv);
	
	// Do border effects
	borderEffects(color, uv);
	
	// Do Overlay
	overlay( color);
	
	// Output the result
    gl_FragColor = color * uBrightness;
}
