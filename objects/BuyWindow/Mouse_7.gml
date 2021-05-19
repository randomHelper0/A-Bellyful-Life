if (ControlEnv.money >= item.price){
    create_item(item);
    ControlEnv.money -= item.price;
    with (ControlBackpack) refresh_backpack();
    instance_destroy();
}

