/// @description 

// Inherit the parent event
event_inherited();


if vida <= 0 && !rodou
{
	rodou = true;
	if sprite_index == spr_inimigo0
	{
		image_index++;
	}
	else
	{
		morreu = true;
	}
}

if rodou && vida2 <= 0
{
	morreu = true;
}

if morreu
{
	velx = 0;
	
	t--;
	if t <= 0
	{
		image_alpha -= .05;
	}
	
	if image_alpha <= 0
	{
		if !dropou
		{
			//spawnando algum item qnd morre
			// define as probabilidades de ocorrência de cada objeto
			var objeto1_chance = 0.40; // 25% de chance
			var objeto2_chance = 0.40; // 25% de chance
			var yy = 600;

			// gera um número aleatório entre 0 e 1
			var random_num = random(1);
			
			if obj_player_stats.vida > 0
			{
				if (random_num < objeto1_chance + objeto2_chance)
				{
					instance_create_layer(x, yy, "Player", obj_erva);
				}
				else
				{
					//nao dropa nada
				}
			}
			// instancia um dos objetos com base na probabilidade definida
			else if (random_num < objeto1_chance) 
			{
				instance_create_layer(x, yy, "Player", obj_ouro);
			}
			else if (random_num < objeto1_chance + objeto2_chance) 
			{
			    instance_create_layer(x, yy, "Player", obj_municao_pistola);
			}
			else {
			    //nao dropa nada
			}
			dropou = true;
			
		}	
		//morreu
		instance_destroy();
	
	}
}