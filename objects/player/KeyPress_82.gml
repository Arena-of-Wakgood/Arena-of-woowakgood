/// @description Insert description here
// You can write your code in this editor
if global.chat_activity = false
{
if (global.nickname == name) && just_come_check = 0 && global.matching <= 0 && attacked_before = 0
{
show_my_sword = 4
draw_my_name = -1
var sfx = audio_play_sound(change_etc,0,0)
audio_sound_gain(sfx,0.04*global.master_volume*2*global.sfx_volume,0)
global.n_sword ++

	if global.n_sword > 4
	{
	global.n_sword = 0
	}
	

	if global.n_sword = 0
	{
	move_sprite = spr_move
	attack_sprite = pl_move_skeleton_attack_beat_saber
	spin_attack_sprite = pl_move_skeleton_spin_attack_beat_saber
	down_attack_sprite = pl_move_skeleton_down_attack_beat_saber
	jump_attack_sprite = pl_move_skeleton_jump_attack_beat_saber
	cancled_sprite = pl_move_skeleton_attack_cancled_beatsaber
	spin_sprite = pl_move_skeleton_spin
	jump_sprite = spr_jump
	hurt_sprite = pl_hurt
	attack_laser_sprite = pl_move_skeleton_laser_skill
	guard_sprite = pl_move_skeleton_guard_beat_saber
	sting_sprite = pl_move_skeleton_sting_skill
	attack_laser_sprite_sec = pl_move_skeleton_laser_skill_sec
	rush_slice = pl_move_skeleton_rush_slice
	}
	if global.n_sword = 1
	{
	move_sprite = spr_move
	attack_sprite = pl_move_skeleton_attack_beat_saber_green
	spin_attack_sprite = pl_move_skeleton_spin_attack_beat_saber_green
	down_attack_sprite = pl_move_skeleton_down_attack_beat_saber_green
	jump_attack_sprite = pl_move_skeleton_jump_attack_beat_saber_green
	cancled_sprite = pl_move_skeleton_attack_cancled_beatsaber_green
	spin_sprite = pl_move_skeleton_spin
	jump_sprite = spr_jump
	hurt_sprite = pl_hurt
	attack_laser_sprite = pl_move_skeleton_laser_skill_green
	guard_sprite = pl_move_skeleton_guard_green
	sting_sprite = pl_move_skeleton_sting_skill
	attack_laser_sprite_sec = pl_move_skeleton_laser_skill_sec_green
	rush_slice = pl_move_skeleton_rush_slice_green
	}
	if global.n_sword = 2
	{
	move_sprite = spr_move
	attack_sprite = pl_move_skeleton_attack_beat_saber_red
	spin_attack_sprite = pl_move_skeleton_spin_attack_beat_saber_red
	down_attack_sprite = pl_move_skeleton_down_attack_beat_saber_red
	jump_attack_sprite = pl_move_skeleton_jump_attack_beat_saber_red
	cancled_sprite = pl_move_skeleton_attack_cancled_beatsaber_red
	spin_sprite = pl_move_skeleton_spin
	jump_sprite = spr_jump
	hurt_sprite = pl_hurt
	attack_laser_sprite = pl_move_skeleton_laser_skill_red
	guard_sprite = pl_move_skeleton_guard_red
	sting_sprite = pl_move_skeleton_sting_skill
	attack_laser_sprite_sec = pl_move_skeleton_laser_skill_sec_red
	rush_slice = pl_move_skeleton_rush_slice_red
	}
	if global.n_sword = 3
	{
	move_sprite = spr_move
	attack_sprite = pl_move_skeleton_attack_beat_saber_blue
	spin_attack_sprite = pl_move_skeleton_spin_attack_beat_saber_blue
	down_attack_sprite = pl_move_skeleton_down_attack_beat_saber_blue
	jump_attack_sprite = pl_move_skeleton_jump_attack_beat_saber_blue
	cancled_sprite = pl_move_skeleton_attack_cancled_beatsaber_red
	spin_sprite = pl_move_skeleton_spin
	jump_sprite = spr_jump
	hurt_sprite = pl_hurt
	attack_laser_sprite = pl_move_skeleton_laser_skill_blue
	guard_sprite = pl_move_skeleton_guard_blue
	sting_sprite = pl_move_skeleton_sting_skill
	attack_laser_sprite_sec = pl_move_skeleton_laser_skill_sec_blue
	rush_slice = pl_move_skeleton_rush_slice_blue
	}
	if global.n_sword = 4
	{
	move_sprite = spr_move
	attack_sprite = pl_move_skeleton_attack_beat_saber_katana
	spin_attack_sprite = pl_move_skeleton_spin_attack_beat_saber_katana
	down_attack_sprite = pl_move_skeleton_down_attack_beat_saber_katana
	jump_attack_sprite = pl_move_skeleton_jump_attack_beat_saber_katana
	cancled_sprite = pl_move_skeleton_attack_cancled_beatsaber_red
	spin_sprite = pl_move_skeleton_spin
	jump_sprite = spr_jump
	hurt_sprite = pl_hurt
	attack_laser_sprite = pl_move_skeleton_laser_skill_katana
	guard_sprite = pl_move_skeleton_guard_katana
	sting_sprite = pl_move_skeleton_sting_skill
	attack_laser_sprite_sec = pl_move_skeleton_laser_skill_sec_katana
	rush_slice = pl_move_skeleton_rush_slice_katana
	}
}
}