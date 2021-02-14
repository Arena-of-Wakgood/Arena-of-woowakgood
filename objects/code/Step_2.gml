/// @description Insert description here
// You can write your code in this editor
if global.rank < 0
{
global.rank = 0
}

if global.rank > 4000
{
global.rank = 4000
}


if gamemode_select > 0
{
randomize()
gamemode_select ++
	if _mes_gamemode != -4 && instance_exists(_mes_gamemode)
	{
	_mes_gamemode.sub_text = global.gamemode
	}
	
	if gamemode_select > max_gamemode_select
	{
		repeat(9999)
		{
			if global.gamemode = b_gamemode
			{
			global.gamemode = choose(1,1,2,3,4,5,6,7)
			}
			else
			{
				if !(instance_number(player) < 4 && (global.gamemode = 3 || global.gamemode = 4))
				{
				b_gamemode = global.gamemode;
				break;
				}
				else
				{
				global.gamemode = choose(1,1,2,3,4,5,6,7)
				}
			}
		}
	
	var sfx = audio_play_sound(message_sfx,0,0)
	audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
	max_gamemode_select ++
	gamemode_select = 1
	}
	
	if max_gamemode_select = 15 && max_gamemode_select_sfx = 0
	{
	var sfx = audio_play_sound(kitaso,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	max_gamemode_select_sfx = 1
	}
	
	if max_gamemode_select > 20
	{
	var sfx = audio_play_sound(critical_sfx,0,0)
	audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(donation_sfx,0,0)
	audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
	max_gamemode_select = 0
	gamemode_select = -1
	max_gamemode_select_sfx = 0
	
		if _mes_gamemode != -4 && instance_exists(_mes_gamemode)
		{
		_mes_gamemode.auto_destroy = 1
		_mes_gamemode.alarm[2] = 1
		}
		
		if is_server = true
		{
			repeat(999)
			{
				if largely_before_gamemode = global.gamemode
				{
				global.gamemode = choose(1,1,2,3,4,5)
				}
				else
				{
				break;
				}
			}
			
		largely_before_gamemode = global.gamemode
		global.gamemode_server = global.gamemode
		buffer_seek(gamemode_select_buffer, buffer_seek_start, 0);
		buffer_write(gamemode_select_buffer, buffer_u8, DATA.GAMEMODE_SELECTED);
		buffer_write(gamemode_select_buffer, buffer_string, real(floor(global.gamemode_server)));
		send_all(gamemode_select_buffer);
		}
	}
}
else
{
	if is_server = false
	{
	global.gamemode = global.gamemode_server
	}
}


if global.show_challenger > 0
{
show_sound_list = 0.2
}


if global.matching = 3
{
		//매치 첫시작 선수 소개전 선수 위치 설정
		if global.show_challenger = 0 && global.t_b_alpha > 0 && global.b_alpha > 2
		{
		global.hp = 1000
		global.rage_gauge = 0
		global.awakening = 0
		global.t_b_alpha = -0.01
		global.show_challenger = 1
		global.t_auto_volume_down = 1
		
			with(player)
			{
				if returned_id = global.matched_pl1
				{
				x = obj_floor.x - 230
				y = 903
				show_debug_message("a")
				}
				
				if returned_id = global.matched_pl2
				{
				x = obj_floor.x + 230
				y = 903
				show_debug_message("b")
				}

				if global.gamemode_server = 3
				{
					if returned_id = global.matched_pl3
					{
					x = obj_floor.x - 230
					y = 903
					show_debug_message("c")
					}
		
					if returned_id = global.matched_pl4
					{
					x = obj_floor.x + 230
					y = 903
					show_debug_message("d")
					}
				}
				
				if global.gamemode_server = 4
				{
					if returned_id = global.matched_pl3
					{
					x = obj_floor.x + 230+82
					y = 903
					show_debug_message("c")
					}
		
					if returned_id = global.matched_pl4
					{
					x = obj_floor.x + 230+82+82
					y = 903
					show_debug_message("d")
					}
				}
			}
		}
		
		
	if global.gamemode_server != 3 && global.gamemode_server != 4
	{
		if (global.matched_pl1 != global.return_player_id && global.matched_pl2 != global.return_player_id)
		{
		global.show_challenger = 1
		global.hp = 1000
		global.rage_gauge = 0
		global.awakening = 0
		global.slow_motion = 0
		global.never_move = 1
		global.matching = 2
		global.show_challenger = 0
		global.t_auto_volume_down = 1
		global.t_b_alpha = -0.01
		
		var _mes = instance_create_depth(x,y,-999,message_);
		_mes.t_image_alpha = 1;
		_mes.text = "Round 1";
		_mes.sub_text = "1라운드 시작!";
		_mes.auto_destroy = 0;
		_mes.alarm[1] = 180;
		}
		else
		{
			//매치 첫시작 선수 소개
			if global.show_challenger = 1
			{
				with(player)
				{
					if returned_id = global.matched_pl1
					{
						if show_first_action > 300
						{
						global.matched_pl1_ready = 1
			
						buffer_seek(code.matching_buffer, buffer_seek_start, 0);
						buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
						buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
						send_all(code.matching_buffer);
						}
					}
		
					if returned_id = global.matched_pl2
					{
						if show_first_action > 300
						{
						global.matched_pl2_ready = 1
			
						buffer_seek(code.matching_buffer, buffer_seek_start, 0);
						buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
						buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
						send_all(code.matching_buffer);
						}
					}
				}
		
				//매치 첫시작 선수 소개후 게임 시작
				if global.matched_pl1_ready = 1 && global.matched_pl2_ready = 1
				{
				global.hp = 1000
				global.rage_gauge = 0
				global.awakening = 0
				global.matching = 1
				global.t_auto_volume_down = 1
				var _mes = instance_create_depth(x,y,-999,message_);
				_mes.t_image_alpha = 1;
				_mes.text = "Round 1";
				_mes.sub_text = "1라운드 시작!";
				_mes.auto_destroy = 0;
				_mes.alarm[1] = 180;
		
				var my_p = get_my_player()
				if instance_exists(my_p)
				{
					if global.matched_pl1 = global.return_player_id
					{
					my_p.sprite_index = my_p.move_sprite
					my_p.x = obj_floor.x - 230
					my_p.y = 903
					
						repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
						{
						randomize()
						var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
						var scale = irandom_range(20,40)/50
						dust.image_xscale = scale
						dust.image_yscale = scale
						dust.vspeed = irandom_range(-50,50)/37
						dust.hspeed = irandom_range(-50,50)/37
						dust.image_alpha = 1
						}
								
					sfx_for_multiplayer(mob_faint,0,0.1)
					}
			
					if global.matched_pl2 = global.return_player_id
					{
					my_p.sprite_index = my_p.move_sprite
					my_p.x = obj_floor.x + 230
					my_p.y = 903
					
						repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
						{
						randomize()
						var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
						var scale = irandom_range(20,40)/50
						dust.image_xscale = scale
						dust.image_yscale = scale
						dust.vspeed = irandom_range(-50,50)/37
						dust.hspeed = irandom_range(-50,50)/37
						dust.image_alpha = 1
						}
								
					sfx_for_multiplayer(mob_faint,0,0.1)
					}
				}
	
				global.show_challenger = 0
				global.matched_pl1_ready = 0
				global.matched_pl2_ready = 0
				global.matched_pl3_ready = 0
				global.matched_pl4_ready = 0
				global.never_move = 0
				}
			}
		}
	}
	else
	{
		if global.gamemode_server = 3
		{
			if (global.matched_pl1 != global.return_player_id && global.matched_pl2 != global.return_player_id && global.matched_pl3 != global.return_player_id && global.matched_pl4 != global.return_player_id)
			{
			global.hp = 1000
			global.rage_gauge = 0
			global.awakening = 0
			global.slow_motion = 0
			global.never_move = 1
			global.matching = 2
			global.show_challenger = 0
			global.t_auto_volume_down = 1
			global.t_b_alpha = -0.01
		
			var _mes = instance_create_depth(x,y,-999,message_);
			_mes.t_image_alpha = 1;
			_mes.text = "Round 1";
			_mes.sub_text = "1라운드 시작!";
			_mes.auto_destroy = 0;
			_mes.alarm[1] = 180;
			}
			else
			{
				if (global.matched_pl1_won+global.matched_pl2_won) = 1
				{
					if (global.matched_pl1 = global.return_player_id || global.matched_pl2 = global.return_player_id)
					{
					global.hp = 1000
					global.awakening = 0
					global.matched_pl1_ready = 1
					global.matched_pl2_ready = 1
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl1);
					send_all(code.matching_buffer);
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl2);
					send_all(code.matching_buffer);
					
					
					global.slow_motion = 0
					global.never_move = 1
					global.matching = 2
					global.show_challenger = 0
					global.t_auto_volume_down = 1
					global.t_b_alpha = -0.01
		
					var _mes = instance_create_depth(x,y,-999,message_);
					_mes.t_image_alpha = 1;
					_mes.text = "Round 1";
					_mes.sub_text = "1라운드 시작!";
					_mes.auto_destroy = 0;
					_mes.alarm[1] = 180;
					}
					else
					{
						//매치 첫시작 선수 소개
						if global.show_challenger = 1
						{
							with(player)
							{
								if returned_id = global.matched_pl3
								{
									if show_first_action > 300
									{
									global.matched_pl3_ready = 1
			
									buffer_seek(code.matching_buffer, buffer_seek_start, 0);
									buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
									buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
									send_all(code.matching_buffer);
									}
								}
		
								if returned_id = global.matched_pl4
								{
									if show_first_action > 300
									{
									global.matched_pl4_ready = 1
			
									buffer_seek(code.matching_buffer, buffer_seek_start, 0);
									buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
									buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
									send_all(code.matching_buffer);
									}
								}
							}
		
							//매치 첫시작 선수 소개후 게임 시작
							if global.matched_pl3_ready = 1 && global.matched_pl4_ready = 1
							{
							global.hp = 1000
							global.rage_gauge = 0
							global.awakening = 0
							global.matching = 1
							global.t_auto_volume_down = 1
							var _mes = instance_create_depth(x,y,-999,message_);
							_mes.t_image_alpha = 1;
							_mes.text = "Round 1";
							_mes.sub_text = "1라운드 시작!";
							_mes.auto_destroy = 0;
							_mes.alarm[1] = 180;
		
							var my_p = get_my_player()
							if instance_exists(my_p)
							{
								if global.matched_pl3 = global.return_player_id
								{
								my_p.sprite_index = my_p.move_sprite
								my_p.x = obj_floor.x - 230
								my_p.y = 903
								
									repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
									{
									randomize()
									var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
									var scale = irandom_range(20,40)/50
									dust.image_xscale = scale
									dust.image_yscale = scale
									dust.vspeed = irandom_range(-50,50)/37
									dust.hspeed = irandom_range(-50,50)/37
									dust.image_alpha = 1
									}
								
								sfx_for_multiplayer(mob_faint,0,0.1)
								}
			
								if global.matched_pl4 = global.return_player_id
								{
								my_p.sprite_index = my_p.move_sprite
								my_p.x = obj_floor.x + 230
								my_p.y = 903
								
									repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
									{
									randomize()
									var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
									var scale = irandom_range(20,40)/50
									dust.image_xscale = scale
									dust.image_yscale = scale
									dust.vspeed = irandom_range(-50,50)/37
									dust.hspeed = irandom_range(-50,50)/37
									dust.image_alpha = 1
									}
								
								sfx_for_multiplayer(mob_faint,0,0.1)
								}
							}
	
							global.show_challenger = 0
							global.matched_pl1_ready = 0
							global.matched_pl2_ready = 0
							global.matched_pl3_ready = 0
							global.matched_pl4_ready = 0
							global.never_move = 0
							}
						}
					}
				}
				else
				{
					if (global.matched_pl3 = global.return_player_id || global.matched_pl4 = global.return_player_id)
					{
					global.hp = 1000
					global.awakening = 0
					global.matched_pl3_ready = 1
					global.matched_pl4_ready = 1
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl3);
					send_all(code.matching_buffer);
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl4);
					send_all(code.matching_buffer);
						
					global.slow_motion = 0
					global.never_move = 1
					global.matching = 2
					global.show_challenger = 0
					global.t_auto_volume_down = 1
					global.t_b_alpha = -0.01
		
					var _mes = instance_create_depth(x,y,-999,message_);
					_mes.t_image_alpha = 1;
					_mes.text = "Round 1";
					_mes.sub_text = "1라운드 시작!";
					_mes.auto_destroy = 0;
					_mes.alarm[1] = 180;
					}
					else
					{
						//매치 첫시작 선수 소개
						if global.show_challenger = 1
						{
							with(player)
							{
								if returned_id = global.matched_pl1
								{
									if show_first_action > 300
									{
									global.matched_pl1_ready = 1
			
									buffer_seek(code.matching_buffer, buffer_seek_start, 0);
									buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
									buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
									send_all(code.matching_buffer);
									}
								}
		
								if returned_id = global.matched_pl2
								{
									if show_first_action > 300
									{
									global.matched_pl2_ready = 1
			
									buffer_seek(code.matching_buffer, buffer_seek_start, 0);
									buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
									buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
									send_all(code.matching_buffer);
									}
								}
							}
		
							//매치 첫시작 선수 소개후 게임 시작
							if global.matched_pl1_ready = 1 && global.matched_pl2_ready = 1
							{
							global.matching = 1
							global.t_auto_volume_down = 1
							var _mes = instance_create_depth(x,y,-999,message_);
							_mes.t_image_alpha = 1;
							_mes.text = "Round 1";
							_mes.sub_text = "1라운드 시작!";
							_mes.auto_destroy = 0;
							_mes.alarm[1] = 180;
		
							var my_p = get_my_player()
							if instance_exists(my_p)
							{
								if global.matched_pl1 = global.return_player_id
								{
								my_p.sprite_index = my_p.move_sprite
								my_p.x = obj_floor.x - 230
								my_p.y = 903
								
									repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
									{
									randomize()
									var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
									var scale = irandom_range(20,40)/50
									dust.image_xscale = scale
									dust.image_yscale = scale
									dust.vspeed = irandom_range(-50,50)/37
									dust.hspeed = irandom_range(-50,50)/37
									dust.image_alpha = 1
									}
								
								sfx_for_multiplayer(mob_faint,0,0.1)
								}
			
								if global.matched_pl2 = global.return_player_id
								{
								my_p.sprite_index = my_p.move_sprite
								my_p.x = obj_floor.x + 230
								my_p.y = 903
								
									repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
									{
									randomize()
									var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
									var scale = irandom_range(20,40)/50
									dust.image_xscale = scale
									dust.image_yscale = scale
									dust.vspeed = irandom_range(-50,50)/37
									dust.hspeed = irandom_range(-50,50)/37
									dust.image_alpha = 1
									}
								
								sfx_for_multiplayer(mob_faint,0,0.1)
								}
							}
	
							global.show_challenger = 0
							global.matched_pl1_ready = 0
							global.matched_pl2_ready = 0
							global.matched_pl3_ready = 0
							global.matched_pl4_ready = 0
							global.never_move = 0
							}
						}
					}
				}
			}
		}
		else
		{
			if (global.matched_pl1 != global.return_player_id && global.matched_pl2 != global.return_player_id && global.matched_pl3 != global.return_player_id && global.matched_pl4 != global.return_player_id)
			{
			global.slow_motion = 0
			global.never_move = 1
			global.matching = 2
			global.show_challenger = 0
			global.t_auto_volume_down = 1
			global.t_b_alpha = -0.01
		
			var _mes = instance_create_depth(x,y,-999,message_);
			_mes.t_image_alpha = 1;
			_mes.text = "Round 1";
			_mes.sub_text = "1라운드 시작!";
			_mes.auto_destroy = 0;
			_mes.alarm[1] = 180;
			}
			else
			{
				//매치 첫시작 선수 소개
				if global.show_challenger = 1
				{
					with(player)
					{
						if returned_id = global.matched_pl1
						{
							if show_first_action > 300
							{
							global.matched_pl1_ready = 1
			
							buffer_seek(code.matching_buffer, buffer_seek_start, 0);
							buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
							buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
							send_all(code.matching_buffer);
							}
						}
		
						if returned_id = global.matched_pl2
						{
							if show_first_action > 300
							{
							global.matched_pl2_ready = 1
			
							buffer_seek(code.matching_buffer, buffer_seek_start, 0);
							buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
							buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
							send_all(code.matching_buffer);
							}
						}
						
						if returned_id = global.matched_pl3
						{
							if show_first_action > 300
							{
							global.matched_pl3_ready = 1
			
							buffer_seek(code.matching_buffer, buffer_seek_start, 0);
							buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
							buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
							send_all(code.matching_buffer);
							}
						}
		
						if returned_id = global.matched_pl4
						{
							if show_first_action > 300
							{
							global.matched_pl4_ready = 1
			
							buffer_seek(code.matching_buffer, buffer_seek_start, 0);
							buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
							buffer_write(code.matching_buffer, buffer_string, global.return_player_id);
							send_all(code.matching_buffer);
							}
						}
					}
		
					//매치 첫시작 선수 소개후 게임 시작
					if global.matched_pl1_ready = 1 && global.matched_pl2_ready = 1 && global.matched_pl3_ready = 1 && global.matched_pl4_ready = 1
					{
					global.matching = 1
					global.t_auto_volume_down = 1
					var _mes = instance_create_depth(x,y,-999,message_);
					_mes.t_image_alpha = 1;
					_mes.text = "Round 1";
					_mes.sub_text = "1라운드 시작!";
					_mes.auto_destroy = 0;
					_mes.alarm[1] = 180;
		
					var my_p = get_my_player()
					if instance_exists(my_p)
					{
						if global.matched_pl1 = global.return_player_id
						{
						my_p.sprite_index = my_p.move_sprite
						my_p.x = obj_floor.x - 230
						my_p.y = 903
						
							repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
							{
							randomize()
							var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
							var scale = irandom_range(20,40)/50
							dust.image_xscale = scale
							dust.image_yscale = scale
							dust.vspeed = irandom_range(-50,50)/37
							dust.hspeed = irandom_range(-50,50)/37
							dust.image_alpha = 1
							}
								
						sfx_for_multiplayer(mob_faint,0,0.1)
						}
			
						if global.matched_pl2 = global.return_player_id
						{
						my_p.sprite_index = my_p.move_sprite
						my_p.x = obj_floor.x + 230
						my_p.y = 903
						
							repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
							{
							randomize()
							var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
							var scale = irandom_range(20,40)/50
							dust.image_xscale = scale
							dust.image_yscale = scale
							dust.vspeed = irandom_range(-50,50)/37
							dust.hspeed = irandom_range(-50,50)/37
							dust.image_alpha = 1
							}
								
						sfx_for_multiplayer(mob_faint,0,0.1)
						}
						
						if global.matched_pl3 = global.return_player_id
						{
						my_p.sprite_index = my_p.move_sprite
						my_p.x = obj_floor.x + 230 + 82
						my_p.y = 903
						
							repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
							{
							randomize()
							var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
							var scale = irandom_range(20,40)/50
							dust.image_xscale = scale
							dust.image_yscale = scale
							dust.vspeed = irandom_range(-50,50)/37
							dust.hspeed = irandom_range(-50,50)/37
							dust.image_alpha = 1
							}
								
						sfx_for_multiplayer(mob_faint,0,0.1)
						}
						
						if global.matched_pl4 = global.return_player_id
						{
						my_p.sprite_index = my_p.move_sprite
						my_p.x = obj_floor.x + 230 + 82 + 82
						my_p.y = 903
						
							repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
							{
							randomize()
							var dust = instance_create_depth(my_p.x+irandom_range(-32,32),my_p.y+irandom_range(-32,32),my_p.depth-1,pepsi_effect)
							var scale = irandom_range(20,40)/50
							dust.image_xscale = scale
							dust.image_yscale = scale
							dust.vspeed = irandom_range(-50,50)/37
							dust.hspeed = irandom_range(-50,50)/37
							dust.image_alpha = 1
							}
								
						sfx_for_multiplayer(mob_faint,0,0.1)
						}
					}
	
					global.show_challenger = 0
					global.matched_pl1_ready = 0
					global.matched_pl2_ready = 0
					global.matched_pl3_ready = 0
					global.matched_pl4_ready = 0
					global.never_move = 0
					}
				}
			}
		}
	}
}

if is_server = true
{
buffer_seek(rain_buffer, buffer_seek_start, 0);
buffer_write(rain_buffer, buffer_u8, DATA.WEATHER);
buffer_write(rain_buffer, buffer_string, global.rainy);
buffer_write(rain_buffer, buffer_string, floor(global.wind_dir*100));
buffer_write(rain_buffer, buffer_string, global.now_map);
send_all(rain_buffer);
}


if global.slow_motion > 0
{
	if is_server = true && global.slow_motion = 1
	{
		with(player)
		{
			if global.gamemode != 3
			{
				if global.matched_pl1 = returned_id
				{
					if hp > 0
					{
					global.matched_pl1_won ++
					}
					else
					{
					global.matched_pl2_won ++
					}
				}
			}
			else
			{
				if (global.matched_pl1_won + global.matched_pl2_won) = 1
				{
					if (global.matched_pl3 = returned_id)
					{
						if hp > 0
						{
						global.matched_pl1_won ++
						}
						else
						{
						global.matched_pl2_won ++
						}
					}
				}
				else
				{
					if (global.matched_pl1 = returned_id)
					{
						if hp > 0
						{
						global.matched_pl1_won ++
						}
						else
						{
						global.matched_pl2_won ++
						}
					}
				}
			}
		}
		
	buffer_seek(matching_buffer, buffer_seek_start, 0);
	buffer_write(matching_buffer, buffer_u8, DATA.SEND_WINNINGS);
	buffer_write(matching_buffer, buffer_string, global.matched_pl1_won);
	buffer_write(matching_buffer, buffer_string, global.matched_pl2_won);
	send_all(matching_buffer);
	global.slow_motion++
	}
	
global.slow_motion += 0.1
global.slow_motion += global.slow_motion*0.03
	if global.slow_motion < 45
	{
	th_afas = 0
	room_speed = 15+global.slow_motion;
	}
	else
	{
		if room_speed != 5
		{
			if global.rainy = 1 && th_afas = 0
			{
			th_afas = 1
			var random_val = percentage_k(40)
			
				if random_val = 1
				{
				var sfx_th = audio_play_sound(thunder_sfx,0,0)
				audio_sound_gain(sfx_th,0.2*global.master_volume*2*global.sfx_volume,0)
				global.w_alpha = 0.75
				}
			}
		room_speed = 60
			if global.matching != 3
			{
			var _myp = get_my_player()
				if instance_exists(_myp)
				{
					with(player)
					{
						if self.id != _myp
						{
						obj_camera.t_x = self.x;
						obj_camera.t_y = self.y;
						}
					}
				}
			}
		}
	}
	
	if (global.gamemode_server != 3 && global.gamemode_server != 4)
	{
		if global.t_b_alpha > 0 && global.b_alpha > 2 && (global.matched_pl1 = global.return_player_id || global.matched_pl2 = global.return_player_id) && global.slow_motion > 45
		{
			with(player)
			{
				if returned_id = global.matched_pl1 && global.matched_pl1_ready = 0
				{
				global.matched_pl1_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
			
				if returned_id = global.matched_pl2 && global.matched_pl2_ready = 0
				{
				global.matched_pl2_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
			}
		}
	
		if global.matching > 0 && global.matching != 3
		{
			//재매치
			if global.matched_pl1_ready = 1 && global.matched_pl2_ready = 1
			{
				//둘의 승점이 모두 3 미만인 경우 재매치
				if global.matched_pl1_won < 2 && global.matched_pl2_won < 2
				{
				var _mes = instance_create_depth(x,y,-999,message_);
				_mes.t_image_alpha = 1;
				_mes.text = "Round "+string(1+global.matched_pl1_won + global.matched_pl2_won);
				_mes.sub_text = "상대를 때려 눕히세요! ( "+string(global.matched_pl1_won)+" vs "+string(global.matched_pl2_won)+" )";
				_mes.auto_destroy = 0;
				_mes.alarm[1] = 180;
		
				with(player)
				{
					if global.matched_pl1 = returned_id
					{
					x = obj_floor.x - 230
					y = 903;
					}
			
					if global.matched_pl2 = returned_id
					{
					x = obj_floor.x + 230
					y = 903;
					}
				}
		
				global.hp = 1000
				global.matched_pl1_ready = 0
				global.matched_pl2_ready = 0
				global.matched_pl3_ready = 0
				global.matched_pl4_ready = 0
				global.never_move = 0
				global.slow_motion = 0
				global.t_b_alpha = -0.01
				global.awakening = 0
				}
				else
				{
				//둘중 한명의 점수가 3점이 넘어간 경우
			
				var _betted_rank = irandom_range(28,32)
			
				if global.matched_pl1_won > global.matched_pl2_won
				{
				var _text1 = "Match End!"
				var _text2 = "승자 : "+string(global.matched_pl1_name)
			
					if is_server = true
					{
						if global.matched_pl1 = 0
						{
						global.draw_now_rank = 1
						global.keep_winning++
						global.rank += _betted_rank
						}
					
					buffer_seek(matching_buffer, buffer_seek_start, 0);
					buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
					buffer_write(matching_buffer, buffer_string, global.matched_pl1);
					buffer_write(matching_buffer, buffer_string, global.matched_pl2);
					buffer_write(matching_buffer, buffer_string, floor(_betted_rank));
					buffer_write(matching_buffer, buffer_string, string(_text2));
					send_all(matching_buffer);
					}
				}
			
				if global.matched_pl1_won < global.matched_pl2_won
				{
				var _text1 = "Match End!"
				var _text2 = "승자 : "+string(global.matched_pl2_name)
			
					if is_server = true
					{
						if global.matched_pl1 = 0
						{
						global.draw_now_rank = 1
						global.rank -= _betted_rank
						global.keep_winning = 0
						}
					
					buffer_seek(matching_buffer, buffer_seek_start, 0);
					buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
					buffer_write(matching_buffer, buffer_string, global.matched_pl2);
					buffer_write(matching_buffer, buffer_string, global.matched_pl1);
					buffer_write(matching_buffer, buffer_string, floor(_betted_rank));
					buffer_write(matching_buffer, buffer_string, string(_text2));
					send_all(matching_buffer);
					}
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
				global.matched_pl3_ready = 0
				global.matched_pl4_ready = 0
				global.never_move = 0
				global.slow_motion = 0
				global.t_b_alpha = -0.01
				global.matching = 0
				global.matched_pl1_won = 0
				global.matched_pl2_won = 0
				}
			}
		}
	}
	else
	{
		if global.t_b_alpha > 0 && global.b_alpha > 2 && (global.matched_pl1 = global.return_player_id || global.matched_pl2 = global.return_player_id || global.matched_pl3 = global.return_player_id || global.matched_pl4 = global.return_player_id) && global.slow_motion > 45
		{
			with(player)
			{
				if returned_id = global.matched_pl1 && global.matched_pl1_ready = 0
				{
				x = obj_floor.x - 230
				y = 903;
				
				global.matched_pl1_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
			
				if returned_id = global.matched_pl2 && global.matched_pl2_ready = 0
				{
				x = obj_floor.x + 230
				y = 903;
				
				global.matched_pl2_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
				
				if returned_id = global.matched_pl3 && global.matched_pl3_ready = 0
				{
				x = obj_floor.x + 230 +82
				y = 903;
				
				global.matched_pl3_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
				
				if returned_id = global.matched_pl4 && global.matched_pl4_ready = 0
				{
				x = obj_floor.x + 230 +82+82
				y = 903;
				
				global.matched_pl4_ready = 1
		
				buffer_seek(code.matching_buffer, buffer_seek_start, 0);
				buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
				buffer_write(code.matching_buffer, buffer_string, returned_id);
				send_all(code.matching_buffer);
				}
			}
		}
	
		if (global.matching > 0 && global.matching != 3)
		{
			//재매치
			if (global.matched_pl1_ready = 1 && global.matched_pl2_ready = 1 && global.matched_pl3_ready = 1 && global.matched_pl4_ready = 1)
			{
			global.hp = 1000
			global.awakening = 0
				//둘의 승점이 모두 3 미만인 경우 재매치
				if global.matched_pl1_won < 2 && global.matched_pl2_won < 2
				{
				var _mes = instance_create_depth(x,y,-999,message_);
				_mes.t_image_alpha = 1;
				_mes.text = "Round "+string(1+global.matched_pl1_won + global.matched_pl2_won);
				_mes.sub_text = "상대를 때려 눕히세요! ( "+string(global.matched_pl1_won)+" vs "+string(global.matched_pl2_won)+" )";
				_mes.auto_destroy = 0;
				_mes.alarm[1] = 180;
				
				if global.gamemode_server = 3
				{
					if ((global.matched_pl1_won + global.matched_pl2_won) = 1)
					{
						if (global.matched_pl1_name = global.nickname || global.matched_pl2_name = global.nickname)
						{
						global.hp = 1000
						global.awakening = 0
						global.matched_pl1_ready = 1
						global.matched_pl2_ready = 1
						global.slow_motion = 0
						global.never_move = 1
						global.matching = 2
						global.show_challenger = 0
						global.t_auto_volume_down = 1
						global.t_b_alpha = -0.01
					
						buffer_seek(code.matching_buffer, buffer_seek_start, 0);
						buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
						buffer_write(code.matching_buffer, buffer_string, global.matched_pl1);
						send_all(code.matching_buffer);
					
						buffer_seek(code.matching_buffer, buffer_seek_start, 0);
						buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
						buffer_write(code.matching_buffer, buffer_string, global.matched_pl2);
						send_all(code.matching_buffer);
						}
						else
						{
						global.hp = 1000
						global.awakening = 0
						global.slow_motion = 0
						global.never_move = 1
						global.matching = 1
						global.show_challenger = 0
						global.t_auto_volume_down = 1
						global.t_b_alpha = -0.01
						}
					}
					else
					{
					global.hp = 1000
					global.awakening = 0
					global.matching = 2
					global.slow_motion = 0
					global.show_challenger = 0
					global.matched_pl3_ready = 1
					global.matched_pl4_ready = 1
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl3);
					send_all(code.matching_buffer);
					
					buffer_seek(code.matching_buffer, buffer_seek_start, 0);
					buffer_write(code.matching_buffer, buffer_u8, code.DATA.READY_TO_FIGHT);
					buffer_write(code.matching_buffer, buffer_string, global.matched_pl4);
					send_all(code.matching_buffer);
					}
				}
		
				with(player)
				{
					if global.gamemode_server = 3
					{
						if global.matched_pl1 = returned_id || global.matched_pl3 = returned_id
						{
						x = obj_floor.x - 230
						y = 903;
						}
			
						if global.matched_pl2 = returned_id || global.matched_pl4 = returned_id
						{
						x = obj_floor.x + 230
						y = 903;
						}
					}
					else
					{
						if global.matched_pl1 = returned_id
						{
						x = obj_floor.x - 230
						y = 903;
						}
			
						if global.matched_pl2 = returned_id
						{
						x = obj_floor.x + 230
						y = 903;
						}
						
						if global.matched_pl3 = returned_id
						{
						x = obj_floor.x + 230+82
						y = 903;
						}
			
						if global.matched_pl4 = returned_id
						{
						x = obj_floor.x + 230+82+82
						y = 903;
						}
					}
				}
		
				global.hp = 1000
				global.matched_pl1_ready = 0
				global.matched_pl2_ready = 0
				global.matched_pl3_ready = 0
				global.matched_pl4_ready = 0
				global.never_move = 0
				global.slow_motion = 0
				global.t_b_alpha = -0.01
				global.awakening = 0
				}
				else
				{
				//둘중 한명의 점수가 3점이 넘어간 경우
			
				var _betted_rank = irandom_range(28,32)
			
				if global.matched_pl1_won > global.matched_pl2_won
				{
				var _text1 = "Match End!"
				if global.gamemode_server = 3
				{
				var _text2 = "승자 : "+string(global.matched_pl1_name)+" & "+string(global.matched_pl3_name)
				}
				else
				{
				var _text2 = "승자 : "+string(global.matched_pl1_name)
				}
			
					if is_server = true
					{
						if global.matched_pl1 = 0 || global.matched_pl3 = 0
						{
						global.draw_now_rank = 1
						global.keep_winning++
						global.rank += _betted_rank
						}
					
					buffer_seek(matching_buffer, buffer_seek_start, 0);
					buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
					buffer_write(matching_buffer, buffer_string, global.matched_pl1);
					buffer_write(matching_buffer, buffer_string, global.matched_pl2);
					buffer_write(matching_buffer, buffer_string, floor(_betted_rank));
					buffer_write(matching_buffer, buffer_string, string(_text2));
						if global.gamemode_server = 4
						{
						buffer_write(matching_buffer, buffer_string, -4);
						buffer_write(matching_buffer, buffer_string, global.matched_pl3);
						buffer_write(matching_buffer, buffer_string, -4);
						buffer_write(matching_buffer, buffer_string, global.matched_pl4);
						}
						else
						{
						buffer_write(matching_buffer, buffer_string, global.matched_pl3);
						buffer_write(matching_buffer, buffer_string, global.matched_pl4);
						}
					send_all(matching_buffer);
					}
				}
			
				if global.matched_pl1_won < global.matched_pl2_won
				{
				var _text1 = "Match End!"
				if global.gamemode_server = 3
				{
				var _text2 = "승자 : "+string(global.matched_pl2_name)+" & "+string(global.matched_pl4_name)
				}
				else
				{
				var _text2 = "승자 : "+string(global.matched_pl2_name)+" & "+string(global.matched_pl3_name)+" & "+string(global.matched_pl4_name)
				}
			
					if is_server = true
					{
						if global.matched_pl1 = 0 || global.matched_pl3 = 0
						{
						global.draw_now_rank = 1
						global.rank -= _betted_rank
						global.keep_winning = 0
						}
					
					buffer_seek(matching_buffer, buffer_seek_start, 0);
					buffer_write(matching_buffer, buffer_u8, DATA.MATCH_END);
					buffer_write(matching_buffer, buffer_string, global.matched_pl2);
					buffer_write(matching_buffer, buffer_string, global.matched_pl1);
					buffer_write(matching_buffer, buffer_string, floor(_betted_rank));
					buffer_write(matching_buffer, buffer_string, string(_text2));
						if global.gamemode_server = 4
						{
						buffer_write(matching_buffer, buffer_string, global.matched_pl3);
						buffer_write(matching_buffer, buffer_string, -4);
						buffer_write(matching_buffer, buffer_string, global.matched_pl4);
						buffer_write(matching_buffer, buffer_string, -4);
						}
						else
						{
						buffer_write(matching_buffer, buffer_string, global.matched_pl4);
						buffer_write(matching_buffer, buffer_string, global.matched_pl3);
						}
					send_all(matching_buffer);
					}
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
				global.matched_pl3_ready = 0
				global.matched_pl4_ready = 0
				global.never_move = 0
				global.slow_motion = 0
				global.t_b_alpha = -0.01
				global.matching = 0
				global.matched_pl1_won = 0
				global.matched_pl2_won = 0
				}
			}
		}
	}
}
else
{
	if room_speed != 5
	{
	room_speed = 60
	}
}


//매칭 시작
if is_server = true && global.client_num >= 1 && repeat_matching = 1
{
var player1_exists = 1
var player2_exists = 1
var player3_exists = 1
var player4_exists = 1
randomize()
var selected_p1 = irandom_range(0,global.to_return_player_id)
var selected_p2 = irandom_range(0,global.to_return_player_id)
var selected_p3 = irandom_range(0,global.to_return_player_id)
var selected_p4 = irandom_range(0,global.to_return_player_id)

	if _mes_select_matching = -4
	{
		repeat(99999)
		{
			if selected_p1 = selected_p2
			{
			selected_p2 = irandom_range(0,global.to_return_player_id)
			}
			else
			{
			break;
			}
		}
	
		if (global.gamemode_server = 3 || global.gamemode_server = 4)
		{
			repeat(99999)
			{
				if (selected_p3 = selected_p1 || selected_p3 = selected_p2)
				{
				selected_p3 = irandom_range(0,global.to_return_player_id)
				}
				else
				{
				break;
				}
			}
		
			repeat(99999)
			{
				if (selected_p4 = selected_p1 || selected_p4 = selected_p2 || selected_p4 = selected_p3)
				{
				selected_p4 = irandom_range(0,global.to_return_player_id)
				}
				else
				{
				break;
				}
			}
		}
	}
	else
	{
		if (global.gamemode_server = 3 || global.gamemode_server = 4)
		{
		selected_p3 = irandom_range(0,global.to_return_player_id)
		selected_p4 = irandom_range(0,global.to_return_player_id)
		}
		else
		{
		var __f1 = (get_string("플레이어1을 지정해주세요", ""));
		var __f2 = (get_string("플레이어2을 지정해주세요", ""));
	
		if __f1 = ""
		{
		__f1 = 0
		}
	
		if __f2 = ""
		{
		__f2 = 1
		}
	
		selected_p1 = __f1;
		selected_p2 = __f2;
		}
	}
	
	if selected_p1 != selected_p2
	{
		with(player)
		{
			if returned_id = selected_p1
			{
				if image_alpha <= -10
				{
				player1_exists = 0
				}
				else
				{
				global.matched_pl1 = selected_p1;
				global.matched_pl1_name = name;
				}
			}
			
			
			if returned_id = selected_p2
			{
				if image_alpha <= -10
				{
				player2_exists = 0
				}
				else
				{
				global.matched_pl2 = selected_p2;
				global.matched_pl2_name = name;
				}
			}
			
			if (global.gamemode_server = 3 || global.gamemode_server = 4)
			{
				if returned_id = selected_p3
				{
					if image_alpha <= -10
					{
					player3_exists = 0
					}
					else
					{
					global.matched_pl3 = selected_p3;
					global.matched_pl3_name = name;
					}
				}
				
				if returned_id = selected_p4
				{
					if image_alpha <= -10
					{
					player4_exists = 0
					}
					else
					{
					global.matched_pl4 = selected_p4;
					global.matched_pl4_name = name;
					}
				}
			}
		}
	}
	
	if (global.gamemode_server = 3 || global.gamemode_server = 4)
	{
		if (global.matched_pl1 = -4 || global.matched_pl2 = -4 || global.matched_pl3 = -4 || global.matched_pl4 = -4)
		{
		player1_exists = 0
		player2_exists = 0
		player3_exists = 0
		player4_exists = 0
		}
	}
	else
	{
		if global.matched_pl1 = -4 || global.matched_pl2 = -4
		{
		player1_exists = 0
		player2_exists = 0
		}
	}
	
	
	//두 플레이어 둘다 존재하는 경우
	if (player1_exists = 1 && player2_exists = 1 && player3_exists = 1 && player4_exists = 1)
	{
	global.t_b_alpha = 2.01
	global.matching = 3
	
	for(var i = -6; i <= 6; i++)
	{
	var random_cre = percentage_k(60-(instance_number(obj_andience1)+instance_number(obj_andience11)+instance_number(obj_andience111))*5)
		if random_cre = 1
		{
		instance_create_depth(obj_floor.x+64*i,903-48,obj_floor.depth-1,choose(obj_andience1,obj_andience11,obj_andience111))
		}
	}
		
	buffer_seek(matching_buffer, buffer_seek_start, 0);
	buffer_write(matching_buffer, buffer_u8, DATA.MATCH_START);
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl1));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl2));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl1_name));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl2_name));
	
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl3));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl4));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl3_name));
	buffer_write(matching_buffer, buffer_string, string(global.matched_pl4_name));
	send_all(matching_buffer);
	
	repeat_matching = 0
	}
}


