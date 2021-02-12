/// @description Insert description here
// You can write your code in this editor
depth = -999998

draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(0,0,9999,9999,0)

var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-120
var yy = camera_get_view_y(view_camera[0])+120-10

draw_set_alpha(1)
draw_set_color(c_gray)
draw_rectangle(xx-160,yy,xx+460,yy+198+270+48,0)

draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(xx-160,yy,xx+460,yy+198+270+48,1)
draw_rectangle(xx-161,yy-1,xx+461,yy+199+270+48,1)



var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-80
var yy = camera_get_view_y(view_camera[0])+160
draw_sprite_ext(sprite_index,1,xx,yy,1,1,0,c_white,1)
draw_sprite_ext(sprite_index,0,xx+global.master_volume*200,yy,1,1,0,c_white,1)

draw_text_kl_scale(xx+220,yy-18,"마스터 볼륨 "+string(global.master_volume*100)+"%",16,999,image_alpha,image_blend,0,-1,font0,1/3,1/3,image_angle)