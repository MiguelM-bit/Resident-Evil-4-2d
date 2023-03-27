/// @description

var a = keyboard_check(ord("E"));

if a && place_meeting(x, y, obj_player)
{
	if room == Room1
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(Room2);
		}
	}
	if room == Room2
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(Room3);
		}
	}
	if room == Room3
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(Room4);
		}
	}
	if room == Room4
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(Room0);
		}
	}
}



