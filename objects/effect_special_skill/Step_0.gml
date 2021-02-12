/// @description Insert description here
// You can write your code in this editor
alpha1 -= 0.1

if image_xscale < 1 && time <= 58
{
image_xscale += 0.026
image_xscale += image_xscale*0.1
}

if image_yscale < 1
{
image_yscale += 0.026
image_yscale += image_yscale*0.2
}

if image_xscale > 1 && time <= 58
{
image_xscale = 1
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
view_shake(choose(0,0,0,0,1),choose(0,0,1,1,1,1,2),choose(0,1))
time ++
}


if a = 0 && time > 1
{
var sfx = audio_play_sound(laser_skill_using,0,0)
audio_sound_gain(sfx,0.05*global.master_volume*2*global.sfx_volume*(1 - point_distance(x,y,player.x,player.y)/1200),0)
alpha1 = 1.2
view_shake(13,24,8)
global.w_alpha = 1.1
a = 1
}

if time > 58
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
laser_dis += 20
laser_dis += laser_dis*0.25
effect_y += 3.3
effect_y += effect_y*0.1
}

