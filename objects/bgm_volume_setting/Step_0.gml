/// @description Insert description here
// You can write your code in this editor
depth = -999999

var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-80
var yy = camera_get_view_y(view_camera[0])+160+64-13

x = xx+global.bgm_volume*200
y = yy


if pressed = 1
{
	if mouse_x > xx && mouse_x < xx+200
	{
	x = mouse_x
	}
	
	if mouse_x < xx
	{
	x = xx
	}
	
	if mouse_x > xx+200
	{
	x = xx+200
	}
	
global.bgm_volume = (x - xx)/200
}