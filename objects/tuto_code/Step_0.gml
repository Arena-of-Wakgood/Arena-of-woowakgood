/// @description Insert description here
// You can write your code in this editor
if time = 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "아레나에 오신 것을 환영합니다!"
p_mes.target = player.id
}

if time = 1 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "본격적인 플레이에 앞서 튜토리얼을 진행하도록 하겠습니다!"
p_mes.target = player.id
}

if time = 2 && p_mes = -1
{
time = 3
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -2
key_guide.image_index = 0

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -0.5
key_guide.image_index = 1

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 1.5
key_guide.image_index = 7
}

if time = 3 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 4 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "다음은 기본 공격 입니다!"
p_mes.target = player.id
}

if time = 5 && p_mes = -1
{
time = 6
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 0
key_guide.image_index = 2
}

if time = 6 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 7 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "다음은 스테미나를 사용하는 조금 더 강력한 공격들 입니다!"
p_mes.target = player.id
}

if time = 8 && p_mes = -1
{
time = 9
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -1.5
key_guide.image_index = 4

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 0
key_guide.image_index = 15

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 1.5
key_guide.image_index = 3
}

if time = 9 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 10 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "이제 공격을 했으면 역으로 회피도 해야겠죠?"
p_mes.target = player.id
}

if time = 11 && p_mes = -1
{
time = 13
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -1
key_guide.image_index = 6

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 1
key_guide.image_index = 13
}

if time = 13 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "가드를 성공했거나, 실패해서 처맞은 경우 레이지 게이지가 차게 됩니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 14 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "이때 이 레이지 게이지를 이용해 더욱 강력한 공격을 할 수 있습니다!"
p_mes.target = player.id
}

if time = 15 && p_mes = -1
{
time = 17
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -3
key_guide.image_index = 11

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = -1
key_guide.image_index = 12

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 1.5
key_guide.image_index = 14

var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 3
key_guide.image_index = 16
}

if time = 17
{
global.rage_gauge = 100
}

if time = 17 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 18 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "이제 마지막 기술 입니다!"
p_mes.target = player.id
}

if time = 19 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "상대방에게 너무 일방적으로 처맞고 있을 경우"
p_mes.target = player.id
}

if time = 20 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "'레이지 모드'를 시전하여 상대를 떨궈낼 수 있습니다!"
p_mes.target = player.id
}

if time = 21 && p_mes = -1
{
time = 23
global.never_move = 0
var key_guide = instance_create_depth(-100,-100,-999994,draw_key_)
key_guide.location = 0
key_guide.image_index = 5
}

if time = 23
{
global.rage_gauge = 100
}

if time = 23 && instance_number(draw_key_) <= 0 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}

if time = 24 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "레이지 모드 시전 중엔, 공격 속도와 이동 속도가 증가하며,"
p_mes.target = player.id
}

if time = 25 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "스테미나가 무한이 됩니다!"
p_mes.target = player.id
}

if time = 26 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "일방적으로 많이 처맞아서 체력이 없는 경우,"
p_mes.target = player.id
}

if time = 27 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "해당 기술을 통해 역전 각을 잡아보세요!"
p_mes.target = player.id
} 

if time = 28 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "튜토리얼은 여기 까지 입니다!"
p_mes.target = player.id
}

if time = 29 && p_mes = -1
{
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "혹여나 조작법을 까먹었다면 G키를 통해 조작법을 확인 할 수 있습니다!"
p_mes.target = player.id
}

if time = 30 && p_mes = -1
{
global.awakening = 0
global.rage_gauge = 0
global.never_move = 1
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "자! 이제부터 앞서 알려드린 기술들을 통해"
p_mes.target = player.id
}

if time = 31 && p_mes = -1
{
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "앞으로 연속해서 등장할 몹들을 최대한 빠르게 모두 처치 해보세요!"
p_mes.target = player.id
}


if time >= 32 && time < 37
{
global.timer ++
show_timer += (96 - show_timer)*0.1
}
else
{
show_timer += (-128 - show_timer)*0.1
}


var xx = 2048
var yy = 903
if time = 32 && p_mes = -1
{
var _targeted_x = xx-16
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx+16
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

time = 33
}

if time = 33 && instance_number(hyumpanchi_banana) = 0
{
var _targeted_x = xx-64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx+64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
time = 34
}

if time = 34 && instance_number(hyumpanchi_banana) = 0
{
var _targeted_x = xx-64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx+64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
time ++
}

if time = 35 && instance_number(hyumpanchi_banana) = 0
{
var _targeted_x = xx+64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx+96
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)


var _targeted_x = xx+128
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
time ++
}

if time = 36 && instance_number(hyumpanchi_banana) = 0
{
var _targeted_x = xx-64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx-128
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)


var _targeted_x = xx+64
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

var _targeted_x = xx+128
instance_create_depth(_targeted_x,yy,player.depth,hyumpanchi_banana)
	repeat(choose(6,7,7,8,8,9,9,9,10,10,11,12))
	{
	randomize()
	var dust = instance_create_depth(_targeted_x+irandom_range(-5,5),yy+irandom_range(-5,5),depth-1,pepsi_effect)
	var scale = irandom_range(20,40)/50
	dust.image_xscale = scale
	dust.image_yscale = scale
	dust.vspeed = irandom_range(-50,50)/37
	dust.hspeed = irandom_range(-50,50)/37
	dust.image_alpha = 1
	}
	
var sfx = audio_play_sound(mob_faint,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
time ++
}

if time = 37 && p_mes = -1 && instance_number(hyumpanchi_banana) = 0
{
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "좋습니다! "+string(global.timer/60)+"초 걸리셨네요!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
	if global.timer < 3600
	{
	global.rank = 1500+floor(3600 - global.timer)
	}
}

if time = 38 && p_mes = -1
{
p_mes = instance_create_depth(x,y,depth-1,player_message)
p_mes.text = "이제 본격적으로 게임을 시작하겠습니다!"
p_mes.target = player.id

var sfx = audio_play_sound(gibungoa,0,0)
audio_sound_gain(sfx,0.3*global.master_volume*2*global.sfx_volume,0)
}


if time = 39 && p_mes = -1
{
time = 40
global.t_b_alpha = 1.01
global.tutorial = 1
save_data()
alarm[1] = 180
}