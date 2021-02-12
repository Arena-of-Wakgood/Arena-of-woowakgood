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

t_chat_line += (chat_line - t_chat_line)*0.1