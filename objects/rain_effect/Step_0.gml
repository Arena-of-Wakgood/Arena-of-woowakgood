/// @description Insert description here
// You can write your code in this editor
if ignore_floor = 0
{
	if place_meeting(x,y,obj_floor)
	{
	instance_destroy()
	}

	if room_height <= y-160
	{
	instance_destroy()
	}
}
else
{
	if y > room_height+128
	{
	instance_destroy()
	}
}

if start_yscale != -4
{
yscale = start_yscale*(room_speed/60)*(room_speed/60)
}

