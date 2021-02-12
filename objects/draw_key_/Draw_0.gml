var cm_vx = obj_camera.v_x/1280
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5+location*96*cm_vx
var yy = camera_get_view_y(view_camera[0])+160*cm_vx

draw_sprite_ext(sprite95,image_index,xx,yy,cm_vx,cm_vx,0,c_white,image_alpha*0.8)

var string_ = ""
if image_index = 0 || image_index = 8
{
string_ = "<-"
}
if image_index = 1 || image_index = 9
{
string_ = "->"
}
if image_index = 2
{
string_ = "A"
}
if image_index = 3
{
string_ = string(global.s_key)
}
if image_index = 4
{
string_ = string(global.w_key)
}
if image_index = 5
{
string_ = "E"
}
if image_index = 6
{
string_ = "->"
}
if image_index = 11
{
string_ = "S"
}
if image_index = 12
{
string_ = "E"
}
if image_index = 13
{
string_ = "<-"
}
if image_index = 14
{
string_ = "->"
}
if image_index = 15
{
string_ = "Q"
}
if image_index = 16
{
string_ = "E"
}

if image_index = 6
{
draw_text_kl_scale(xx+13*cm_vx,yy,string(string_),16,9999,image_alpha,image_blend,-1,0,font0,cm_vx*1/2.5,cm_vx*1/2.5,-90)
}
else if (image_index = 13 || image_index = 14)
{
	if image_index = 14
	{
	draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.665,yy-cm_vx*8,"+",16,9999,image_alpha,image_blend,-1,0,font0,cm_vx*1/2.5,cm_vx*1/2.5,0)
	draw_text_kl_scale(xx+13*cm_vx,yy,string(string_),16,9999,image_alpha,image_blend,-1,0,font0,cm_vx*1/2.5,cm_vx*1/2.5,-90)
	}
	else
	{
	draw_text_kl_scale(xx+13*cm_vx,yy,string(string_),16,9999,image_alpha,image_blend,-1,0,font0,cm_vx*1/2.5,cm_vx*1/2.5,-90)
	}
}
else
{
draw_text_kl_scale(xx,yy-18*cm_vx,string(string_),16,9999,image_alpha,image_blend,-1,0,font0,cm_vx*1/2.5,cm_vx*1/2.5,image_angle)
}







if image_index = 0 || image_index = 1
{
draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-2*96*cm_vx-cm_vx*20,yy+85*cm_vx,"이동 (연타 하여 달리기)",16,9999,1,image_blend,0,-1,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 2
{
draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5,yy+85*cm_vx,"일반 공격 (최대 3연타)",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 3
{
draw_text_kl_scale(xx,yy+85*cm_vx,"내려 찍기\n\n\n\n(공중에서 S)\n\n\n\n[스테미나 소모]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 4
{
draw_text_kl_scale(xx,yy+85*cm_vx,"올려 치기\n\n\n\n[스테미나 소모]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 5
{
draw_text_kl_scale(xx,yy+85*cm_vx,"레이지 모드\n\n\n\n(멘탈게이지 풀 상태로 E키 꾹)",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 6
{
draw_text_kl_scale(xx,yy+85*cm_vx,"구르기",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 7
{
draw_text_kl_scale(xx,yy+85*cm_vx,"점프",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 8
{
draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5,yy+85*cm_vx,global.w_key,16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 11
{
draw_text_kl_scale(xx,yy+85*cm_vx,"돌진베기\n\n\n\n(달리기 도중 "+string(global.s_key)+")\n\n\n\n[멘탈 게이지 일부 소비]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 12
{
draw_text_kl_scale(xx,yy+85*cm_vx,"지진파\n\n\n\n[멘탈 게이지 일부 소비]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 13
{
draw_text_kl_scale(xx,yy+85*cm_vx,"가드",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 14
{
draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.665,yy+85*cm_vx,"익스플로전\n\n\n\n[멘탈 게이지 대량 소비]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}

if image_index = 15
{
draw_text_kl_scale(xx,yy+85*cm_vx,"회전 베기\n\n\n\n[스테미나 소비]",16,9999,1,image_blend,0,0,font0,cm_vx*1/3,cm_vx*1/3,image_angle)
}





if a = 0
{
	if image_alpha < 1
	{
	image_alpha += 0.05
	}
}
else
{
image_alpha -= 0.05
	if image_alpha <= 0
	{
	instance_destroy()
	}
}