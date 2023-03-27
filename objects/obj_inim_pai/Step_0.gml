/// @description

var dir, esq, player;

player = instance_exists(obj_player);

var chao = place_meeting(x, y + 1, obj_col);

//gravidade
if !chao
{
	vely += grav;
}


if player
{
	switch(estado)
	{
		case inim_state.parado:
		
			//parado
			velx = 0;
		
			//se estiver perto muda o estado para andando
			if distance_to_object(obj_player) < 748
			{
				estado = inim_state.andando;
			}
		
		
		break;
		
		
		case inim_state.andando:
		
			//escolhendo o lado
			dir = obj_player.x > x // direita
			esq = obj_player.x < x //esquerda
	
			//movendo
			velx = lerp(velx, (dir - esq) * vel, acel);
	
			if distance_to_object(obj_player) > 128
			{
				var parede_dir, parede_esq;
		
				parede_dir = place_meeting(x + 1, y, obj_col);
				parede_esq = place_meeting(x - 1, y, obj_col);
		
				if parede_dir || parede_esq
				{
					//pulando
					if chao
					{
						//jump
						vely -= jump_force;
			
						//deformando
						if x_scale < 0 // esquerda
						{
							xscale = -.8;
						}
						else
						{
							xscale = .8;
						}
						yscale = 1.4;
					}
				}
			}
			
			
			//se estiver longe muda o estado para parado
			if distance_to_object(obj_player) > 512
			{
				estado = inim_state.parado;
			}
		
		break;
		
	}
	
}
	


if !place_meeting(x, y, obj_player)
{
	//girando de um lado pro outro
	if velx < 0
	{
		x_scale = -1;
	}
	else if velx > 0
	{
		x_scale = 1;
	}
	else
	{
		//nao fazer nada
	}
}


var acelScale = .1;
xscale = lerp(xscale, x_scale, acelScale);
yscale = lerp(yscale, 1, acelScale);