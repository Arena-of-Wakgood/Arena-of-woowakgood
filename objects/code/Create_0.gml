window()


////////////////////////////////////////////////////////////////////////

send_request = http_ip_get(""); //Enter your website here between "", if nothing is entered, a request is send to icanhazip.com
my_ip = "" //Initialize ip variable
error = "" //Initialize error variable
text_color = 0 //Initialize text color variable
ip_for_calcul = ""
created_platfrom = 0

///////////////////////////////////////////////////////////////////////

th_afas = 0
room_speed = 60
server_ip = "192.168.0.5"//"211.192.230.184";//"208.67.222.222";
server_port = 42524;
is_server = false;
sepa_power = 0
now_recieving = 0
sepa_alpha = 0
check_winner = 0
ability_choosing_time = 0
ability_choosing_time_f_d = 0
show_sound_list = 0
show_sound_list_y = 0
global.for_kick_player = 0
global.now_map = 2
b_map = global.now_map
global.guide_message_chat = 0
global.m_hp = 1000
global.use_final_skill = 0
global.now_music = 0
force_mapchange_ = 0
show_sound_list_alpha = 0
global.blocked_pvp = 0
global.blocked_chat = 0

global.pinged_player_num = 0
for(var i = 0; i < 40; i++)
{
global.pinged_player[i] = -1
}

index = 0;
draw_set_font(font0);
randomize()

ping_c_timer = 0
for(var i = 0; i <= 25; i++)
{
ping_checker[i] = 0
ping_checker_start[i] = 0
}
change_weather = 0
change_weather_max = 0
stack_lcq = 0
global.low_quality = 0

global.imoji_cooldown = 0
largely_before_gamemode = 0
global.nickname = "아기 뺑띠"+string(irandom(999));
global.n_sword = 0
global.select_dev_setting = 0
global.r_hp_alpha = 0
global.dev_message = 0
global.dev_message_alpha = 0
setting_alpha = 0
setting_alpha_real = 0
setting_text_alpha = 0
auto_des = 0
enum DATA {
	INIT_DATA,
	CHAT,
	ONE_DATA,
	MUCH_DATA,
	ADD_CLI,
	REMOVE_CLI,
	COMMAND,
	CHECKING_,
	ANTI_CHEATING,
	MATCH_START,
	MATCHING_NOW,
	MATCH_END,
	READY_TO_FIGHT,
	WEATHER,
	SLOW_MOTION,
	MATCHING_ABLE,
	SEND_NAME,
	DISCONECTON,
	KICK_PLAYER,
	GET_REAL_ID,
	SEND_WINNINGS,
	SAVE_PLAYERS_RANK,
	GAMEMODE_SELECTING,
	GAMEMODE_SELECTED,
	_RED_CIRCLE_EFFECT
}
enum COMM {
	POSITION,
	PING_CHECK,
	PING_CHECK_RECEIVED_SERVER,
	IMAGE,
	SFX,
	VIEW_SHAKE,
	DOWM_EFFECT,
	ATTACK_EFFECT,
	SPARK_EFFECT,
	BUBLE_EFFECT,
	ATTACKER_GET_RAGE,
	RUSH_ATTACK_EFFECT,
	IMAGE_FOR_CAMERA,
	PING_CHECK_RECEIVED_CLI,
	PING_CHECK_RECEIVED_SERVER_AC,
	MUSIC_SYNC,
	PLATFORM_T,
	P_DAMAGE
}


global.DATA_COMMAND = DATA.COMMAND;
global.DATA_SEND_NAME = DATA.SEND_NAME;
global.DATA_SAVE_PLAYERS_RANK = DATA.SAVE_PLAYERS_RANK;
global.DATA_READY_TO_FIGHT = DATA.READY_TO_FIGHT;
global.DATA_SLOW_MOTION = DATA.SLOW_MOTION;
global.DATA_KICK_PLAYER = DATA.KICK_PLAYER;
global.DATA__RED_CIRCLE_EFFECT = DATA._RED_CIRCLE_EFFECT;

global.COMM_POSITION = COMM.POSITION;
global.COMM_PING_CHECK = COMM.PING_CHECK;
global.COMM_PING_CHECK_RECEIVED_SERVER = COMM.PING_CHECK_RECEIVED_SERVER;
global.COMM_IMAGE = COMM.IMAGE;
global.COMM_SFX = COMM.SFX;
global.COMM_VIEW_SHAKE = COMM.VIEW_SHAKE;
global.COMM_DOWM_EFFECT = COMM.DOWM_EFFECT;
global.COMM_ATTACK_EFFECT = COMM.ATTACK_EFFECT;
global.COMM_SPARK_EFFECT = COMM.SPARK_EFFECT;
global.COMM_BUBLE_EFFECT = COMM.BUBLE_EFFECT;
global.COMM_ATTACKER_GET_RAGE = COMM.ATTACKER_GET_RAGE;
global.COMM_IMAGE_FOR_CAMERA = COMM.IMAGE_FOR_CAMERA;
global.COMM_PING_CHECK_RECEIVED_CLI = COMM.PING_CHECK_RECEIVED_CLI;
global.COMM_PING_CHECK_RECEIVED_SERVER_AC = COMM.PING_CHECK_RECEIVED_SERVER_AC;
global.COMM_MUSIC_SYNC = COMM.MUSIC_SYNC;
global.COMM_PLATFORM_T = COMM.PLATFORM_T;
global.COMM_P_DAMAGE = COMM.P_DAMAGE;

ping_buffer = buffer_create(2, buffer_grow, 1);
info_buffer = buffer_create(2, buffer_grow, 1);
dis_buffer = buffer_create(2, buffer_grow, 1);
one_buffer = buffer_create(2, buffer_grow, 1);
much_buffer = buffer_create(2, buffer_grow, 1);
command_buffer = buffer_create(2, buffer_grow, 1);
rain_buffer = buffer_create(2, buffer_grow, 1);
matching_buffer = buffer_create(2, buffer_grow, 1);
connection_buffer = buffer_create(2, buffer_grow, 1);
kick_buffer = buffer_create(2, buffer_grow, 1);
effect_buffer = buffer_create(2, buffer_grow, 1);
music__buffer = buffer_create(2, buffer_grow, 1);
gamemode_select_buffer = buffer_create(2, buffer_grow, 1);
gamemode_select = 0
max_gamemode_select = 0
max_gamemode_select_sfx = 0
b_gamemode = 1
_mes_gamemode = -4
music_selected = -4
b_music_selected = -4
my_ID = 0;
global.my_instance_id = 0;
global.clients = ds_list_create();
list_names = ds_list_create();
list_vals = ds_list_create();
list_types = ds_list_create();

depth = -99999

global.master_volume = 1
global.sfx_volume = 1
global.bgm_volume = 1
global.fps_draw = 0
global.in_practice = 0

global.test_mode = 1
global.build_ver = 24;
global.draw_partici = 0
forced_end_game = 0

global.never_move = 0
global.awakening = 0
global.stemina_cooltime = 0
global.rage_w_alpha = 0
r_w_alpha_time = 0
global.voice_option = 0
global.shine_ef = 0
global.chat_activity = false;
global.playing_scene = 0
global.playing_scene_black_bg = 0
global.tip_alpha = 0
show_timer = -120

global.gamemode = 1
global.gamemode_server = 0
global.show_challenger = 0

global.full_screen = 0
global.skill_jump_attack = 2
global.w_key = "W"
global.q_key = "Q"
global.a_key = "A"
global.run_key = vk_shift
global.e_key = "E"
global.s_key = "S"
global.rage_gauge = 0
global.awakening = 0
global.skill_turning_attack = 2
global.skill_jump_attack = 2
global.stop_awakening = 0
global.movement_speed = 0
global.cannot_use_stemina = 0
global.hp = 1000
global.p_floor = 903
global.stemina = 0
global.tutorial = 0

global.hit_sfx_1 = hit_sfx1
global.hit_sfx_2 = hit_sfx2
global.hit_sfx_3 = hit_sfx3
global.blood_effect = 1
global.can_send_shake = 0

global.server_build_ver = -4;

global.matching = 0
global.rank = 0
global.draw_rank = 0
global.draw_now_rank = 0
global.l_q_grap = 0
global.snow_effect_distance = 0
global.snowflake_amount = 0
global.ban_from_server = 0
sended_rain = 0


global.rainy = 0
global.wind_dir = 0

global.matched_pl1_name = -4
global.matched_pl2_name = -4

global.matched_pl3_name = -4
global.matched_pl4_name = -4

global.matched_pl1 = -4
global.matched_pl2 = -4

global.matched_pl3 = -4
global.matched_pl4 = -4



global.matched_pl1_ready = -4
global.matched_pl2_ready = -4

global.matched_pl3_ready = -4
global.matched_pl4_ready = -4

global.matched_pl1_won = 0
global.matched_pl2_won = 0

global.auto_volume_down = 0
global.t_auto_volume_down = 0
global.return_player_id = 0
global.to_return_player_id = 0
global.keep_winning = 0
check_unban_server = 0
injured_effect = 0;
repeat_matching = 0;
_b_matching = 0;
_mes_select_matching = -4
certain_matching = 0
before_hp = global.hp;
global.bgm = -4
global.slow_motion = 0;
global.light_scaling = 1
light_scaling_time = 0
light_scaling_ = 0
option = 0

global.camera_vx = 0
global.client_num = 0;
alarm[2] = 5






global.max_stemina_plus = 0 //최대 스테미나 증가 +10%
global.movementspeed_plus = 0 //이동 속도 증가 +5%
global.jump_plus = 0 //점프력 증가 +15%
global.low_gravity_plus = 1 //중력 감소 -10%
global.mental_plus = 0 //레이지 게이지 충전량 +5%
global.max_armor_plus = 0 //방어력 증가 +15%
global.damage_plus = 0 //데미지 증가 +10%
global.damage_plus_multi = 0
global.full_mental_plus = 0 //다음 라운드 시작시 레이지게이지 100% (1회용)
global.taking_hp_plus = 0 //상대 공격시 체력 흡혈 +5%
global.laser_num_plus = 0 //레이저 스킬의 레이저 갯수 증가
global.critical_plus = 0 //크리티컬 데미지 확률 증가 +10%
global.critical_plus_multi = 0
global.ignore_falling_plus = 0 //낙사 무시 1회
global.ignore_falling_check = 0
global.mental_attack_sp_plus = 0 //레이지 게이지 스킬 시전 속도 +50%
global.automatic_guard_plus = 0 //공격 자동 방어 확률 +10%
global.waiting_choosing = 0
global.choice = 0
for(var i = 0; i <= 2; i++)
{
global.choices[i] = 0
}

load_data()