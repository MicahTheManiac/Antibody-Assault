// Set
draw_set_halign(halign);
draw_set_valign(valign);
draw_set_color(color);
draw_set_font(font);

draw_text_transformed(x, y, $"{text}", text_size, text_size, 0);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_roboto);