extends Area2D

func interact():
	if Autoload.currQuest in ["REPAIR_1", "REPAIR_2"] and !Autoload.farmFixed:
		Autoload.resources["qCond"] = true
		Autoload.resources["metals"] -= 25
		Autoload.farmFixed = true
