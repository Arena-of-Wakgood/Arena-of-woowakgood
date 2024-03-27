/// @description Insert description here
// You can write your code in this editor
if global.in_practice = 0 && global.blocked_pvp = 0
{
	if received = 0
	{
	buffer_seek(command_buffer, buffer_seek_start, 0);
	buffer_write(command_buffer, buffer_u8, global.DATA_COMMAND);
	buffer_write(command_buffer, buffer_u8, code.my_ID);
	buffer_write(command_buffer, buffer_u8, global.COMM_DOWM_EFFECT);
	buffer_write(command_buffer, buffer_string, global.nickname);
	buffer_write(command_buffer, buffer_string, floor(100*t_image_xscale));
	buffer_write(command_buffer, buffer_string, floor(100*t_image_yscale));
	buffer_write(command_buffer, buffer_string, x);
	send_all(command_buffer);
	}
}