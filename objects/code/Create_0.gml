window()


////////////////////////////////////////////////////////////////////////

send_request = http_ip_get(""); //Enter your website here between "", if nothing is entered, a request is send to icanhazip.com
my_ip = "" //Initialize ip variable
error = "" //Initialize error variable
text_color = 0 //Initialize text color variable
ip_for_calcul = ""

///////////////////////////////////////////////////////////////////////

th_afas = 0
room_speed = 60
server_ip = "175.196.5.129";//"175.196.5.129";
server_port = 12521;
is_server = false;

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
	MUSIC_SYNC
}
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


load_data()