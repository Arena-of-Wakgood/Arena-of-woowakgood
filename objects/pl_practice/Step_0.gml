/// @description Insert description here
// You can write your code in this editor
yy += (t_y - yy)*0.1
var _my_p = get_my_player()
depth = obj_floor.depth-1

if global.b_alpha_prt < 0.2 && global.chat_activity = false
{
	if global.matching = 0
	{
		if instance_exists(_my_p) && point_distance(x,903,_my_p.x,_my_p.y) <= 32
		{
		t_y = -80
			if can_enter = noone
			{
			can_enter = instance_create_depth(-100,-100,-999994,draw_key_)
			can_enter.location = 0
				if global.in_practice = 0
				{
				can_enter.image_index = 22
				}
				else
				{
				can_enter.image_index = 23
				}
			}
	
			if keyboard_check_pressed(ord("D"))
			{
			global.never_move = 1
			entering_now = 1
			global.t_b_alpha_prt = 2.01
			}
		}
		else
		{
		t_y = 0
			if can_enter != noone
			{
			instance_destroy(can_enter)
			can_enter = noone
			}
		}
	}
	else
	{
		if global.in_practice = 1
		{
			if instance_exists(_my_p) && point_distance(x,903,_my_p.x,_my_p.y) <= 32
			{
			t_y = -80
				if can_enter = noone
				{
				can_enter = instance_create_depth(-100,-100,-999994,draw_key_)
				can_enter.location = 0
					if global.in_practice = 0
					{
					can_enter.image_index = 22
					}
					else
					{
					can_enter.image_index = 23
					}
				}
	
				if keyboard_check_pressed(ord("D"))
				{
				global.never_move = 1
				entering_now = 1
				global.t_b_alpha_prt = 1.1
				}
			}
			else
			{
			t_y = 0
				if can_enter != noone
				{
				instance_destroy(can_enter)
				can_enter = noone
				}
			}
		}
		else
		{
		t_y = 0
		}
	}
}

if entering_now > 0
{
	if global.b_alpha_prt >= 2
	{
	global.never_move = 0
	if global.in_practice = 0
	{
	_my_p.x = 2048
	_my_p.y = 903
	obj_camera.x = 2048
	obj_camera.y = 903
	}
	else
	{
	_my_p.x = 5056
	_my_p.y = 903
	obj_camera.x = 5056
	obj_camera.y = 903
	}
	entering_now = 0
	changed_prt = 0
	global.t_b_alpha_prt = -0.01
	}

	
	if global.b_alpha_prt >= 1 && global.b_alpha_prt < 2
	{
	_my_p.x = 5056
	_my_p.y = 0
	}
	
	if global.b_alpha_prt >= 1.5 && global.b_alpha_prt < 2
	{
		if changed_prt = 0
		{
			if global.in_practice = 0
			{
			global.in_practice = 1
			}
			else
			{
				with(hyumpanchi_banana)
				{
				hp = -1
				}
			global.in_practice = 0
			}
		changed_prt = 1
		}
	}
}