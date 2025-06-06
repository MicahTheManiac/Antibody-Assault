timer_ticks = clamp(timer_ticks - 1, 0, 30);

if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	image_blend = color_accent;
	
	if (mouse_check_button_pressed(mb_left))
	{
		timer_ticks = 10;
		
		// Execute
		if (!do_level_load) and (button_function != -1)
		{
			button_function();
		}
		else if (do_level_load)
		{
			room_goto(level_to_load);
		}
	}
}
else
{
	image_blend = color;
}

if (timer_ticks > 0)
{
	image_blend = make_color_rgb(255, 192, 255);
}