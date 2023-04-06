/// @description

var a = keyboard_check(ord("E"));

if a && place_meeting(x, y, obj_player)
{
	if room == Room1
	{

		room_goto(Room2);
		
	}
	else if room == Room2
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(Room3);
		}
	}
	else if room == Room3
	{
		room_goto(Room4);
	}
	else if room == Room4
	{
		
		room_goto(Room5);
	}
	else if room == Room5
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto_next();
		}
	}
	else
	{
		if !instance_exists(obj_inim_pai)
		{
			room_goto(rn_test);
		}
	}
}



