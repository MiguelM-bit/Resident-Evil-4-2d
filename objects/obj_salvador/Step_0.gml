/// @description 

// Inherit the parent event
event_inherited();


if vida <= 0 && !rodou
{
	rodou = true;

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
			var yy = 600;
			
			instance_create_layer(x, yy, "Player", obj_barra_ouro);

			dropou = true;
		}
		
		//morreu
		instance_destroy();
	}
}