function dev_mes(argument0) 
{
global.dev_message = argument0
	if argument0 = "F1키를 누르고 있는 상태로 마우스 휠 혹은 키보드 방향키를 통해 관리자 모드를 사용할 수 있습니다"
	{
	global.dev_message_alpha = 20
	}
	else if (argument0 = "서버의 인원이 꽉찼거나 닫혀 있습니다.")
	{
	code.alarm[4] = 90
	global.dev_message_alpha = 20
	}
	else
	{
	global.dev_message_alpha = 8
	}
}
