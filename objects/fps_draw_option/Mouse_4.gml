/// @description Insert description here
// You can write your code in this editor
global.fps_draw ++
if global.fps_draw > 1
{
global.fps_draw = 0
}

show_debug_overlay(global.fps_draw)

var sfx = audio_play_sound(message_sfx,0,0)
audio_sound_gain(sfx,0.1*global.master_volume*2*global.sfx_volume,0)