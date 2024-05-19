extends Area2D

@export var left := false
@export var drone : Sprite2D

func interact():
	if !left:
		match(Autoload.currQuest):
			"ANALYZE_HULL":
				drone.send("ANALYZE_HULL",false)
			"FIX_HULL":
				Autoload.resources["metals"] -= 5
				drone.send("FIX_HULL",false)
			"AST_1":
				drone.send("AST_1",false)
			"AST_2":
				drone.send("AST_2",false)
			"_":
				return
	match(Autoload.currQuest):
		"REPAIR_1":
			drone.send("REPAIR_1",true)
			Autoload.resources["metals"] -= 10
		"ENG_1":
			drone.send("ENG_1",true)
			Autoload.resources["metals"] -= 75
			Autoload.resources["glass"] -= 10
		"ALIENS":
			if Autoload.resources["oxygen"] >= 60:
				drone.send("ALIENS",true)
		"ENG_COMPLETE":
			drone.send("ENG_COMPLETE",true)
			Autoload.resources["metals"] -= 300
			Autoload.resources["power gems"] -= 100
			Autoload.resources["glass"] -= 50
		"_":
			return
