/// @description Insert description here
// You can write your code in this editor

if global.draw_now_rank < 0
{
global.draw_now_rank = 0
}

if global.draw_now_rank >= 0
{
global.draw_rank += (global.rank - global.draw_rank)*0.1
global.draw_now_rank -= 0.03
	if abs(global.draw_rank - global.rank) < 1
	{
	global.draw_rank = global.rank
	}
}



if global.t_shake_x <= 0.01
	{
	global.t_shake_x = 0
	}
	
	if global.t_shake_y <= 0.01
	{
	global.t_shake_y = 0
	}
global.t_shake_x += (0 - global.t_shake_x)*0.1
global.t_shake_y += (0 - global.t_shake_y)*0.1
global.real_shake_x += (global.t_shake_x*global.shake_x - global.real_shake_x)*0.1
global.real_shake_y += (global.t_shake_y*global.shake_y - global.real_shake_y)*0.1
global.shake_time ++
	if global.shake_time > 1
	{
	global.shake_x = -global.shake_x
	global.shake_y = -global.shake_y
	global.shake_time = 0
	}



x += global.real_shake_x
y += global.real_shake_y

if room != menu
{
	if can_follow_p = 1
	{
	var my_p = -4

		with(player)
		{
			if(global.nickname == name)
			{
			my_p = id;
			}
		}

		if my_p != -4 && instance_exists(my_p) && floor(global.matching) != 2 && global.hp > 0
		{
		t_x = my_p.x;
		t_y = my_p.y;
		}

		if (floor(global.matching) = 2) || (global.matching > 0 && global.hp <= 0 && global.gamemode_server = 4)
		{
			if keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_enter) && global.chat_activity = false
			{
			global.observe_target ++
		
				if (global.observe_target > 1 && global.gamemode != 3 && global.gamemode != 4) || (global.observe_target > 3 && (global.gamemode = 3 || global.gamemode_server = 4))
				{
				global.observe_target = 0
				}
			
				if global.observe_target = 0
				{
				my_cer_p = get_certain_player(global.matched_pl1_name);
				}
				if global.observe_target = 1
				{
				my_cer_p = get_certain_player(global.matched_pl2_name);
				}
				if global.observe_target = 2
				{
				my_cer_p = get_certain_player(global.matched_pl3_name);
				}
				if global.observe_target = 3
				{
				my_cer_p = get_certain_player(global.matched_pl4_name);
				}
			wait_follow_observe = 0
			}
	
			if (abs(x - t_x) > 300)
			{
				if global.observe_target = 0
				{
				my_cer_p = get_certain_player(global.matched_pl1_name);
				}
				if global.observe_target = 1
				{
				my_cer_p = get_certain_player(global.matched_pl2_name);
				}
				if global.observe_target = 2
				{
				my_cer_p = get_certain_player(global.matched_pl3_name);
				}
				if global.observe_target = 3
				{
				my_cer_p = get_certain_player(global.matched_pl4_name);
				}
			
			wait_follow_observe = 0
			}
	
			if my_cer_p != -4 && instance_exists(my_cer_p)
			{
			image_angle += (point_direction(x,y,my_cer_p.x,my_cer_p.y) - image_angle)*0.1
			
				if wait_follow_observe = 0
				{
				t_x = my_cer_p.x
				t_y = my_cer_p.y
			
				wait_follow_observe = 1
				alarm[1] = 5
				}
			}
		}
	}
	
	if can_follow_p = 0
	{
	can_follow_p = 1
	alarm[0] = 1
	}
}



if global.show_challenger = 0
{
	if t_x != -4
	{
	x += (t_x - x)*0.1
	}
	
	if t_y != -4
	{
	y += (t_y - y)*0.1
	}
}
else
{
v_x = 1280*0.65
v_y = 720*0.65
x += (obj_floor.x - x)*0.1
y += (903 - y)*0.1
}



x = floor(x)
y = floor(y)

global.view_angle_ += (0 - global.view_angle_)*0.1
camera_set_view_angle(view_camera[0],global.view_angle_)

if v_x > 1280*0.4
{
camera_set_view_size(view_camera[0],floor(v_x),floor(v_y));
}
else
{
camera_set_view_size(view_camera[0],floor(1280*0.4),floor(720*0.4));
}

v_x += (tv_x - v_x)*0.02;
v_y += (tv_y - v_y)*0.02;

if global.slow_motion > 0
{
player.depth = -100
v_x = 1280*0.8
v_y = 720*0.8
}
else
{
	if global.matching > 0 && can_follow_p_2 = 1
	{
	var get_other_player = -4
	var my_p = get_my_player()

		if global.matching = 1
		{
			with(player)
			{
				if image_alpha > 0 && id != my_p.id
				{
				get_other_player = id;
				}
			}
		}
		else
		{
			if global.observe_target = 0
			{
			get_other_player = get_certain_player(global.matched_pl1_name);
			}
			if global.observe_target = 1
			{
			get_other_player = get_certain_player(global.matched_pl2_name);
			}
			if global.observe_target = 2
			{
			get_other_player = get_certain_player(global.matched_pl3_name);
			}
			if global.observe_target = 3
			{
			get_other_player = get_certain_player(global.matched_pl4_name);
			}
		}
	
		if (get_other_player != -4 && instance_exists(get_other_player))
		{
			if get_other_player = -4
			{
			get_other_player = my_p.x
			}
		var _set_scale = (abs(my_p.x - get_other_player.x)/2)
	
			if _set_scale > 320
			{
			_set_scale = 320
			}
	
		tv_x = 1280*0.8+_set_scale*1.28
		tv_y = 720*0.8+_set_scale*0.72
		}
	}
	else
	{
	tv_x = 1280
	tv_y = 720
	}
}

if global.w_alpha2 > 0
{
global.w_alpha2 -= 0.15
}

if global.w_alpha < 0
{
global.w_alpha = 0
}

if global.w_alpha > 0
{
global.w_alpha -= 0.15
}



global.b_alpha += (global.t_b_alpha - global.b_alpha)*0.05

