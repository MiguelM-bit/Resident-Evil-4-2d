/// @description 

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);


if recarregando
{
	draw_text(x - 32,y - sprite_height - 44, "recarregando...");
}
else if interact
{
	draw_text(x - 32, y - sprite_height - 44, "Aperte E");
}