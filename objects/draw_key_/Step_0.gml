
time ++


if image_index = 0 && keyboard_check(vk_left)
{
a = 1
}

if image_index = 1 && keyboard_check(vk_right)
{
a = 1
}

if image_index = 2 && player.attack_ > 10
{
a = 1
}

if image_index = 3 && player.down_attack > 0
{
a = 1
}

if image_index = 4 && player.jump_attack > 0
{
a = 1
}

if image_index = 5 && global.awakening > 1
{
a = 1
}

if image_index = 6 && player.spin > 0
{
a = 1
}

if image_index = 7 && keyboard_check(vk_space)
{
a = 1
}

if image_index = 11 && player.dash_attack > 0
{
a = 1
}

if image_index = 12 && player.down_attack_with_rage > 0
{
a = 1
}

if image_index = 13 && player.guarding > 0
{
a = 1
}

if (image_index = 14 || image_index = 16) && player.attack_laser > 0
{
a = 1
}

if image_index = 15 && player.spin_attack > 0
{
a = 1
}


if image_index = 8 || image_index = 9
{
instance_destroy()
}