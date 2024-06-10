extends Control

var elapsed_time : float = 0.0
var high_score = 0

func _ready():
	$score.text = "Score: 0"

func _process(delta):
	elapsed_time += delta
	$score.text = "Score: " + str("%.2f" % elapsed_time)
