if (!ControlEnv.has_tripod){
		tooltip_start(x,y,"Error", "You need camera gear to start streaming!");
		exit;
}

global.streaming = true;
instance_destroy();