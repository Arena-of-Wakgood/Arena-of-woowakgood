function hp_minus_for_mob(argument0) {
	var random_val = choose(0,0,0,1)
	
	if random_val = 1
	{
	var random_plus_damage = irandom_range(-5,15)
	}
	else
	{
	var random_plus_damage = 0
	}
	
	
	if global.now_music = wak_rio
	{
	var damage_calcul = ((argument0+random_plus_damage)*1.5)/armored_level;
	}
	else
	{
	var damage_calcul = ((argument0+random_plus_damage)/armored_level);
	}

	
	if argument0 <= 0
	{
	random_plus_damage = 0
	view_shake(2,2,1)
	}
	
	if argument0 > 0
	{
	hp -= damage_calcul
	var d_ef = instance_create_depth(x,y,depth-1,draw_hp_m)
	d_ef.d_text = damage_calcul
	
	
	
	if argument0+random_plus_damage <= argument0
	{
	d_ef.image_blend = $FF1E9DFF
	view_shake(3,4,2)
	}
	else
	{
	var sfx = audio_play_sound(critical_sfx,0,0)
	audio_sound_gain(sfx,0.05*global.master_volume*2*global.sfx_volume,0)

	d_ef.image_blend = $FF6D19FF
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
	global.w_alpha = 1
	}
	}





	if argument0 > 0
	{
		if instance_number(effect_special_skill) = 0 && instance_number(effect_attack_s) = 0
		{
		global.rage_gauge += 1.2
			if global.awakening > 1 && global.stop_awakening = 0
			{
			global.awakening += 0.15
			}
		}
	}




	if global.awakening > 1 && argument0 > 0
	{
	global.awakening += 0.0011
	}


}
