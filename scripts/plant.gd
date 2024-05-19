extends Sprite2D

enum stages {dead,s1,s2,s3,s4,s5}
var anims = {stages.dead:"dead",
			 stages.s1:"s1",
			 stages.s2:"s2",
			 stages.s3:"s3",
			 stages.s4:"s4",
			 stages.s5:"s5"}
			
var stage := stages.dead
var oxy := false

func _ready():
	await get_tree().create_timer(randf_range(0,2)).timeout
	#stage = 1
	startAnim()
	$Timer.start()

func startAnim():
	$anim.play(anims[stage])

func timeOut():
	if stage == 0:
		return
	else:
		if stage != 5:
			stage+=1
			startAnim()
			if stage == 4:
				position.y -= 18
		else:
			if !oxy:
				oxy = true
				$bubbles.emitting = true
				startAnim()
			Autoload.resources["oxygen"] = clampf(Autoload.resources["oxygen"]+.1,0,100)
			print(str(Autoload.resources["oxygen"]))
