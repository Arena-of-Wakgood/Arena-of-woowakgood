/// @description Insert description here
// You can write your code in this editor
shader_set(shFlash)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
for(var i = 1; i <= 3; i ++)
{
draw_sprite_ext(sprite_index,image_index,x-i,y,image_xscale,image_yscale,image_angle,$FFCA9383,image_alpha*a/8);
draw_sprite_ext(sprite_index,image_index,x+i,y,image_xscale,image_yscale,image_angle,$FFCA9383,image_alpha*a/8);
draw_sprite_ext(sprite_index,image_index,x,y-i,image_xscale,image_yscale,image_angle,$FFCA9383,image_alpha*a/8);
draw_sprite_ext(sprite_index,image_index,x,y+i,image_xscale,image_yscale,image_angle,$FFCA9383,image_alpha*a/8);
}
shader_reset()