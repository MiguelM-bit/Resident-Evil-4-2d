/// @description

//se nao rodou  aprimeira vez
if !rodou
{
	//verifica quando os inimigos acabaram
	if instance_number(obj_inim_pai) <= 0
	{
		//ativa o spawm e fala q ja rodou uma vez
		spawn = true;
		rodou = true;
		
	}
}
else //se ja rodou a primiera vez
{
	//verifica se nao tem mais inimigos
	if instance_number(obj_inim_pai) <= 0
	{
		//fala q rodou a segunda vez
		rodou2 = true;
	}	
}

//se rodou a segunda vez
if rodou2 && !serra
{
	var	xx1 = 4512,
		yy = 660;
	
	instance_create_layer(xx1, yy, "Inimigos", obj_salvador);
	serra = true;	
	
}

//ja criou o salvador e matou ele
if serra && !instance_exists(obj_salvador)
{
	t2--;
	if t2 <= 0
	{
		room_goto(Room0);
	}
}

//spawm
if spawn
{
	//definindo as posições
	var xx1 = 704,
		xx2 = 1632,
		xx3 = 5216,
		xx4 = 5856,
		xx5 = 6816,
		yy = 660,
		
		
	//verifica se nao foram criados mais q dois inimigos e se ja nao criou
	if criados < 2 && !criou
	{
		
		//cria os inimigos
		instance_create_layer(xx1, yy, "Inimigos", obj_inimigo);
		instance_create_layer(xx2, yy, "Inimigos", obj_inimigo);
		instance_create_layer(xx3, yy, "Inimigos", obj_inimigo);
		instance_create_layer(xx4, yy, "Inimigos", obj_inimigo);
		instance_create_layer(xx5, yy, "Inimigos", obj_inimigo);
		
		//aumenta a contagem de inimigos criados
		criados++;
		//ativa o timer
		criou = true;
		
	}
}

if criou
{
	t--;
	if t <= 0
	{
		criou = false;
		t = 90 * room_speed;
	}
}