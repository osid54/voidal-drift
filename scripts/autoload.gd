extends Node

var resources = {
				"metals":45,
				"silicon":2,
				"glass":5,
				"power gems":25,
				"seeds":30,
				"crops":20,
				"cooked food":10,
				"oxygen":50.0,
				"hunger":100.0,
				"alignment":100.0,
				"qCond":false,
				"hull":60.0,
				}

var farmFixed := false
var crafterFixed := false
var satFixed := false
var droneFixed := false
var engineStage := 0

var questline = {"START": {"started": false, "nextQuest": "CHECK_LOGS", "requirements": {"qCond":true}},
				 "CHECK_LOGS": {"started": false, "nextQuest": "ANALYZE_HULL", "requirements": {"qCond":true}},
				 "ANALYZE_HULL": {"started": false, "nextQuest": "FIX_HULL", "requirements": {"qCond":true}},
				 "FIX_HULL": {"started": false, "nextQuest": "REPAIR_1", "requirements": {"qCond":true, "hull":100.0}},
				 "REPAIR_1": {"started": false, "nextQuest": "AST_1", "requirements": {"qCond":true, "alignment":100.0, "metals":5}},
				 "AST_1": {"started": false, "nextQuest": "REPAIR_2", "requirements": {"qCond":true, "alignment":0, "metals":30}},
				 "REPAIR_2": {"started": false, "nextQuest": "AST_2", "requirements": {"qCond":true, "alignment":100.0, "metals":5}},
				 "AST_2": {"started": false, "nextQuest": "ENG_1", "requirements": {"qCond":true, "alignment":0, "metals":100, "silicon":10, "glass":15}},
				 "ENG_1": {"started": false, "nextQuest": "ALIENS", "requirements": {"qCond":true, "alignment":100.0, "metals":25}},
				 "ALIENS": {"started": false, "nextQuest": "ALIENS", "requirements": {"qCond":true, "alignment":0, "metals":300, "power gems":100, "glass":50}},
				 "ENG_COMPLETE": {"started": false, "nextQuest": "SLEEP", "requirements": {"qCond":true, "alignment":0, "oxygen":100}},
				 "SLEEP": {"started": false, "nextQuest": "END", "requirements": {"qCond":true}},
				 "END": {"started": false, "nextQuest": "END", "requirements": {"qCond":true}},
				 "_": {"started": false, "nextQuest": "_", "requirements": {}}}

var currQuest := "CHECK_LOGS"

func _ready():
	pass # Replace with function body.

func _process(_delta):
	print(currQuest)
	print(str(resources))
	print(str(questline[currQuest]["requirements"]))
	for req in questline[currQuest]["requirements"]:
		if resources[req] != questline[currQuest]["requirements"].get(req):
			return
	resources["qCond"] = false
	currQuest = questline[currQuest]["nextQuest"]
	questline[currQuest]["started"] = true
