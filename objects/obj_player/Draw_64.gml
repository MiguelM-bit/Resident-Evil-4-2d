/// @description


var x_gui = display_get_gui_width(),
	y_gui = display_get_gui_height();




draw_sprite_ext(spr_ui, obj_player_stats.vida, x_gui - 200, y_gui - 172, .45, .45, 0, c_white, 1);
draw_text(x_gui - 165, y_gui - 105, string(obj_player_stats.municao_pente) + "/" + string(obj_player_stats.municao_total));
//draw_text(x_gui - 170, y_gui - 150, string(vida));

if obj_player_stats.ouro > 0
{
	draw_text(x_gui - 165, y_gui / 5, string(obj_player_stats.ouro) + " pts");
}