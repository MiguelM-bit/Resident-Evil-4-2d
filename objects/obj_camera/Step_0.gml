/// @description 


var player = instance_exists(obj_player),
	offset = -128,
	acel = .05;

if player
{
	x = lerp(x, obj_player.x + (obj_player.velx * 16), acel);
	y = lerp(y, obj_player.y + offset, acel);
	
}

