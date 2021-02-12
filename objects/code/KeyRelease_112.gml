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
		_mes_s.alarm[1] = 180
		}
		else
		{
		show_debug_message("can not matching")
		}
	}
	
	if global.select_dev_setting = 2
	{
		if global.gamemode_server != 3 && global.gamemode_server != 4
		{
			if is_server = true && global.client_num >= 1
			{
			certain_matching ++

				if certain_matching > 1
				{
				certain_matching = 0
				}

				if certain_matching = 1
				{
				_mes_select_matching = instance_create_depth(x,y,-999,message_)
				_mes_select_matching.t_image_alpha = 1
				_mes_select_matching.text = "특정한 매칭!"
				_mes_select_matching.sub_text = "(특정 플레이어를 매칭 시킵니다)"
				_mes_select_matching.auto_destroy = 0
				}
				else
				{
					if _mes_select_matching != -4
					{
					_mes_select_matching.alarm[1] = 1
					_mes_select_matching = -4
					}
				}
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

	var _mes = instance_create_depth(x,y,-999,message_);
	_mes.t_image_alpha = 1;
	_mes.text = _text1
	_mes.sub_text = _text2
	_mes.auto_destroy = 0;
	_mes.alarm[1] = 180;

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
	
	
	
	if global.select_dev_setting = 4
	{
	var _kicked_player = (get_string("킥할 플레이어를 지정해주세요", ""));

		if _kicked_player != ""
		{
		buffer_seek(kick_buffer, buffer_seek_start, 0);
		buffer_write(kick_buffer, buffer_u8, DATA.KICK_PLAYER);
		buffer_write(kick_buffer, buffer_string, real(_kicked_player));
		buffer_write(kick_buffer, buffer_string, string("Kicked by "+string(global.nickname)));
		send_all(kick_buffer);
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
	
setting_alpha = -0.01
global.select_dev_setting = 0
auto_des = 0

var sfx = audio_play_sound(message_sfx,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
}