extends Area2D

func interact():
	if Autoload.currQuest in ["REPAIR_1", "REPAIR_2"] and !Autoload.crafterFixed:
		Autoload.resources["qCond"] = true
		Autoload.resources["metals"] -= 25
		Autoload.crafterFixed = true
	elif Autoload.currQuest == "ENG_1":
		Autoload.resources["metals"] -= 25
		Autoload.resources["silicon"] -= 10
		Autoload.resources["glass"] -= 5
