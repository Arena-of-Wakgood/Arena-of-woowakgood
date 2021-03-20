var v_x = global.camera_vx
var cm_width = camera_get_view_width(view_camera[0])
var cm_height = camera_get_view_height(view_camera[0])
var cm_x = camera_get_view_x(view_camera[0])
var xx = cm_x+v_x*16
var yy = camera_get_view_y(view_camera[0])+v_x*16

if global.draw_partici = 1
{
var _img_ind = 0

if ping > 5 && ping <= 10
{
_img_ind = 1
}

if ping > 10 && ping <= 15
{
_img_ind = 2
}

if ping > 15 && ping <= 20
{
_img_ind = 3
}

if ping > 25 && ping <= 30
{
_img_ind = 4
}

if ping > 35
{
_img_ind = 5
}

draw_sprite_ext(Sprite147,_img_ind,xx+camera_get_view_width(view_camera[0])*0.5-v_x*58,yy+playerID*v_x*32+v_x*70,v_x,v_x,0,c_white,1)
draw_text_k_scale(xx+camera_get_view_width(view_camera[0])*0.5-v_x*80,yy+playerID*v_x*32+v_x*64,string(playerID),v_x*64,-1,1,c_white,0,1,font0,v_x*0.35,v_x*0.35,0);
draw_text_k_scale(xx+camera_get_view_width(view_camera[0])*0.5-v_x*100,yy+playerID*v_x*32+v_x*64,string(fps_now)+"/"+string(room_sp_now)+"/"+string(ping),v_x*64,-1,1,c_white,0,1,font0,v_x*0.35,v_x*0.35,0);
draw_text_k_scale(xx+camera_get_view_width(view_camera[0])*0.5-v_x*32,yy+playerID*v_x*32+v_x*64,string(name),v_x*64,-1,1,c_white,0,-1,font0,v_x*0.35,v_x*0.35,0);
}

if x > cm_x && x < cm_x+cm_width && y > yy && y < yy+cm_height
{
var p_floor = 903

draw_sprite_ext(spr_shadow,0,x,p_floor+27,1-abs(y-p_floor)/48,1-abs(y-p_floor)/64,0,c_white,(1-abs(y-p_floor)/48)*0.3*image_alpha)
draw_sprite_ext(sprite_index,image_index,floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
}

if image_alpha > 0 && global.hp > 0
{
	if global.slow_motion = 0 && global.select_dev_setting = 0
	{
		if(global.my_instance_id == id)
		{
			if show_my_sword > 0
			{
				if global.n_sword = 0
				{
				draw_text_kl_scale(x,y-120,"비트세이버 광선검",v_x*64,-1,show_my_sword,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
				}
				
				if global.n_sword = 1
				{
				draw_text_kl_scale(x,y-120,"왁굳 에디션 광선검",v_x*64,-1,show_my_sword,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
				}
				
				if global.n_sword = 2
				{
				draw_text_kl_scale(x,y-120,"잃어버린 파란 광선검",v_x*64,-1,show_my_sword,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
				}
				
				if global.n_sword = -1
				{
				draw_text_kl_scale(x,y-120,"왁초리",v_x*64,-1,show_my_sword,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
				draw_sprite_ext(item_sword,3,x-image_xscale*2,y-64,0.75,0.75,0,c_white,show_my_sword)
				}
				else
				{
				draw_sprite_ext(item_sword,global.n_sword,x-image_xscale*2,y-64,0.75,0.75,0,c_white,show_my_sword)
				}
			}
		
		//체력바
		hp_bar_alpha += (1 - hp_bar_alpha)*0.1
			if hp_bar_alpha > 0 && global.slow_motion = 0 && global.show_challenger = 0
			{
			draw_hp += (global.hp - draw_hp)*0.1
			draw_sprite_ext(sprite20,0,xx+60*v_x,yy+32*v_x,5.2*v_x,2*v_x,0,c_white,hp_bar_alpha)
				if global.hp/max_hp > 0 && global.hp <= max_hp
				{
				draw_sprite_ext(sprite20,5,xx+64*v_x,yy+32*v_x,(global.m_hp/max_hp)*5.5*v_x,2*v_x*1.5,0,c_white,hp_bar_alpha)
				draw_sprite_ext(sprite20,1,xx+64*v_x,yy+32*v_x,(draw_hp/max_hp)*5.5*v_x,2*v_x*1.5,0,c_white,hp_bar_alpha)
				}
		
				if code.injured_effect > 0
				{
				draw_sprite_ext(sprite20,3,xx+60*v_x,yy+32*v_x,5.2*v_x,2*v_x,0,c_white,code.injured_effect)
				}
			
				if global.r_hp_alpha > 0
				{
				draw_sprite_ext(sprite20,3,xx+60*v_x,yy+32*v_x,5.2*v_x,2*v_x,0,c_red,global.r_hp_alpha)
				}
			}
	
			if hp_bar_alpha > 0 && global.slow_motion = 0 && global.show_challenger = 0
			{
			draw_stemina += (global.stemina-1 - draw_stemina)*0.1
			draw_sprite_ext(sprite20,0,xx+60*v_x,yy+64*v_x,5.2*v_x,v_x*1.5,0,c_white,hp_bar_alpha)
				if global.stemina/10 > 0
				{
				draw_sprite_ext(sprite20,4,xx+64*v_x,yy+64*v_x,(draw_stemina/10)*5.5*v_x,v_x*1.5,0,c_white,hp_bar_alpha)
				}
			}
	
			if hp_bar_alpha > 0 && global.slow_motion = 0 && global.show_challenger = 0
			{
			draw_rage += (global.rage_gauge - draw_rage)*0.1
			draw_sprite_ext(sprite20,0,xx+60*v_x,yy+96*v_x,2*v_x,2*v_x,0,c_white,hp_bar_alpha)
				if global.rage_gauge/100 > 0
				{
				draw_sprite_ext(sprite20,2,xx+64*v_x,yy+96*v_x,(draw_rage/100)*2*v_x,2*v_x,0,c_white,hp_bar_alpha)
				}
			draw_sprite_ext(sprite20,3,xx+60*v_x,yy+96*v_x,2*v_x,2*v_x,0,c_white,global.rage_w_alpha)
			}
	
		}
		else
		{
		//체력바
		hp_bar_alpha = 1
			if hp_bar_alpha > 0 && global.slow_motion = 0 && global.show_challenger = 0
			{
			draw_hp += (hp - draw_hp)*0.1
			draw_sprite_ext(sprite20,0,x-20,y+32,1,1,0,c_white,hp_bar_alpha)
				if hp/max_hp > 0
				{
				draw_sprite_ext(sprite20,5,x-18,y+32,m_hp/max_hp,1,0,c_white,hp_bar_alpha)
				draw_sprite_ext(sprite20,1,x-18,y+32,draw_hp/max_hp,1,0,c_white,hp_bar_alpha)
				}
			}
		}
	}


	if w_alpha > 0
	{
	var sprite = asset_get_index(string(sprite_get_name(string(sprite_index)))+"_white")
		if sprite_exists(sprite)
		{
		draw_sprite_ext(sprite,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,w_alpha)
		}
	}

	if show_my_sword <= 0
	{
		if abs(x-obj_camera.x) <= 450 && global.tutorial != 0
		{
			if keep_winning_ <= 1
			{
			draw_text_kl_scale(x,y-55,string(name),v_x*64,-1,draw_my_name,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
			}
			else
			{
			draw_text_kl_scale(x,y-55,string(name)+" ("+string(keep_winning_)+"연승 중)",v_x*64,-1,draw_my_name,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
			}
			
			if image_blend = c_gray
			{
			draw_sprite_ext(boss_shower,0,x,y-80,image_xscale*0.7,image_yscale*0.7,0,c_white,draw_my_name)
			draw_sprite_ext(boss_shower,1,x,y-80,image_xscale*0.7,image_yscale*0.7,0,c_white,draw_my_name*boss_alpha)
			}
		}
	}
}




//draw_text_kl_scale(x,y-v_x*64,global.show_challenger,v_x*64,-1,1,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
