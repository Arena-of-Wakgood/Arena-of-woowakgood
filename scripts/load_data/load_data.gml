// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_data()
{
ini_open_protect("Arena_of_Wakgood.ini")
//랭크
global.rank = ini_read_real("rank","a",2500);

//마스터 볼륨
global.master_volume = ini_read_real("master_volume","a",1);

//BGM 볼륨
global.bgm_volume = ini_read_real("bgm_volume","a",1);

//효과음
global.sfx_volume = ini_read_real("sfx_volume","a",1);

//풀스크린
global.full_screen = ini_read_real("full_screen","a",1);

//키세팅
global.a_key = ini_read_string("a_key","a","A")
global.q_key = ini_read_string("q_key","a","Q")
global.s_key = ini_read_string("s_key","a","S")
global.w_key = ini_read_string("w_key","a","W")
global.run_key = ini_read_string("run_key","a","Non")
global.e_key = ini_read_string("e_key","a","E")

//키 가이드
global.guide = ini_read_real("guide","a",0)

//혈흔
global.blood_effect = ini_read_real("blood_effect","a",1)

//밴당함
global.ban_from_server = ini_read_real("ban_from_server","a",0)

//랭크
global.rank = ini_read_real("rank","a",0)

//이름
global.nickname = ini_read_string("nickname","a",-4)

//연승
global.keep_winning = ini_read_real("keep_winning","a",0)

//튜토리얼
global.tutorial = ini_read_real("tutorial","a",0)

ini_close_protect()
}