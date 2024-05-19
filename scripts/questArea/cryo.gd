extends Area2D

func interact():
	if Autoload.currQuest == "SLEEP":
		Autoload.resources["qCond"] = true
	#end scene
