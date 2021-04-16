/// @description Insert description here
// You can write your code in this editor
depth = obj_floor.depth-11


var x1 = xstart-320
var x2 = xstart+320
var y1 = ystart-120
var y2 = ystart+120
var my_p = get_my_player()

if code.is_server = true
{
timer++
}

if timer > 150
{
time_s ++
timer = 0

buffer_seek(command_buffer, buffer_seek_start, 0);
buffer_write(command_buffer, buffer_u8, code.DATA.COMMAND);
buffer_write(command_buffer, buffer_u8, code.my_ID);
buffer_write(command_buffer, buffer_u8, code.COMM.PLATFORM_T);
buffer_write(command_buffer, buffer_string, floor(time_s));
send_all(command_buffer);
}

if time_s > 3
{
time_s = 0
}





if time_s = 0
{
var _cal_plus = (x1 - x)*0.05
x += _cal_plus
	if on_platform > 0 && instance_exists(my_p)
	{
	my_p.x += _cal_plus
	}
}

if time_s = 1
{
var _cal_plus = (y1 - y)*0.05
y += _cal_plus
	if on_platform > 0 && instance_exists(my_p)
	{
	my_p.y += _cal_plus
	}
}

if time_s = 2
{
var _cal_plus = (x2 - x)*0.05
x += _cal_plus
	if on_platform > 0 && instance_exists(my_p)
	{
	my_p.x += _cal_plus
	}
}

if time_s = 3
{
var _cal_plus = (y2 - y)*0.05
y += _cal_plus
	if on_platform > 0 && instance_exists(my_p)
	{
	my_p.y += _cal_plus
	}
}

if on_platform = 0 && ((place_meeting(x,y-my_p.vspeed,my_p) && my_p.vspeed >= 0) || (place_meeting(x,y,my_p) && time_s = 1 && abs(_cal_plus) > 1)) && my_p.y+26 <= y
{
my_p.vspeed = 0
my_p.gravity = 0
my_p.y = y-26.5
b_on_platform = 1
on_platform = 1
}


if on_platform > 0
{
global.p_floor = y-27

	if my_p.down_attack = 0 && my_p.down_attack_with_rage = 0
	{
		if (abs(y-27 - my_p.y) > 1.5 || abs(x - my_p.x) > 70)
		{
		on_platform = 0
		}
	}
	else
	{
	my_p.vspeed = 0
	my_p.gravity = 0
	my_p.y = y-26.5
	}
}
else
{
global.p_floor = 903
}

if b_on_platform != on_platform
{
	if time_s = 1 || time_s = 3
	{
	player.vspeed += _cal_plus*0.25
	}
	else
	{
	player.movement_speed += _cal_plus*0.25
	}
b_on_platform = 0
}