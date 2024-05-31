extends Control

var elapsed_time : float = 0.0

func _ready():
	$Label.text = "Score: 0"

func _process(delta):
	elapsed_time += delta
	$Label.text = "Score: " + str("%.2f" % elapsed_time)
