global.dev_message_alpha -= 0.08

if show_sound_list > 0
{
show_sound_list_y += (-150 - show_sound_list_y)*0.1
show_sound_list -= 0.01
show_sound_list_alpha += (1.1 - show_sound_list_alpha)*0.1
}
else
{
show_sound_list_y += (-256 - show_sound_list_y)*0.1
show_sound_list_alpha += (-0.01 - show_sound_list_alpha)*0.1
}

if global.show_challenger > 0 && global.b_alpha >= 1
{
global.now_map = choose(0,2)
}



if global.slow_motion = 0 && fps < 55
{
global.low_quality = 1
}

if is_server = true
{
ping_c_timer ++
	if ping_c_timer > 200
	{
		for(var i = 0; i <= 25; i++)
		{
		ping_checker[i] = 0
		ping_checker_start[i] = 1
		}
	
	buffer_seek(code.ping_buffer, buffer_seek_start, 0);
	buffer_write(ping_buffer, buffer_u8, code.DATA.COMMAND);
	buffer_write(ping_buffer, buffer_u8, code.my_ID);
	buffer_write(code.ping_buffer, buffer_u8, COMM.PING_CHECK);
	send_all(code.ping_buffer);
	ping_c_timer = 0
	}


	for(var i = 0; i <= 25; i++)
	{
		if ping_checker_start[i] = 1
		{
		ping_checker[i]++
		}
	}
}

if instance_number(obj_camera) > 0
{
depth = obj_camera.depth+1
}

if global.r_hp_alpha > 0
{
global.r_hp_alpha += (-0.01 - global.r_hp_alpha)*0.1
}

if global.gamemode_server = 6 && global.awakening < 1
{
global.rage_gauge += 0.1
}

global.rage_w_alpha += (-0.01 - global.rage_w_alpha)*0.1

if global.rage_gauge >= 100
{
r_w_alpha_time++
	if r_w_alpha_time > 65
	{
	global.rage_w_alpha = 1
	r_w_alpha_time = 0
	}
}

if auto_des > 0
{
auto_des --
}
setting_alpha_real += (setting_alpha - setting_alpha_real)*0.1

if global.matching <= 0
{
forced_end_game = 0
}


if global.select_dev_setting > 0
{
setting_text_alpha += (1 - setting_text_alpha)*0.1
}

if !instance_exists(_mes_gamemode)
{
_mes_gamemode = -4
}

if room = room_main
{
	if _mes_gamemode = -4
	{
		if global.matching = 0
		{
		show_timer += (50 - show_timer)*0.1
		}
		else
		{
		show_timer += (-128 - show_timer)*0.1
		}
	}
	else
	{
	show_timer = -128
	}
}


if is_server = true
{
	if (global.b_alpha <= 0 && global.matching = 3)
	{
	forced_end_game ++
	
	var _check_player_online = 0
		with(player)
		{
			if returned_id = global.matched_pl1
			{
			_check_player_online++
			}
					
			if returned_id = global.matched_pl2
			{
			_check_player_online++
			}
			
			if (global.gamemode_server = 3 || global.gamemode_server = 4)
			{
				if returned_id = global.matched_pl3
				{
				_check_player_online++
				}
				
				if returned_id = global.matched_pl4
				{
				_check_player_online++
				}
			}
			else
			{
			_check_player_online += 2
			global.matched_pl3_ready = 1
			global.matched_pl4_ready = 1
			}
		}


		if (_check_player_online < 4 && forced_end_game < 190)
		{
		forced_end_game = 190
		}



		if forced_end_game > 200
		{
			if (global.matched_pl1_ready = 0 || global.matched_pl2_ready = 0 || global.matched_pl3_ready = 0 || global.matched_pl4_ready = 0)
			{
			buffer_seek(matching_buffer, buffer_seek_start, 0);
			buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
			buffer_write(matching_buffer, buffer_string, global.matched_pl1);
			buffer_write(matching_buffer, buffer_string, global.matched_pl2);
			buffer_write(matching_buffer, buffer_string, floor(0));
			send_all(matching_buffer);

			var _text1 = "Forced Match End!"
			
			if _check_player_online < 4
			{
			var _text2 = "(인원수가 부족합니다)"
			}
			else
			{
			var _text2 = "(각 플레이어의 지연 시간이 너무 깁니다)"
			}

			var _mes = instance_create_depth(x,y,-999,message_);
			_mes.t_image_alpha = 1;
			_mes.text = _text1
			_mes.sub_text = _text2
			_mes.auto_destroy = 0;
			_mes.alarm[1] = 180;

			global.hp = 1000
			global.matched_pl1_ready = 0
			global.matched_pl2_ready = 0
			global.never_move = 0
			global.slow_motion = 0
			global.t_b_alpha = -0.01
			global.matching = 0
			global.matched_pl1_won = 0
			global.matched_pl2_won = 0
			global.show_challenger = 0
			}
		}
	}
}


if global.b_alpha >= 1
{
var _ran_val = percentage_k((global.matched_pl1_won+global.matched_pl2_won)*43)
	if _ran_val = 1
	{
	global.rainy = 0
	}
}




if global.t_b_alpha < 0 && global.slow_motion <= 0
{
global.matched_pl1_ready = 0
global.matched_pl2_ready = 0
}

if global.stemina < 1
{
global.stemina = 1
}

light_scaling_time++

if light_scaling_time > 80
{
light_scaling_++
light_scaling_time = 0
}

if light_scaling_ > 1
{
light_scaling_ = 0
}

if light_scaling_ = 0
{
global.light_scaling += 0.001
}
else
{
global.light_scaling -= 0.001
}


if b_map != global.now_map
{
global.w_alpha = 1.5
b_map = global.now_map
}

if is_server = true && global.b_alpha >= 1
{
randomize()
change_weather ++

	if (audio_is_playing(maser_bgm) || audio_is_playing(shake_it_bgm)) && global.rainy != 1
	{
	change_weather_max = 0
	}

	if change_weather_max < change_weather
	{
	global.wind_dir = choose(-1,1)*irandom_range(0,12)
		if audio_is_playing(maser_bgm) || audio_is_playing(shake_it_bgm)
		{
		global.rainy = 1
		}
		else
		{
		global.rainy = irandom_range(0,2)
		}
	change_weather_max = irandom_range(6000,8000)
	change_weather = 0
	}
	
	if global.gamemode_server = 3
	{
	change_weather += 5
		if (global.rainy = 0 || abs(global.wind_dir) < 23)
		{
		change_weather = 0
		global.wind_dir = choose(-1,1)*irandom_range(23,30)
		global.rainy = choose(1,2)
		}
	}
	else
	{
		if (abs(global.wind_dir) >= 23)
		{
		change_weather_max = 0
		}
	}
}

if global.can_send_shake > 0
{
global.can_send_shake --
}






if global.rage_gauge > 100
{
global.rage_gauge = 100
}

if injured_effect > 0
{
injured_effect += (-0.01 - injured_effect)*0.1
}



if global.b_alpha <= 0.1 || global.t_auto_volume_down <= 0
{
global.auto_volume_down += (global.t_auto_volume_down - global.auto_volume_down)*0.01
}

if global.matching > 0
{
	if global.t_b_alpha <= 0 && global.t_auto_volume_down > 0
	{
		if global.bgm = -4
		{
			if is_server = true
			{
			randomize()
			var music_selected = choose(gyu_seong_bu_whal,wakrio_bgm,maser_bgm,bamguy_bgm,shake_it_bgm,wak_surada,alzaltak,tong_tiring)
			global.bgm = audio_play_sound(music_selected,0,false)
			show_sound_list = 3

			buffer_seek(effect_buffer, buffer_seek_start, 0);
			buffer_write(effect_buffer, buffer_u8, COMM.MUSIC_SYNC);
			buffer_write(effect_buffer, buffer_string, audio_get_name(string(music_selected)));
			send_all(effect_buffer);
			}
		}
		else
		{
			if audio_is_playing(gyu_seong_bu_whal) || audio_is_playing(wakrio_bgm) || audio_is_playing(maser_bgm) || audio_is_playing(shake_it_bgm) || audio_is_playing(bamguy_bgm) || audio_is_playing(tong_tiring) || audio_is_playing(wak_surada) || audio_is_playing(alzaltak)
			{
			audio_sound_gain(global.bgm,global.bgm_volume*global.master_volume*0.32*global.auto_volume_down,0)
			}
			else
			{
			global.bgm = -4
			}
		}
	}
}
else
{
	if global.auto_volume_down > 0 && global.t_auto_volume_down >= 0
	{
	global.t_auto_volume_down = -0.01
	}
	
	if global.bgm != -4
	{
	audio_sound_gain(global.bgm,global.bgm_volume*global.master_volume*0.52*global.auto_volume_down,0)
	}
	
	if global.auto_volume_down <= 0 && global.t_auto_volume_down <= 0
	{
	audio_stop_sound(gyu_seong_bu_whal)
	audio_stop_sound(maser_bgm)
	audio_stop_sound(wakrio_bgm)
	audio_stop_sound(shake_it_bgm)
	audio_stop_sound(wak_surada)
	audio_stop_sound(tong_tiring)
	audio_stop_sound(alzaltak)
	audio_stop_sound(bamguy_bgm)
	global.bgm = -4
	}
}




