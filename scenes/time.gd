extends Control

var elapsed_time : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Score: 0"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed_time += delta
	$Label.text = "Score: " + str("%.2f" % elapsed_time)

#str(int(elapsed_time))
