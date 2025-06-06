cell_energy = 90;
cell_energy_max = 100;
cell_health = 20;
cell_health_max = 20;

timer_movement_start = 100;
timer_movement = timer_movement_start;
timer_shoot_start = 20;
timer_shoot = timer_shoot_start;
timer_death_start = 60;
timer_death = timer_death_start;

is_friendly = true;
is_hovered = false;
is_selected = false;

// Built-in GameMaker
speed = 0.25;
direction = irandom_range(0, 180) - 90;

function f_cell_divide()
{
	var _cell = obj_cell_friendly;
	if (!is_friendly) _cell = obj_cell_enemy;
	
	if (cell_energy == cell_energy_max)
	{
		cell_energy = cell_energy_max div 2;
		
		var _mutation_energy = 0;
		var _mutation_health = 0;
		var _mutation_speed = 0;
		
		if (f_chance(0.15))
		{
			// Create Array with Random Value and Shuffle
			var _stats = [irandom_range(1, 10), 0, 0];
			_stats = array_shuffle(_stats);
			
			// Set Values
			_mutation_energy = _stats[0] * 2;
			_mutation_health = _stats[1];
			_mutation_speed = _stats[2] * 0.075;
			
			// Set Variable for Announcement
			global.has_mutation_occurred = true;
			global.is_mutant_friendly = is_friendly;
		}
		
		with(instance_create_layer(x, y, "Instances", _cell))
		{
			cell_energy_max = other.cell_energy_max + _mutation_energy;
			cell_health_max = other.cell_health_max + _mutation_health;
			speed += _mutation_speed;
			
			// Set Energy & Health
			cell_health = cell_health_max;
			cell_energy = cell_energy_max div 2;
		}
	}
}