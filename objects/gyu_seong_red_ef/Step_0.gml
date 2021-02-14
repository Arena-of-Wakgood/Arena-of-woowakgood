/// @description Insert description here
// You can write your code in this editor
if global.low_quality = 1
{
image_alpha -= 0.1;
}
else
{
image_alpha -= 0.005;
}
a += 0.02;

if image_alpha <= 0
{
instance_destroy();
};

hspeed += (0 - hspeed)*0.1;