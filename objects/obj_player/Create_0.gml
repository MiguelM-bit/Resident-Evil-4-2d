/// @description

//garantir q ele tem um camera
if !instance_exists(obj_camera)
{
	instance_create_layer(x, y, "Camera", obj_camera);
}
//obj das varaiveis
if !instance_exists(obj_player_stats)
{
	instance_create_layer(x, y, "Player", obj_player_stats);
}


//criando as variaveis

//vida
vida = obj_player_stats.vida;
perdeu_vida = false;
t_vida = 2 * room_speed;

//velocidades
velx = 0;
vely = 0;

acel = .25;
vel = 5;
jump_force = 10;
grav = .5;

//escala do player
xscale = 1;
yscale = 1;
x_scale = 1;

//timer para parar de andar
time_p = .2 * room_speed;
timer_p = time_p;

//variaveis da arma
cd = .7 * room_speed
cd_tiro = cd;
pode_atirar = true;

vel_tiro = 25;

reload_cd = 1.1 * room_speed;
recarregando = false;

municao_max = obj_player_stats.municao_max;
municao_pente = obj_player_stats.municao_max;
municao_total = obj_player_stats.municao_total;

interact = false;


//maquina de estados
enum state
{
	parado, movendo, morreu
	
}

//selecionando estado inicial
estado = state.parado;
