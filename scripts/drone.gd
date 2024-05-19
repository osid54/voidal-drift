extends Sprite2D

func send(quest, left):
	var startPos = $bot.position
	var tweenGO = get_tree().create_tween().set_parallel()
	tweenGO.tween_property($bot, "modulate", Color(0,0,0,1), 1).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	if left:
		tweenGO.tween_property($bot, "position", Vector2(startPos.x,startPos.y-100), 1).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	else:
		tweenGO.tween_property($bot, "position", Vector2(startPos.x,startPos.y+100), 1).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	match(quest):
		"ANALYZE_HULL":
			await get_tree().create_timer(3).timeout
		"FIX_HULL":
			await get_tree().create_timer(1).timeout
			Autoload.resources["hull"] += 10
			await get_tree().create_timer(1).timeout
			Autoload.resources["hull"] += 20
			await get_tree().create_timer(1).timeout
			Autoload.resources["hull"] += 10
			await get_tree().create_timer(1).timeout
		"AST_1":
			await get_tree().create_timer(10).timeout
			Autoload.resources["metals"] += 25
		"AST_2":
			await get_tree().create_timer(15).timeout
			Autoload.resources["metals"] += 75
			Autoload.resources["silicon"] += 8
			Autoload.resources["metals"] += 10
			Autoload.resources["power gems"] += 20
		"REPAIR_1":
			await get_tree().create_timer(1).timeout
			#fix
			await get_tree().create_timer(1).timeout
		"ENG_1":
			await get_tree().create_timer(1).timeout
			#fix
			await get_tree().create_timer(1).timeout
		"ALIENS":
			await get_tree().create_timer(5).timeout
			Autoload.resources["metals"] += 275
			Autoload.resources["power gems"] += 80
			Autoload.resources["glass"] += 50
		"ENG_COMPLETE":
			await get_tree().create_timer(5).timeout
			#fix
			await get_tree().create_timer(1).timeout
		"_":
			print("error")
			return
	var tweenCOME = get_tree().create_tween().set_parallel()
	tweenCOME.tween_property($bot, "modulate", Color(1,1,1,1), 1).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	tweenCOME.tween_property($bot, "position", startPos, 1).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	Autoload.resources["qCond"] = true
