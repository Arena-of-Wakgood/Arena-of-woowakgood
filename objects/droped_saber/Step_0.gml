/// @description Insert description here
// You can write your code in this editor
if spin_speed > 1
{
spin_speed -= 0.1
}

timer ++

if timer > 400
{
image_alpha -= 0.1
	if image_alpha <= 0
	{
	instance_destroy()
	}
}

if abs(923 - y) > 64 && already_droped = 0
{
image_angle -= sign(random_angle_p)*spin_speed*3
}

if abs(923 - y) <= 64 && already_droped = 0
{
	if set_angle = 0
	{
	image_angle += (random_angle_p - image_angle)*0.2
	set_angle = 1
	}
image_angle += (random_angle_p - image_angle)*0.08
}

hspeed += (hspeed*0.9 - hspeed)*0.01

if y >= 923 && already_droped = 0 && place_meeting(x,923,obj_floor)
{
image_angle = random_angle_p
hspeed = 0
gravity = 0
vspeed = 0
already_droped = 1
random_angle_p = 0
y = 923
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																												
repeat(6)
{
var _ef = instance_create_depth(x,y+23,player.depth-1,effect_spark_received)
_ef.hspeed = irandom_range(-10,10)
_ef.vspeed = irandom_range(-2,2)
}

image_index ++

	if place_meeting(x,y+1,obj_floor)
	{
	var sfx = audio_play_sound(guard,0,0)
	audio_sound_gain(sfx,0.02*global.master_volume*2*global.sfx_volume,0)

	var sfx = audio_play_sound(sword_ready,0,0)
	audio_sound_gain(sfx,0.025*global.master_volume*2*global.sfx_volume,0)
	}
	else
	{
	instance_destroy()
	}
}