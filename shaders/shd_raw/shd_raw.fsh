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

vec2 geometryCorrection()
{
    float intScale = 1.0 + (uDoIntScale * (-1.0 + uDisplaySize.y / (uGameSize.y * floor(uDisplaySize.y / uGameSize.y))));
    
    float aspect = uDisplaySize.x / (uDisplaySize.y * uAspect);
    
    vec2 uv = ((v_vTexcoord - 0.5) * intScale * uZoom) + 0.5;
    uv.x = ((uv.x - 0.5) * aspect) + 0.5;
    
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

void borderEffects( inout vec4 color, in vec2 uv)
{
	/// Replaces fragments outside of the CRT screen with a blurred vignette
	
	// See if the fragment is on the border
	bool is_border = ( (uv.x > 1.0) || (uv.x < 0.0) || (uv.y > 1.0) || (uv.y < 0.0) );
	
	if ( is_border)
		{
			color *= 0.001;
			color.a = 1.0;
		}
	
}

vec4 getColor( in vec2 uv)
{
	
	// Get a starting color from the game
	vec4 col = texture2D( gm_BaseTexture, uv);
	
	// Return the final color
	return col;
}

void main()
{
	// Get the corresponding position on the CRT for the current fragment
	vec2 uv = geometryCorrection();
	
	// Get the base color from the game
	vec4 color = getColor( uv);
	
	// Do border effects
	borderEffects(color, uv);
	
	// Output the result
    gl_FragColor = color;
}
