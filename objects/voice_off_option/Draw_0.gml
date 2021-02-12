/// @description Insert description here
// You can write your code in this editor
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-250+128+128
var yy = camera_get_view_y(view_camera[0])+160+64+64+48+48+32

image_index = global.voice_option

draw_sprite_ext(sprite_index,image_index,xx,yy,image_xscale,image_xscale,0,c_white,1)
draw_text_kl_scale(xx+32,yy-10,"목소리 효과음 끄기",32,9999,image_alpha,image_blend,0,-1,font0,1/3,1/3,image_angle)