if (is_level_complete) and (!is_button_created)
{
	is_button_created = true;
	with(instance_create_layer(1060, 660, "Instances", obj_button))
	{
		text = "Restart";
		button_function = room_restart;
	}
}