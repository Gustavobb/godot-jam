extends Sprite

func _ready():
	$Tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), .2, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()

func _on_Tween_tween_completed(_object, _key):
	queue_free()
