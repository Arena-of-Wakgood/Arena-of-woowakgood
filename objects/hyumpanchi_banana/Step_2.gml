/// @description Insert description here
// You can write your code in this editor

if knocked_down_ef = 0
{
	if hp <= 0
	{
	knocked_down_ef = 1
	}
}

if knocked_down_ef > 0
{
cannot_move = 1
hit_motion = 1
sprite_index = hurt_sprite
movement_speed += (0 - movement_speed)*0.1

	if place_meeting(x,y+1,obj_floor)
	{
	image_index = 1
	}
	knocked_down_ef = 999
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(x+irandom_range(-5,5),y+irandom_range(-5,5),depth-1,pepsi_effect_received)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
	
	var sfx = audio_play_sound(mob_faint,0,0)
	audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
	
	
	if knocked_down_ef > 100
	{
	instance_destroy()
	}
}

if hit_cooltime > 0
{
t_x = x
hit_stand_up = 1
}

if hit_stand_up = 1
{
cannot_move = 1
}


if place_meeting(x,y,effect)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	

	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)

	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	hp_minus_for_mob(27+global.skill_turning_attack*2)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*1.8
	hit_cooltime = 1
	last_hit = 1
	vspeed = -1
	alarm[1] = 10
	cannot_move = 1
	alarm[2] = 24
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}

if place_meeting(x,y,effect_jump_attack)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_jump_attack)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)

	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	view_shake(3,3,3)
	
	hp_minus_for_mob(21+global.skill_jump_attack*2)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	

	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*0.4
	hit_cooltime = 1
	last_hit = 1
	vspeed = -4.1
	alarm[1] = 5
	cannot_move = 1
	alarm[2] = 24
	gravity_ignore = 1
	alarm[3] = 9
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}


if place_meeting(x,y,effect_down_attack)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_down_attack)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	hp_minus_for_mob(18)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*0.9
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.36
	vspeed += 4
	alarm[1] = 3
	cannot_move = 1
	alarm[2] = 24
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}





if place_meeting(x,y,effect_attack1)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_attack1)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	

	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)

	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	hp_minus_for_mob(16)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*2
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.36
	vspeed += 4
	alarm[1] = 13
	cannot_move = 1
	alarm[2] = 24
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}




if place_meeting(x,y,effect_attack2)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_attack2)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	view_shake(7,13.5,4)
	
	hp_minus_for_mob(19)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	

	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*2
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 1.5
	alarm[1] = 10
	cannot_move = 1
	alarm[2] = 24
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}





if place_meeting(x,y,effect_attack3)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_attack3)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	view_shake(7,60,4)
	
	hp_minus_for_mob(26)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*2.5
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 3.5
	alarm[1] = 10
	cannot_move = 1
	alarm[2] = 18
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}



if place_meeting(x,y,effect_attack_s)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_attack_s)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	var skill_red_ball_effect_rage = instance_create_depth(x,y,depth-1,red_circle_effect)
	skill_red_ball_effect_rage.image_xscale = 0.45
	skill_red_ball_effect_rage.image_yscale = 0.45
	skill_red_ball_effect_rage.t_scale = 0.65
	skill_red_ball_effect_rage.alarm[11] = 7
	
	view_shake(7,12,4)
	
	hp_minus_for_mob(32)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	movement_speed += __i*2.5
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 3.8
	alarm[1] = 20
	cannot_move = 1
	alarm[2] = 48
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}





if place_meeting(x,y,rage_mode_knockback) || place_meeting(x,y,down_effect)
{
	if hit_cooltime = 0
	{
	alarm[5] = 90
	
	hp_minus_for_mob(0)
	
	movement_speed = 0
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 3.8
	alarm[1] = 16
	cannot_move = 1
	alarm[2] = 16
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}




if place_meeting(x,y,ef_blood_dash_attack)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,ef_blood_dash_attack)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	

	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,1)
	view_shake(7,12,4)
	hp_minus_for_mob(92)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	

	movement_speed += __i*2.5
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 0.5
	alarm[1] = 20
	cannot_move = 1
	alarm[2] = 48
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}


if place_meeting(x,y,charging_attack)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,charging_attack)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)

	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,0)
	view_shake(1,4,2)
	hp_minus_for_mob(62)

	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	
	gravity = 0.2
	y --
	vspeed -= 4
	movement_speed = -player.image_xscale*13
	hit_cooltime = 1
	last_hit = 1
	alarm[1] = 25
	cannot_move = 1
	alarm[2] = 25
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}


if place_meeting(x,y,effect_special_skill_sec)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_special_skill_sec)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	

	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	var skill_red_ball_effect_rage = instance_create_depth(x,y,depth-1,red_circle_effect)
	skill_red_ball_effect_rage.image_xscale = 0.45
	skill_red_ball_effect_rage.image_yscale = 0.45
	skill_red_ball_effect_rage.t_scale = 0.65
	skill_red_ball_effect_rage.alarm[11] = 7
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,0)
	view_shake(1,4,2)
	hp_minus_for_mob(7)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	

	movement_speed += __i*2.5
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 0.1
	alarm[1] = 3
	cannot_move = 1
	alarm[2] = 3
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}




if place_meeting(x,y,effect_special_skill)
{
	if hit_cooltime = 0
	{
	var _attacker_ef = instance_place(x,y,effect_special_skill)
	var sfx = audio_play_sound(choose(global.hit_sfx_1,global.hit_sfx_2,global.hit_sfx_3),0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	

	var sfx = audio_play_sound(sparking_sound,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	if place_meeting(x,y+1,obj_floor)
	{
	y -= 1
	}
	vspeed -= 0.6
	
	t_hp_bar_alpha = 1
	alarm[5] = 90
	
	var skill_red_ball_effect_rage = instance_create_depth(x,y,depth-1,red_circle_effect)
	skill_red_ball_effect_rage.image_xscale = 0.45
	skill_red_ball_effect_rage.image_yscale = 0.45
	skill_red_ball_effect_rage.t_scale = 0.65
	skill_red_ball_effect_rage.alarm[11] = 7
	
	
	bloody(_attacker_ef.x,_attacker_ef.y,0)
	view_shake(1,4,2)
	hp_minus_for_mob(22)
	
	movement_speed = 0
	var __i = sign(x - player.x)
	if __i = 0
	{
	__i = choose(-1,1)
	}
	
	

	movement_speed += __i*4.3
	hit_cooltime = 1
	last_hit = 1
	gravity = 0.2
	vspeed -= 1
	alarm[1] = 3
	cannot_move = 1
	alarm[2] = 3
		if hit_motion = 0
		{
		hit_motion = 1
		}
	}
}
