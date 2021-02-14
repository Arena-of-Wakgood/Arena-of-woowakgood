/// @description Insert description here
// You can write your code in this editor
draw_self()


//$FFFFC999
//$FF7F4919
//$FF1A1A1A
//$FF331700
if image_index = 0
{
	if instance_number(light_a) > 0
	{
	gpu_set_tex_filter(true);
	draw_sprite_stretched_ext(BG_,0,0,0,room_width,room_height+((light_a.y-729)*1.5),c_white,0.75)
	gpu_set_tex_filter(false);
	
//		for(var i = 0; i <= 32+(abs(light_a.y-729)/8); i += 2)
//		{
//		draw_set_color($FF7F4919)
//		draw_set_alpha(0.04)
//		draw_line_width(0,0,room_width,0,i*64)
//		}
		
		//if light_a.y > 729
		//{
//			for(var i = 0; i <= (abs(light_a.y-729))*3.5; i += 2)
//			{
//			draw_set_color($FF1A1A1A)
//			draw_set_alpha(0.04)
//			draw_line_width(0,0,room_width,0,i*64)
//			}

		//gpu_set_tex_filter(true);
		//draw_sprite_stretched_ext(BG_,0,0,0,room_width,room_height-(abs(light_a.y-729)*3.5),c_white,0.75)
		//gpu_set_tex_filter(false);
		//}
	}
	else
	{
//		for(var i = 0; i <= 25; i += 0.5)
//		{
//		draw_set_color($FFFFC999)
//		draw_set_alpha(0.02)
//		draw_line_width(0,0,room_width,0,i*64)
//		}
	}
}

