function hp_minus_for_player(argument0,argument1) 
{
bloody(x,y,1)
var random_val = percentage_k(25+global.critical_plus_multi*10)
var img_bnd = c_white
var argu_0 = argument0

	if random_val = 1
	{
	var random_plus_damage = irandom_range(-5,15)
	}
	else
	{
	var random_plus_damage = 0
	}
	
	if argu_0 <= 0
	{
	random_plus_damage = 0
	}
	
	var calcul_damage = (argu_0+random_plus_damage)
	
	if global.gamemode_server = 4
	{
		if playerID = global.matched_pl1
		{
		argu_0 = (floor((argu_0/3)*100))/100
		calcul_damage = (floor((calcul_damage/3)*100))/100
		}
		else
		{
		argu_0 = (floor((argu_0*1.5)*100))/100
		calcul_damage = (floor((calcul_damage*1.5)*100))/100
		}
	}

	var d_ef = instance_create_depth(player.x,player.y,depth-1,draw_hp_m)
	d_ef.d_text = (calcul_damage)

	
	if calcul_damage <= argu_0
	{
	img_bnd = $FF1E9DFF
	d_ef.image_blend = img_bnd
	view_shake(3,4,2)
	}
	else
	{
	var sfx = audio_play_sound(critical_sfx,0,0)
	audio_sound_gain(sfx,0.05*global.master_volume*2*global.sfx_volume,0)

	img_bnd = $FF6D19FF
	d_ef.image_blend = img_bnd
	view_shake(4,6.8,4)
	d_ef.image_xscale = 1.1
	d_ef.image_yscale = 1.1
	
	
	var __i = choose(-1,1)
	var bl_ef = instance_create_depth(x,y,depth-1,ef_blood)
	var img_scale = -__i*irandom_range(8,15)/5
	bl_ef.image_xscale = img_scale
	bl_ef.image_yscale = abs(img_scale)
	bl_ef.t_x = __i
	bl_ef.image_angle = irandom_range(-90,90)
	
	var random_val_t = percentage_k(10)
	
		if random_val_t = 1
		{
		global.w_alpha = 1
		}
	}


	if global.hp > 0 && (calcul_damage) > 0
	{
		if global.gamemode_server = 2
		{
		global.rage_gauge += 10
		}
		else
		{
		global.rage_gauge += 5
		}


		if global.hp != code.before_hp
		{
		code.injured_effect = 1
		code.before_hp = global.hp
		}

		if calcul_damage <= argu_0
		{
		img_bnd = $FF1E9DFF
		d_ef.image_blend = img_bnd
		view_shake(4,0,10)
		}
		else
		{
		img_bnd = $FF6D19FF
		d_ef.image_blend = img_bnd
		view_shake(4,0,15)
		}
	}
	
	if argument1.attack_owner != -4
	{
	buffer_seek(command_buffer, buffer_seek_start, 0);
	buffer_write(command_buffer, buffer_u8, global.DATA_COMMAND);
	buffer_write(command_buffer, buffer_u8, code.my_ID);
	buffer_write(command_buffer, buffer_u8, global.COMM_ATTACKER_GET_RAGE);
	buffer_write(command_buffer, buffer_string, argument1.attack_owner);
	buffer_write(command_buffer, buffer_string, string(floor((calcul_damage)*4)));
	buffer_write(command_buffer, buffer_string, string(floor((calcul_damage)*100)));
	buffer_write(command_buffer, buffer_string, string(floor((argu_0)*100)));
	send_all(command_buffer);
	}

	
global.hp -= (calcul_damage)*(100-global.max_armor_plus*15+global.damage_plus_multi*10)/100
}
