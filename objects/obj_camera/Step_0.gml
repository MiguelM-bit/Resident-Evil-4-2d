/// @description 


var player = instance_exists(obj_player),
	offset = -128,
	acel = .05;

if player
{
	if vila
	{
		var xx = 2722,
			yy = 671;
		x = lerp(x, xx, acel);
		y = lerp(y, yy, acel);
		
		t_cam--;
		if t_cam <= 0
		{
			vila = false;
		}
	}
	else
	{
		x = lerp(x, obj_player.x + (obj_player.velx * 16), acel);
		y = lerp(y, obj_player.y + offset, acel);
	}
	
	
	
}


