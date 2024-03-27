/// @description Insert description here
// You can write your code in this editor
if global.in_practice = 0
{
buffer_seek(command_buffer, buffer_seek_start, 0);
buffer_write(command_buffer, buffer_u8, global.DATA_COMMAND);
buffer_write(command_buffer, buffer_u8, code.my_ID);
buffer_write(command_buffer, buffer_u8, global.COMM_ATTACK_EFFECT);
buffer_write(command_buffer, buffer_string, global.nickname);
buffer_write(command_buffer, buffer_string, real(floor(x*100)));
buffer_write(command_buffer, buffer_string, real(floor(y*100)));
buffer_write(command_buffer, buffer_string, real(floor(image_xscale*100)));
buffer_write(command_buffer, buffer_string, real(floor(image_yscale*100)));
buffer_write(command_buffer, buffer_string, real(floor(image_angle*100)));
buffer_write(command_buffer, buffer_string, real(floor(image_index*100)));
buffer_write(command_buffer, buffer_string, object_get_name(object_index));
buffer_write(command_buffer, buffer_string, sprite_get_name(sprite_index));
buffer_write(command_buffer, buffer_string, real(floor(image_alpha*100)));
send_all(command_buffer);
}