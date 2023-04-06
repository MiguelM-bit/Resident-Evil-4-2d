/// @description

var player = instance_exists(obj_player);

if player && !chegou_perto
{
	if distance_to_object(obj_player) < 600
	{
		lado = choose(-1,1);
		chegou_perto = true;	
	}
	
}

if !morreu
{
	if chegou_perto
	{
		//player perto, sair voando	
		image_xscale = lado;
		if lado < 0 //esquerda
		{
			direction = 135;
		}
		else //direita
		{
			direction = 45;
		}
		speed = 3.3;
	}
}
else //morreu
{
	speed = 2.5;
	direction = 270;
	image_yscale = -1;
	
	if !dropou
	{
		//spawnando algum item qnd morre
		// define as probabilidades de ocorrência de cada objeto
		var objeto1_chance = 0.25; // 25% de chance
		var objeto2_chance = 0.50; // 25% de chance
		var objeto3_chance = 0.25; // 25% de chance
		var yy = 600;

		// gera um número aleatório entre 0 e 1
		var random_num = random(1);

		// instancia um dos objetos com base na probabilidade definida
		if (random_num < objeto1_chance) 
		{
			instance_create_layer(x, yy, "Player", obj_erva);
		}
		else if (random_num < objeto1_chance + objeto2_chance) 
		{
		    instance_create_layer(x, yy, "Player", obj_municao_pistola);
		}
		else if (random_num < objeto1_chance + objeto2_chance + objeto3_chance) 
		{
		    instance_create_layer(x, yy, "Player", obj_ouro);
		}
		else {
		    //nao dropa nada
		}
		
		dropou = true;
	}
}



if y < 0 or y > room_height
{
	instance_destroy();
}