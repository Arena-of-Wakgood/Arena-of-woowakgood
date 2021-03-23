function chat_up(argument0,argument1,argument2) 
{
var chating = argument0;

	for(var i = 0; i < 32; i++)
	{
	obj_chatbox.chat[32 - i] = obj_chatbox.chat [31 - i];
	}
	
obj_chatbox.chat[0] = string(chating);

	if instance_number(player) > 0
	{
		with(player)
		{
			if argument1 = name
			{
				if p_mes != -1
				{
				instance_destroy(p_mes)
				p_mes = -1
				}

				if global.in_practice = 0
				{
					if p_mes = -1 && (argument2 > 0 || argument1 = global.matched_pl1_name || argument1 = global.matched_pl2_name || argument1 = global.matched_pl3_name || argument1 = global.matched_pl4_name)
					{
					p_mes = instance_create_depth(x,y,depth-1,player_message)
					p_mes.text = string(chating)
					p_mes.target = self.id
					p_mes.alarm[2] = 160
					}
					else
					{
					var _cre_message = 0
					var cal_text = string_replace(chating,string(argument1)+" : ","")
						with(obj_andience1)
						{
							if _cre_message = 0 && p_mes = -1
							{
							_cre_message = 1
							p_mes = instance_create_depth(x,y,depth-1,player_message_for_audience)
							p_mes.text = string(cal_text)
							p_mes.target = self.id
							p_mes.alarm[2] = 120
							}
						}
					
						with(obj_andience11)
						{
							if _cre_message = 0 && p_mes = -1
							{
							_cre_message = 1
							p_mes = instance_create_depth(x,y,depth-1,player_message_for_audience)
							p_mes.text = string(cal_text)
							p_mes.target = self.id
							p_mes.alarm[2] = 120
							}
						}
					
						with(obj_andience111)
						{
							if _cre_message = 0 && p_mes = -1
							{
							_cre_message = 1
							p_mes = instance_create_depth(x,y,depth-1,player_message_for_audience)
							p_mes.text = string(cal_text)
							p_mes.target = self.id
							p_mes.alarm[2] = 120
							}
						}
					}
				}
			}
		}
	}
}
