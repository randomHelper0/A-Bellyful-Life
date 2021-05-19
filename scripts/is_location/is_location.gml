function is_location() {
	if (room == rmJournal || room == rmBackpack || room == rmInteract || room == rmKitchenFridge
		|| room == rmStatus || room == rmScene || room == rmShop
	    //|| room == rmMapUni// || room == rmMapCity// || room == rmGeneralStore 
	    || room == rmStat || room == rmAbilities)
	    return false;
	else
	    return true;
}


function is_location_room(rm) {
	if (rm == rmJournal || rm == rmBackpack || rm == rmInteract || rm == rmKitchenFridge
		|| rm == rmStatus || rm == rmScene || rm == rmShop
	    //|| rm == rmMapUni// || rm == rmMapCity// || rm == rmGeneralStore 
	    || rm == rmStat || rm == rmAbilities)
	    return false;
	else
	    return true;
}
