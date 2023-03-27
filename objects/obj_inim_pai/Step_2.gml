/// @description



#region colisao com as paredes
//colisao horizontal
if (place_meeting(x + velx, y, obj_col))
{
	while(!place_meeting(x + sign(velx), y, obj_col))
	{
		x += sign(velx);
	}
	velx = 0;
}

//colisao vertical
if (place_meeting(x, y + vely, obj_col))
{
	while(!place_meeting(x, y + sign(vely), obj_col))
	{
		y += sign(vely);
	}
	vely = 0;
}
#endregion

#region colisao com outros inimigos
t_c--;
if t_c <= 0
{
	t_c = 3 * room_speed;
	//colisao horizontal
	if (place_meeting(x + velx, y, obj_inim_pai))
	{
		while(!place_meeting(x + sign(velx), y, obj_inim_pai))
		{
			x += sign(velx);
		}
		velx = 0;
	}

	//colisao vertical
	if (place_meeting(x, y + vely, obj_inim_pai))
	{
		while(!place_meeting(x, y + sign(vely), obj_inim_pai))
		{
			y += sign(vely);
		}
		vely = 0;
	}
}
#endregion
/*
#region colisao com o player

if distance_to_object(obj_player) < 4
{
	//colisao horizontal
	if (place_meeting(x + velx, y, obj_player))
	{
		while(!place_meeting(x + sign(velx), y, obj_player))
		{
			x += sign(velx);
		}
		velx = 0;
	}

	//colisao vertical
	if (place_meeting(x, y + vely, obj_player))
	{
		while(!place_meeting(x, y + sign(vely), obj_player))
		{
			y += sign(vely);
		}
		vely = 0;
	}
}
#endregion
*/

//aplicando
x += velx;
y += vely;
