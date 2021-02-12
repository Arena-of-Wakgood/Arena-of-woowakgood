/// @description Insert description here
// You can write your code in this editor
if global.tutorial = 0
{
global.b_alpha = 2
global.t_b_alpha = 2
code.server = network_create_server(network_socket_tcp, code.server_port, 1);

room_goto(fight_room)

global.my_instance_id = instance_create_depth(2040+irandom_range(-200,200),903,-100, obj_nope);
	with(global.my_instance_id) 
	{
	name = global.nickname;
	playerID = 0;
	soc = 0;
	instance_change(player, true);
	
	alarm[1] = 1
	}
}