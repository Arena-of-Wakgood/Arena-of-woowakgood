/// @description Insert description here
// You can write your code in this editor
draw_self()
if global.now_map = 0
{
	if instance_number(light_a) > 0
	{
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,0,c_white,0.3+(light_a.y-729)/128)
	}
}
else
{
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,0,c_white,0.3)
}