/// @description Insert description here
// You can write your code in this editor
command_buffer = buffer_create(3, buffer_grow, 1);

keep_cre_effect = 0
a = 0
laser_dis = 0
time = 0
effect_y = 0
effect_index = 0
image_xscale = 2
image_yscale = 2
image_alpha = 1.8
image_speed = 0.6
image_angle = 0
xscale_shaker = 1
shaker_time = 0

view_shake(3,3,1)
alpha1 = 0.4



var sfx = audio_play_sound(mob_faint,false,0)
audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume*image_xscale*(1 - point_distance(x,y,player.x,player.y)/1200),0)
