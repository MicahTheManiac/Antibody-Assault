// Set Color
var _color = c_white; // Default
if (is_hovered) _color = c_yellow;

// Draw Box
if (is_hovered) or (is_selected)
{
	draw_sprite_ext(spr_selector, 0, x, y, 1.1, 1.1, 0, _color, 1);
}

//Energy & Health
if (is_selected)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_roboto);
	draw_text_transformed(x, y - 40, $"Health: {cell_health}\nEnergy: {cell_energy}/{cell_energy_max}", 1, 1, 0);
	
	// Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_roboto);
}