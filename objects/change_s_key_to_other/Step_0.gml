/// @description Insert description here
// You can write your code in this editor
depth = -999999

var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-250
var yy = camera_get_view_y(view_camera[0])+160+64+64+48+48+32

x = xx
y = yy

if pressed > 0
{
image_index = 2
	if keyboard_check_pressed(vk_anykey)
	{
	var sfx = audio_play_sound(message_sfx,0,0)
	audio_sound_gain(sfx,0.1*global.master_volume*2*global.sfx_volume,0)
	global.s_key = string_upper(keyboard_lastchar)
	pressed = 0
	}
	
	if mouse_check_button_pressed(mb_any)
	{
	var sfx = audio_play_sound(cannot_buy,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	pressed = 0
	}
}
else
{
image_index = 0
}

if pressed = -1
{
pressed = 1
}