extends Area2D

func interact():
	if Autoload.currQuest == "CHECK_LOGS":
		Autoload.resources["qCond"] = true
	#show hud
