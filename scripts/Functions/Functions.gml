function f_shoot_antibody(_x, _y, _is_friendly, _direction)
{	
	with(instance_create_layer(_x, _y, "Instances", obj_antibody))
	{
		is_friendly = _is_friendly;
		direction = _direction + random_range(-1, 1);
	}
}

function f_activate_rules_menu()
{
	instance_deactivate_layer("InstInterfaceMain");
	instance_activate_layer("InstInterfaceRules");
}

function f_activate_main_menu()
{
	instance_deactivate_layer("InstInterfaceRules");
	instance_activate_layer("InstInterfaceMain");
}