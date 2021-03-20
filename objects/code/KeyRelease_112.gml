/// @description Insert description here
// You can write your code in this editor
if is_server = true && auto_des <= 0
{
	if global.select_dev_setting = 1
	{
		if global.client_num >= 1
		{
		repeat_matching = 1
		_mes_s = instance_create_depth(x,y,-999,message_)
		_mes_s.t_image_alpha = 1
		_mes_s.text = "매칭중..."
		_mes_s.sub_text = "(잠시만 기다려 주세요)"
		_mes_s.auto_destroy = 0
		_mes_s.alarm[1] = 40
		
			if _mes_select_matching != -4
			{
			_mes_select_matching.alarm[1] = 1
			_mes_select_matching = -4
			}
		}
		else
		{
		dev_mes("매칭이 불가능 합니다")
		}
	}
	
	if global.for_kick_player >= 0
	{
		if (global.select_dev_setting = 12 || global.select_dev_setting = 13)
		{
			if global.pinged_player_num < 3
			{
			global.pinged_player[global.for_kick_player] *= -1
				if global.pinged_player[global.for_kick_player] = -1
				{
				global.pinged_player_num --
				}
				else
				{
				global.pinged_player_num ++
				}
			dev_mes(string(global.pinged_player_num)+" / "+string(global.for_kick_player)+" / "+string(global.pinged_player[global.for_kick_player]))
			}
			else
			{
			global.pinged_player_num --
			global.pinged_player[global.for_kick_player] = -1
			dev_mes("최대 4명까지 설정 가능 합니다")
			}
		}
	}
	
	
	
	
	if global.select_dev_setting = 3
	{
		if global.gamemode_server != 3 && global.gamemode_server != 4
		{
		buffer_seek(matching_buffer, buffer_seek_start, 0);
		buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
		buffer_write(matching_buffer, buffer_string, global.matched_pl1);
		buffer_write(matching_buffer, buffer_string, global.matched_pl2);
		buffer_write(matching_buffer, buffer_string, floor(0));
		buffer_write(matching_buffer, buffer_string, string("게임 강제 종료"));
		send_all(matching_buffer);
		}
		else
		{
		buffer_seek(matching_buffer, buffer_seek_start, 0);
		buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
		buffer_write(matching_buffer, buffer_string, global.matched_pl1);
		buffer_write(matching_buffer, buffer_string, global.matched_pl2);
		buffer_write(matching_buffer, buffer_string, floor(0));
		buffer_write(matching_buffer, buffer_string, string("게임 강제 종료"));
		buffer_write(matching_buffer, buffer_string, global.matched_pl1);
		buffer_write(matching_buffer, buffer_string, global.matched_pl2);
			if global.gamemode_server = 4
			{
			buffer_write(matching_buffer, buffer_string, global.matched_pl1);
			buffer_write(matching_buffer, buffer_string, global.matched_pl2);
			}
		send_all(matching_buffer);
		}

	var _text1 = "Match End!"
	var _text2 = "게임 강제 종료"
	dev_mes(string(_text1)+" / "+string(_text2))

	global.hp = 1000
	global.matched_pl1_ready = 0
	global.matched_pl2_ready = 0
	global.matched_pl3_ready = 0
	global.matched_pl4_ready = 0
	global.never_move = 0
	global.slow_motion = 0
	global.t_b_alpha = -0.01
	global.matching = 0
	global.matched_pl1_won = 0
	global.matched_pl2_won = 0
	global.show_challenger = 0
	global.matched_pl1 = -4
	global.matched_pl2 = -4
	global.matched_pl3 = -4
	global.matched_pl4 = -4
	_mes_select_matching = -4
	}
	
	
	
	if global.select_dev_setting = 14
	{
		if global.for_kick_player != 0
		{
		var __aaa = string("Kicked by "+string(global.nickname))
		buffer_seek(kick_buffer, buffer_seek_start, 0);
		buffer_write(kick_buffer, buffer_u8, DATA.KICK_PLAYER);
		buffer_write(kick_buffer, buffer_string, real(global.for_kick_player));
		buffer_write(kick_buffer, buffer_string, __aaa);
		send_all(kick_buffer);
	
		var name_a = ""
		with(player)
		{
			if playerID = global.for_kick_player
			{
			name_a = string(name)
			}
		}
	
		chat_up(string(name_a)+"이/가 서버에서 추방 당했습니다. (사유 : "+string(__aaa)+")",0,0)
		}
		else
		{
		dev_mes("자기 자신은 추방 할 수 없습니다!")
		}
	}
	
	
	
	if global.select_dev_setting = 5
	{
	gamemode_select = 1

	if _mes_gamemode = -4
	{
	_mes_gamemode = instance_create_depth(x,y,-999,message_);
	_mes_gamemode.t_image_alpha = 1;
	_mes_gamemode.text = "게임 모드 선택 중"
	_mes_gamemode.sub_text = 0;
	_mes_gamemode.auto_destroy = 0;
	}

	buffer_seek(gamemode_select_buffer, buffer_seek_start, 0);
	buffer_write(gamemode_select_buffer, buffer_u8, DATA.GAMEMODE_SELECTING);
	send_all(gamemode_select_buffer);
	}
	
	
	
	if global.select_dev_setting = 6
	{
		for(var i = 1; i <= 20; i++)
		{
		buffer_seek(code.kick_buffer, buffer_seek_start, 0);
		buffer_write(code.kick_buffer, buffer_u8, code.DATA.KICK_PLAYER);
		buffer_write(code.kick_buffer, buffer_string, real(i));
		buffer_write(code.kick_buffer, buffer_string, string("Server restarting"));
		send_all(code.kick_buffer);
		}
	game_restart()
	}
	
	if global.select_dev_setting = 7
	{
	var _friend_code = encryption_ip(my_ip)
	clipboard_set_text(_friend_code)
	dev_mes("초대 코드가 복사 되었습니다!")
	}


if global.select_dev_setting = 4
{
auto_des = 25
setting_alpha = 1
global.for_kick_player = 0
global.select_dev_setting = 14
dev_mes("킥할 플레이어를 선택해주세요")
}
else if global.select_dev_setting = 2
{
	if global.gamemode_server != 3 && global.gamemode_server != 4
	{
	global.select_dev_setting = 12
	}
	else
	{
	global.select_dev_setting = 13
	}
}
else if (global.select_dev_setting = 12 || global.select_dev_setting = 13)
{
auto_des = 25
setting_alpha = 1
	if global.for_kick_player = -1
	{
	global.for_kick_player = 0
	setting_alpha = -0.01
	auto_des = 0
	global.select_dev_setting = 0
	}
}
else
{
setting_alpha = -0.01
auto_des = 0
global.select_dev_setting = 0
}



var sfx = audio_play_sound(message_sfx,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
}