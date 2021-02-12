/// @description Insert description here
// You can write your code in this editor
buffer_seek(code.effect_buffer, buffer_seek_start, 0);
buffer_write(code.effect_buffer, buffer_u8, code.DATA.COMMAND);
buffer_write(code.effect_buffer, buffer_u8, code.my_ID);
buffer_write(code.effect_buffer, buffer_u8, code.COMM.SPARK_EFFECT);
buffer_write(code.effect_buffer, buffer_string, global.nickname);
buffer_write(code.effect_buffer, buffer_string, string(floor(x*100)));
buffer_write(code.effect_buffer, buffer_string, string(floor(y*100)));
buffer_write(code.effect_buffer, buffer_string, string(floor(vspeed*100)));
buffer_write(code.effect_buffer, buffer_string, string(floor(hspeed*100)));
buffer_write(code.effect_buffer, buffer_string, object_get_name(object_index));
buffer_write(code.effect_buffer, buffer_string, string(sprite_index));
buffer_write(code.effect_buffer, buffer_string, string(floor(image_angle*100)));
send_all(code.effect_buffer);