/// @description

velx = 0;
vely = 0;

grav = .5;

acel = .05;
vel = 3.15;

jump_force = 10;

x_scale = 1;
xscale = 1;
yscale = 1;

t_c = 3 * room_speed;


enum inim_state
{
	parado, andando
}

estado = inim_state.parado;
