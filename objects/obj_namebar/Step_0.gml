/// @description Insert description here
// You can write your code in this editor

dis_a_draw += (dis_a - dis_a_draw)*0.1

if keyboard_check_pressed(vk_anykey)
{
timer = -8
alpha1 = 0
}


if image_alpha < -2
{
	if dis_a = 0
	{
		if (room == menu)
		{
			if cannot_select_name <= 0
			{
				code.server = network_create_socket(network_socket_tcp);
				var res = network_connect(code.server, code.server_ip, code.server_port);
	
				if (res < 0) 
				{
				dev_mes("서버의 인원이 꽉찼거나 닫혀 있습니다.");
				}
				else 
				{
				room_goto(room_main);
				}
			}
		}
	}
	
	if dis_a = 2
	{
		if (room == menu)
		{
			if cannot_select_name <= 0
			{
			var sfx = audio_play_sound(message_sfx,0,0)
			audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
			code.server = network_create_server(network_socket_tcp, code.server_port, 10);
		
				if (code.server < 0) 
				{
				dev_mes("서버를 생성할 수 없습니다!");
				}
				else 
				{
				save_data()
				room_goto(room_main);
				code.is_server = true;
				global.b_alpha = 1
				dev_mes("F1키를 눌러 서버를 관리해주세요");
				}
			}
		}
	}
}


timer += 0.1
if timer > 40
{
alpha1 += 0.1
}



if start = 2
{
image_alpha -= 0.05
}

if activate = 1
{
	if string_length(keyboard_string) >= 13
	{
	keyboard_string = global.nickname
	
	var sfx = audio_play_sound(cannot_buy,0,0)
	audio_sound_gain(sfx,0.2*global.master_volume*2*global.sfx_volume,0)
	
	cannot_select_name = 1
	}
	
global.nickname = keyboard_string;
}

cannot_select_name -= 0.08


if activate = 0
{
	if auto_nick = 1
	{
		if global.nickname = -4
		{
		already_set_name = 0
		global.nickname = "아기뺑띠"+string(irandom_range(0,1000))
		}
	}
	else
	{
	already_set_name = 1
	}
}