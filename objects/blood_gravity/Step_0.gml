/// @description Insert description here
// You can write your code in this editor


if place_meeting(x,y,obj_floor)
{
var _fl_blood = instance_create_depth(x,930+irandom_range(-6,6),player.depth+10,blood_on_floor)
	
_fl_blood.scale_dir = choose(-1,1)
_fl_blood.sprite_index = sprite991
if global.blood_effect > 0
{
_fl_blood.sprite_index = sprite99
}
instance_destroy()
}

if y > room_height+100
{
instance_destroy()
}

image_alpha += 0.1
speed += (0 - speed)*0.01


if global.slow_motion > 0
{
	if resized = 0
	{
	resized = 1
	image_xscale = (1/128)*32
	image_yscale = (1/128)*32
	}
	else
	{
	image_xscale += (1/128 - image_xscale)*0.08
	image_yscale += (1/128 - image_yscale)*0.08
	}
}