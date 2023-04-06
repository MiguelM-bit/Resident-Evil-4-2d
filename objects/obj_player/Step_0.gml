/// @description 

//criando os inputs
var right, left, up, down, jump, shoot, reload, test;

//configurando as teclas
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
right = keyboard_check(ord("A"));
left = keyboard_check(ord("D"));
jump = keyboard_check(vk_space);
shoot = keyboard_check(vk_enter);
reload = keyboard_check(ord("R"));
test = keyboard_check_pressed(ord("T"));

if test
{
	if obj_player_stats.vida < 3
	{
		obj_player_stats.vida += 1
	}
}



//verificando colisao com o chao
var chao = place_meeting(x, y + 1, obj_col);

//gravidade
if !chao
{
	//faz o personagem descer
	vely += grav;
}

//maquinas de estados
switch(estado)
{
	case state.parado:

		//selecionando a animação
		sprite_index = spr_player; //parado


		//parando o player
		velx = 0;
	
		//saindo do estado
		if (right || left || jump)
		{
			estado = state.movendo;
		}
	
	break;
	
	
	case state.movendo:
		
		//selecionando a animação
		sprite_index = spr_player_andando; //andando
		
		//movendo o player para os lados
		velx = lerp(velx, (left - right) * vel, acel);
		
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
		
	
		//verificando se estou no chao e apertei para pular
		if jump && chao
		{
			//pulando
			vely -= jump_force;
			
			//verificando em qual lado estou
			if x_scale < 0 // esquerda
			{
				//achantando o player
				xscale = -.8;
			}
			else
			{
				//achantando o player
				xscale = .8;
			}
			//achantando o player
			yscale = 1.4;
		}
		else
		{
			if velx != 0 && chao
			{
				var wobbleFrequency = .05,
					wobbleAmount = .03,
					spd = 2.3,
					acl = .15;
		
				var value = 1 + sin(current_time / wobbleFrequency) * wobbleAmount * spd;
		
					//verificando em qual lado estou
					if x_scale < 0 // esquerda
					{
						//achantando o player
						xscale = lerp(xscale, -value, acl);
					}
					else
					{
						//achantando o player
						xscale = lerp(xscale, value, acl);
					}
		
				yscale = lerp(yscale, value, acl);
			}
		}
		
	
		//reseta o timer 
		if (right || left || jump)
		{
			timer_p = time_p;
		}
	
		//timer para parar
		timer_p--;
		if timer_p <= 0
		{
			estado = state.parado;
		}

	break;
	
	case state.morreu:
	
		//animação de morte
		sprite_index = spr_player;
	
		velx = 0;
		
		image_alpha -= .01;
		if image_alpha <= 0
		{
			//morreu
			game_restart();
		}
	
	break;
}

#region tiro
if shoot && pode_atirar && obj_player_stats.municao_pente > 0 && !recarregando
{
	velx = 0;
	obj_player_stats.municao_pente--;
	if obj_player_stats.municao_pente <= 0
	{
		recarregando = true;
	}
	var tiro = instance_create_layer(x + sprite_width * xscale - 20, y - sprite_height + 22 , "Tiro", obj_tiro);
		tiro.image_xscale = x_scale;
		tiro.speed = vel_tiro * x_scale;
		
	//verificando em qual lado estou
	if x_scale < 0 // esquerda
	{
		//achantando o player
		xscale = -.8;
	}
	else
	{
		//achantando o player
		xscale = .8;
	}	
	pode_atirar = false;
}

if reload && obj_player_stats.municao_pente < obj_player_stats.municao_max && obj_player_stats.municao_total >= obj_player_stats.municao_max
{
	recarregando = true;
}

if recarregando
{
	if obj_player_stats.municao_total >= obj_player_stats.municao_max
	{	
		reload_cd--;
		if reload_cd <= 0
		{
			obj_player_stats.municao_total -= obj_player_stats.municao_max;
			obj_player_stats.municao_pente = obj_player_stats.municao_max;
			recarregando = false;
			reload_cd = 1.1 * room_speed;
		}
	}
	else
	{
		//sem munição
		recarregando = false;
	}
}

//cooldown do tiro
if !pode_atirar
{
	cd_tiro--;
	if cd_tiro <= 0
	{
		cd_tiro = cd;
		pode_atirar = true;
	}
}
#endregion

#region tomando dano
var inim = place_meeting(x, y, obj_inim_pai);
var salvador = place_meeting(x, y, obj_salvador);
if inim && !perdeu_vida
{
	
		obj_player_stats.vida += 1;
		perdeu_vida = true;
}
else if salvador && !perdeu_vida
{
	
		obj_player_stats.vida = 3;
		perdeu_vida = true;
}


//timer qnd perde vida
if perdeu_vida
{
	t_vida--;
	if t_vida <= 0
	{
		perdeu_vida = false;
		t_vida = 2 * room_speed;
	}
}

#endregion

//aparecendo o para apertar e para interarir
if place_meeting(x, y, obj_next_level) or place_meeting(x, y, obj_itens)
{
	if room == Room2
	{
		if !instance_exists(obj_inim_pai)
		{
			interact = true;
		}
	}
	else
	{	
		interact = true;
	}
}
else
{
	interact = false;
}


//resetando a escala
var acelS = .1;
xscale = lerp(xscale, x_scale, acelS * 3);
yscale = lerp(yscale, 1, acelS);