var type = async_load[? "type"];

if (type == network_type_connect)
{
	var socket = async_load[? "socket"];
	var cli_max = ds_list_size(global.clients)

	index = 0;
	buffer_seek(info_buffer, buffer_seek_start, 0);
	buffer_write(info_buffer, buffer_u8, DATA.INIT_DATA);
	buffer_write(info_buffer, buffer_u8, cli_max);
	buffer_write(info_buffer, buffer_u8, socket);
	
	if instance_exists(player)
	{
		for(var i = 0; i < cli_max; i++) 
		{
			with(player) 
			{
				if (other.index == playerID) 
				{
				buffer_write(other.info_buffer, buffer_string, name);
				buffer_write(other.info_buffer, buffer_u8, soc);
				}
			}
			index++;
		}
	}
	
	network_send_packet(socket, info_buffer, buffer_get_size(info_buffer));

	ds_list_add(global.clients, socket);
}
else if (type == network_type_disconnect) 
{
	var socket = async_load[? "socket"];//"id"쓰지 말것 무조건 0이 나온다.

	buffer_seek(dis_buffer, buffer_seek_start, 0);
	buffer_write(dis_buffer, buffer_u8, DATA.REMOVE_CLI);
	buffer_write(dis_buffer, buffer_u8, socket);
	send_all(dis_buffer);
	
	with(player)
	{
	image_alpha = -10
	}
		
	show_debug_message(global.nickname)
	if global.matching <= 0
	{
	chat_up("플레이어가 나갔습니다.",global.nickname,1);
	}
	else
	{
	chat_up("플레이어가 나갔습니다.",global.nickname,0);
	}
	
	var pos = ds_list_find_index(global.clients, socket);
	ds_list_delete(global.clients, pos);
}
else if (type == network_type_data) 
{
	var buffer = async_load[? "buffer"];
	
	buffer_seek(buffer, buffer_seek_start, 0);
	
	var data = buffer_read(buffer, buffer_u8);
	
	switch(data) 
	{
		case DATA.INIT_DATA:
			my_ID = buffer_read(buffer, buffer_u8);
			var socket = buffer_read(buffer, buffer_u8);
			global.client_num = my_ID;
			if instance_exists(player)
			{
			player.playerID = my_ID;
			}
			global.my_instance_id.soc = socket;
			chat_up("채팅방에 들어왔습니다.",global.nickname,1);

				for(i = 0; i < my_ID; i++)
				{
				var obj = instance_create_depth(2040+irandom_range(-200,200),903,-100, obj_nope);
				obj.playerID = i;
					with(obj) 
					{
					name = buffer_read(buffer, buffer_string);
					soc = buffer_read(buffer, buffer_u8);
					instance_change(player, true);
					}
				}
			buffer_seek(info_buffer, buffer_seek_start, 0);
			buffer_write(info_buffer, buffer_u8, DATA.ADD_CLI);
			buffer_write(info_buffer, buffer_u8, my_ID);
			send_all(info_buffer);
			send_one(buffer_string, "name");
			send_one(buffer_u8, "soc");
		break;
		case DATA.CHAT:
			str = buffer_read(buffer, buffer_string);
			var _sender = buffer_read(buffer, buffer_string);
			var _is_server__ = buffer_read(buffer, buffer_string);
			
			if _is_server__ = 1
			{
				if string_pos("/chatban",str) != 0
				{
				var converted_text__ = string_replace_all(str,"/chatban","")
				converted_text__ = string_replace_all(converted_text__,string(_sender),"")
				converted_text__ = string_replace_all(converted_text__,":","")
				converted_text__ = string_replace_all(converted_text__," ","")
				
					if global.nickname = converted_text__
					{
					dev_mes("채팅 권한이 변경되었습니다")
					global.blocked_chat ++
						if global.blocked_chat > 1
						{
						global.blocked_chat = 0
						}
					}
					else
					{
					chat_up(string(converted_text__)+"의 채팅 권한이 변경되었습니다",0,0)
					}
				}
				else if string_pos("/kick",str) != 0
				{
				var converted_text__ = string_replace_all(str,"/kick","")
				converted_text__ = string_replace_all(converted_text__,string(_sender),"")
				converted_text__ = string_replace_all(converted_text__,":","")
				converted_text__ = string_replace_all(converted_text__," ","")

					if global.nickname = converted_text__
					{
					chat_up(string(converted_text__)+"이/가 서버에서 추방 당했습니다. (사유 : "+string("Kick command")+")",0,0)
					alarm[11] = 1
					}
				}
				else if string_pos("/pvpban",str) != 0
				{
				var converted_text__ = string_replace_all(str,"/pvpban","")
				converted_text__ = string_replace_all(converted_text__,string(_sender),"")
				converted_text__ = string_replace_all(converted_text__,":","")
				converted_text__ = string_replace_all(converted_text__," ","")

					if global.nickname = converted_text__
					{
					dev_mes("PVP 권한이 변경되었습니다")
					global.blocked_pvp ++
						if global.blocked_pvp > 1
						{
						global.blocked_pvp = 0
						}
					}
					else
					{
					chat_up(string(converted_text__)+"의 PVP 권한이 변경되었습니다",0,0)
					}
				}
				else if string_pos("/dm",str) != 0
				{
				chat_up(str,_sender,1);
				}
				else
				{
					if global.matching > 0
					{
					chat_up(str,_sender,-1);
					}
					else
					{
					chat_up(str,_sender,1);
					}
				}
			}
			else
			{
				if string_pos("/dm",str) != 0
				{
					if string_pos(global.nickname,str) != 0
					{
					chat_up(str,_sender,1);
					}
				}
				else
				{
					if global.matching > 0
					{
					chat_up(str,_sender,-1);
					}
					else
					{
					chat_up(str,_sender,1);
					}
				}
			}
		break;
		
		case DATA.MUCH_DATA:
			var ID = buffer_read(buffer, buffer_u8);
			var size = buffer_read(buffer, buffer_u8);
			for(var i = 0; i < size; i++) {
				var type = buffer_read(buffer, buffer_u8);
				var val_name = buffer_read(buffer, buffer_string);
				var val = buffer_read(buffer, type);
				with(player) 
				{
					if(playerID == ID) 
					{
					variable_instance_set(id, val_name, val);
					}
				}
			}
		break;
		
		case DATA.GET_REAL_ID:
			if is_server = false && global.return_player_id = 0
			{
			var ID = buffer_read(buffer, buffer_string);
			global.return_player_id = real(ID)
			}
		break;
		
		case DATA._RED_CIRCLE_EFFECT:
			var _check_who_send = buffer_read(buffer, buffer_string);
				if global.nickname != string(_check_who_send) && now_recieving = 0
				{
				var _x = real(buffer_read(buffer, buffer_string));
				var _y = real(buffer_read(buffer, buffer_string));
				var _xscale = real(buffer_read(buffer, buffer_string));
				var _yscale = real(buffer_read(buffer, buffer_string));
				var _t_scale = real(buffer_read(buffer, buffer_string));
			
				var skill_red_ball_effect_rage = instance_create_depth((_x)/100,(_y)/100,player.depth-2,red_circle_effect_received);
				skill_red_ball_effect_rage.image_xscale = (_xscale)/100;
				skill_red_ball_effect_rage.image_yscale = (_yscale)/100;
				skill_red_ball_effect_rage.t_scale = (_t_scale)/100;
				skill_red_ball_effect_rage.alarm[11] = 7;
				now_recieving = 1
				}
			now_recieving = 0
		break;
		
		case DATA.GAMEMODE_SELECTING:
			if is_server = false
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
			}
		break;
		
		case DATA.GAMEMODE_SELECTED:
			if is_server = false
			{
			var gamemode_val = buffer_read(buffer, buffer_string);
			
			global.gamemode_server = gamemode_val;
			}
		break;
		
		case DATA.ADD_CLI:
			var some_ID = buffer_read(buffer, buffer_u8);
			if(my_ID != some_ID)
			{
			var obj = instance_create_depth(2040+irandom_range(-200,200),903,-100,obj_nope);
				with(obj) 
				{
				name = "";
				playerID = some_ID;
				soc = 0;
				instance_change(player, true);
				}
				global.client_num++;
				global.to_return_player_id ++;
				
				if global.matching <= 0
				{
				chat_up("새로운 플레이어가 왔습니다.",global.nickname,1);
				}
				else
				{
				chat_up("새로운 플레이어가 왔습니다.",global.nickname,0);
				}
				sended_rain = -1
				
				if is_server = true
				{
				buffer_seek(info_buffer, buffer_seek_start, 0);
				buffer_write(info_buffer, buffer_u8, DATA.CHECKING_);
				buffer_write(info_buffer, buffer_string, global.build_ver);
				send_all(info_buffer);
				
				buffer_seek(connection_buffer, buffer_seek_start, 0);
				buffer_write(connection_buffer, buffer_u8, DATA.GET_REAL_ID);
				buffer_write(connection_buffer, buffer_string, real(global.to_return_player_id));
				send_all(connection_buffer);
				
				buffer_seek(gamemode_select_buffer, buffer_seek_start, 0);
				buffer_write(gamemode_select_buffer, buffer_u8, DATA.GAMEMODE_SELECTED);
				buffer_write(gamemode_select_buffer, buffer_string, real(floor(global.gamemode)));
				send_all(gamemode_select_buffer);
				
					if global.matching > 0
					{
					buffer_seek(matching_buffer, buffer_seek_start, 0);
					buffer_write(matching_buffer, buffer_u8, DATA.MATCH_START);
					buffer_write(matching_buffer, buffer_string, global.matched_pl1);
					buffer_write(matching_buffer, buffer_string, global.matched_pl2);
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl1_name));
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl2_name));
					
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl3));
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl4));
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl3_name));
					buffer_write(matching_buffer, buffer_string, string(global.matched_pl4_name));
					send_all(matching_buffer);
					}
				}
			}
		break;
		case DATA.DISCONECTON:
		if is_server = false
		{
			var _name = buffer_read(buffer, buffer_string);
			with(player)
			{
				if name = _name
				{
				instance_destroy();
				}
			};
		}
		break;
		
		case DATA.KICK_PLAYER:
		if is_server = false
		{
		var _name = buffer_read(buffer, buffer_string);
		var _reason = buffer_read(buffer, buffer_string);

			if (global.nickname = _name || global.return_player_id = real(_name))
			{
				if string(_reason) = "Anti cheating"
				{
				global.ban_from_server = 1
				}
			save_data()
			dev_mes("서버에서 추방 당했습니다. (사유 : "+string(_reason)+")");
			game_restart();
			}
		}
		break;
	
		
		case DATA.CHECKING_:
		if is_server = 9999 //안티 치트 비활성화
		{
		var _build_ver = buffer_read(buffer, buffer_string);
		global.server_build_ver = real(_build_ver);
		alarm[0] = 1
		
		buffer_seek(info_buffer, buffer_seek_start, 0);
		buffer_write(info_buffer, buffer_u8, DATA.ANTI_CHEATING);
		buffer_write(info_buffer, buffer_string, global.nickname);
		buffer_write(info_buffer, buffer_string, global.rank);
		send_all(info_buffer);
		}
		break;
		
		case DATA.ANTI_CHEATING:
		if is_server = true
		{
		var _name = buffer_read(buffer, buffer_string);
		var _rank = buffer_read(buffer, buffer_string);
		
		ini_open("Arena_of_Wakgood_rank_for_server.ini")
		var loaded_rank = ini_read_real(string(_name),"/",-4);
		ini_close()
		
			if loaded_rank != -4
			{
				if abs(loaded_rank - _rank) >= 96
				{
				buffer_seek(kick_buffer, buffer_seek_start, 0);
				buffer_write(kick_buffer, buffer_u8, DATA.KICK_PLAYER);
				buffer_write(kick_buffer, buffer_string, _name);
				buffer_write(kick_buffer, buffer_string, string("Anti cheating"));
				send_all(kick_buffer);
				}
			}
		}
		break;
		
		case DATA.REMOVE_CLI:
			var socket = buffer_read(buffer, buffer_u8);
			with(player)
			{
			show_debug_message(playerID)
			image_alpha = -10
			}
			
			if global.matching <= 0
			{
			chat_up("누군가가 나갔습니다.",global.nickname,1);
			}
			else
			{
			chat_up("누군가가 나갔습니다.",global.nickname,0);
			}
			
			global.client_num--;
		break;
		
		case DATA.WEATHER:
			if is_server = false
			{
			var _got_val = buffer_read(buffer, buffer_string);
			var _got_val2 = buffer_read(buffer, buffer_string);
			var _got_val3 = buffer_read(buffer, buffer_string);
			global.rainy = real(_got_val);
			global.wind_dir = real(_got_val2/100);
			global.now_map = real(_got_val3);
			}
		break;
		
		case DATA.SLOW_MOTION:
		alarm[1] = 180
		global.slow_motion = 1;
		global.w_alpha = 1.5;
		room_speed = 15;
		global.never_move = 1
		
		var a___ = audio_play_sound(last_scene,0,0)
		audio_sound_gain(a___,0.7*global.master_volume*2*global.sfx_volume,0)
		break;
		
		case DATA.SEND_NAME:
		var _pl_id = buffer_read(buffer, buffer_string);
		var _name = buffer_read(buffer, buffer_string);
			with(player)
			{
				if real(_pl_id) = playerID && is_string(_name) 
				{
				name = _name;
				}
			}
		break;
		
		case DATA.MATCH_START:
			if is_server = false && global.matching = 0
			{
			var pl1_real_id = buffer_read(buffer, buffer_string);
			var pl2_real_id = buffer_read(buffer, buffer_string);
			var pl1_name = buffer_read(buffer, buffer_string);
			var pl2_name = buffer_read(buffer, buffer_string);
			var pl3_real_id = buffer_read(buffer, buffer_string);
			var pl4_real_id = buffer_read(buffer, buffer_string);
			var pl3_name = buffer_read(buffer, buffer_string);
			var pl4_name = buffer_read(buffer, buffer_string);
		
			
			global.matched_pl1 = pl1_real_id;
			global.matched_pl2 = pl2_real_id;
			
			global.matched_pl3 = pl3_real_id;
			global.matched_pl4 = pl4_real_id;
			

			global.matched_pl1_name = pl1_name;
			global.matched_pl2_name = pl2_name;
			
			global.matched_pl3_name = pl3_name;
			global.matched_pl4_name = pl4_name;
		
			global.never_move = 1;
			global.t_b_alpha = 2.01;
			
			if global.in_practice > 0
			{
			var _my_p = get_my_player()
			pl_practice.entering_now = 0
			pl_practice.changed_prt = 0
			global.t_b_alpha_prt = -0.01
			_my_p.x = 2048
			_my_p.y = 903
			obj_camera.x = 2048
			obj_camera.y = 903
				with(hyumpanchi_banana)
				{
				hp = -1
				}
			global.in_practice = 0
			}
			
			global.matching = 3
			
				for(var i = -6; i <= 6; i++)
				{
				var random_cre = percentage_k(20)
					if random_cre = 1
					{
					instance_create_depth(choose(2448,1648)+64*i,903-48,obj_floor.depth-2,choose(obj_andience1,obj_andience11,obj_andience111))
					}
				}
			}
		break;
		
		case DATA.SEND_WINNINGS:
			if is_server = false
			{
			var pl1_win = buffer_read(buffer, buffer_string);
			var pl2_win = buffer_read(buffer, buffer_string);
			
			global.matched_pl1_won = real(pl1_win)
			global.matched_pl2_won = real(pl2_win)
			}
		break;
		
		case DATA.MATCH_END:
			if is_server = false
			{
			global.matched_pl1_name = -4
			global.matched_pl2_name = -4
			global.matched_pl3_name = -4
			global.matched_pl4_name = -4
			var _winner = buffer_read(buffer, buffer_string);
			var _loser = buffer_read(buffer, buffer_string);
			var _bet_point = buffer_read(buffer, buffer_string);
			var _message = buffer_read(buffer, buffer_string);
			if global.gamemode_server = 3 || global.gamemode_server = 4
			{
			var _winner2 = buffer_read(buffer, buffer_string);
			var _loser2 = buffer_read(buffer, buffer_string);
			}
			
			if global.gamemode_server = 4
			{
			var _winner3 = buffer_read(buffer, buffer_string);
			var _loser3 = buffer_read(buffer, buffer_string);
			}
			
			if global.gamemode_server != 3 && global.gamemode_server != 4
			{
				if global.return_player_id = _winner
				{
				global.keep_winning ++
				global.draw_now_rank = 1
				global.rank += real(floor(_bet_point))
				}
				
				if global.return_player_id = _loser
				{
				global.keep_winning = 0
				global.draw_now_rank = 1
				global.rank -= real(floor(_bet_point))
				}
			}
			else
			{
				if global.gamemode_server = 3
				{
					if global.return_player_id = _winner || global.return_player_id = _winner2
					{
					global.keep_winning ++
					global.draw_now_rank = 1
					global.rank += real(floor(_bet_point))
					}
				
					if global.return_player_id = _loser || global.return_player_id = _loser2
					{
					global.keep_winning = 0
					global.draw_now_rank = 1
					global.rank -= real(floor(_bet_point))
					}
				}
				else
				{
					if global.return_player_id = _winner || global.return_player_id = _winner2 || global.return_player_id = _winner3
					{
					global.keep_winning ++
					global.draw_now_rank = 1
					global.rank += real(floor(_bet_point))
					}
				
					if global.return_player_id = _loser || global.return_player_id = _loser2 || global.return_player_id = _loser3
					{
					global.keep_winning = 0
					global.draw_now_rank = 1
					global.rank -= real(floor(_bet_point))
					}
				}
			}

				
			buffer_seek(code.matching_buffer, buffer_seek_start, 0);
			buffer_write(code.matching_buffer, buffer_u8, global.DATA_SAVE_PLAYERS_RANK);
			buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
			buffer_write(code.matching_buffer, buffer_string, global.rank);
			send_all(code.matching_buffer);
			
			var _mes = instance_create_depth(x,y,-999,message_);
			_mes.t_image_alpha = 1;
			_mes.text = "Match End!"
			_mes.sub_text = string(_message)
			_mes.auto_destroy = 0;
			_mes.alarm[1] = 180;
			
			save_data()
			}
			
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
		with(player)
		{
		sprite_index = move_sprite
		}
		break;
		
		case DATA.SAVE_PLAYERS_RANK:
			if is_server = true
			{
			var _name = buffer_read(buffer, buffer_string);
			var _rank = buffer_read(buffer, buffer_string);
			
			save_user_rank(_name,_rank);
			save_data();
			}
		break;
		
		case DATA.READY_TO_FIGHT:
			var got_pl_real_id = buffer_read(buffer, buffer_string);
			
			if got_pl_real_id = global.matched_pl1
			{
			global.matched_pl1_ready = 1
			}
			
			if got_pl_real_id = global.matched_pl2
			{
			global.matched_pl2_ready = 1
			}
			
			if got_pl_real_id = global.matched_pl3
			{
			global.matched_pl3_ready = 1
			}
			
			if got_pl_real_id = global.matched_pl4
			{
			global.matched_pl4_ready = 1
			}
		forced_end_game = 0
		break;

		case DATA.COMMAND:
			var com_ID = buffer_read(buffer, buffer_u8);
			var command = buffer_read(buffer, buffer_u8);
			switch(command) 
			{
				case COMM.POSITION:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _x = buffer_read(buffer, buffer_string);
				var _y = buffer_read(buffer, buffer_string);
				var _hp = buffer_read(buffer, buffer_string);
				var _real_id_ = buffer_read(buffer, buffer_string);
				var _kw_ = buffer_read(buffer, buffer_string);
				var _s_sword_ = buffer_read(buffer, buffer_string);
				var _m_hp = buffer_read(buffer, buffer_string);
				if global.nickname != _check_who_send
				{
					with(player) 
					{
						if(playerID == com_ID)
						{
						x = real(_x)/10;
						y = real(_y)/10;
						if is_string(_hp)
						{
						hp = real(_hp)/100;
						m_hp = real(_m_hp)/100;
						}
						
						if is_real(_kw_)
						{
						keep_winning_ = real(string(_kw_))/100;
						}

						n_sword_ = real(string(_s_sword_))/100;
						returned_id = real(_real_id_);
						}
					}
				}
				break;
				
				case COMM.IMAGE_FOR_CAMERA:
				var _follower = buffer_read(buffer, buffer_string);
				var _xscale = buffer_read(buffer, buffer_string);
				var _yscale = buffer_read(buffer, buffer_string);
				var _angle = buffer_read(buffer, buffer_string);
				var _img_alpha = buffer_read(buffer, buffer_string);
				
				var my_p = get_my_player();
				if my_p.image_alpha = 1
				{
					with(obj_camera)
					{
						if (my_cer_p != -4 && my_cer_p = _follower)
						{
						image_xscale = real(_xscale)/100;
						image_yscale = real(_yscale)/100;
						image_angle = real(_angle)/100;
						image_alpha = real(_img_alpha)/100
						}
					}
				}
				break;
				
				case COMM.IMAGE:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var spr_ind = buffer_read(buffer, buffer_string);
				var _xscale = buffer_read(buffer, buffer_string);
				var _yscale = buffer_read(buffer, buffer_string);
				var _index = buffer_read(buffer, buffer_string);
				var _angle = buffer_read(buffer, buffer_string);
				var _w_alpha = buffer_read(buffer, buffer_string);
				var _img_alpha = buffer_read(buffer, buffer_string);
				var _movement_speed___ = buffer_read(buffer, buffer_string);
				if global.nickname != _check_who_send
				{
					with(player) 
					{
						if(playerID == com_ID)
						{
						sprite_index = spr_ind;
						image_xscale = real(_xscale)/100;
						image_yscale = real(_yscale)/100;
						image_index = real(_index)/100;
						image_angle = real(_angle)/100;
						w_alpha = real(_w_alpha)/100;
						image_alpha = real(_img_alpha)/100
						self_movement_speed = real(_movement_speed___)/100
						}
					}
				}
				break;
				
				case COMM.DOWM_EFFECT:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _xscale = buffer_read(buffer, buffer_string);
				var _yscale = buffer_read(buffer, buffer_string);
				var _x = buffer_read(buffer, buffer_string);
				if global.nickname != _check_who_send
				{
				var effect_ = instance_create_depth(_x,global.p_floor+27,player.depth+1,down_effect);
				effect_.t_image_xscale = _xscale/100;
				effect_.t_image_yscale = _yscale/100;
				effect_.received = 1
				}
				break;
				
				
				case COMM.PING_CHECK:
				buffer_seek(code.ping_buffer, buffer_seek_start, 0);
				buffer_write(ping_buffer, buffer_u8, global.DATA_COMMAND);
				buffer_write(ping_buffer, buffer_u8, code.my_ID);
				buffer_write(code.ping_buffer, buffer_u8, COMM.PING_CHECK_RECEIVED_SERVER);
				buffer_write(code.ping_buffer, buffer_string, global.return_player_id);
				send_all(code.ping_buffer);
				break;
				
				case COMM.PING_CHECK_RECEIVED_SERVER:
				if is_server = true
				{
				var _check_who_send = real(buffer_read(buffer, buffer_string));
				
				ping_checker_start[_check_who_send] = 0;
				
				buffer_seek(code.ping_buffer, buffer_seek_start, 0);
				buffer_write(ping_buffer, buffer_u8, global.DATA_COMMAND);
				buffer_write(ping_buffer, buffer_u8, code.my_ID);
				buffer_write(code.ping_buffer, buffer_u8, COMM.PING_CHECK_RECEIVED_CLI);
				buffer_write(code.ping_buffer, buffer_string, real(_check_who_send));
				buffer_write(code.ping_buffer, buffer_string, real(ping_checker[_check_who_send]));
				buffer_write(code.ping_buffer, buffer_string, real(fps_real));
				buffer_write(code.ping_buffer, buffer_string, real(room_speed));
				send_all(code.ping_buffer);
				}
				break;
				
				case COMM.PING_CHECK_RECEIVED_CLI:
				if is_server = false
				{
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _ping = buffer_read(buffer, buffer_string);
				var _nfps = buffer_read(buffer, buffer_string);
				var _rnfps = buffer_read(buffer, buffer_string);
					with(player)
					{
						if playerID = _check_who_send
						{
						ping = real(_ping);
						fps_now = real(_nfps);
						room_sp_now = real(_rnfps);
						
						buffer_seek(code.ping_buffer, buffer_seek_start, 0);
						buffer_write(code.ping_buffer, buffer_u8, global.DATA_COMMAND);
						buffer_write(code.ping_buffer, buffer_u8, code.my_ID);
						buffer_write(code.ping_buffer, buffer_u8, global.COMM_PING_CHECK_RECEIVED_SERVER_AC);
						buffer_write(code.ping_buffer, buffer_string, real(playerID));
						buffer_write(code.ping_buffer, buffer_string, real(_ping));
						buffer_write(code.ping_buffer, buffer_string, real(_nfps));
						buffer_write(code.ping_buffer, buffer_string, real(_rnfps));
						send_all(code.ping_buffer);
						}
					}
				}
				break;
				
				case COMM.PING_CHECK_RECEIVED_SERVER_AC:
				if is_server = true
				{
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _ping = buffer_read(buffer, buffer_string);
				var _nfps = buffer_read(buffer, buffer_string);
				var _rnfps = buffer_read(buffer, buffer_string);
					with(player)
					{
						if playerID = _check_who_send
						{
						ping = real(_ping);
						fps_now = real(_nfps);
						room_sp_now = real(_rnfps);
						}
					}
				}
				break;
				
				
				case COMM.SFX:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _argu0 = buffer_read(buffer, buffer_string);
				var _argu1 = buffer_read(buffer, buffer_string);
				var _argu2 = buffer_read(buffer, buffer_string);
				var _x = buffer_read(buffer, buffer_string);
				var _y = buffer_read(buffer, buffer_string);
				if global.nickname != _check_who_send && audio_exists(_argu0)
				{
				var _my_player = get_my_player();
				//dev_mes(string(_my_player)+"/"+string(global.nickname))
					if instance_exists(_my_player)
					{
					var volume = _argu2/100;
					var sfx = audio_play_sound(_argu0,_argu1,0);
					audio_sound_gain(sfx,(1-point_distance(_x/100,_y/100,_my_player.x,_my_player.y)/940)*volume*global.master_volume*2*global.sfx_volume,0);
					}
				}
				break;
				
				case COMM.VIEW_SHAKE:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _argu0 = buffer_read(buffer, buffer_string);
				var _argu1 = buffer_read(buffer, buffer_string);
				var _argu2 = buffer_read(buffer, buffer_string);
				if global.nickname != _check_who_send
				{
				var _my_player = get_my_player();
				//dev_mes(string(_my_player)+"/"+string(global.nickname))
				var _a = _argu0/100;
				var _b = _argu1/100;
				var _c = _argu2/100;
				view_shake_received(_a,_b,_c);
				}
				break;
				
				case COMM.PLATFORM_T:
				var _on_platform_ = buffer_read(buffer, buffer_string);
				if instance_exists(obj_platform)
				{
				obj_platform.time_s = real(string(_on_platform_));
				}
				break;
				
				case COMM.P_DAMAGE:
				var _p_damage_ = buffer_read(buffer, buffer_string);
				var _p_damage_critical = buffer_read(buffer, buffer_string);
				if is_real(_p_damage_)
				{
				global.damage_plus_multi = real(string(_p_damage_));
				global.critical_plus_multi = real(string(_p_damage_critical));
				}
				break;
				
				
				case COMM.ATTACK_EFFECT:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _x = buffer_read(buffer, buffer_string);
				var _y = buffer_read(buffer, buffer_string);
				var _xscale = buffer_read(buffer, buffer_string);
				var _yscale = buffer_read(buffer, buffer_string);
				var _angle = buffer_read(buffer, buffer_string);
				var _index = buffer_read(buffer, buffer_string);
				var _obj_ind = buffer_read(buffer, buffer_string);
				var _spr_ind = buffer_read(buffer, buffer_string);
				var _alpha = buffer_read(buffer, buffer_string);
				var _img_blend = c_white;
				
				if global.nickname != _check_who_send
				{
					if global.gamemode_server != 4
					{
					var _obj_get_ = asset_get_index(string(_obj_ind)+"_attacked");
					}
					else
					{
						if global.matched_pl1 = global.return_player_id
						{
						var _obj_get_ = asset_get_index(string(_obj_ind)+"_attacked");
						}
						else
						{
							if global.matched_pl1_name != _check_who_send
							{
							var _obj_get_ = asset_get_index(string(_obj_ind)+"_non_attacked");
							}
							else
							{
							var _obj_get_ = asset_get_index(string(_obj_ind)+"_attacked");
							_img_blend = c_gray;
							}
						}
					}
				var _spr_get_ = asset_get_index(string(_spr_ind));
				
					if (object_exists(_obj_get_) && sprite_exists(_spr_get_))
					{
					var _attack_ef = instance_create_depth(_x/100,_y/100,player.depth+1,_obj_get_);
					_attack_ef.attack_owner = _check_who_send;
					_attack_ef.image_xscale = _xscale/100;
					_attack_ef.image_yscale = _yscale/100;
					_attack_ef.image_angle = _angle/100;
					_attack_ef.image_index = _index/100;
					_attack_ef.sprite_index = _spr_get_;
					_attack_ef.image_alpha = _alpha/100;
						if _img_blend = c_gray
						{
						_attack_ef.image_blend = _img_blend;
						}
					}
				}
				break;
				
				case COMM.RUSH_ATTACK_EFFECT:
				var _check_who_send = buffer_read(buffer, buffer_string);
				var _x = buffer_read(buffer, buffer_string);
				var _y = buffer_read(buffer, buffer_string);
				var _xscale = buffer_read(buffer, buffer_string);
				var _yscale = buffer_read(buffer, buffer_string);
				var __i = buffer_read(buffer, buffer_string);
				
				if global.nickname != _check_who_send
				{
				var my_p = get_my_player();
				var bl_ef = instance_create_depth(_x/100,_y/100,my_p.depth-1,ef_blood_dash_attack_attacked);
				bl_ef.image_xscale = _xscale/100;
				bl_ef.image_yscale = _yscale/100;
				bl_ef.t_x = __i/100;
				bl_ef.attack_owner = _check_who_send;
				}
				break;
				
				case COMM.MUSIC_SYNC:
				var _music_name = buffer_read(buffer, buffer_string);
				show_debug_message(_music_name)
				if is_server = false
				{
				global.now_music = string(_music_name)
				global.bgm = audio_play_sound((string(_music_name)),0,false)
				show_sound_list = 3
				}
				break;
				
				case COMM.SPARK_EFFECT:
				var _check_who_send = buffer_read(buffer, buffer_string);
				if now_recieving = 0 && global.nickname != string(_check_who_send)
				{
				now_recieving = 1
				var _x = buffer_read(buffer, buffer_string);
				var _y = buffer_read(buffer, buffer_string);
				var _vspeed = buffer_read(buffer, buffer_string);
				var _hspeed = buffer_read(buffer, buffer_string);
				var _obj_ind = buffer_read(buffer, buffer_string);
				var _spr_ind = buffer_read(buffer, buffer_string);
				var _angle = buffer_read(buffer, buffer_string);
				var _obj_get_ = asset_get_index(string(_obj_ind)+"_received");
				
					if object_exists(_obj_get_) && now_recieving <= 1
					{
					var _attack_ef = instance_create_depth(real(_x)/100,real(_y)/100,player.depth+choose(-1,1),_obj_get_);
					_attack_ef.vspeed = real(_vspeed)/100;
					_attack_ef.hspeed = real(_hspeed)/100;
					_attack_ef.sprite_index = _spr_ind;
					_attack_ef.image_angle = real(_angle)/100;
					now_recieving = 2
					}
				now_recieving = 0
				}
				break;
				
				
				case COMM.BUBLE_EFFECT:
				var _check_who_send = buffer_read(buffer, buffer_string);
				
				if global.nickname != string(_check_who_send)
				{
				var _a1 = buffer_read(buffer, buffer_string);
				var _a2 = buffer_read(buffer, buffer_string);
				var _a3 = buffer_read(buffer, buffer_string);
				var _a4 = buffer_read(buffer, buffer_string);
				var _a5 = buffer_read(buffer, buffer_string);
				var _a6 = buffer_read(buffer, buffer_string);
				var _a7 = buffer_read(buffer, buffer_string);
				var _a8 = buffer_read(buffer, buffer_string);
				var _a9 = buffer_read(buffer, buffer_string);
				var _a10 = buffer_read(buffer, buffer_string);
				var _a11 = buffer_read(buffer, buffer_string);
				var _a12 = buffer_read(buffer, buffer_string);
				cre_buble_ef(_a1/100,_a2/100,string(_a3),string(_a4),_a5/100,_a6/100,_a7/100,_a8/100,_a9/100,_a10/100,_a11/100,_a12/100,0)
				}
				break;
				
				case COMM.ATTACKER_GET_RAGE:
				var _check_who_send = buffer_read(buffer, buffer_string);
				
				if global.nickname = _check_who_send
				{
				var _rage_gage = buffer_read(buffer, buffer_string);
				var _damage = buffer_read(buffer, buffer_string);
				var _ori_damage = buffer_read(buffer, buffer_string);
				var img_bnd = c_white
				var _xscale = 1
				var _yscale = 1
				var _my_p = get_my_player();
				
					if _damage <= _ori_damage
					{
					img_bnd = $FF1E9DFF;
					}
					else
					{
					var sfx = audio_play_sound(critical_sfx,0,0);
					audio_sound_gain(sfx,0.05*global.master_volume*2*global.sfx_volume,0);

					img_bnd = $FF6D19FF;
					_xscale = 1.1;
					_yscale = 1.1;

					var __i = choose(-1,1);
					var bl_ef = instance_create_depth(x,y,depth-1,ef_blood);
					var img_scale = -__i*irandom_range(8,15)/5;
					_xscale = img_scale;
					_yscale = abs(img_scale);
					bl_ef.t_x = __i;
					bl_ef.image_angle = irandom_range(-90,90);
					
					var random_shine = percentage_k(10)
						if random_shine = 1
						{
						global.w_alpha = 1;
						}
					}


					if _damage > 0
					{
						if _damage <= _ori_damage
						{
						img_bnd = $FF1E9DFF;
						}
						else
						{
						img_bnd = $FF6D19FF;
						}
					}
					
					if  _my_p != -4 && instance_exists(_my_p)
					{
					var d_ef = instance_create_depth(_my_p.x,_my_p.y,_my_p.depth-1,draw_hp_m);
					d_ef.d_text = _damage/100;
					d_ef.image_blend = img_bnd;
					d_ef.image_xscale = _xscale;
					d_ef.image_yscale = _yscale;
					}

					if floor(real(_ori_damage/100)) = 62
					{
						with(_my_p)
						{
						global.hp -= 18
						global.movement_speed = 0
							if abs(movement_speed) > 2.6
							{
							movement_speed = image_xscale*2
							}
							else
							{
							movement_speed = -movement_speed*1.3
							}
						y -= 1
						gravity = -0.1
						vspeed = -4
						attack_charge_sfx = 0
						sprite_index = move_sprite
						image_index = 0
						cannot_move = 0
						cooltime = 0
						charge_attack = 3
						charge_attack_effect = 0
						global.movement_speed = 0
						sfx_for_multiplayer(sword_ready,false,0.12)
						}
					}
					
					if floor(real(_ori_damage/100)) = 58
					{
						with(_my_p)
						{
						sting_attack = 7
						attack_sting_sfx = 2
						sfx_for_multiplayer(sword_ready,false,0.12)
						}
					}
				

					if global.gamemode_server = 2
					{
					global.rage_gauge += real(_rage_gage)/50+real(_rage_gage)/500;
					}
					else
					{
					global.rage_gauge += real(_rage_gage)/100+real(_rage_gage)/1000*global.mental_plus;
					
						if global.taking_hp_plus > 0
						{
						global.hp += (real(_damage)*global.taking_hp_plus)/20
						}
					}
				}
				break;
			}
		break;
	}
	if (is_server) {
		send_all(buffer);
	}
}