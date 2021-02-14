/// @description Insert description here
// You can write your code in this editor
if ignore_floor = 0
{
if global.l_q_grap = 0
{
	if global.p_floor+27 >= y
	{
		if instance_exists(player)
		{
		var depth_ = player.depth
		}
		else
		{
		depth_ = -1
		}
		
	var random_dir = choose(-1,1)
	var _depth = depth_-choose(-1,1)
	
		if global.low_quality = 0
		{
			repeat(irandom_range(7,9))
			{
			var _ef = instance_create_depth(x,global.p_floor+27,_depth,effect_spark_rain)
			_ef.hspeed = irandom_range(5,20)*random_dir/10
			_ef.vspeed = irandom_range(-40,-10)/90
			}
		}
	}
}
}