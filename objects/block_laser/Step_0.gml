/// @description Insert description here


depth = obj_floor.depth+2

scaling_time ++

if scaling_time > 33
{
self_scaling += 0.004
}
else
{
self_scaling -= 0.004
}

if scaling_time >= 66
{
scaling_time = 0
}



image_xscale = width_*0.4
image_yscale = width_*0.55




x2 = x + lengthdir_x(3000,direction)
y2 = y + lengthdir_y(3000,direction)

