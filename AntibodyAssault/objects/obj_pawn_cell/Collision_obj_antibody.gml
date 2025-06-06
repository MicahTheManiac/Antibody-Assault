if (is_friendly) and (!other.is_friendly)
{
	cell_health--;
	instance_destroy(other);
}

if (!is_friendly) and (other.is_friendly)
{
	cell_health--;
	instance_destroy(other);
}