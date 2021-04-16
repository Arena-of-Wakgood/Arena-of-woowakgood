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

if room = room_main && global.draw_partici = 0 && global.select_dev_setting = 0
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
gamemode_val_ = "특수 능력 대전 (1 vs 1)"
setting_buff = "매 라운드 마다 진 팀은 특수한 능력 하나를 획득 합니다"
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
var yy = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])*0.35
var t_color_ = c_white

if global.select_dev_setting > 0
{
var aaa_text = "키보드 좌,우 방향키로 선택 및 F1키를 눌러 선택"

var n_setting = "unknown"
var n_setting__ = "<                                  >"

if global.select_dev_setting = 1
{
n_setting__ = "                                    >"
n_setting = "매칭 시작"
}

if global.select_dev_setting = 2
{
n_setting = "특정 플레이어 고정 매칭"
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
n_setting__ = "<"
n_setting = "창 닫기"
}

if global.select_dev_setting = 14 || global.select_dev_setting = 12 || global.select_dev_setting = 13
{
	if global.for_kick_player <= -1
	{
	n_setting__ = "                                    >"
	}
	else if global.for_kick_player > global.to_return_player_id
	{
	n_setting__ = "<"
	}
	else
	{
	var n_setting__ = "<                                  >"
	}

var name_a = "창 닫기"

	if global.for_kick_player != 0
	{
		with(player)
		{
			if playerID = global.for_kick_player
			{
			name_a = string(name)+" ("+string(global.for_kick_player)+")"
			}
		}
	}
	else
	{
	name_a = string(global.nickname)+" ("+string(global.for_kick_player)+")"
	}
n_setting = string(name_a)

	if global.for_kick_player >= 0
	{
		if global.pinged_player[global.for_kick_player] > 0
		{
		t_color_ = $FF7D47EE
		}
	}
}





	for(var i = 0; i < 48; i ++)
	{
	draw_set_color(c_black)
	draw_set_alpha(setting_alpha_real*0.1)
	draw_rectangle(xx,yy+i*5*v_x,xx+camera_get_view_width(view_camera[0]),yy-i*5*v_x,0)
	draw_set_alpha(1)
	}
	
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy-80*v_x,"관리자 세팅",32,-1,setting_alpha_real,c_yellow,0,0,font0,1/3*v_x,1/3*v_x,0)
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy,n_setting,32,-1,setting_alpha_real*setting_text_alpha,t_color_,0,0,font0,1/2*v_x,1/2*v_x,0)

draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+v_x*256,"아래 채팅창 명령어를 활용해 보세요! \n\n\n /chatban [닉네임], /pvpban [닉네임], /kick [닉네임]",32,-1,setting_alpha_real*setting_text_alpha,t_color_,0,0,font0,1/2*v_x,1/2*v_x,0)
if n_setting__ = "<"
{
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5-140*v_x,yy,n_setting__,32,-1,setting_alpha_real*setting_text_alpha,c_white,0,0,font0,1/2*v_x,1/2*v_x,0)
}
else
{
draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy,n_setting__,32,-1,setting_alpha_real*setting_text_alpha,c_white,0,0,font0,1/2*v_x,1/2*v_x,0)
}

draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+100*v_x,aaa_text,32,-1,setting_alpha_real,c_gray,0,0,font0,1/3*v_x,1/3*v_x,0)
}

draw_text_kl_scale(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-v_x*16,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-40*v_x,"* "+string(global.dev_message),32,-1,global.dev_message_alpha,c_gray,0,1,font0,1/3*v_x,1/3*v_x,0)

var _playing_music_name = ""


if audio_get_name(global.now_music) = audio_get_name(maser_bgm)
{
_playing_music_name = "Wakgood Records - Master (Don't Kill Me)"
}

if audio_get_name(global.now_music) = audio_get_name(wakrio_bgm)
{
_playing_music_name = "Wakgood Records - Wak'rio"
}

if audio_get_name(global.now_music) = audio_get_name(shake_it_bgm)
{
_playing_music_name = "Wakgood Records - Escape"
}

if audio_get_name(global.now_music) = audio_get_name(tong_tiring)
{
_playing_music_name = "Uoohbues - 붕붕붕 vs 빨리 접속하세요"
}

if audio_get_name(global.now_music) = audio_get_name(wak_surada)
{
_playing_music_name = "Wakgood Records - Party Doo"
}

if audio_get_name(global.now_music) = audio_get_name(alzaltak)
{
_playing_music_name = "Wakgood Records - Alzar Takkarsen"
}

if audio_get_name(global.now_music) = audio_get_name(wak_rio)
{
_playing_music_name = "Wakgood Records - Wak'rio"
}

if audio_get_name(global.now_music) = audio_get_name(bamguy_bgm)
{
_playing_music_name = "badassgatsby - 밤가이!!"
}

if show_sound_list_alpha > 0
{
	if _playing_music_name != ""
	{
	draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+(show_sound_list_y)*v_x*1.5,"Now playing",32,-1,show_sound_list_alpha,c_yellow,0,0,font0,1/3.5*v_x,1/3.5*v_x,0)
	draw_text_kl_scale(xx+camera_get_view_width(view_camera[0])*0.5,yy+(show_sound_list_y+35)*v_x*1.5,string(_playing_music_name),32,-1,show_sound_list_alpha,c_white,0,0,font0,1/2*v_x,1/2*v_x,0)
	}
}

