/// @description Insert description here
// You can write your code in this editor
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5
var yy = camera_get_view_y(view_camera[0])
var v_x_ = obj_camera.v_x/1280
draw_text_kl_scale(xx,yy+v_x_*show_timer,string(global.timer/60)+"초",v_x_*64,-1,1,c_white,0,0,font0,v_x_*0.35,v_x_*0.35,0);