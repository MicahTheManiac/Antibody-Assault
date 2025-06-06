if (global.has_mutation_occurred)
{
	timer_mutation--;
	
	var _name = "n [Unknown]";
	var _color = c_white;
	
	if (global.is_mutant_friendly)
	{
		_name = " Friendly";
		_color = c_navy;
	}
	else
	{
		_name = "n Enemy";
		_color = c_maroon;
	}
	
	// Set
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(_color);
	draw_set_font(fnt_roboto_black);
	
	draw_text_transformed(640, 360, $"A{_name} Cell has Mutated!", 1, 1, 0);
	
	// Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_font(fnt_roboto);
	
	if (timer_mutation <= 0)
	{
		timer_mutation = 120;
		global.has_mutation_occurred = false;
		global.is_mutant_friendly = false;
	}
}

// Game Finished -- Set
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fnt_roboto_black);

// Game Finished - Logic
if (!instance_exists(obj_cell_friendly))
{
	draw_text_transformed(640, 10, "GAME OVER\nImmune Cells have been Defeated", 1, 1, 0);
	is_level_complete = true;
}
else if (!instance_exists(obj_cell_enemy))
{
	draw_text_transformed(640, 10, "GAME WON\nInvading Cells have been Defeated", 1, 1, 0);
	is_level_complete = true;
}
else if (!instance_exists(obj_pawn_cell))
{
	draw_text_transformed(640, 10, "GAME TIED\nAll Cells have Died", 1, 1, 0);
	is_level_complete = true;
}

// Game Finished - Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_roboto);