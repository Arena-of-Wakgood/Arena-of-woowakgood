/// @description Insert description here
// You can write your code in this editor

for(var i = 1.1; i > 0.3; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,c_black,image_alpha*0.05)
}

for(var i = 1.4; i > 0.1; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,c_black,image_alpha*0.01)
}

for(var i = 1.3+scale_plus; i > 0.9-scale_plus; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,c_black,image_alpha*0.02)
}

for(var i = 0.6; i > 0.3; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,$FFFF00FF,image_alpha*0.01)
}

for(var i = 0.7+scale_plus; i > 0.6-scale_plus; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,$FF645FEE,image_alpha*0.02)
}

for(var i = 1+scale_plus; i > 0.6-scale_plus; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,$FF645FEE,image_alpha*0.02)
}

for(var i = 0.6; i > 0.3; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,c_red,image_alpha*0.05)
}

for(var i = 0.7+scale_plus; i > 0.6-scale_plus; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,c_red,image_alpha*0.02)
}

for(var i = 0.8+scale_plus; i > 0.6-scale_plus; i -= 0.05)
{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*i,image_yscale*i,0,$FF39206D,image_alpha*0.02)
}

