function Remi_dialogues(){
	dialogue_init()
	dialogue_create(
			    "1",
			    "Let's go patrolling!",
			    false,
				"Not implemented"
		)
	
	eating_out_ask(Remi);
	
	dialogue_start(true);
}