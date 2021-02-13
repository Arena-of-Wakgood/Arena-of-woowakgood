/// @description Insert description here
// You can write your code in this editor
if global.rainy = 0
{
	if global.slow_motion <= 0
	{
		if y < 699
		{
		y -= 0.0001
		}

		if scale < 0.7
		{
		scale += 0.0008
		}
	}
}
else
{
scale = 0
y = 737
}

if (global.matched_pl1_won + global.matched_pl2_won) < 1 && global.matching != 0
{
scale = 0
y = 737
}

if global.b_alpha >= 1
{
alarm[1] = 1
}
else
{
alarm[1] = 25
}