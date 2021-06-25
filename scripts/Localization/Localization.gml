#macro EN 0
#macro RUS 1
#macro JAP 2
#macro VN 3


global.language = EN;
function strlan(){
	var en_str = "";
	for (var i=0; i<argument_count; i+= 2){
			if (argument[i] == global.language)
				return argument[i+1];	
			else if (argument[i] == EN)
				en_str = argument[i + 1];
	}
	
	return en_str;
}

function exelan(fname){
	var lan_name = language_str(global.language);
	var script = asset_get_index(fname+"_"+lan_name);
	if (script == -1){
		lan_name = "EN";
		script = asset_get_index(fname+"_"+lan_name);
	}
	
	return script();
		
}

function language_str(index){
	switch (index){
		case EN:
			return "EN";
		case RUS:
			return "RUS";
		case JAP:
			return "JAP";
		case VN:
			return "VN";
	}
	
	return "N/A";
}