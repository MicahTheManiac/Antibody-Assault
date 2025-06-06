timer_ticks--;

if (timer_ticks <= 10)
{
	speed -= 0.1;
	image_alpha -= 0.1;
}

if (timer_ticks <= 0)
{
	instance_destroy(id);
}

if (is_friendly) image_blend = c_blue;
else image_blend = c_red;