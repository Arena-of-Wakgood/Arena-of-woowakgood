/// @description Insert description here
// You can write your code in this editor
//draw_text(x,y,string(t_x)+"/"+string(t_y))
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])
var yy = camera_get_view_y(view_camera[0])
var yy2 = yy+camera_get_view_height(view_camera[0])
var v_x_ = obj_camera.v_x/1280









if global.shine_ef = 0
{
draw_set_color(c_white)
draw_set_alpha(global.w_alpha)
draw_rectangle(0,0,room_width,room_height,0)
draw_set_alpha(1)
}

draw_set_color(c_black)
draw_set_alpha(global.b_alpha)
draw_rectangle(0,0,room_width,room_height,0)
draw_set_alpha(1)



if room != menu
{
	if global.slow_motion = 0 && global.show_challenger = 0 && global.matching != 2 && global.select_dev_setting = 0
	{
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+40*v_x_,"HP",(v_x_)*76,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+72*v_x_,"Stemina",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+101*v_x_,"Mental",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	
	if global.n_sword = -1
	{
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+160*v_x_,"SA : 익스플로전 / 돌진 베기 사용 불가 및 일부 공격 판정이 작아짐",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.3,v_x_*0.3,0);
	}
	
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+128*v_x_,"Rank : "+string(floor(global.draw_rank)),v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
		if global.draw_now_rank > 0
		{
		var _color = $FF7D47EE
	
			if global.draw_rank < global.rank
			{
			_color = $FFF7D06D
			}
		draw_text_k_scale(camera_get_view_x(view_camera[0])+v_x_*16,yy+128*v_x_,"Rank : "+string(floor(global.draw_rank)),v_x_*64,-1,global.draw_now_rank,_color,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
		}
	}

	
	if global.guide = 1 && global.chat_activity = false && global.slow_motion = 0 && global.show_challenger = 0
	{
	draw_set_color(c_black)
	draw_set_alpha(0.7)
	draw_rectangle(xx,yy2,xx-v_x_*642,yy2-v_x_*176,0)
	draw_set_alpha(1)


	draw_text_kl_scale(xx-v_x_*636,yy2-v_x_*170,"기본공격 (A)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*636,yy2-v_x_*170+v_x_*32,"달리기 (좌우 방향키 연타)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*636,yy2-v_x_*170+v_x_*82,"접속자 목록 (Tab)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*636,yy2-v_x_*170+v_x_*114,"환경 설정 (ESC)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*636,yy2-v_x_*170+v_x_*146,"무기 변경 (R)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);

	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170,"기본 스킬(스테미나 소모) : ",v_x_*64,-1,1,$FFF7D06D,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170+v_x_*50,"회전베기 (Q)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170+v_x_*82,"올려치기 (W)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170+v_x_*114,"내려찍기 (S)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170+v_x_*146,"차지 (달리기 도중 A)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*436,yy2-v_x_*170+v_x_*178,"가드 (위 방향키)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);

	draw_text_kl_scale(xx-v_x_*8,yy2-v_x_*210,"(G키로 가이드 열고 닫기)",v_x_*64,-1,1,c_white,0,1,font0,v_x_*0.3,v_x_*0.3,0);
	draw_text_kl_scale(xx-v_x_*236,yy2-v_x_*170,"특수 스킬(멘탈 게이지 소모) : ",v_x_*64,-1,1,$FF7D47EE,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*236,yy2-v_x_*170+v_x_*50,"돌진 베기 (달리기 도중 S)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*236,yy2-v_x_*170+v_x_*82,"지진파 (E)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*236,yy2-v_x_*170+v_x_*114,"익스플로전 (아래 방향키 + E)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	draw_text_kl_scale(xx-v_x_*236,yy2-v_x_*170+v_x_*146,"레이지 모드 (E키 꾹 누르기)",v_x_*64,-1,1,c_white,0,-1,font0,v_x_*0.35,v_x_*0.35,0);
	}
}








var xx = camera_get_view_x(view_camera[0])
var yy = camera_get_view_y(view_camera[0])
var xxx = camera_get_view_width(view_camera[0])
var yyy = camera_get_view_height(view_camera[0])

if global.playing_scene > 0
{
	if global.playing_scene_black_bg < 125
	{
	global.playing_scene_black_bg ++
	}
global.playing_scene_black_bg += (125 - global.playing_scene_black_bg)*0.01
}
else
{
	if global.playing_scene_black_bg > 0
	{
	global.playing_scene_black_bg --
	}
global.playing_scene_black_bg += (-1 - global.playing_scene_black_bg)*0.01
}

if global.playing_scene_black_bg > 0
{
draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(xx,yy,xx+xxx,yy+global.playing_scene_black_bg*obj_camera.v_y/1000,0)
draw_rectangle(xx,yy+yyy,xx+xxx,yy+yyy-global.playing_scene_black_bg*obj_camera.v_y/1000,0)
}





