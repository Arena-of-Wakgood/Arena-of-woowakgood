/// @description Insert description here
// You can write your code in this editor
global.shine_ef ++
if global.shine_ef > 1
{
global.shine_ef = 0
}


var sfx = audio_play_sound(message_sfx,0,0)
audio_sound_gain(sfx,0.1*global.master_volume*2*global.sfx_volume,0)