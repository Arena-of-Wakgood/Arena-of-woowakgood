/// @description Insert description here
// You can write your code in this editor
for(var i = 6; i <= 15; i++)
{
	if point_distance(x,y,spark_x[i],spark_y[i]) < 32
	{
	draw_set_color($FFF0E9D8)
	draw_set_alpha((0.2-alpha)*0.1)
	draw_line_width(x,y,spark_x[i],spark_y[i],2)
	}
}

//draw_text(x,y,string(spark_x[time_s])+" / "+string(spark_y[time_s])+" / "+string(vspeed))
//draw_text(x,y,string(gravity)+" / "+string(vspeed)+" / "+string(alpha))