// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_data()
{
ini_open_protect("Arena_of_Wakgood.ini")
//랭크
ini_write_real("rank","a",global.rank);

//마스터 볼륨
ini_write_real("master_volume","a",global.master_volume);

//BGM 볼륨
ini_write_real("bgm_volume","a",global.bgm_volume);

//효과음
ini_write_real("sfx_volume","a",global.sfx_volume);

//풀스크린
ini_write_real("full_screen","a",global.full_screen);

//키세팅
ini_write_string("a_key","a",global.a_key)
ini_write_string("q_key","a",global.q_key)
ini_write_string("s_key","a",global.s_key)
ini_write_string("w_key","a",global.w_key)
ini_write_string("run_key","a",global.run_key)
ini_write_string("e_key","a",global.e_key)

//키 가이드
ini_write_real("guide","a",global.guide)

//혈흔
ini_write_real("blood_effect","a",global.blood_effect)

//밴당함
ini_write_real("ban_from_server","a",global.ban_from_server)

//랭크 저장
ini_write_real("rank","a",global.rank)

//이름 저장
ini_write_string("nickname","a",global.nickname)

//연승
ini_write_real("keep_winning","a",global.keep_winning)

//튜토리얼
ini_write_real("tutorial","a",global.tutorial)



ini_close_protect()
}