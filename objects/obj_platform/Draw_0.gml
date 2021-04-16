/// @description Insert description here
// You can write your code in this editor
//var my_p = get_my_player()

draw_self()

var p_floor = 903

draw_sprite_ext(spr_shadow,0,x,p_floor+27,(1-abs(y-p_floor)/48)*3.5,(1-abs(y-p_floor)/64)*2,0,c_white,1.5*(1-abs(y-p_floor)/48)*0.3*image_alpha)


//draw_text(x,y,string(my_p.gravity)+" / "+string(my_p.vspeed))