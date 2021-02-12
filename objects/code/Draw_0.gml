var v_x = global.camera_vx
var xx = camera_get_view_x(view_camera[0])+v_x*16
var yy = camera_get_view_y(view_camera[0])+v_x*16

if room = room_main && global.draw_partici = 1
{
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy,"접속자 ("+string(instance_number(player))+"명)  ["+string(600-ping_c_timer)+"s]",v_x*64,-1,1,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
}

//draw_text_kl_scale(room_width*0.5,room_height*0.2,"스페이스바를 눌러 서버 참가",v_x*64,-1,1,c_white,0,0,font0,v_x*0.4,v_x*0.4,0);



if global.fps_draw > 0
{
draw_text_k_scale(xx,yy+v_x*160,string(global.return_player_id),v_x*64,-1,1,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);

draw_text_k_scale(xx,yy+v_x*220,string(string(global.matched_pl1)+" / "+string(global.matched_pl2)+" / "+string(global.matched_pl3)+" / "+string(global.matched_pl4)),v_x*64,-1,1,c_white,0,-1,font0,v_x*0.35,v_x*0.35,0);
draw_text_k_scale(xx,yy+v_x*280,string(global.matched_pl1_ready)+" / "+string(global.matched_pl2_ready),v_x*64,-1,1,c_white,0,0,font0,v_x*0.35,v_x*0.35,0);
}

if room = room_main && global.draw_partici = 0
{
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5
var yy = camera_get_view_y(view_camera[0])

var gamemode_val_ = floor(global.gamemode_server)
var setting_buff = -4

if gamemode_val_ <= 1
{
gamemode_val_ = "1 vs 1"
}

if gamemode_val_ = 2
{
gamemode_val_ = "외나무 다리 (1 vs 1)"
setting_buff = "차지 밀치기 거리 400% 및 멘탈 게이지 충전 속도 200%"
}

if gamemode_val_ = 3
{
gamemode_val_ = "이어싸우기 (2 vs 2)"
}

if gamemode_val_ = 4
{
gamemode_val_ = "보스 레이드 (1 vs 3)"
setting_buff = "보스로 선택된 플레이어의 방어력 및 데미지 대폭 증가 합니다"
}

if gamemode_val_ = 5
{
gamemode_val_ = "강풍 (1 vs 1)"
setting_buff = "강풍에 의해 플레이어가 밀려나며, 일정 시간 마다 강풍의 방향이 바뀝니다"
}

if gamemode_val_ = 6
{
gamemode_val_ = "분조장 (1 vs 1)"
setting_buff = "멘탈 게이지 지속적으로 참 (레이지 모드 상태 제외)"
}

if gamemode_val_ = 7
{
gamemode_val_ = "아기뺑띠 (1 vs 1 vs 1 vs 1)"
setting_buff = "일정 시간이 지나면 아기뺑띠가 된 플레이어는 터집니다!"
}

draw_text_kl_scale(xx,yy+v_x*show_timer,"현재 게임 모드 :",v_x*64,-1,1,$FF7D47EE,0,0,font0,v_x*0.35,v_x*0.35,0);
draw_text_kl_scale(xx,yy+v_x*(show_timer+64),string(gamemode_val_),v_x*64,-1,1,c_white,0,0,font0,v_x*0.5,v_x*0.5,0);
	if setting_buff != -4
	{
	draw_text_kl_scale(xx,yy+v_x*(show_timer+100),string(setting_buff),v_x*64,-1,1,c_yellow,0,0,font0,v_x*0.3,v_x*0.3,0);
	}
}


var xx = camera_get_view_x(view_camera[0])
var yy = camera_get_view_y(view_camera[0])+170


if global.select_dev_setting > 0
{

var n_setting = "unknown"

if global.select_dev_setting = 1
{
n_setting = "매칭 시작"
}

if global.select_dev_setting = 2
{
n_setting = "임의 플레이어 매칭"
}

if global.select_dev_setting = 3
{
n_setting = "매치 강제 종료"
}

if global.select_dev_setting = 4
{
n_setting = "플레이어 킥"
}

if global.select_dev_setting = 5
{
n_setting = "랜덤 게임 모드 선택"
}

if global.select_dev_setting = 6
{
n_setting = "서버 리스타팅"
}

if global.select_dev_setting = 7
{
n_setting = "초대 코드 복사하기"
}

if global.select_dev_setting = 8
{
n_setting = "창 닫기"
}


	for(var i = 0; i < 8; i ++)
	{
	draw_set_color(c_black)
	draw_set_alpha(setting_alpha_real*0.16)
	draw_rectangle(xx,yy+i*3*v_x,xx+camera_get_view_width(view_camera[0]),yy+100-i*3,0)
	draw_set_alpha(1)
	}
	
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+15*v_x,"관리자 세팅",32,-1,setting_alpha_real,c_yellow,0,0,font0,1/3*v_x,1/3*v_x,0)
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+50*v_x,n_setting,32,-1,setting_alpha_real*setting_text_alpha,c_white,0,0,font0,1/2*v_x,1/2*v_x,0)
}

draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-v_x*16,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-40*v_x,"* "+string(global.dev_message),32,-1,global.dev_message_alpha,c_gray,0,1,font0,1/3*v_x,1/3*v_x,0)

var _playing_music_name = ""


if audio_is_playing(maser_bgm)
{
_playing_music_name = "Wakgood Records - Master (Don't Kill Me)"
}

if audio_is_playing(wakrio_bgm)
{
_playing_music_name = "Wakgood Records - Wak'rio"
}

if audio_is_playing(shake_it_bgm)
{
_playing_music_name = "Gark - SHAKE IT"
}

if audio_is_playing(tong_tiring)
{
_playing_music_name = "BLKFLAGZ - 통티리타랑통통"
}

if audio_is_playing(wak_surada)
{
_playing_music_name = "badassgatsby - 왁스라다 리믹스"
}

if audio_is_playing(alzaltak)
{
_playing_music_name = "Wakgood Records - Alzar Takkarsen"
}

if audio_is_playing(wak_rio)
{
_playing_music_name = "Wakgood Records - Wak'rio"
}

if audio_is_playing(bamguy_bgm)
{
_playing_music_name = "badassgatsby - 밤가이!!"
}

if show_sound_list_alpha > 0
{
	if _playing_music_name != ""
	{
	draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+(show_sound_list_y)*v_x,"Now playing",32,-1,show_sound_list_alpha,c_yellow,0,0,font0,1/3.5*v_x,1/3.5*v_x,0)
	draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+(show_sound_list_y+35)*v_x,string(_playing_music_name),32,-1,show_sound_list_alpha,c_white,0,0,font0,1/2*v_x,1/2*v_x,0)
	}
}
