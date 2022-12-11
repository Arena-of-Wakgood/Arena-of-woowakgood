/// @description Insert description here
// You can write your code in this editor
image_xscale = 1.5
image_yscale = 2
command_buffer = buffer_create(3, buffer_grow, 1);
if !place_meeting(x,y+1,obj_floor)
{
instance_destroy()
}

image_alpha = 4
alpha1 = 0
alpha2 = 1.2

//var sfx = audio_play_sound(mob_faint,0,0)
var sfx = audio_play_sound(mob_faint,false,0)
audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume*image_xscale*(1 - point_distance(x,y,player.x,player.y)/1200),0)

alarm[1] = 1
alarm[3] = 1