extends Control

func _process(_delta):
	$Panel/VBoxContainer/hull.text = "HULL INTEGRITY: {0}%".format([Autoload.resources["hull"]])
	$Panel/VBoxContainer/align.text = "ALIGNMENT: {0}%".format([Autoload.resources["alignment"]])
	$Panel/VBoxContainer/oxy.text = "OXYGEN LEVEL: {0}%".format([Autoload.resources["oxygen"]])
