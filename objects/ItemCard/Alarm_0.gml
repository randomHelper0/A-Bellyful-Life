if (point_distance(mouse_x,mouse_y, xpre+width/2, ypre+height/2) < width/2){
    dragging = false;
    win = instance_create(0,0,ItemWindow);
    win.item = item;
    win.card = id;
}

