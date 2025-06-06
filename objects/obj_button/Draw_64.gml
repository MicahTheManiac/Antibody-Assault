// String Width & Height
var _width = string_length(text);
var _height = sprite_height;

// Getting the Width & Height of the Text Sprite
var _tw = 64;
var _th = 64;

// Font Offset
var _offset = 5;

image_xscale = _width * _tw / 80;
image_yscale = _height / _th;

// Draw
if (draw_gui)
{
	draw_self();
	
	// Set
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(color);
	draw_set_font(fnt_roboto_black);
	
	draw_text_transformed(x, y, $"{text}", text_size, text_size, 0);
	
	// Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_font(fnt_roboto);
	
}

draw_gui = true;