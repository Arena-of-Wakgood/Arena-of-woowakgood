/// @description Insert description here
// You can write your code in this editor
if des = 0
{
image_xscale += (0.8 - image_xscale)*0.1
image_yscale += (0.8 - image_yscale)*0.1
y += (ystart-80 - y)*0.1
image_alpha += (1.1 - image_alpha)*0.1
}
else
{
image_xscale += (0 - image_xscale)*0.1
image_yscale += (0 - image_yscale)*0.1
y += (ystart-160 - y)*0.1
image_alpha += (-0.1 - image_alpha)*0.1

	if image_alpha < 0
	{
	instance_destroy()
	}
}