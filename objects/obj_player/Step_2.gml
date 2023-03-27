/// @description


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


//aplicando
x += velx;
y += vely;

