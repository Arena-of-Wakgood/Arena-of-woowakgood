/// @description Insert description here
// You can write your code in this editor
draw_self()
if image_index = 0
{
	if instance_number(light_a) > 0
	{
		for(var i = 0; i <= 32+(abs(light_a.y-729)/8); i += 0.5)
		{
		draw_sprite_ext(sprite_index,1,x,0,image_xscale,i,0,c_white,0.02)
		}
		
		if light_a.y > 729
		{
			for(var i = 0; i <= (abs(light_a.y-729))*3.5; i += 0.5)
			{
			draw_sprite_ext(sprite_index,3,x,0,image_xscale,i,0,c_white,0.02)
			}
		}
	}
	else
	{
		for(var i = 0; i <= 25; i += 0.5)
		{
		draw_sprite_ext(sprite_index,1,x,0,image_xscale,i,0,c_white,0.02)
		}
	}
}
