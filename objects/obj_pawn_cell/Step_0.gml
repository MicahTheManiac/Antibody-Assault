timer_movement--;

// Movement Timer
if (timer_movement <= 0)
{
	timer_movement = timer_movement_start;
	direction = irandom_range(0, 359);
	
	// Regenerate Energy
	var _energy = 2;
	if (is_friendly) _energy = 3;
	if (f_chance(0.75)) cell_energy += _energy;
	
	// Divide
	if (cell_energy >= cell_energy_max)
	{
		switch(is_friendly)
		{
			case true: if (f_chance(0.2)) f_cell_divide(); break;
			case false: if (f_chance(0.5)) f_cell_divide(); break;
		}
	}
}

// Hover and Selection
if (collision_point(mouse_x, mouse_y, id, 0, false))
{
	is_hovered = true;
	
	// Check Button
	if (mouse_check_button_pressed(mb_left))
	{
		// Switch Values
		switch(is_selected)
		{
			case true: is_selected = false; break;
			case false: is_selected = true; break;
		}
	}
}
else
{
	is_hovered = false;
}

// Friendly Cells
if (is_friendly)
{
	// Shoot Antibodies
	if (mouse_check_button(mb_left)) and (is_selected)
	{
		timer_shoot--;
		if (timer_shoot <= 0)
		{
			timer_shoot = timer_shoot_start;
			
			// If we have Enough Energy
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			if (int64(cell_energy) > 0)
			{
				cell_energy--;
				f_shoot_antibody(x, y, is_friendly, _dir);
			}
		}
	}
	else
	{
		timer_shoot = timer_shoot_start;
	}
	
	// Divide
	if (keyboard_check_pressed(vk_space)) and (is_selected)
	{
		f_cell_divide();
	}
}
// Enemy Cells
else
{
	timer_shoot--;
	if (timer_shoot <= 0)
	{
		timer_shoot = timer_shoot_start;
		
		// Get Cell and Direction
		var _cell = instance_nearest(x, y, obj_cell_friendly);
		var _dir = 0;
		
		if (_cell != noone) _dir = point_direction(x, y, _cell.x, _cell.y);
		
		// If we have Enough Energy & Random Chance
		if (int64(cell_energy) > 0) and (f_chance(0.05)) and (_cell != noone)
		{
			cell_energy--;
			f_shoot_antibody(x, y, false, _dir);
		}
	}
}

// Cell Death
if (cell_health == 0)
{
	timer_death--;
	image_alpha -= 0.02;
	
	if (timer_death <= 0)
	{
		instance_destroy(id);
	}
}

// Clamp Energy & Health
cell_energy = clamp(cell_energy, 0, cell_energy_max);
cell_health = clamp(cell_health, 0, cell_health_max);

// Clamp X & Y
var _limit = 32;
x = clamp(x, _limit, room_width - _limit);
y = clamp(y, _limit, room_height - _limit);