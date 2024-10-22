shader_type canvas_item;
render_mode blend_mix;
uniform vec3 color_to_mix : source_color;
uniform float mix_amount;

uniform vec4 palette_0 : source_color;
uniform vec4 palette_1 : source_color;
uniform vec4 palette_2 : source_color;
uniform vec4 palette_3 : source_color;
uniform vec4 palette_4 : source_color;
uniform vec4 palette_5 : source_color;
uniform vec4 palette_6 : source_color;
uniform vec4 palette_7 : source_color;

uniform float noise_mix = 0.0;
uniform sampler2D noise_img;
uniform float noise_speed = 0.5;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	COLOR.a = tex.a;
	
		//setup
	const vec4 mask_0 = vec4(1.0, 0.0, 1.0, 1.0);
	const vec4 mask_1 = vec4(1.0, 0.0, 0.0, 1.0);
	const vec4 mask_2 = vec4(0.0, 1.0, 1.0, 1.0);
	const vec4 mask_3 = vec4(0.0, 0.0, 1.0, 1.0);
	const vec4 mask_4 = vec4(0.0, 1.0, 0.0, 1.0);
	const vec4 mask_5 = vec4(1.0, 1.0, 0.0, 1.0);
	const vec4 mask_6 = vec4(1.0, 1.0, 1.0, 1.0);
	const vec4 mask_7 = vec4(0.0, 0.0, 0.0, 1.0);
	
	const vec4 noise_0 = vec4(0.462, 0.470, 0.459, 1.0);
	const vec4 noise_1 = vec4(0.573, 0.596, 0.882, 1.0);
	const vec4 noise_2 = vec4(0.957, 0.667, 0.0, 1.0);
	const vec4 noise_3 = vec4(0.969, 0.933, 0.859, 1.0);
	const vec4 shadow = vec4(0.462, 0.470, 0.459, 1.0);
	
	vec2 uvr = vec2(UV.x + TIME * noise_speed, UV.y);
	vec2 uvg = vec2(UV.x, UV.y + TIME * noise_speed);
	vec2 uvb = vec2(UV.x - TIME * noise_speed, UV.y);
	
	float noise_scalar = (texture(noise_img, uvr).r + texture(noise_img, uvg).g + texture(noise_img, uvb).b) * 0.4;
	vec4 noise_color = noise_0;
	noise_color = mix(noise_color, noise_1,step(0.2,noise_scalar));
	noise_color = mix(noise_color, noise_2,step(0.5,noise_scalar));
	noise_color = mix(noise_color, noise_3,step(0.8,noise_scalar));
	vec4 noise_shadow = mix(noise_color, shadow, 0.5);
	
	
	vec4 color_a = texture(TEXTURE, UV);
	vec4 color = color_a;
	
	//The actual mixing
	//Magenta and Red
	color = mix(color, palette_0, float(color_a == mask_0));
	color = mix(color, palette_1, float(color_a == mask_1));
	color = mix(color, noise_color, float(color_a == mask_0) * noise_mix);
	color = mix(color, noise_shadow, float(color_a == mask_1) * noise_mix);
	
	//Cyan and Blue
	color = mix(color, palette_2, float(color_a == mask_2));
	color = mix(color, palette_3, float(color_a == mask_3));
	
	//Green and Yellow
	color = mix(color, palette_4, float(color_a == mask_4));
	color = mix(color, palette_5, float(color_a == mask_5));
	color = mix(color, noise_color, float(color_a == mask_4) * noise_mix);
	color = mix(color, noise_color, float(color_a == mask_5) * noise_mix);
	color = mix(color, noise_1, float(color_a == mask_4) * noise_mix * 0.5);
	color = mix(color, noise_2, float(color_a == mask_5) * noise_mix * 0.5);
	
	//White and Black
	color = mix(color, palette_6, float(color_a == mask_6));
	color = mix(color, palette_7, float(color_a == mask_7));
	
	COLOR.rgb = mix(color.rgb, color_to_mix.rgb, mix_amount);
}
