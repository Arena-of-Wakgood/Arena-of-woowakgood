/// @description Insert description here
// You can write your code in this editor
command_buffer = buffer_create(3, buffer_grow, 1);
image_speed = 0.5
_a = 1

if !place_meeting(x,y+1,obj_floor)
{
instance_destroy()
}

alarm[1] = 1