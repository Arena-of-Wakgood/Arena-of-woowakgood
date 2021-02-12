if(global.chat_activity)
{
	if keyboard_string != "" && string_length(keyboard_string) <= 40
	{
	buffer_seek(chat_buffer, buffer_seek_start, 0);
	
	buffer_write(chat_buffer, buffer_u8, DATA.CHAT);
	buffer_write(chat_buffer, buffer_string,string(global.nickname)+" : "+keyboard_string);
	buffer_write(chat_buffer, buffer_string,global.nickname);
	
	send_all(chat_buffer);
		if (code.is_server)
		{
			if global.matching > 0
			{
			chat_up(string(global.nickname)+" : "+string(keyboard_string),global.nickname,-1);
			}
			else
			{
			chat_up(string(global.nickname)+" : "+string(keyboard_string),global.nickname,1);
			}
		}
	keyboard_string = "";
	}
	else
	{
	var sfx = audio_play_sound(cannot_buy,0,0)
	audio_sound_gain(sfx,0.1*global.master_volume*2*global.sfx_volume,0)
	cannot_send = 1
	}
}


global.chat_activity = !global.chat_activity;
keyboard_string = "";
image_index = global.chat_activity;