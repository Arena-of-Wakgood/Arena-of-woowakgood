/// @description Insert description here
// You can write your code in this editor
force_mapchange_ ++

if force_mapchange_ > 2
{
force_mapchange_ = 0
}

if force_mapchange_ = 0
{
global.now_map = 2
}
if force_mapchange_ = 1
{
global.now_map = 3
}
if force_mapchange_ = 2
{
global.now_map = 0
}