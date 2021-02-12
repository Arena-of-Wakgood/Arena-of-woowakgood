/// @description Insert description here
// You can write your code in this editor
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-80
var yy = camera_get_view_y(view_camera[0])+160+64-13
draw_sprite_ext(sprite_index,1,xx,yy,1,1,0,c_white,1)
draw_sprite_ext(sprite_index,0,xx+global.bgm_volume*200,yy,1,1,0,c_white,1)

draw_text_kl_scale(xx+220,yy-18,"BGM 볼륨 "+string(global.bgm_volume*100)+"%",16,999,image_alpha,image_blend,0,-1,font0,1/3,1/3,image_angle)