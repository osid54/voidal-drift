extends Node

var resources = {
				"metals":0,
				"silicon":0,
				"glass":0,
				"nuclear fuel":0,
				"seeds":0,
				"crops":0,
				"cooked food":0,
				"oxygen":100.0,
				"hunger":100.0,
				"alignment":100.0,
				"qCond":false
				}

var questline = {"START": {"started": false, "nextQuest": "CHECK_LOGS", "requirements": {"qCond":true}},
				 "CHECK_LOGS": {"started": false, "nextQuest": "ANALYZE_HULL", "requirements": {"qCond":true}},
				 "ANALYZE_HULL": {"started": false, "nextQuest": "FIX_HULL", "requirements": {"qCond":true}},
				 "FIX_HULL": {"started": false, "nextQuest": "REPAIR_1", "requirements": {"qCond":true}},
				 "REPAIR_1": {"started": false, "nextQuest": "AST_1", "requirements": {"qCond":true, "alignment":100.0, "metals":5}},
				 "AST_1": {"started": false, "nextQuest": "REPAIR_2", "requirements": {"qCond":true, "alignment":0, "metals":30}},
				 "REPAIR_2": {"started": false, "nextQuest": "AST_2", "requirements": {"qCond":true, "alignment":100.0, "metals":5}},
				 "AST_2": {"started": false, "nextQuest": "ENG_1", "requirements": {"qCond":true, "alignment":0, "metals":100, "silicon":20, "glass":15}},
				 "ENG_1": {"started": false, "nextQuest": "ALIENS", "requirements": {"qCond":true, "alignment":100.0, "metals":25}},
				 "ALIENS": {"started": false, "nextQuest": "ALIENS", "requirements": {"qCond":true, "alignment":0, "metals":300, "nuclear fuel":100, "glass":50}},
				 "ENG_COMPLETE": {"started": false, "nextQuest": "SLEEP", "requirements": {"qCond":true, "alignment":0, "oxygen":100}},
				 "SLEEP": {"started": false, "nextQuest": "END", "requirements": {"qCond":true}},
				 "END": {"started": false, "nextQuest": "END", "requirements": {"qCond":true}},
				 "_": {"started": false, "nextQuest": "_", "requirements": {}}}

var currQuest := "START"

func _ready():
	pass # Replace with function body.

func _process(_delta):
	for req in questline[currQuest]["requirements"]:
		#print(str(resources[req]))
		#print(str(questline[currQuest]["requirements"][req]))
		if resources[req] != questline[currQuest]["requirements"][req]:
			break
		else:
			currQuest = questline[currQuest]["nextQuest"]
			questline[currQuest]["started"] = true
			resources["qCond"] = false
