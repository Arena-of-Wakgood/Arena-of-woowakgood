/// @description Insert description here
// You can write your code in this editor
var _rain_ef = instance_create_depth(mouse_x,mouse_y,obj_camera.depth+15,rain_effect)
_rain_ef.image_angle = 270+global.wind_dir+90
_rain_ef.direction = 270+global.wind_dir+90
_rain_ef.vspeed = irandom_range((6.7*3.5+(global.wind_dir*0.1))*1000,(13*3.5+(global.wind_dir*0.1))*1000)/1000
_rain_ef.image_xscale = irandom_range(0.2*3*10,0.8*3*10)/10
_rain_ef.image_yscale = irandom_range(0.2*3*10,0.8*3*10)/10
_rain_ef.ignore_floor = percentage_k(40)