/// @description Insert description here
// You can write your code in this editor



if special_voice_chat = 0 && (string_pos("!BT",text) != 0)
{
var sfx = audio_play_sound(buy_item,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
can_draw = 0
special_voice_chat = 1
var _a = instance_create_depth(x,y,depth-1,obj_imoji)
_a.image_index = 0
}

if special_voice_chat = 0 && (string_pos("!GZ",text) != 0)
{
var sfx = audio_play_sound(buy_item,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
can_draw = 0
special_voice_chat = 1
var _a = instance_create_depth(x,y,depth-1,obj_imoji)
_a.image_index = 1
}

if special_voice_chat = 0 && (string_pos("!DC",text) != 0)
{
var sfx = audio_play_sound(buy_item,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
can_draw = 0
special_voice_chat = 1
var _a = instance_create_depth(x,y,depth-1,obj_imoji)
_a.image_index = 2
}

if special_voice_chat = 0 && (string_pos("!sad",text) != 0 || string_pos("!SAD",text) != 0) 
{
var sfx = audio_play_sound(buy_item,0,0)
audio_sound_gain(sfx,0.12*global.master_volume*2*global.sfx_volume,0)
can_draw = 0
special_voice_chat = 1
var _a = instance_create_depth(x,y,depth-1,obj_imoji)
_a.image_index = 3
}