function msg_Amber_eating_out_EN(){
	ctb_msg(cmd_ex(ex_talk) +
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", cmd_sound(get_random_asset("chewsoft", 1,4))+
		"[speaker:Amber][ex:smile](You could only marvel at Amber as she chow down one hamburger after another.)",
		"[ex:idle][speaker:Player]Where does it all go, really?",
		"[speaker:Amber][ex:smile2]Hehe, obviously I don't usually eat that much, but I definitely won't hold back if someone else is paying :P",
		"[ex:idle][speaker:noone]You both enjoyed the meal while having small talks");
}

function msg_Amber_eating_out_RUS(){
	ctb_msg(cmd_ex(ex_talk) +
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", cmd_sound(get_random_asset("chewsoft", 1,4))+
		"[speaker:Amber][ex:smile](Ты только и успеваешь восхищаться, как Эмбер поедает один гамбургер за другим.)",
		"[ex:idle][speaker:Player]Куда это всё могло подеваться, нет ну правда?",
		"[speaker:Amber][ex:smile2]Хе-хе, определенно, обычно я не ем так много, но я не собираюсь сдерживаться, когда за меня готов кто-то заплатить :P",
		"[ex:idle][speaker:noone]Вы оба наслаждались едой во время светских бесед");
}

function msg_Amber_eating_out_CN(){
	ctb_msg(cmd_ex(ex_talk) +
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", cmd_sound(get_random_asset("chewsoft", 1,4))+
		"[speaker:Amber][ex:smile](Amber大口吃着一个又一个汉堡令你感到十分惊叹.)",
		"[ex:idle][speaker:Player]你是怎么吃这么多的？",
		"[speaker:Amber][ex:smile2]哈哈，我平时肯定不吃这么多了，不过既然有人陪我一起吃，那我可就不收着了.",
		"[ex:idle][speaker:noone]你们一边聊着天，享受着食物."
		)
}

function msg_Amber_eating_out_JP(){
	ctb_msg(cmd_ex(ex_talk) +
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...",
		cmd_sound(get_random_asset("chewsoft", 1,4)) + "...", cmd_sound(get_random_asset("chewsoft", 1,4))+
		"一通りジョギングをした後、二人は少し休憩をするために立ち止まりました。",
		"[speaker:Amber]おはよう！ わたしAmber。一緒にジョギングする人がいてうれしい！",
		"[speaker:Player]やっほー！私は " +Player.name+"、よろしくね。ここでよくジョギングするの？",
		"[speaker:Amber]うん！毎朝６時から８時までやってるの！"
		)
}
/////////////////

function msg_Amber_jog_EN(){
	ctb_list(player_jog_finish, noone, "After a round of jogging, both of you stopped to take a small break",
			"[speaker:Amber]Good morning! I'm Amber. It's nice to have someone to jog with.",
			"[speaker:Player]Yup! I'm " +Player.name+", nice to meet you. Do you jog here often?",
			"[speaker:Amber]Every morning from 6 to 8.");
}

function msg_Amber_jog_RUS(){
	ctb_list(player_jog_finish, noone,"После пробежки вы оба остановились, чтобы сделать небольшой перерыв.",
		"[speaker:Amber]Доброе утро! Я Эмбер. Приятно иметь бегать трусцой с кем-то вместе.",
		"[speaker:Player]Ага! Я " +Player.name+", приятно познакомиться. И часто ты здесь бегаешь?",
		"[speaker:Amber]Каждое утро с 6 до 8.");
}

function msg_Amber_jog_CN(){
	ctb_list(player_jog_finish, noone,"小跑了一会，你们都停下来休息了一会",
		"[speaker:Amber]早上好！我是Amber，有个人陪我一起跑真不错.",
		"[speaker:Player]对呀！我是"+Player.name+",很高兴认识你。你经常在这里跑步么？",
		"[speaker:Amber]是的，我每天早上6点到8点都在。"
		);
}

function msg_Amber_jog_JP(){
	ctb_list(player_jog_finish, noone,"一通りジョギングをした後、二人は少し休憩をするために立ち止まりました。",
		"[speaker:Amber]おはよう！ わたしAmber。一緒にジョギングする人がいてうれしい！",
		"[speaker:Player]やっほー！私は " +Player.name+"、よろしくね。ここでよくジョギングするの？",
		"[speaker:Amber]うん！毎朝６時から８時までやってるの！"
		);
}