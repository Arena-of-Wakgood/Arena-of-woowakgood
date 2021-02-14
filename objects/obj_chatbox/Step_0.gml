/// @description Insert description here
// You can write your code in this editor
if w_alpha > 1
{
w_alpha -= 0.05
}
else
{
w_alpha += (-0.01 - w_alpha)*0.1
}

if chat_line < 0
{
chat_line = 0
}

if chat_line > 22
{
chat_line = 22
}

if global.chat_activity <= 0
{
chat_line = 0
}
else
{
	if instance_number(imoji_button) = 0
	{
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 0
	_imoji_bt.xposition = -3.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 1
	_imoji_bt.xposition = -2.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 2
	_imoji_bt.xposition = -1.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 3
	_imoji_bt.xposition = -0.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 4
	_imoji_bt.xposition = 0.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 5
	_imoji_bt.xposition = 1.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 6
	_imoji_bt.xposition = 2.5
	
	var _imoji_bt = instance_create_depth(-100,-100,depth-1,imoji_button)
	_imoji_bt.image_index = 7
	_imoji_bt.xposition = 3.5
	}
}

t_chat_line += (chat_line - t_chat_line)*0.1