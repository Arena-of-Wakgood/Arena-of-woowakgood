/// @description Insert description here
// You can write your code in this editor
alpha1 -= 0.1
w_alpha__ += (-0.01 - w_alpha__)*0.2

if image_xscale < 0.7 && time <= 58
{
image_xscale += 0.026
image_xscale += image_xscale*0.1
}


image_yscale += 0.026*4
image_yscale += image_yscale*0.2


if image_xscale > 0.7 && time <= 58
{
image_xscale = 0.7
	if time = 0
	{
	time ++
	}
}

if time > 0
{
effect_index += 0.005
	if effect_index < 1
	{
	effect_index += 0.09
	}
time ++
}

if global.in_practice > 0
{
instance_destroy()
}


if a = 0 && time > 1
{
alpha1 = 1.2
global.w_alpha = 1.1
a = 1
}

if time > 48
{
image_xscale -= 0.026
image_xscale -= image_xscale*0.1
	if image_xscale <= 0
	{
	instance_destroy()
	}
}



if a = 1
{
laser_dis += 20*4
laser_dis += laser_dis*0.25
effect_y += 3.3*4
effect_y += effect_y*0.1
}

shaker_time ++
if shaker_time <= 2
{
xscale_shaker += (1.2 - xscale_shaker)*0.15
}

if shaker_time >= 3
{
xscale_shaker += (0.6 - xscale_shaker)*0.15
}

if shaker_time >= 4
{
shaker_time = 0
}
