if global.blocked_chat = 0
{
alarm[0] = 1
}
else
{
	if global.chat_activity = 0
	{
	global.chat_activity = !global.chat_activity;
	keyboard_string = "";
	image_index = global.chat_activity;
	}
	else
	{
		if keyboard_string != ""
		{
		var sfx = audio_play_sound(cannot_buy,0,0)
		audio_sound_gain(sfx,0.1*global.master_volume*2*global.sfx_volume,0)
		cannot_send = 1
		}
		else
		{
		global.chat_activity = !global.chat_activity;
		keyboard_string = "";
		image_index = global.chat_activity;
		}
	}
}