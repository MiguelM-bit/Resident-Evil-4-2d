/// @description

if !rodou
{
	if instance_number(obj_inim_pai) <= 0
	{
		spawn = true;
		rodou = true;
		
	}
}
		
if spawn
{
	var rn_x = room_width,
		xx = rn_x + 32,
		yy = 660
		
	if criados < 3 && !criou
	{
		criados++;
		instance_create_layer(xx, yy, "Inimigos", obj_inimigo);
		criou = true;
	}
}

if criou
{
	t--;
	if t <= 0
	{
		criou = false;
		t = 5 * room_speed;
	}
}