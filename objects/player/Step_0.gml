


if boss_alpha > 0
{
boss_alpha += (-0.01 - boss_alpha)*0.1
}

	if global.gamemode_server != 4
	{
	image_blend = c_white
	}
	else
	{
		if global.matched_pl1 = returned_id
		{
		image_blend = c_gray
		boss_alpha_time ++
			if boss_alpha_time > 65
			{
			boss_alpha_time = 0
			boss_alpha = 1
			}
		}
		else
		{
		image_blend = c_white
		}
	}

if sprite_index != move_sprite && sprite_index != jump_sprite && sprite_index != spin_sprite
{
attacked_before = 1
}
else
{
	if sprite_index != hurt_sprite
	{
	attacked_before = 0
	}
}

if hp > 0
{
already_droped_saber = 0
}

if n_sword_ != -1
{
	if image_alpha > 0 && hp <= 0 && attacked_before = 1 && already_droped_saber = 0
	{
	var _d_saber = instance_create_depth(x,y,depth-1,droped_saber)
		if n_sword_ = 0
		{
		_d_saber.image_index = 0
		var _d_saber = instance_create_depth(x,y,depth-1,droped_saber)
		_d_saber.image_index = 2
		}
		if n_sword_ = 1
		{
		_d_saber.image_index = 4
		}
		if n_sword_ = 2
		{
		_d_saber.image_index = 0
		}
	already_droped_saber = 1
	}
}


if (global.nickname == name) && just_come_check = 0
{
	if hurt = 0
	{
	global.m_hp += (global.hp - global.m_hp)*0.1
	}


	if place_meeting(x,y,sword_attack_parents)
	{
		if sprite_index != move_sprite && sprite_index != spin_sprite && sprite_index != jump_sprite && sprite_index != attack_laser_sprite && sprite_index != attack_laser_sprite_sec && sprite_index != cancled_sprite && sprite_index != guard_sprite
		{
			if image_index > 4.5
			{
			cancled_attack = 1
			}
		}
	}
	
	if cancled_attack > 0
	{
	sprite_index = cancled_sprite
	cancled_attack += 0.24
	guarding = 1
	image_index = cancled_attack
	
		if cancled_attack > 5
		{
		cancled_attack = 0
		sprite_index = move_sprite
		}
	}
	
	
	
	if image_alpha > 0
	{
		if global.rage_gauge = 100
		{
		cre_buble_ef(x+irandom_range(-16,16),y+irandom_range(-16,16),$FF6D52F2,$FF1C1CB2,irandom_range(-10,-30)/10,irandom_range(-8,-8)/10,0.1,0.1,0,0,1,1,1)
		}
		else
		{
			if image_blend = c_gray
			{
			cre_buble_ef(x+irandom_range(-16,16),y+irandom_range(-16,16),c_gray,c_black,irandom_range(-10,-30)/10,irandom_range(-8,-8)/10,0.1,0.1,0,0,1,1,1)
			}
			else
			{
				if keep_winning_ >= 2 && keep_winning_ < 5
				{
				cre_buble_ef(x+irandom_range(-16,16),y+irandom_range(-16,16),$FF7F9924,$FFDEFF23,irandom_range(-10,-30)/10,irandom_range(-8,-8)/10,0.1,0.1,0,0,1,1,1)
				}
	
				if keep_winning_ >= 5
				{
				cre_buble_ef(x+irandom_range(-16,16),y+irandom_range(-16,16),$FF994A81,$FFE47BFF,irandom_range(-10,-30)/10,irandom_range(-8,-8)/10,0.1,0.1,0,0,1,1,1)
				}
			}
		}
	}
	
	
	if ping > 50
	{
	dev_mes("연결 상태가 매우 불안정합니다")
	ping_kick_timer ++
		if ping_kick_timer > 80
		{
		
		ping_kick_timer = 0
		}
	}
	else
	{
	ping_kick_timer = 0
	}
	
	
	if global.hp <= 150
	{
	hp_r_alpha_timer ++
		if hp_r_alpha_timer > 50
		{
		global.r_hp_alpha = 1
		hp_r_alpha_timer = 0
		}
	}
	
	
n_sword_ = global.n_sword
	if show_my_sword > 0
	{
	show_my_sword -= 0.1
	}
	else
	{
		if draw_my_name < 1
		{
		draw_my_name += 0.1
		}
	}
	
returned_id = global.return_player_id;

	if abs(global.wind_dir) >= 23
	{
		if !place_meeting(x+3*sign(movement_speed_wind)+movement_speed_wind,y-0.5,obj_floor) && global.never_move = 0
		{
		x += movement_speed_wind*0.75
		}
	movement_speed_wind += (2.5*(global.wind_dir/23) - movement_speed_wind)*0.05
	}
	
	if global.hp <= 0
	{
	hurt = 2
	}


	if global.show_challenger > 0
	{
	show_first_action ++
	
		if show_first_action >= 0 && show_first_action <= 1
		{
		obj_camera.x = obj_floor.x-350
		obj_camera.y = 903
		}
		
		if show_first_action >= 1 && show_first_action <= 120
		{
		obj_camera.v_x = 1280*0.5
		obj_camera.v_y = 720*0.5
		
		obj_camera.x += (obj_floor.x-100 - obj_camera.x)*0.01
		}
		
		if show_first_action >= 120 && show_first_action <= 121
		{
		obj_camera.x = obj_floor.x+400
		obj_camera.y = 903
		}
		
		if show_first_action >= 121 && show_first_action <= 210
		{
		obj_camera.v_x = 1280*0.5
		obj_camera.v_y = 720*0.5
		
		obj_camera.x += (obj_floor.x+100 - obj_camera.x)*0.01
		}
		
		if show_first_action >= 211 && show_first_action <= 298
		{
		obj_camera.x = obj_floor.x
		obj_camera.y = 903
		obj_camera.v_x += (1280*0.65 - obj_camera.v_x)*0.05
		obj_camera.v_y += (720*0.65 - obj_camera.v_y)*0.05
		}
	
		if x > obj_floor.x
		{
		image_index = 0
		image_xscale = abs(image_xscale)
		}
		
		if x < obj_floor.x
		{
		image_index = 0
		image_xscale = -abs(image_xscale)
		show_debug_message("b")
		}
		
		
		if show_first_action > 80
		{
			if cancled_attack = 0 && abs(obj_camera.x - x) < 64
			{
				if sprite_index != guard_sprite
				{
				global.w_alpha = 1.1
				w_alpha = 1.1
			
					if global.n_sword != -1
					{
					sfx_for_multiplayer(choose(swing_lightsaber_sfx1,swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
					sfx_for_multiplayer(sparking_sound,0,0.1)
					}
				}
			sprite_index = guard_sprite
			}
		}
		else
		{
			if cancled_attack = 0
			{
			sprite_index = move_sprite
			}
		}
	}
	else
	{
	show_first_action = 0
	}


	if sprite_index = move_sprite
	{
		if floor(image_index) = 3 || floor(image_index) = 9
		{
			if footstep_sound_played = 0
			{
			footstep_sound_played = 1
			
			sfx_for_multiplayer(footstep_sfx,0,0.2)
		
			var _get_msp = abs(floor(movement_speed))
				if charge_attack <= 0
				{
					repeat(irandom_range(2,_get_msp))
					{
					randomize()
					var dust = instance_create_depth(x+irandom_range(-1,1),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
					dust.image_xscale = 0.1
					dust.image_yscale = 0.1
					dust.vspeed = -irandom_range(100,200)/200
					dust.hspeed = -movement_speed*irandom_range(10,50)/50
					dust.image_alpha = 0.4
					}
				}
			}
		}
		else
		{
		footstep_sound_played = 0
		}
	}
	
	
	
	
	
w_alpha += (-0.01 - w_alpha)*0.1
	if global.matching = 2
	{
	global.never_move = 1
	global.hp = 1000;
	hurt = 1;
	gravity = 0;
	vspeed = 0;
	movement_speed = 0;
	global.movement_speed = 0;
	x = obj_camera.x;
	y = obj_camera.y;
	image_alpha = 0
	}
	else
	{
	image_alpha = 1
	}
	
	if image_alpha != 0
	{
		if global.hp <= 0 && global.matching > 0 && global.slow_motion = 0 && global.never_move = 0
		{
			if hurt = 0
			{
			hurt = 1
			}
			else
			{
			hurt = 10
			}
		global.never_move = 1
		
			if global.gamemode_server != 4
			{
			randomize()
			repeat(irandom_range(8,12))
			{
			var _fl_blood = instance_create_depth(x,y,depth,blood_gravity)
			_fl_blood.hspeed = -(image_xscale*irandom_range(10,65)/10)
			_fl_blood.vspeed = -irandom_range(10,65)/10
			_fl_blood.sprite_index = sprite64
			if global.blood_effect > 0
			{
			_fl_blood.sprite_index = sprite64
			}
			}
		
			sfx_for_multiplayer(choose(wakgood_hurt,wakgood_hurt2,gumseong_woowakgood,kiyahou),0,0.2)

			buffer_seek(match_buffer, buffer_seek_start, 0);
			buffer_write(match_buffer, buffer_u8, code.DATA.SLOW_MOTION);
			send_all(match_buffer);
	
				if code.is_server = true
				{
				code.alarm[1] = 180
				global.slow_motion = 1;
				global.w_alpha = 1;
				room_speed = 15;
				global.never_move = 1
				var a___ = audio_play_sound(last_scene,0,0)
				audio_sound_gain(a___,0.7*global.master_volume*2*global.sfx_volume,0)
				}
			}
			else
			{
			var all_knockdown = 0
				with(player)
				{
					if global.matched_pl1 = playerID
					{
						if hp <= 0
						{
						randomize()
						repeat(irandom_range(8,12))
						{
						var _fl_blood = instance_create_depth(x,y,depth,blood_gravity)
						_fl_blood.hspeed = -(image_xscale*irandom_range(10,65)/10)
						_fl_blood.vspeed = -irandom_range(10,65)/10
						_fl_blood.sprite_index = sprite64
						if global.blood_effect > 0
						{
						_fl_blood.sprite_index = sprite64
						}
						}
						
						sfx_for_multiplayer(choose(wakgood_hurt,wakgood_hurt2,gumseong_woowakgood,kiyahou),0,0.2)
			
						buffer_seek(match_buffer, buffer_seek_start, 0);
						buffer_write(match_buffer, buffer_u8, code.DATA.SLOW_MOTION);
						send_all(match_buffer);
						}
					}
					else
					{
						if global.matched_pl2 = playerID || global.matched_pl3 = playerID || global.matched_pl4 = playerID
						{
							if hp <= 0
							{
							all_knockdown ++
							}
						}
					}
				}
				
				if all_knockdown >= 3
				{
				randomize()
				repeat(irandom_range(8,12))
				{
				var _fl_blood = instance_create_depth(x,y,depth,blood_gravity)
				_fl_blood.hspeed = -(image_xscale*irandom_range(10,65)/10)
				_fl_blood.vspeed = -irandom_range(10,65)/10
				_fl_blood.sprite_index = sprite64
				if global.blood_effect > 0
				{
				_fl_blood.sprite_index = sprite64
				}
				}
				
				sfx_for_multiplayer(choose(wakgood_hurt,wakgood_hurt2,gumseong_woowakgood,kiyahou),0,0.2)
				
				buffer_seek(match_buffer, buffer_seek_start, 0);
				buffer_write(match_buffer, buffer_u8, code.DATA.SLOW_MOTION);
				send_all(match_buffer);
				}
			}
		}
	
	if guard_cool_time > 0
	{
	guard_cool_time --
		if guard_cool_time <= 0
		{
		guard_cool_time = 0
		}
	}

	if hurt_cooltime > 0
	{
	hurt_cooltime --
		if hurt_cooltime <= 0
		{
		hurt_cooltime = 0
		}
	}

	
	if hurt_little > 0
	{
	cannot_move = 1
		if !place_meeting(x,y+5,obj_floor)
		{
		hurt = 1
		hurt_little = 0
		}
	
		if hurt = 0
		{
		image_index = 0
		}
		
	if cancled_attack = 0
	{
	sprite_index = hurt_sprite
	}
	
	hurt_little ++
		if hurt_little >= 45
		{
		cannot_move = 0
		
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
		hurt_little = 0
		}
	}
	
	if w_alpha < 0.3 && hurt <= 25 && (dash_attack = 0 || dash_attack > 8) && global.hp > 0
	{
	var guarding_now = 0
		
		if place_meeting(x,y,beatsaber_block_attacked) && spin = 0
		{
		var _placed_obj = instance_place(x,y,beatsaber_block_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
		
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 10 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 9
		
				if guard_cool_time = 0
				{
					if global.gamemode_server = 2
					{
					movement_speed = image_xscale*16
					}
					else
					{
					movement_speed = image_xscale*4
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 6
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			_placed_obj.des = 1
			instance_destroy(_placed_obj)
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 8
				if global.gamemode_server = 2
				{
				movement_speed = check_guard*16
				}
				else
				{
				movement_speed = check_guard*4
				}
				hp_minus_for_player(32,_placed_obj)
				
			
				
					if !place_meeting(x,y+3,obj_floor)
					{
					y -= 1
					}
				vspeed = -4
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			instance_destroy(_placed_obj)
			}
		}
		
		if place_meeting(x,y,charging_attack_attacked) && spin = 0
		{
		var _placed_obj = instance_place(x,y,charging_attack_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 10 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 9
		
				if guard_cool_time = 0
				{
					if global.gamemode_server = 2
					{
					movement_speed = image_xscale*24
					}
					else
					{
					movement_speed = image_xscale*6
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 6
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 8
				if global.gamemode_server = 2
				{
				movement_speed = check_guard*24
				}
				else
				{
				movement_speed = check_guard*6
				}
				hp_minus_for_player(62,_placed_obj)
				
			
				
					if !place_meeting(x,y+3,obj_floor)
					{
					y -= 1
					}
				vspeed = -4
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,rage_mode_knockback_attacked)
		{
		
		var _placed_obj = instance_place(x,y,rage_mode_knockback_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
			if hurt_cooltime = 0
			{
			hurt = 1
			hurt_cooltime = 10
			movement_speed = check_guard*5
			
				if !place_meeting(x,y+3,obj_floor)
				{
				y -= 1
				}
			vspeed = -4
			sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
			}
		}
		
		if place_meeting(x,y,effect_sting_attacked)
		{
		var _placed_obj = instance_place(x,y,effect_sting_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 4 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 3
		
				if guard_cool_time = 0
				{
					if charge_attack = 0
					{
					movement_speed = _placed_obj.image_angle
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 6
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				global.rage_gauge -= 2
				hurt = 1
				hurt_cooltime = 32
				movement_speed = _placed_obj.image_angle
				hp_minus_for_player(58,_placed_obj)
				
				
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*(-check_guard)
					_ef.vspeed = irandom_range(-4,2)
					}
				
					if !place_meeting(x,y+3,obj_floor)
					{
					y -= 1
					}
				vspeed = -2.5
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		

		if place_meeting(x,y,effect_quake_attacked)
		{
		
		var _placed_obj = instance_place(x,y,effect_quake_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 2.8 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 1.8
		
				if guard_cool_time = 0
				{
					if charge_attack = 0
					{
					movement_speed = image_xscale*6
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 6
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				global.rage_gauge -= 2
				hurt = 1
				hurt_cooltime = 8
				movement_speed = check_guard
				hp_minus_for_player(10,_placed_obj)
				
				
					if !place_meeting(x,y+3,obj_floor)
					{
					y -= 1
					}
				vspeed = -4
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}

		if place_meeting(x,y,effect_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 2.8 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 1.8
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale*2.2
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 7
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 10
				movement_speed = check_guard
				hp_minus_for_player(27,_placed_obj)
				
				
					if !place_meeting(x,y+3,obj_floor)
					{
					y -= 1
					vspeed = -2
					}
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_jump_attack_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_jump_attack_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.8 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.8
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale*0.5
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 5
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 5
				movement_speed = check_guard*0.5
				hp_minus_for_player(21,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed = -4.1
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_down_attack_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_down_attack_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.7 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.7
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale*1.8
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 3
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 3
				movement_speed = check_guard*0.2
				hp_minus_for_player(18,_placed_obj)
				

				gravity = 0.36
				vspeed += 4
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_attack1_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_attack1_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.6 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.6
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale*2
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 13
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 13
				movement_speed = check_guard*0.8
				hp_minus_for_player(16,_placed_obj)
				
				
					if !place_meeting(x,y+1,obj_floor)
					{
					vspeed = 4.3
					}
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_attack2_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_attack2_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.7 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.7
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 10
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 10
				movement_speed = check_guard*0.8
				hp_minus_for_player(19,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed = -1
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_attack3_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,effect_attack3_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 2.3 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 1.3
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 10
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 10
				movement_speed = check_guard*2
				hp_minus_for_player(26,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed = -4.1
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,ef_blood_dash_attack_attacked) && spin = 0
		{
		
		var _placed_obj = instance_place(x,y,ef_blood_dash_attack_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 8 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 7
		
				if guard_cool_time = 0
				{
				movement_speed = image_xscale*2.5
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 15
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 4
				}
				else
				{
				global.rage_gauge += 2
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				hurt = 1
				hurt_cooltime = 15
				movement_speed = check_guard*2.5
				hp_minus_for_player(92,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed = -1
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		if place_meeting(x,y,effect_special_skill_attacked)
		{
		
		var _placed_obj = instance_place(x,y,effect_special_skill_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.3 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.3
		
				if guard_cool_time = 0
				{
					if charge_attack <= 0
					{
					movement_speed = image_xscale
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 1
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 2
				}
				else
				{
				global.rage_gauge += 1
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				global.rage_gauge --
				hurt = 1
				hurt_cooltime = 3
				movement_speed = -check_guard
				hp_minus_for_player(32,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed -= 1
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
		
		
		if place_meeting(x,y,effect_special_skill_sec_attacked)
		{
		
		var _placed_obj = instance_place(x,y,effect_special_skill_sec_attacked)
		var guarding_now = 0
		var check_guard = sign(x - _placed_obj.x)
			
		if check_guard = 0
		{
		check_guard = choose(-1,1)
		}
				
			if guarding > 0 && global.stemina >= 1.3 && check_guard = sign(image_xscale)
			{
			guarding_now = 1
			}
				
			if guarding_now = 1 || charge_attack > 0
			{
			global.stemina -= 0.3
		
				if guard_cool_time = 0
				{
					if charge_attack <= 0
					{
					movement_speed = image_xscale*4
					}
				guarding = 2.5
				w_alpha = 1
				guard_cool_time = 1
				sfx_for_multiplayer(guard,0,0.1)
	
				var random_dir = -image_xscale
				if global.gamemode_server = 2
				{
				global.rage_gauge += 2
				}
				else
				{
				global.rage_gauge += 1
				}
					repeat(8)
					{
					var _ef = instance_create_depth(x-image_xscale*4,y+irandom_range(-13,0),depth-1,effect_spark)
					_ef.hspeed = irandom_range(5,20)*random_dir
					_ef.vspeed = irandom_range(-4,2)
					}
				}
			}
			else
			{
				if hurt_cooltime = 0
				{
				global.rage_gauge --
				hurt = 1
				hurt_cooltime = 3
				movement_speed = check_guard*4.3
				hp_minus_for_player(22,_placed_obj)
				
				
					if place_meeting(x,y+1,obj_floor)
					{
					y -= 1
					}
				vspeed -= 0.6
				sfx_for_multiplayer(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0.2)
				}
			}
		}
	}
			
				
	
	
	
	
	if keyboard_check_pressed(vk_space) && global.chat_activity = false && global.matching != 3
	{
		if global.never_move = 0 && place_meeting(x,y+1,obj_floor)
		{
			if jump = 0 && cannot_move = 0 && cooltime = 0
			{
			sfx_for_multiplayer(jump_sfx,0,0.6)
	
				repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
				{
				randomize()
				var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
				dust.image_xscale = 0.13
				dust.image_yscale = 0.13
				dust.vspeed = -irandom_range(100,200)/200
				dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
				dust.image_alpha = 0.4
				}
	
			vspeed = -6
			jump = 0
			jump_end_motion = 0
			b_movement_speed = 0
			global.stemina_cooltime = 0
			y -= 1.2
			jump = 1
	
			if image_xscale < 0 && global.movement_speed > 0
			{
			global.movement_speed = abs(global.movement_speed)
			}
			if image_xscale > 0 && global.movement_speed < 0
			{
			global.movement_speed = -abs(global.movement_speed)
			}

			b_movement_speed = global.movement_speed
			cannot_move = 1
			}
		}
	}
	
	
	if keyboard_check_pressed(vk_down) && global.chat_activity = false && global.matching != 3 && attack_ = 0
	{
		if global.never_move = 0
		{
			if place_meeting(x,y+2,obj_floor)
			{
				if spin = 0 && cannot_move = 0 && cooltime = 0 && down_attack = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0 && abs(global.movement_speed) > 1
				{
				spin = 1
				cannot_move = 1
				cooltime = 1
				global.stemina_cooltime = 0
					repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
					{
					randomize()
					var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
					dust.image_xscale = 0.13
					dust.image_yscale = 0.13
					dust.vspeed = -irandom_range(100,200)/200
					dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
					dust.image_alpha = 0.4
					}
				}
		
				if spin = 0 && jump > 0 && down_attack = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0
				{
				spin = 1
				cannot_move = 1
				cooltime = 1
				global.stemina_cooltime = 0
					repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
					{
					randomize()
					var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
					dust.image_xscale = 0.13
					dust.image_yscale = 0.13
					dust.vspeed = -irandom_range(100,200)/200
					dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
					dust.image_alpha = 0.4
					}
			
					var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
					var sprite = asset_get_index(string(sprite_get_name(string(spin_sprite)))+"_white")
					if sprite_exists(sprite)
					{
					ef.sprite_index = sprite
					}
					else
					{
					ef.sprite_index = spin_sprite
					}
					ef.image_index = 0
					ef.image_xscale = image_xscale
					ef.image_yscale = image_yscale
					ef.image_alpha = 0.2*image_alpha
					ef.image_angle = image_angle
				}
			}
		}
	}
	
	if global.cannot_use_stemina = 0
	{
		if (player.sprite_index = player.move_sprite || player.sprite_index = player.attack_sprite)
		{
		global.stemina_cooltime += 5
		}

		if global.stemina_cooltime > 70
		{
		global.stemina += 0.04
		}

		if global.stemina > 11
		{
		global.stemina = 11
		}
	}
	else
	{
	global.stemina = 0
	}
	
	
	if gravity = 0
	{
	movement_speed += (0 - movement_speed)*0.032
		if global.rainy = 0
		{
		movement_speed += (0 - movement_speed)*0.01
		}
	
		if abs(movement_speed) > 2
		{
		movement_speed += (0 - movement_speed)*0.02
		}
		
		if abs(movement_speed) <= 0.05
		{
		movement_speed = 0
		}
		
			if gravity = 0
			{
			can_cre_effect ++
				if can_cre_effect > 1
				{
					repeat(abs(floor(movement_speed)))
					{ 
					randomize()
					var dust = instance_create_depth(x+irandom_range(-8,8)-movement_speed*0.5,y+28+irandom_range(-2,2),depth+1,pepsi_effect)
					dust.image_xscale = 0.13
					dust.image_yscale = 0.13
					dust.vspeed = -irandom_range(100,200)/200
					dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
					dust.image_alpha = 0.4
					}
				can_cre_effect = 0
				}
			}
		
		
		if abs(movement_speed) <= 0.5
		{
		movement_speed = 0
		}
	attack_in_air_cool = 0
	}
	else
	{
	movement_speed += (0 - movement_speed)*0.01
	}
	
	if !place_meeting(x-image_xscale*32,y,obj_floor)
	{
	x += movement_speed
	}
	
	if abs(movement_speed) < 0.1
	{
	movement_speed = 0
	}
	
	if hurt > 0
	{
	cannot_move = 1
	
	if cancled_attack = 0
	{
	sprite_index = hurt_sprite
	}

	if dash_attack = 0
	{
	global.movement_speed += (0 - global.movement_speed)*0.1
	}

		if place_meeting(x,y+1,obj_floor)
		{
		image_index = 1
	
			if hurt = 1
			{
			sfx_for_multiplayer(down_attack_sfx,0,0.15)

		
			var random_val = choose(0,0,0,1)
				if random_val = 1
				{
					if global.voice_option = 0
					{
					var a_s = choose(2,1,0)
						if a_s = 1
						{
						sfx_for_multiplayer(choose(jyunne_a_i_upne,i_am_sorry,wait_plz),0,0.25)
						}
					}
				}
			}
	
		hurt++
		
			if global.awakening > 1
			{
			hurt += 0.5
			}
		}
		else
		{
		image_index = 0
		hurt = 1
		}
	
		if hurt > 45 && global.slow_motion = 0
		{
		hurt = 0
		cannot_move = 0
		w_alpha = 2
			if global.show_challenger = 0
			{
				if cancled_attack = 0
				{
				sprite_index = move_sprite
				}
			}
		}
	}
	
	if global.matching != 1
	{
		if y > room_height || global.hp <= 0
		{
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-32,32),y+irandom_range(-32,32),depth-1,pepsi_effect)
			var scale = irandom_range(20,40)/50
			dust.image_xscale = scale
			dust.image_yscale = scale
			dust.vspeed = irandom_range(-50,50)/37
			dust.hspeed = irandom_range(-50,50)/37
			dust.image_alpha = 1
			}
			
		y = 903
		x = 2040+irandom_range(-200,200)
		
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-32,32),y+irandom_range(-32,32),depth-1,pepsi_effect)
			var scale = irandom_range(20,40)/50
			dust.image_xscale = scale
			dust.image_yscale = scale
			dust.vspeed = irandom_range(-50,50)/37
			dust.hspeed = irandom_range(-50,50)/37
			dust.image_alpha = 1
			}
	
		sfx_for_multiplayer(mob_faint,0,0.1)


		movement_speed += (0 - movement_speed)*0.1
		global.hp = 1000
		}
	}
	
	if global.matching = 1
	{
		if y > room_height && fallen = 0
		{
		movement_speed = 0
		global.movement_speed = 0
		fallen = 1
		global.hp = 0
		}
		
		if global.hp > 0 && y < room_height
		{
		fallen = 0
		}
	}
	


	if w_alpha > 0.05 && guarding > 0
	{
	if keyboard_check_pressed(ord(string(global.a_key))) && fast_guarding > 0 && global.chat_activity = false && global.matching != 3
	{
	fast_guarding = 0
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(guard_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = guard_sprite
		}
		ef.image_index = 2
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}		
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_down) && global.chat_activity = false && global.matching != 3
	{
		if place_meeting(x,y+2,obj_floor) && hurt = 0 && hurt_little = 0
		{
		skill_combo = 0
		fast_guarding = 0
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
		image_index = 0
		cooltime = 0
		cannot_move = 0

		down_attack = 0
		spin = 1
		cannot_move = 1
		cooltime = 1
		global.stemina_cooltime = 0
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
			dust.image_xscale = 0.13
			dust.image_yscale = 0.13
			dust.vspeed = -irandom_range(100,200)/200
			dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
			dust.image_alpha = 0.4
			}

			

			repeat(3)
			{
			var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
			var sprite = asset_get_index(string(sprite_get_name(string(guard_sprite)))+"_white")
			if sprite_exists(sprite)
			{
			ef.sprite_index = sprite
			}
			else
			{
			ef.sprite_index = guard_sprite
			}
			ef.image_index = 2
			ef.image_xscale = image_xscale
			ef.image_yscale = image_yscale
			ef.image_alpha = 0.2*image_alpha
			ef.image_angle = image_angle
			}	
		}
	}
}

if (attack_ > 4 && attack_ <= 5) || (attack_ > 6.5 && attack_ <= 9) || (attack_ >= 12)
{
	if global.skill_jump_attack > 0 && global.stemina > 2.5 && keyboard_check_pressed(ord(string(global.w_key))) && attack_ >= 12 && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		if attack_ > 4 && attack_ <= 5
		{
		ef.image_index = 3
		}
		if attack_ > 6.5 && attack_ <= 9
		{
		ef.image_index = 8
		}
		if attack_ >= 12
		{
		ef.image_index = 13
		}
		
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if global.skill_turning_attack > 0 && global.stemina > 3.8 && keyboard_check_pressed(ord(string(global.q_key))) && attack_ >= 12 && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		if attack_ > 4 && attack_ <= 5
		{
		ef.image_index = 3
		}
		if attack_ > 6.5 && attack_ <= 9
		{
		ef.image_index = 8
		}
		if attack_ >= 12
		{
		ef.image_index = 13
		}
		
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}

	if keyboard_check_pressed(vk_up) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		if attack_ > 4 && attack_ <= 5
		{
		ef.image_index = 3
		}
		if attack_ > 6.5 && attack_ <= 9
		{
		ef.image_index = 8
		}
		if attack_ >= 12
		{
		ef.image_index = 13
		}
		
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_down) && global.chat_activity = false && global.matching != 3
	{
		if place_meeting(x,y+2,obj_floor) && hurt = 0 && hurt_little = 0
		{
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
		image_index = 0
		cooltime = 0
		cannot_move = 0

		down_attack = 0
		spin = 1
		cannot_move = 1
		cooltime = 1
		global.stemina_cooltime = 0
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
			dust.image_xscale = 0.13
			dust.image_yscale = 0.13
			dust.vspeed = -irandom_range(100,200)/200
			dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
			dust.image_alpha = 0.4
			}

			

			repeat(3)
			{
			var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
			var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
			if sprite_exists(sprite)
			{
			ef.sprite_index = sprite
			}
			else
			{
			ef.sprite_index = attack_sprite
			}
			if attack_ > 4 && attack_ <= 5
			{
			ef.image_index = 3
			}
			if attack_ > 6.5 && attack_ <= 9
			{
			ef.image_index = 8
			}
			if attack_ >= 12
			{
			ef.image_index = 13
			}
		
			ef.image_xscale = image_xscale
			ef.image_yscale = image_yscale
			ef.image_alpha = 0.2*image_alpha
			ef.image_angle = image_angle
			}
		}
	}
}


if down_attack > 13
{
	if global.skill_jump_attack > 0 && global.stemina > 2.5 && keyboard_check_pressed(ord(string(global.w_key))) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(down_attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = down_attack_sprite
		}
		ef.image_index = 4
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if global.skill_turning_attack > 0 && global.stemina > 3.8 && keyboard_check_pressed(ord(string(global.q_key))) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		ef.image_index = 6
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_up) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		ef.image_index = 6
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_down) && global.chat_activity = false && global.matching != 3
	{
		if place_meeting(x,y+2,obj_floor) && hurt = 0 && hurt_little = 0
		{
		cooltime = 0
		down_attack_motion_dilay = 0
		down_attack_gravity = 0
		down_attack_sfx_on = 0
		down_attack_plusing = 0
		down_attack = 0
		cannot_move = 0
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
		image_index = 0
		y -= 1

		spin = 1
		cannot_move = 1
		cooltime = 1
		global.stemina_cooltime = 0
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
			dust.image_xscale = 0.13
			dust.image_yscale = 0.13
			dust.vspeed = -irandom_range(100,200)/200
			dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
			dust.image_alpha = 0.4
			}
			

			repeat(3)
			{
			var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
			var sprite = asset_get_index(string(sprite_get_name(string(down_attack_sprite)))+"_white")
			if sprite_exists(sprite)
			{
			ef.sprite_index = sprite
			}
			else
			{
			ef.sprite_index = down_attack_sprite
			}
			ef.image_index = 4
			ef.image_xscale = image_xscale
			ef.image_yscale = image_yscale
			ef.image_alpha = 0.2*image_alpha
			ef.image_angle = image_angle
			}
		}
	}
}


if dash_attack >= 4.6
{
	if global.skill_jump_attack > 0 && global.stemina > 2.5 && keyboard_check_pressed(ord(string(global.w_key))) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(pl_move_skeleton_rush_slice)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = pl_move_skeleton_rush_slice
		}
		ef.image_index = 9
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_up) && global.chat_activity = false && global.matching != 3
	{
		repeat(3)
		{
		var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
		var sprite = asset_get_index(string(sprite_get_name(string(attack_sprite)))+"_white")
		if sprite_exists(sprite)
		{
		ef.sprite_index = sprite
		}
		else
		{
		ef.sprite_index = attack_sprite
		}
		if attack_ > 4 && attack_ <= 5
		{
		ef.image_index = 2
		}
		if attack_ > 6.5 && attack_ <= 9
		{
		ef.image_index = 7
		}
		if attack_ >= 12
		{
		ef.image_index = 12
		}
		
		ef.image_xscale = image_xscale
		ef.image_yscale = image_yscale
		ef.image_alpha = 0.2*image_alpha
		ef.image_angle = image_angle
		}
	
	skill_combo = 20
	}
	
	if keyboard_check_pressed(vk_down) && global.chat_activity = false && global.matching != 3
	{
		if place_meeting(x,y+2,obj_floor) && hurt = 0 && hurt_little = 0
		{
		dash_attack = 0
		double_pressed_left = 0
		double_pressed_right = 0
		cannot_move = 0
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
		image_index = 0

		spin = 1
		cannot_move = 1
		cooltime = 1
		global.stemina_cooltime = 0
			repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
			{
			randomize()
			var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
			dust.image_xscale = 0.13
			dust.image_yscale = 0.13
			dust.vspeed = -irandom_range(100,200)/200
			dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
			dust.image_alpha = 0.4
			}


			repeat(3)
			{
			var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
			var sprite = asset_get_index(string(sprite_get_name(string(pl_move_skeleton_rush_slice)))+"_white")
			if sprite_exists(sprite)
			{
			ef.sprite_index = sprite
			}
			else
			{
			ef.sprite_index = pl_move_skeleton_rush_slice
			}
			ef.image_index = 9
			ef.image_xscale = image_xscale
			ef.image_yscale = image_yscale
			ef.image_alpha = 0.2*image_alpha
			ef.image_angle = image_angle
			}
		}
	}
	
	
	if keyboard_check_pressed(vk_space) && global.chat_activity = false && global.matching != 3
	{
		if global.nickname != "썩은물" && global.nickname != "씹찐따"
		{
			if global.never_move = 0 && hurt = 0 && hurt_little = 0
			{
				if place_meeting(x,y+1,obj_floor)
				{
					repeat(3)
					{
					var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef)
					var sprite = asset_get_index(string(sprite_get_name(string(pl_move_skeleton_rush_slice)))+"_white")
					if sprite_exists(sprite)
					{
					ef.sprite_index = sprite
					}
					else
					{
					ef.sprite_index = pl_move_skeleton_rush_slice
					}
					ef.image_index = 9
					ef.image_xscale = image_xscale
					ef.image_yscale = image_yscale
					ef.image_alpha = 0.2*image_alpha
					ef.image_angle = image_angle
					}
					
				dash_attack = 0
				double_pressed_left = 0
				double_pressed_right = 0
				cannot_move = 0
				if cancled_attack = 0
				{
				sprite_index = move_sprite
				}
				image_index = 0
		
				sfx_for_multiplayer(jump_sfx,0,0.6)

	
					repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
					{
					randomize()
					var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
					dust.image_xscale = 0.13
					dust.image_yscale = 0.13
					dust.vspeed = -irandom_range(100,200)/200
					dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
					dust.image_alpha = 0.4
					}
	
				vspeed = -6
				jump_end_motion = 0
				global.stemina_cooltime = 0
				y -= 1.2
				jump = 1
	
				if image_xscale < 0 && global.movement_speed > 0
				{
				global.movement_speed = abs(global.movement_speed)
				}
				if image_xscale > 0 && global.movement_speed < 0
				{
				global.movement_speed = -abs(global.movement_speed)
				}

				cannot_move = 1
				}
			}
		}
	}
}

if skill_combo > 0
{
skill_combo --
}



/////////////////////////////////////////////////////////////////////////////////



if keyboard_check(vk_up) && hurt = 0 && hurt_little = 0 && global.chat_activity = false && global.matching != 3
{
	if (cannot_move = 0) && guarding <= 1
	{
		if guarding = -1
		{
		guarding = 1
		fast_guarding = 1
		alarm[11] = 40
		}
	}
	
	if guarding > 1
	{
	guarding -= 0.05
	}
}
else
{
	if guarding <= 0 && guarding != -1
	{
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
	cooltime = 0
	cannot_move = 0
	guarding = -1
	}
	
	if guarding > 0
	{
	guarding -= 0.05
	}
	
	if guarding > 1
	{
	guarding -= 0.1
	}
}

if guarding > 0
{
global.stemina_cooltime = 0
global.movement_speed += (0 - global.movement_speed)*0.1
double_pressed_left = 0
double_pressed_right = 0
cannot_move = 1

	if cancled_attack = 0
	{
	sprite_index = guard_sprite
	image_index = guarding
	}
}


if hurt > 0 || skill_combo >= 1 || cancled_attack > 0
{
	if sting_attack > 0
	{
	global.movement_speed *= 0.5
	movement_speed *= 0.5
	if cancled_attack = 0
	{
	image_index = 0
	}
	sting_attack = 0
	attack_sting_sfx = 0
	sting_attack_effect = 0
	gravity = 0
	vspeed = 0
	cannot_move = 0
	cooltime = 0
	}
	
	if charge_attack > 0
	{
	global.movement_speed = 0
	movement_speed *= 0.5
	attack_charge_sfx = 0
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		image_index = 0
		}
	cannot_move = 0
	cooltime = 0
	charge_attack = 0
	charge_attack_effect = 0
	}
	
	if attack_ > 0
	{
	attack_ = 0
	keep_attack = 0
	keep_attacking = 0
	attack_sfx_on = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
		if skill_combo = 0
		{
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		cooltime = 0
		cannot_move = 0
		}
	}
	
	if attack_in_air > 0
	{
	attack_in_air = 0
	attack_sfx_on = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
		if skill_combo = 0
		{
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		cooltime = 0
		cannot_move = 0
		}
	}
	
	if down_attack > 0
	{
		if skill_combo = 0
		{
		alarm[1] = 8
		}
		else
		{
		cooltime = 0
		}
		
	down_attack_motion_dilay = 0
	down_attack_gravity = 0
	down_attack_sfx_on = 0
	down_attack_plusing = 0
	down_attack = 0
	cannot_move = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
	y -= 1
	}
	
	if spin_attack > 0
	{
	spin_attack = 9999
	}
	
	if jump_attack > 0
	{
	jump_attack = 9999
	}
	
	if attack_laser > 0
	{
	attack_laser_sfx = 0
	down_attack_plusing = 0
	attack_laser = 0
	down_attack_with_rage_dis = 0
	cannot_move = 0
	cooltime = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
	global.never_move = 0
	}
	
	if attack_laser_sec > 0
	{
	attack_laser_sfx = 0
	down_attack_plusing = 0
	attack_laser_sec = 0
	down_attack_with_rage_dis = 0
	cannot_move = 0
	cooltime = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
	global.never_move = 0
	}
	
	if down_attack_with_rage > 0
	{
		if skill_combo = 0
		{
		alarm[1] = 8
		}
		else
		{
		cooltime = 0
		}
		
	down_attack_motion_dilay = 0
	down_attack_gravity = 0
	down_attack_sfx_on = 0
	down_attack_plusing = 0
	down_attack_with_rage = 0
	cannot_move = 0
	down_attack_with_rage_dis = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
	y -= 1
	}
	
	if dash_attack > 0
	{
	dash_attack = 0
	double_pressed_left = 0
	double_pressed_right = 0
	cannot_move = 0
	if cancled_attack = 0
	{
	sprite_index = move_sprite
	image_index = 0
	}
	}
	
	if skill_red_ball_effect != -1
	{
	instance_destroy(skill_red_ball_effect)
	skill_red_ball_effect = -1
	}
	
	if guarding > 0
	{
		if cancled_attack = 0
		{
		sprite_index = move_sprite
		}
	cooltime = 0
	cannot_move = 0
	guarding = -1
	paring = 1
	
		if fast_guarding > 0
		{
		w_alpha = 1
		global.stemina_cooltime = 999
		if cancled_attack = 0
		{
		image_index = 0
		}
		attack_in_air = 2.92
		attack_in_air_cool = 1
		cooltime = 1
		cannot_move = 1
		fast_guarding = 0
		}
	}
fast_guarding = 0
skill_combo = 0
}






if global.never_move = 0 && keyboard_check_pressed(ord(string(global.a_key))) && global.chat_activity = false && global.matching != 3
{
	if (attack_in_air < 7 && gravity > 0 && cooltime = 0 && hurt = 0 && hurt_little = 0 && attack_in_air_cool = 0 && (!place_meeting(x,y+38,obj_floor) || vspeed < 0)) && charge_attack <= 0
	{
		if cancled_attack = 0
		{
		image_index = 0
		}
	attack_in_air = 2.92
	attack_in_air_cool = 1
	cooltime = 1
	cannot_move = 1
	}
	
	if attack_ > 0 && jump = 0
	{
	keep_attack = 1
	alarm[2] = 14
	}
	
	if (double_pressed_left < 2 && double_pressed_right < 2)
	{
		if (attack_ < 7 && cannot_move = 0 && cooltime = 0 && hurt = 0 && hurt_little = 0) && (gravity <= 0 || attack_in_air_cool = 1)
		{
		global.stemina_cooltime = 0
		attack_ = 1
		cooltime = 1
		cannot_move = 1
		if global.movement_speed*2 > 5
		{
		global.movement_speed = global.movement_speed*2
		}
		else
		{
		global.movement_speed = 5*sign(global.movement_speed)
		}


		vspeed += 2
		}
	}
	else
	{
		if global.stemina >= 7.7
		{
			if gravity = 0 && charge_attack = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0
			{
			movement_speed = -image_xscale*13
			global.stemina -= 6.7
			global.stemina_cooltime = 0
			charge_attack = 1
			cannot_move = 1
			}
		}
		else
		{
		var sfx = audio_play_sound(cannot_buy,0,0)
		audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
		}
	}
}






var pressing = 0
if global.run_key != "Non" && keyboard_check_pressed(ord(string(global.run_key))) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}

if global.run_key = vk_shift && keyboard_check_pressed(string(global.run_key)) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}

if global.run_key = vk_up && keyboard_check_pressed(string(global.run_key)) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}



if global.never_move = 0 && global.run_key != "Non" && pressing = 1
{
double_pressed_right = 2
double_pressed_left = 2
}




var pressing = 0
if global.e_key != "Non" && keyboard_check(ord(string(global.e_key))) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}

if global.e_key = vk_shift && keyboard_check(string(global.e_key)) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}

if global.e_key = vk_up && keyboard_check(string(global.e_key)) && global.chat_activity = false && global.matching != 3
{
pressing = 1
}




if global.awakening = 0 && global.rage_gauge = 100 && pressing = 1 && global.never_move = 0
{
global.awakening += 0.05
global.stop_awakening = 0
}

if global.awakening > 0.1
{
	if global.voice_option = 0 && rage_mode_sfx = -1
	{
	rage_mode_sfx = audio_play_sound(ang___,0,0)
	audio_sound_gain(rage_mode_sfx,0.6*global.master_volume*2*global.sfx_volume,0)
	}
}



if global.awakening < 1 && pressing = 0
{
audio_stop_sound(rage_mode_sfx)
rage_mode_sfx = -1
global.awakening = 0
}





if global.never_move = 0 && keyboard_check_released(ord(string(global.e_key))) && w_alpha < 0.17 && global.chat_activity = false && global.matching != 3
{
	if check_d_press_e = 0
	{
		//if gravity = 0
		//{
		movement_speed += (0 - movement_speed)*0.04
	
				if abs(movement_speed) > 2
				{
				movement_speed += (0 - movement_speed)*0.02
				}
			
			if place_meeting(x,y+38,obj_floor) && gravity <= 0
			{
				if !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right) && attack_laser = 0 && global.chat_activity = false && global.matching != 3
				{
					if down_attack_with_rage = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0 && global.rage_gauge >= 27
					{
					vspeed = 0
					vspeed = -6
					y -= 1
					down_attack_with_rage = 1
					cooltime = 1
					cannot_move = 1
					jump = 0
					jump_end_motion = 0
					jump_vsp_up = 1
					cooltime = 1
					movement_speed = -image_xscale*8

					global.stemina_cooltime = 0
					global.rage_gauge -= 27
				

					var skill_red_ball_effect_rage = instance_create_depth(x,y,player.depth-1,red_circle_effect)
					skill_red_ball_effect_rage.image_xscale = 0.8
					skill_red_ball_effect_rage.image_yscale = 0.8
					skill_red_ball_effect_rage.t_scale = 0.8
					skill_red_ball_effect_rage.alarm[11] = 7

			
						if global.awakening >= 1
						{
						global.awakening -= 0.3
						}
			
					sfx_for_multiplayer(sound5,0,0.13)
				
				
			
					w_alpha = 1

					var __i = choose(-1,1)
					var bl_ef = instance_create_depth(x,y,depth-1,ef_blood)
					var img_scale = -__i*irandom_range(8,15)/5
					bl_ef.image_xscale = img_scale*0.5
					bl_ef.image_yscale = abs(img_scale)*0.5
					bl_ef.t_x = __i
					bl_ef.image_angle = irandom_range(-90,90)
			

				
					sfx_for_multiplayer(swing_lightsaber_sfx1,0,0.1)
					}
					else
					{
					var sfx = audio_play_sound(cannot_buy,0,0)
					audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
					}
				}
			
				if global.n_sword != -1 && keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right) && down_attack_with_rage = 0 && global.chat_activity = false && global.matching != 3
				{
					if attack_laser = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && hurt = 0 && hurt_little = 0 && global.rage_gauge >= 80
					{
					vspeed = 0
					y -= 1
					attack_laser = 1
					cooltime = 1
					cannot_move = 1
					jump = 0
					jump_end_motion = 0
					jump_vsp_up = 1
					cooltime = 1
					global.stemina_cooltime = 0
					global.rage_gauge -= 80
				
					if skill_red_ball_effect = -1
					{
					skill_red_ball_effect = instance_create_depth(x+10*image_xscale,y+15,player.depth-1,red_circle_effect)
					skill_red_ball_effect.image_xscale = 0.35
					skill_red_ball_effect.image_yscale = 0.35
					skill_red_ball_effect.t_scale = 0.35
					}

			
						if global.awakening >= 1
						{
						global.awakening -= 0.8
						}
			
					sfx_for_multiplayer(laser_skill_ready,0,0.15)
				
					if global.voice_option = 0
					{
					sfx_for_multiplayer(ready_swording,0,0.35)
					}

			
					sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
					}
					else
					{
					var sfx = audio_play_sound(cannot_buy,0,0)
					audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
					}
				}
			
			
				if !keyboard_check(vk_down) && (keyboard_check(vk_left) || keyboard_check(vk_right)) && down_attack_with_rage = 0 && global.chat_activity = false && global.matching != 3
				{
					if attack_laser_sec = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && hurt = 0 && hurt_little = 0 && global.rage_gauge >= 80
					{
					vspeed = 0
					y -= 1
					attack_laser_sec = 1
					cooltime = 1
					cannot_move = 1
					jump = 0
					jump_end_motion = 0
					jump_vsp_up = 1
					cooltime = 1
					global.stemina_cooltime = 0
					global.rage_gauge -= 80
				
					if skill_red_ball_effect = -1
					{
					skill_red_ball_effect = instance_create_depth(x+10*image_xscale,y+15,player.depth-1,red_circle_effect)
					skill_red_ball_effect.image_xscale = 0.35
					skill_red_ball_effect.image_yscale = 0.35
					skill_red_ball_effect.t_scale = 0.35
					}

			
						if global.awakening >= 1
						{
						global.awakening -= 0.8
						}
			
					sfx_for_multiplayer(laser_skill_ready,0,0.15)
				
					if global.voice_option = 0
					{
					//sfx_for_multiplayer(sagaji,0,0.14)
					sfx_for_multiplayer(ready_swording,0,0.35)
					}

			
					sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
					}
					else
					{
					var sfx = audio_play_sound(cannot_buy,0,0)
					audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
					}
				}
			}
			
			if gravity > 0 && (!place_meeting(x,y+38,obj_floor) || vspeed < 0)
			{
				if down_attack_with_rage = 0 && global.chat_activity = false && global.matching != 3
				{
					if attack_in_air = 0 && cooltime = 0 && spin = 0 && hurt = 0 && hurt_little = 0 && global.rage_gauge >= 25
					{
					image_index = 0
					attack_in_air = 2.92
					attack_in_air_cool = 1
					cooltime = 1
					cannot_move = 1
					global.stemina_cooltime = 0
					global.rage_gauge -= 25
					
						if global.awakening >= 1
						{
						global.awakening -= 0.25
						}
					alarm[5] = 10
					}
					else
					{
					var sfx = audio_play_sound(cannot_buy,0,0)
					audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
					}
				}
			}
		}
	//}
}



if pressing = 0
{
check_d_press_e = 0
}











if global.never_move = 0 && keyboard_check_pressed(ord(string(global.q_key))) && global.chat_activity = false && global.matching != 3 && charge_attack <= 0
{
if global.skill_turning_attack > 0 && turning_attack_used < global.skill_turning_attack
{
		if global.stemina > 3.8
		{
			if spin_attack = 0 && cannot_move = 0 && cooltime = 0 && hurt = 0 && hurt_little = 0
			{
			turning_attack_used ++
			cannot_move = 1
			jump = 0
			jump_end_motion = 0
			jump_vsp_up = 1
			cooltime = 1
			global.stemina_cooltime = 0
			global.stemina -= 2.8
				if place_meeting(x,y+2,obj_floor)
				{
				spin_attack = 1
				gravity = 0.2
				vspeed = -4
				}
				else
				{
				spin_attack = 3
				vspeed = 0
				gravity = 0
				}
			}
		}
		else
		{
		var sfx = audio_play_sound(cannot_buy,0,0)
		audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
		}
	
	

		if !place_meeting(x,y+10,obj_floor) && hurt = 0 && hurt_little = 0
		{
			if global.stemina > 3.8
			{
				if spin_attack = 0 && cannot_move = 1 && cooltime = 0 && jump > 0
				{
				turning_attack_used ++
				jump = 0
				jump_end_motion = 0
				spin_attack = 3.5
				cannot_move = 1
				jump_vsp_up = 1
				cooltime = 1
				gravity = 0
				vspeed = 0
				global.stemina_cooltime = 0
				global.stemina -= 2.8
				}
			}
			else
			{
			var sfx = audio_play_sound(cannot_buy,0,0)
			audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
			}
		}
}
}







if global.never_move = 0 && keyboard_check_pressed(ord(string(global.s_key))) && global.chat_activity = false && global.matching != 3 && charge_attack <= 0
{
	if !place_meeting(x,y+2,obj_floor)
	{
		if global.stemina > 2.8
		{
			if down_attack = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0
			{
			down_attack = 1
			cooltime = 1
			cannot_move = 1
			jump = 0
			jump_end_motion = 0
			jump_vsp_up = 1
			cooltime = 1
			global.stemina_cooltime = 0
			global.stemina -= 1.8
			var _ef = instance_create_depth(x,y-32,depth+1,effect_down_attack)
			_ef.sprite_index = pl_move_skeleton_down_attack1
			_ef.image_index = 1+global.n_sword
			_ef.image_xscale = image_xscale
			_ef.image_alpha = 0.10001
			
			sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
			}
		}
		else
		{
		var sfx = audio_play_sound(cannot_buy,0,0)
		audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
		}
	
		if global.stemina > 2.8
		{
			if down_attack = 0 && cannot_move = 1 && jump > 0 && cooltime = 0 && spin = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0
			{
			down_attack = 1
			cooltime = 1
			cannot_move = 1
			jump = 0
			jump_end_motion = 0
			jump_vsp_up = 1
			cooltime = 1
			global.stemina_cooltime = 0
			global.stemina -= 1.8
			var _ef = instance_create_depth(x,y-6,depth+1,effect_down_attack)
			_ef.sprite_index = pl_move_skeleton_down_attack1
			_ef.image_index = 1+global.n_sword
			_ef.image_xscale = image_xscale
			_ef.image_alpha = 0.6
			
			sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
			}
		}
		else
		{
		var sfx = audio_play_sound(cannot_buy,0,0)
		audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
		}
	}
	else
	{
		if global.n_sword != -1 && (double_pressed_left >= 2 || double_pressed_right >= 2) && global.rage_gauge >= 27
		{
			if gravity = 0 && dash_attack = 0 && cannot_move = 0 && cooltime = 0 && spin = 0 && down_attack_plusing = 0 && hurt = 0 && hurt_little = 0
			{
			global.rage_gauge -= 27
		
				if global.awakening >= 1
				{
				global.awakening -= 0.3
				}
			dash_attack = 1
			cannot_move = 1
			}
		}
		else
		{
			if global.rage_gauge < 27
			{
			var sfx = audio_play_sound(cannot_buy,0,0)
			audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
			}
		}
	}
}









if global.never_move = 0 && keyboard_check_pressed(ord(string(global.w_key))) && global.chat_activity = false && global.matching != 3 && charge_attack <= 0
{
if global.skill_jump_attack > 0 && jump_attack_used < global.skill_jump_attack
{
	if global.stemina > 2.5
	{
		if jump_attack = 0 && cannot_move = 0 && cooltime = 0 && hurt = 0 && hurt_little = 0
		{
		jump_attack_used ++
		if skill_combo = 0
		{
		jump_attack = 1
		}
		else
		{
		skill_combo = 0
		jump_attack = 1.5
		}
		cannot_move = 1
		jump = 0
		jump_end_motion = 0
		jump_vsp_up = 1
		cooltime = 1
		vspeed = 0
		gravity = 0
		global.stemina -= 1.5
		global.stemina_cooltime = 0
		}
	}
	else
	{
	var sfx = audio_play_sound(cannot_buy,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	}

if !place_meeting(x,y+10,obj_floor)
{
	if global.stemina > 3
	{
		if jump_attack = 0 && cannot_move = 1 && cooltime = 0 && jump > 0 && hurt = 0 && hurt_little = 0
		{
		jump_attack_used ++
		gravity = 0
		vspeed = 0
		jump = 0
		jump_end_motion = 0
		if skill_combo = 0
		{
		jump_attack = 1
		}
		else
		{
		skill_combo = 0
		jump_attack = 1.5
		}
		cannot_move = 1
		jump_vsp_up = 1
		cooltime = 1
		global.stemina -= 2
		global.stemina_cooltime = 0
		}
	}
	else
	{
	var sfx = audio_play_sound(cannot_buy,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	}
}
}
}







if global.stemina <= 1
{
double_pressed_left = 0
double_pressed_right = 0
}


if global.awakening >= 1
{
var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef);
var sprite = asset_get_index(string(sprite_get_name(string(sprite_index)))+"_white");
if sprite_exists(sprite)
{
ef.sprite_index = sprite;
}
else
{
ef.sprite_index = sprite_index;
};
ef.image_index = image_index;
ef.image_xscale = image_xscale;
ef.image_yscale = image_yscale;
ef.image_alpha = 0.2*image_alpha;
ef.image_angle = image_angle;
	
	if spin_attack >= 7
	{
	var ef = instance_create_depth(x,y,depth+1,gyu_seong_red_ef);
	var sprite = asset_get_index(string(sprite_get_name(string(sprite_index)))+"_white");
	if sprite_exists(sprite)
	{
	ef.sprite_index = sprite;
	}
	else
	{
	ef.sprite_index = sprite_index;
	};
	ef.image_index = image_index;
	ef.image_xscale = image_xscale;
	ef.image_yscale = image_yscale;
	ef.image_alpha = 0.2*image_alpha;
	ef.image_angle = image_angle+spin_attack_angle_p*60*(abs(image_xscale)/image_xscale)+10*(abs(image_xscale)/image_xscale);
	}

	

	if dont_shine = 0
	{
	global.rage_gauge = 100*(global.awakening-1)
	global.stemina += 0.35
	global.stemina_cooltime = 0
	}

	if global.awakening = 1 && global.stop_awakening = 0
	{
	check_d_press_e = 1
	sfx_for_multiplayer(sound5,0,0.13)
	view_shake(1,0,1)
	instance_create_depth(x,y,depth-1,rage_mode_knockback)


	
	var skill_red_ball_effect_rage = instance_create_depth(x,y,player.depth-1,red_circle_effect)
	skill_red_ball_effect_rage.image_xscale = 0.8
	skill_red_ball_effect_rage.image_yscale = 0.8
	skill_red_ball_effect_rage.t_scale = 0.8
	skill_red_ball_effect_rage.alarm[11] = 7
	
	global.stop_awakening = 1
	global.awakening = 2
	global.rage_gauge = 0
	
		var __i = choose(-1,1)
		var bl_ef = instance_create_depth(x,y,depth-1,ef_blood)
		var img_scale = -__i*irandom_range(8,15)/5
		bl_ef.image_xscale = img_scale
		bl_ef.image_yscale = abs(img_scale)
		bl_ef.t_x = __i
		bl_ef.image_angle = irandom_range(-90,90)
		w_alpha = 1.1
	}
}
else
{
dont_shine = 0
	if audio_is_playing(wak_rio)
	{
	var ef = instance_create_depth(x,y,depth+1,gyu_seong_blue_ef);
	var sprite = asset_get_index(string(sprite_get_name(string(sprite_index)))+"_white");
	if sprite_exists(sprite)
	{
	ef.sprite_index = sprite;
	}
	else
	{
	ef.sprite_index = sprite_index;
	};
	ef.image_index = image_index;
	ef.image_xscale = image_xscale;
	ef.image_yscale = image_yscale;
	ef.image_alpha = 0.2*image_alpha;
	ef.image_angle = image_angle;
	}
}

if global.awakening > 0 && global.stop_awakening = 0
{
global.awakening += 0.05
w_alpha = global.awakening*0.5
	if global.awakening > 1
	{
	global.awakening = 1
	}
}

if global.stop_awakening = 1
{
global.awakening -= 0.0008
	
	if global.awakening < 1
	{
	global.awakening = 0
	global.stop_awakening = 0
		if dont_shine = 0
		{
		var __i = choose(-1,1)
		var bl_ef = instance_create_depth(x,y,depth-1,ef_blood)
		var img_scale = -__i*irandom_range(8,15)/5
		bl_ef.image_xscale = img_scale
		bl_ef.image_yscale = abs(img_scale)
		bl_ef.t_x = __i
		bl_ef.image_angle = irandom_range(-90,90)
		w_alpha = 1.1
		
		var skill_red_ball_effect_rage = instance_create_depth(x,y,player.depth-1,red_circle_effect)
		skill_red_ball_effect_rage.image_xscale = 0.8
		skill_red_ball_effect_rage.image_yscale = 0.8
		skill_red_ball_effect_rage.t_scale = 0.8
		skill_red_ball_effect_rage.alarm[11] = 7
		}
	}
}


if global.never_move = 1
{
pressed_a_key = 0
pressed_d_key = 0
}




hspeed += (0 - hspeed)*0.1


repeat(100)
{
	if place_meeting(x,y+0.2,obj_floor)
	{
	y -= 0.1
	jump_attack_used = 0
	turning_attack_used = 0
	}
	else
	{
	break;
	}
}

if !place_meeting(x,y+1,obj_floor) && hurt = 0 && hurt_little = 0
{
	if jump = 0 && spin_attack = 0 && jump_attack = 0 && down_attack = 0
	{
	jump = 1
	jump_vsp_up = 1
	}
}

if sting_attack > 0 && jump_attack = 0 && down_attack = 0
{
sprite_index = sting_sprite
sting_attack += 0.3

	if attack_sting_sfx = 0
	{
	y -= 1
	sfx_for_multiplayer(charging_sfx,false,0.3)
	attack_sting_sfx = 1
	
	var effect_ = instance_create_depth(x-global.movement_speed*13,y-16,player.depth+1,down_effect)
	effect_.t_image_yscale = 0.4*3
	effect_.t_image_xscale = 0.05*3
	effect_.received = 0
	}
	
	if image_angle < 6*image_xscale
	{
	image_angle += 0.5*image_xscale
	}
	
	if image_angle > 6*image_xscale
	{
	image_angle += 0.5*image_xscale
	}

	if attack_sting_sfx = 1
	{
	image_index = sting_attack
	
	var _ef = instance_create_depth(x,y,depth+1,effect_sting)
	_ef.image_index = image_index
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 1
	_ef.image_angle = movement_speed+global.movement_speed
	
		if sting_attack > 6
		{
		attack_sting_sfx = 2
		}
	}
	else
	{
	var _ef = instance_create_depth(x,y,depth+1,effect_sting_free)
	_ef.image_index = image_index
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 1
	_ef.image_angle = image_angle
	
		if sting_attack < 10
		{
		image_index = sting_attack
		}
		else
		{
		image_index = 10
		}
	}
	
	
	
	if place_meeting(x,y+1,obj_floor) && sting_attack > 1
	{
	image_angle = 0
	image_index = 0
	sting_attack = 0
	attack_sting_sfx = 0
	sting_attack_effect = 0
	gravity = 0
	vspeed = 0
	
	spin = 1
	cannot_move = 1
	cooltime = 1
	global.stemina_cooltime = 0
	global.movement_speed = 0
	movement_speed *= 0.35
	
		repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
		{
		randomize()
		var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
		dust.image_xscale = 0.13
		dust.image_yscale = 0.13
		dust.vspeed = -irandom_range(100,200)/200
		dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
		dust.image_alpha = 0.4
		}
	}
	else
	{
	gravity = 0.2
	}
}


if spin_attack = 0 && jump_attack = 0 && down_attack = 0 && sting_attack = 0
{
	if place_meeting(x,y+1,obj_floor)
	{
	jump_attack_used = 0
	turning_attack_used = 0
	gravity = 0
	vspeed = 0
	t_y = y+vspeed
	
		if jump > 4
		{
		jump_end_motion = 1
		}
		
		
		if jump_end_motion = 1
		{
		jump -= 0.9
			if attack_in_air <= 0
			{
			image_index = jump
			}
		}
		
		if jump <= 0 && jump_end_motion = 1
		{
		jump_vsp_up = 0
		cannot_move = 0
		jump = 0
		jump_end_motion = 0
		sprite_index = move_sprite
		}
	}
	else
	{
	gravity = 0.2
	}
}


if !place_meeting(x-(image_xscale)*48,y,obj_floor)
{
	if !position_meeting(x+global.movement_speed+(sign(global.movement_speed)*16),y,obj_floor)
	{
	x += (global.movement_speed)*0.35
	}
}

if pressed_d_key+pressed_a_key = 0 && cannot_move = 0 && attack_ = 0 && dash_attack = 0 && sting_attack = 0
{
global.movement_speed += (0 - global.movement_speed)*0.23
image_index += (0 - image_index)*0.1
}


if cannot_move != 0
{
pressed_a_key = 0
pressed_d_key = 0
}


if spin > 0 && down_attack = 0 && sprite_index != jump_sprite && gravity = 0
{
	if spin = 1
	{
	sfx_for_multiplayer(spin_sfx,0,0.12)
	
	var random_val = choose(1,0)
		if random_val = 1
		{
			if global.voice_option = 0
			{
			sfx_for_multiplayer(zzae_ggi_chun,0,0.5)
			}
		}
	}
sprite_index = spin_sprite
spin += 0.3
image_index = spin
global.movement_speed = 0

	if spin <= 11
	{
		for(var i = 0; i <= (11-spin); i++)
		{
			if !place_meeting(x-image_xscale*16,y-16,obj_floor)
			{
			x += -sign(image_xscale)*0.7
			}
			else
			{
			break;
			}
		}
	}
	
	if spin >= 11
	{
	double_pressed_left = 0
	double_pressed_right = 0
	sprite_index = move_sprite
	spin = 0
	cooltime = 1
	alarm[1] = 8
	cannot_move = 0
	}
}





if spin_attack > 0 && down_attack = 0 && sting_attack = 0
{
	if pressed_d_key+pressed_a_key != 0
	{
	image_xscale = -abs(image_xscale)*(pressed_d_key+pressed_a_key)
	}
sprite_index = spin_attack_sprite
spin_attack += 0.3
if global.awakening > 1
{
spin_attack += 0.05
}

if spin_attack <= 7
{
image_index = spin_attack
}
else
{
image_index = 7
}

	if image_index > 5
	{
		if image_angle = 0
		{
		image_index = 5
		}
	}
	

	if spin_attack <= 1
	{
	global.movement_speed = 0
	}


	if spin_attack < 6
	{
	global.movement_speed = (-image_xscale)*2.2
	
		if vspeed > 0
		{
		gravity = 0.21
		}
		
		spin_attack_angle_p = 1
	}
	else
	{
	gravity = 0
	
		if spin_attack <= 7
		{
			if global.chat_activity = false && global.matching != 3
			{
			var _pressing_a = keyboard_check(vk_left)
			var _pressing_d = keyboard_check(vk_right)
			}
			else
			{
			var _pressing_a = 0
			var _pressing_d = 0
			}
		
		if image_xscale < 0
		{
		_pressing_d = 0
		}
		else
		{
		_pressing_a = 0
		}
		
		if _pressing_d != 0 && _pressing_a != 0
		{
		global.movement_speed = (_pressing_d-_pressing_a)
		}
		else
		{
		global.movement_speed = -image_xscale*0.4
		}
		
		vspeed += (0 - vspeed)*0.05
		}
	
	spin_attack_angle_p++
	
	if spin_attack >= 7 && image_angle != 0
	{
	global.movement_speed += (0 - global.movement_speed)*0.08
		if hurt = 0 && hurt_little = 0
		{
		var _ef = instance_create_depth(x,y,depth+1,effect)
		_ef.image_index = 1+global.n_sword
		_ef.image_xscale = image_xscale
		_ef.image_alpha = 0.6
		_ef.image_angle = image_angle+spin_attack_angle_p*60*(abs(image_xscale)/image_xscale)+10*(abs(image_xscale)/image_xscale)
		}
		
		image_alpha = 0.6
	
		if spin_attack_sfx_on = 0
		{
		sfx_for_multiplayer(spin_attack_sfx,0,0.4)
		

		sfx_for_multiplayer(swing_lightsaber_sfx2,0,0.1)
		
		alarm[10] = 10
		alarm[11] = 18

		
		if global.voice_option = 0
		{
		sfx_for_multiplayer(aaang_,0,0.23)
		}
		spin_attack_sfx_on = 1
		}
	}
	
		if spin_attack_angle_p > 1
		{
		image_angle += 120*(abs(image_xscale)/image_xscale)
		spin_attack_angle_p = 0
		}
	}
	
	if spin_attack >= 13
	{
	sprite_index = move_sprite
	image_angle = 0
	image_alpha = 1
	spin_attack = 0
	cannot_move = 0
	spin_attack_angle_p = 0
	spin_attack_sfx_on = 0
	cooltime = 1
	alarm[1] = 14
	}
}



if jump > 0 && down_attack = 0 && hurt = 0 && hurt_little = 0 && jump_end_motion = 0 && sting_attack = 0
{
	if jump < 5
	{
	jump += 0.3
		if global.awakening > 1
		{
		jump += 0.05
		}
	}
	
	if cancled_attack = 0
	{
	sprite_index = jump_sprite
	}


	if jump > 4
	{
		if attack_in_air <= 0
		{
		image_index = 5
		}
		
		if jump_vsp_up != 1
		{ 
		jump_vsp_up = 1
		}
	}
	else
	{
		if attack_in_air <= 0
		{
		image_index = jump
		}
	}
}



if jump_attack > 0 && down_attack = 0 && spin_attack = 0 && sting_attack = 0
{
jump_attack += 0.3
if global.awakening > 1
{
jump_attack += 0.05
}
sprite_index = jump_attack_sprite
image_index = jump_attack
global.movement_speed = 0

	if jump_attack > 5
	{
		if jump_attack_sfx_on != 1
		{
		jump_attack_sfx_on = 1
		sfx_for_multiplayer(jump_attack_sfx,0,0.6)
		
		sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)

		
		var random_val = choose(1,0,0)
			if random_val = 1
			{
				if global.voice_option = 0
				{
				sfx_for_multiplayer(choose(yayaya,yayaya),0,0.2)
				}
			}
		}
	
	jump_attack += 0.12
	jump_attack_motion_dilay ++
		if jump_attack_vsp_up != 1
		{
		vspeed -= 4
		jump_attack_vsp_up = 1
		}
		
		if hurt = 0 && hurt_little = 0
		{
			if jump_attack_motion_dilay > 2
			{
			var _ef = instance_create_depth(x,y,depth+1,effect_jump_attack)
			if global.n_sword = 0
			{
			_ef.sprite_index = pl_move_skeleton_jump_attack_beat_saber1
			}
			if global.n_sword = 1
			{
			_ef.sprite_index = pl_move_skeleton_jump_attack_beat_saber_green1
			}
			if global.n_sword = 2
			{
			_ef.sprite_index = pl_move_skeleton_jump_attack_beat_saber_red1
			}
			_ef.image_index = image_index
			_ef.image_xscale = image_xscale
			_ef.image_alpha = 0.6
			jump_attack_motion_dilay = 0
			}
		}
	
		
		if jump_attack < 11
		{
			if !place_meeting(x-image_xscale*32,y,obj_floor)
			{
			x += (-image_xscale)*0.7
			}
		}
	}
	

	if jump_attack > 15
	{
	jump_attack = 0
	cannot_move = 0
	jump_attack_vsp_up = 0
	jump_attack_sfx_on = 0
	image_index = 15
	cooltime = 1
	alarm[1] = 16
	}
}









if down_attack_with_rage > 0 && spin_attack = 0 && sting_attack = 0
{
down_dis += 0.5
	if down_attack_with_rage < 5
	{
	down_attack_with_rage += 0.3
	}
	
sprite_index = down_attack_sprite


	if down_attack_with_rage < 4
	{
		if !place_meeting(x-image_xscale*32,y,obj_floor)
		{
		x += (-image_xscale)*2.2
		}
	
	gravity = 0.05
	down_attack_motion_dilay = 1
	}
	else
	{
	gravity = 0.36
		
		if !place_meeting(x-image_xscale*32,y,obj_floor) && down_attack_with_rage < 4
		{
		x += (-image_xscale)*0.67
		}
	}
	
	if place_meeting(x,y+vspeed,obj_floor) || place_meeting(x,y+1,obj_floor)
	{
		if down_attack_sfx_on != 1
		{
			if global.voice_option = 0
			{
			sfx_for_multiplayer(gae_sae_ggya_skill,0,0.24)
			}
	
	
		down_attack_sfx_on = 1
		sfx_for_multiplayer(down_attack_sfx,0,0.5)
		sfx_for_multiplayer(bomb_sfx,false,0.1)
		
		view_shake(4,15+down_dis,4)
		
		attack_target_x = x
		}
		
	global.movement_speed = 0
	movement_speed = 0
	down_dis = 0
		
	vspeed += (0 - vspeed)*0.54
	down_attack_plusing ++
	cooltime = 1
	image_index = 4
	}
	else
	{
	image_index = 3
	}

	
	if audio_is_playing(wak_rio)
	{
	audio_sound_gain(wakrio_bgm,0.3*global.master_volume*2*global.bgm_volume,0)
	}
	
	if down_attack_plusing > 0
	{
	down_attack_motion_dilay++
		if down_attack_motion_dilay > 4
		{
		var _effect = instance_create_depth(attack_target_x+down_attack_with_rage_dis,global.p_floor+27,player.depth-1,effect_quake)
		_effect.image_xscale = 1.5
		_effect.image_yscale = 2
		
		var _effect = instance_create_depth(attack_target_x-down_attack_with_rage_dis,global.p_floor+27,player.depth-1,effect_quake)
		_effect.image_xscale = 1.5
		_effect.image_yscale = 2
		
		down_attack_with_rage_dis += 64
		down_attack_motion_dilay = 0
		}
	}
	
	if (global.awakening <= 0 && down_attack_plusing > 10) || (global.awakening > 1 && down_attack_plusing > 16)
	{
	down_attack_with_rage ++
		if down_attack_with_rage > 32
		{
		alarm[1] = 8
		down_attack_motion_dilay = 0
		down_attack_gravity = 0
		down_attack_sfx_on = 0
		down_attack_plusing = 0
		down_attack_with_rage = 0
		cannot_move = 0
		down_attack_with_rage_dis = 0
		sprite_index = move_sprite
		image_index = 0
		y -= 1
		}
	}
}



if attack_laser_sec > 0 && spin_attack = 0
{
vspeed = 0
cannot_move = 1
global.never_move = 1
global.movement_speed = 0
attack_laser_sec += 0.12

if skill_red_ball_effect != -1
{
	if floor(image_index) < 1
	{
	skill_red_ball_effect.x = x+10*image_xscale
	skill_red_ball_effect.y = y+15
	}
	
	if floor(image_index) >= 1 && floor(image_index) < 2
	{
	skill_red_ball_effect.x = x+16*image_xscale
	skill_red_ball_effect.y = y+10
	}
	
	if floor(image_index) >= 2 && floor(image_index) <= 4
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-6
	}
	
	if floor(image_index) >= 5 && floor(image_index) <= 7
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-5
	}
	
	if floor(image_index) >= 8 && floor(image_index) <= 9
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-4
	}
	
	if floor(image_index) >= 10
	{
	skill_red_ball_effect.x = x-9*image_xscale
	skill_red_ball_effect.y = y+15
	skill_red_ball_effect.des = 1
	skill_red_ball_effect = -1
	}
}
	
sprite_index = attack_laser_sprite_sec
if attack_laser_sec < 13
{
image_index = floor(attack_laser_sec)
}
else
{
image_index = 12
}

	if floor(image_index) >= 11 && attack_laser_sfx = 0
	{
	attack_laser_sfx = 1
	
	
	var effect_ = instance_create_depth(x-image_xscale*16,y-18,player.depth+1,down_effect_for_laser)
	effect_.image_blend = c_black
	effect_.t_image_xscale = 0.3*4*image_yscale/2
	effect_.t_image_yscale = 0.05*3*image_yscale/2
	effect_.image_xscale = 2.5/2
	effect_.image_yscale = 0.8/2
	effect_.alarm[1] = 2
	if image_xscale = -1
	{
	effect_.image_angle = 90
	}
	else
	{
	effect_.image_angle = 270
	}

		
	sfx_for_multiplayer(laser_sfx_sec,0,0.09)

	
	attack_target_x = x
	
	sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
	}
	
	if floor(image_index) > 11 && attack_laser_sfx = 1
	{
	attack_laser_sfx = 2
	var _aaa = instance_create_depth(x-image_xscale*24,y-16,player.depth-1,effect_special_skill_sec)
		if image_xscale = 1
		{
		_aaa.image_angle = 90
		}
		else
		{
		_aaa.image_angle = 270
		}
	}
	
	if attack_laser_sec > 18
	{
	attack_laser_sfx = 0
	down_attack_plusing = 0
	attack_laser_sec = 0
	down_attack_with_rage_dis = 0
	cannot_move = 0
	cooltime = 0
	sprite_index = move_sprite
	image_index = 0
	global.never_move = 0
	}
}





if attack_laser > 0 && spin_attack = 0
{
vspeed = 0
cannot_move = 1
global.never_move = 1
global.movement_speed = 0
attack_laser += 0.1

if skill_red_ball_effect != -1
{
	if round(image_index) < 1
	{
	skill_red_ball_effect.x = x+10*image_xscale
	skill_red_ball_effect.y = y+15
	}
	
	if round(image_index) >= 1 && round(image_index) < 2
	{
	skill_red_ball_effect.x = x+16*image_xscale
	skill_red_ball_effect.y = y+10
	}
	
	if round(image_index) >= 2 && round(image_index) <= 4
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-6
	}
	
	if round(image_index) >= 5 && round(image_index) <= 7
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-5
	}
	
	if round(image_index) >= 8 && round(image_index) <= 9
	{
	skill_red_ball_effect.x = x+14*image_xscale
	skill_red_ball_effect.y = y-4
	}
	
	if round(image_index) >= 10
	{
	skill_red_ball_effect.x = x-9*image_xscale
	skill_red_ball_effect.y = y+15
	skill_red_ball_effect.des = 1
	skill_red_ball_effect = -1
	}
}
	
sprite_index = attack_laser_sprite
if attack_laser < 13
{
image_index = floor(attack_laser)
}
else
{
image_index = 12
}

	if floor(image_index) = 10 && attack_laser_sfx = 0
	{
	attack_laser_sfx = 1
	
	
	var effect_ = instance_create_depth(x,global.p_floor+27,player.depth+1,down_effect)
	effect_.t_image_xscale = 0.3*12
	effect_.t_image_yscale = 0.05*12
	effect_.received = 0
		
		
	sfx_for_multiplayer(sword_ready,0,0.12)

	
	attack_target_x = x
	
	sfx_for_multiplayer(choose(swing_lightsaber_sfx2,swing_lightsaber_sfx3),0,0.1)
	}
	
	if attack_laser > 12.6
	{
	movement_speed = 0
	down_attack_plusing ++
		if down_attack_plusing > 34
		{
		instance_create_depth(attack_target_x+down_attack_with_rage_dis,global.p_floor+32,player.depth-1,effect_special_skill)
		instance_create_depth(attack_target_x-down_attack_with_rage_dis,global.p_floor+32,player.depth-1,effect_special_skill)
		
		down_attack_plusing = 3
		down_attack_with_rage_dis += 151
		}
	}
	
	if attack_laser > 32
	{
	attack_laser_sfx = 0
	down_attack_plusing = 0
	attack_laser = 0
	down_attack_with_rage_dis = 0
	cannot_move = 0
	cooltime = 0
	sprite_index = move_sprite
	image_index = 0
	global.never_move = 0
	}
}




if charge_attack > 0
{
sprite_index = pl_move_skeleton_charging
image_index = charge_attack
cannot_move = 1
charge_attack += 0.025
double_pressed_left = 0
double_pressed_right = 0
global.movement_speed = 0
movement_speed += (0 - movement_speed)*0.015

	if global.awakening > 1
	{
	charge_attack += 0.003
	}
	
	if charge_attack < 3 && abs(movement_speed) > 3
	{
	var _ef = instance_create_depth(x,y,depth+1,charging_attack)
	_ef.image_index = 3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.3
	gravity = 0
	vspeed = 0
	}

	if attack_charge_sfx = 0
	{
		repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
		{
		randomize()
		var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
		dust.image_xscale = 0.13
		dust.image_yscale = 0.13
		dust.vspeed = -irandom_range(100,200)/200
		dust.hspeed = (-global.movement_speed*irandom_range(10,50)/50)+irandom_range(-20,20)/5
		dust.image_alpha = 0.4
		}
				
	sfx_for_multiplayer(charging_sfx,false,0.3)
	attack_charge_sfx = 1
	
	var effect_ = instance_create_depth(x-global.movement_speed*8,y-12,player.depth+1,down_effect)
	effect_.t_image_yscale = 0.4*3
	effect_.t_image_xscale = 0.05*3
	effect_.received = 0
	
	var effect_ = instance_create_depth(x-global.movement_speed*24,y-12,player.depth+1,down_effect)
	effect_.t_image_yscale = 0.6*3
	effect_.t_image_xscale = 0.1*3
	effect_.received = 0
	}

	if charge_attack > 2.05 && charge_attack < 3
	{
	global.movement_speed = 0
	movement_speed = 0
	attack_charge_sfx = 0
	sprite_index = move_sprite
	image_index = 0
	cannot_move = 0
	cooltime = 0
	charge_attack = 0
	charge_attack_effect = 0
	}
	
	if charge_attack >= 4
	{
	global.movement_speed = 0
	movement_speed = 0
	attack_charge_sfx = 0
	sprite_index = move_sprite
	image_index = 0
	cannot_move = 0
	cooltime = 0
	charge_attack = 0
	charge_attack_effect = 0
	}
}







if down_attack > 0 && spin_attack = 0
{
down_dis += 0.5
	if down_attack < 5
	{
	down_attack += 0.3
		if global.awakening > 1
		{
		down_attack += 0.05
		}
	}
	
sprite_index = down_attack_sprite
image_index = down_attack
global.movement_speed = 0

	if down_attack > 3
	{
	image_index = 4
	}
	
	if down_attack < 4
	{
		if !place_meeting(x-image_xscale*32,y,obj_floor)
		{
		x += (-image_xscale)*2.2
		}
	
		if down_attack > 6
		{
		image_index = 6
		}
		else
		{
		image_index = down_attack
		}
	
	gravity = 0.05
	down_attack_motion_dilay = 1
	}
	else
	{
	gravity = 0.36
		
		if down_attack_gravity < 1
		{
		vspeed += 3
		down_attack_gravity += 0.2
		}
		
		if !place_meeting(x-image_xscale*32,y,obj_floor) && down_attack < 4
		{
		x += (-image_xscale)*0.67
		}
		
	
	down_attack_motion_dilay++
	
	if hurt = 0 && hurt_little = 0
	{
		if down_attack_plusing != 1
		{
		var _ef = instance_create_depth(x,y,depth+1,effect_down_attack)
		_ef.sprite_index = pl_move_skeleton_down_attack1
		_ef.image_index = 1+global.n_sword
		_ef.image_xscale = image_xscale
		_ef.image_alpha = 0.6
		down_attack_motion_dilay = 0
		}
	}
	
	image_index = 4
	}
	
	if place_meeting(x,y+vspeed,obj_floor) || place_meeting(x,y+1,obj_floor)
	{
		if down_attack_sfx_on != 1
		{
		down_attack_sfx_on = 1
		sfx_for_multiplayer(down_attack_sfx,0,0.5)
		
		
		if global.voice_option = 0
		{
		sfx_for_multiplayer(gae_sae_ggya,0,0.2)
		}
		
		view_shake(4,15+down_dis,4)
		
		var effect_ = instance_create_depth(x,global.p_floor+27,player.depth+1,down_effect)
		effect_.t_image_xscale = 0.3*down_dis
		effect_.t_image_yscale = 0.05*down_dis
		effect_.received = 0
		}
		
	down_dis = 0
		
	vspeed += (0 - vspeed)*0.54
	down_attack_plusing = 1
	cooltime = 1
	}
	
	if down_attack_plusing > 0
	{
	down_attack ++
		if down_attack > 32
		{
		alarm[1] = 8
		down_attack_motion_dilay = 0
		down_attack_gravity = 0
		down_attack_sfx_on = 0
		down_attack_plusing = 0
		down_attack = 0
		cannot_move = 0
		sprite_index = move_sprite
		image_index = 0
		y -= 1
		}
	}
}


if attack_in_air > 0
{
attack_in_air += 0.16
	if global.awakening > 1
	{
	attack_in_air += 0.03
	}

sprite_index = attack_sprite
image_index = floor(attack_in_air+2.88)

cannot_move = 1
cooltime = 1

if dash_attack = 0 && sting_attack = 0
{
global.movement_speed += (0 - global.movement_speed)*0.1
}


if attack_sfx_on = 0 && (floor(image_index) = 7)
{
sfx_for_multiplayer(swing_sfx2,0,0.4)
sfx_for_multiplayer(swing_lightsaber_sfx2,0,0.1)


attack_sfx_on ++

	
	if hurt = 0 && hurt_little = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack2)
	_ef.image_index = 4+global.n_sword*3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}



	if attack_in_air+2.88 > 7.5
	{
	paring = 0
	attack_in_air = 0
	keep_attack = 0
	keep_attacking = 0
	attack_sfx_on = 0
	sprite_index = move_sprite
	alarm[1] = 12
	alarm[3] = 13
	}
}



if attack_ > 0
{
attack_ += 0.16
	if global.awakening > 1
	{
	attack_ += 0.03
	}
sprite_index = attack_sprite
image_index = attack_
cannot_move = 1
cooltime = 1

	if dash_attack = 0 && sting_attack = 0
	{
	global.movement_speed += (0 - global.movement_speed)*0.1
	}

if attack_sfx_on = 0 && (floor(image_index) = 2)
{
sfx_for_multiplayer(swing_sfx1,0,0.4)

sfx_for_multiplayer(swing_lightsaber_sfx1,0,0.1)


if global.voice_option = 0
{
sfx_for_multiplayer(ssip,0,0.3)
}

attack_sfx_on ++
	if !place_meeting(x-image_xscale*32,y,obj_floor)
	{
	global.movement_speed += (-image_xscale)*6.1
	}
	
	if hurt = 0 && hurt_little = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack1)
	_ef.image_index = 3+global.n_sword*3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

if attack_sfx_on = 0 && (floor(image_index) = 6)
{
sfx_for_multiplayer(swing_sfx2,0,0.4)
sfx_for_multiplayer(swing_lightsaber_sfx2,0,0.1)



	if global.voice_option = 0
	{
	sfx_for_multiplayer(jjin,0,0.28)
	}
attack_sfx_on ++
	if !place_meeting(x-image_xscale*32,y,obj_floor)
	{
	global.movement_speed += (-image_xscale)*4.2
	}
	
	if hurt = 0 && hurt_little = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack2)
	_ef.image_index = 4+global.n_sword*3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

if attack_sfx_on = 0 && (floor(image_index) = 11)
{
sfx_for_multiplayer(swing_sfx3,0,0.4)
sfx_for_multiplayer(swing_lightsaber_sfx3,0,0.1)



	if global.voice_option = 0
	{
	sfx_for_multiplayer(dda,0,0.28)
	}
attack_sfx_on ++
	if !place_meeting(x-image_xscale*32,y,obj_floor)
	{
	global.movement_speed += (-image_xscale)*5.5
	}
	
	if hurt = 0 && hurt_little = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack3)
	_ef.image_index = 5+global.n_sword*3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

	if attack_ > 6.4 && attack_ < 7 && keep_attacking = 0
	{
		if keep_attack = 0
		{
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		sprite_index = move_sprite
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		keep_attacking ++
		attack_sfx_on = 0
		}
	}
	
	if attack_ > 9.4 && attack_ < 10 && keep_attacking = 1
	{
		if keep_attack = 0
		{
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		sprite_index = move_sprite
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		keep_attacking ++
		attack_sfx_on = 0
		}
	}
	
	if attack_ > 14.4 && keep_attacking = 2
	{
	attack_ = 0
	keep_attack = 0
	keep_attacking = 0
	attack_sfx_on = 0
	sprite_index = move_sprite
	alarm[1] = 12
	alarm[3] = 13
	}
}






if dash_attack > 0
{
sprite_index = pl_move_skeleton_rush_slice
dash_attack += 0.2


image_index = dash_attack

	if dash_attack < 2
	{
	global.movement_speed += (0 - global.movement_speed)*0.015
	}
	
	if dash_attack > 3
	{
	global.movement_speed += (0 - global.movement_speed)*0.15
	}
	
	if dash_attack >= 2.3 && dash_attack < 2.83
	{
	global.movement_speed = -image_xscale*48
	dash_attack = 2.83
	

	sfx_for_multiplayer(dash_attack_sfx,0,0.08)

	
		repeat(irandom_range(12,18))
		{
		randomize()
		var dust = instance_create_depth(x+irandom_range(-2,2),y+28+irandom_range(-2,2),depth+1,pepsi_effect)
		dust.image_xscale = 0.135
		dust.image_yscale = 0.135
		dust.vspeed = -irandom_range(100,200)/200
		dust.hspeed = (-global.movement_speed*irandom_range(10,50)/250)
		dust.image_alpha = 0.4
		}
		
		repeat(irandom_range(18,24))
		{
		randomize()
		var dust = instance_create_depth(x+irandom_range(-2,2),y+3+irandom_range(-5,5),depth+1,pepsi_effect)
		dust.image_xscale = 0.145
		dust.image_yscale = 0.145
		dust.vspeed = irandom_range(-220,100)/200
		dust.hspeed = (-global.movement_speed*irandom_range(10,50)/330)
		dust.image_alpha = 0.4
		}
	}
	
	if dash_attack >= 5 && dash_attack < 5.9
	{
	dash_attack = 5.9
	}
	
	if dash_attack >= 4 && dash_attack < 4.04
	{
	dash_attack = 4.04
	var __i = choose(-1,1)
	var bl_ef = instance_create_depth(x-global.movement_speed*7,y-8,depth-1,ef_blood_dash_attack)
	bl_ef.image_xscale = 2
	bl_ef.image_yscale = 0.42
	bl_ef.t_x = __i
	
	var __i = -global.movement_speed/25
	var bl_ef = instance_create_depth(x-global.movement_speed*7,y-8,depth-1,ef_blood)
	bl_ef.image_xscale = 2.3
	bl_ef.image_yscale = 0.42
	bl_ef.t_x = __i
	
	var effect_ = instance_create_depth(x-global.movement_speed*13,y-8,player.depth+1,down_effect)
	effect_.t_image_yscale = 0.3*3
	effect_.t_image_xscale = 0.05*3
	effect_.received = 0
	
	var effect_ = instance_create_depth(x-global.movement_speed*11,y-8,player.depth+1,down_effect)
	effect_.t_image_yscale = 0.15*3
	effect_.t_image_xscale = 0.025*3
	effect_.received = 0
	}

	if dash_attack > 10
	{
	double_pressed_left = 0
	double_pressed_right = 0
	dash_attack = 0
	cannot_move = 0
	sprite_index = move_sprite
	image_index = 0
	}
}

	
////////////////////////////////////////////////////////////////////////////////////////////////
if double_pressed_left > 2
{
double_pressed_left = 2
}

if double_pressed_right > 2
{
double_pressed_right = 2
}


	var press_l = 0
	var press_r = 0
	
	if keyboard_check_pressed(vk_left) && global.chat_activity = false && global.matching != 3
	{
	double_pressed_left++
	alarm[6] = 20
	}
	
	if keyboard_check_pressed(vk_right) && global.chat_activity = false && global.matching != 3
	{
	double_pressed_right++
	alarm[7] = 20
	}
	
	if keyboard_check(vk_left) && global.chat_activity = false && global.matching != 3
	{
	pressed_a_key = -1
	press_l = 1
	}
	else
	{
	pressed_a_key = 0
		if double_pressed_left >= 2
		{
		double_pressed_left = 0
		}
	}
	
	if keyboard_check(vk_right) && global.chat_activity = false && global.matching != 3
	{
	pressed_d_key = 1
	press_r = 1
	}
	else
	{
	pressed_d_key = 0
		if double_pressed_right >= 2
		{
		double_pressed_right = 0
		}
	}
	
	if (press_r-press_l) != 0 && hurt = 0 && hurt_little = 0 && global.never_move = 0
	{
		if press_l > 0 && (cannot_move = 0 || sprite_index = jump_sprite)
		{
			if (sprite_index = move_sprite || sprite_index = jump_sprite)
			{
			image_xscale = 1
			}
			
			if double_pressed_left < 2
			{
				if global.movement_speed > -5 && global.movement_speed <= 0
				{
				global.movement_speed -= 0.12
				global.movement_speed += global.movement_speed*0.05
				}
				else
				{
					if global.movement_speed > 0
					{
					global.movement_speed = global.movement_speed/4
					}
				global.movement_speed += (-5 - global.movement_speed)*0.05
				}
			}
			else
			{
				if global.movement_speed > -(8+sign(floor(global.awakening))*0.5)
				{
				global.movement_speed -= 0.2
					if global.movement_speed < 0
					{
					global.movement_speed += global.movement_speed*0.1
					}
				}
				else
				{
				global.movement_speed = -(8+sign(floor(global.awakening))*0.5)
				}
			}
		}
		
		if press_r > 0 && (cannot_move = 0 || sprite_index = jump_sprite)
		{
			if (sprite_index = move_sprite || sprite_index = jump_sprite)
			{
			image_xscale = -1
			}
			
			if double_pressed_right < 2
			{
				if global.movement_speed < 5 && global.movement_speed >= 0
				{
				global.movement_speed += 0.12
				global.movement_speed += global.movement_speed*0.05
				}
				else
				{
					if global.movement_speed < 0
					{
					global.movement_speed = global.movement_speed/4
					}
				global.movement_speed += (5 - global.movement_speed)*0.05
				}
			}
			else
			{
				if global.movement_speed < (8+sign(floor(global.awakening))*0.5)
				{
				global.movement_speed += 0.2
					if global.movement_speed > 0
					{
					global.movement_speed += global.movement_speed*0.1
					}
				}
				else
				{
				global.movement_speed = (8+sign(floor(global.awakening))*0.5)
				}
			}
		}
	}
	else
	{
		if sting_attack = 0
		{
		global.movement_speed += (0 - global.movement_speed)*0.1;
			if abs(global.movement_speed) <= 0.15 && (sprite_index = move_sprite || sprite_index = jump_sprite) && global.show_challenger = 0
			{
			image_index = 0
			global.movement_speed = 0
			}
		}
	}
	
	if global.movement_speed != 0 && global.show_challenger = 0
	{
		if !place_meeting(x-image_xscale*32,y,obj_floor)
		{
		x += global.movement_speed*0.35
		}
		
		if abs(global.movement_speed) > 0 && sprite_index = move_sprite
		{
		image_index += global.movement_speed*0.12
		}
	}
}
	
	hp = global.hp
	keep_winning_ = global.keep_winning
	
	buffer_seek(command_buffer, buffer_seek_start, 0);
	buffer_write(command_buffer, buffer_u8, code.DATA.COMMAND);
	buffer_write(command_buffer, buffer_u8, code.my_ID);
	buffer_write(command_buffer, buffer_u8, code.COMM.POSITION);
	buffer_write(command_buffer, buffer_string, name);
	buffer_write(command_buffer, buffer_string, real(floor(x*10)));
	buffer_write(command_buffer, buffer_string, real(floor(y*10)));
	buffer_write(command_buffer, buffer_string, real(floor(global.hp*100)));
	buffer_write(command_buffer, buffer_string, real(floor(returned_id)));
	buffer_write(command_buffer, buffer_string, real(floor(global.keep_winning*100)));
	buffer_write(command_buffer, buffer_string, real(floor(global.n_sword*100)));
	buffer_write(command_buffer, buffer_string, real(floor(global.m_hp*100)));
	send_all(command_buffer);

	buffer_seek(command_buffer, buffer_seek_start, 0);
	buffer_write(command_buffer, buffer_u8, code.DATA.COMMAND);
	buffer_write(command_buffer, buffer_u8, code.my_ID);
	buffer_write(command_buffer, buffer_u8, code.COMM.IMAGE);
	buffer_write(command_buffer, buffer_string, name);
	buffer_write(command_buffer, buffer_string, sprite_index);
	buffer_write(command_buffer, buffer_string, floor(image_xscale*100));
	buffer_write(command_buffer, buffer_string, floor(image_yscale*100));
	buffer_write(command_buffer, buffer_string, floor(image_index*100));
	buffer_write(command_buffer, buffer_string, floor(image_angle*100));
	buffer_write(command_buffer, buffer_string, floor(w_alpha*100));
	buffer_write(command_buffer, buffer_string, floor(image_alpha*100));
	send_all(command_buffer);
}


if image_alpha = -10
{
check_discon ++
	if check_discon > 35
	{
		if code.is_server = true
		{
		buffer_seek(code.kick_buffer, buffer_seek_start, 0);
		buffer_write(code.kick_buffer, buffer_u8, code.DATA.KICK_PLAYER);
		buffer_write(code.kick_buffer, buffer_string, real(playerID));
		buffer_write(code.kick_buffer, buffer_string, string("Server disconnetction"));
		send_all(code.kick_buffer);
		}
	instance_destroy()
	}
}
else
{
check_discon = 0
}

if gravity > 0 && !place_meeting(x,y+1.5,obj_floor) && attack_ <= 0 && attack_laser <= 0 && attack_in_air <= 0 && jump_attack <= 0 && spin_attack <= 0 && down_attack <= 0 && dash_attack <= 0 && attack_laser <= 0 && charge_attack <= 0 && sting_attack <= 0 && sprite_index = jump_sprite
{
	if image_index < 7
	{
	image_index += 1.5
	}
	else
	{
	image_index = 5
	}
}