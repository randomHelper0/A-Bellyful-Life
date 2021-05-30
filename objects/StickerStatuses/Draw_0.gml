selectW = sprite_width/3;//sprite_get_width(sprStatusSelect);
selectH = sprite_get_height(sprStatusSelect);
draw_sprite(sprStatusSelect, 0, x + (sprite_width/3)*select + selectW/2, y-selectH);

draw_self();