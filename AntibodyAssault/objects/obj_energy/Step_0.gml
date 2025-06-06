timer_ticks--;

if (timer_ticks <= 0)
{
	timer_ticks = 0;
	speed = clamp(speed - 0.01, 0, 0.5);
}