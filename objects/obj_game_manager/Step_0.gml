if (is_level_complete) and (!is_button_created)
{
	is_button_created = true;
	with(instance_create_layer(1020, 580, "Instances", obj_button))
	{
		text = "Main Menu";
		do_level_load = true;
		level_to_load = rm_title;
	}
	with(instance_create_layer(1020, 660, "Instances", obj_button))
	{
		text = " Restart ";
		button_function = room_restart;
	}
}