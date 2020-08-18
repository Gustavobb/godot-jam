extends Node

onready var cooldown = $Cooldown
const END_VALUE = 1
var is_active = false
var can_slo = true
var time_start
var duration_ms
var start_value

func start(duration = 4, strenght = 0.6):
	if can_slo:
		time_start = OS.get_ticks_msec()
		duration_ms = duration * 1000
		start_value = 1 - strenght
		Engine.time_scale = start_value
		is_active = true
		can_slo = false
	
func _physics_process(_delta):
	if is_active:
		var current_time = OS.get_ticks_msec() - time_start
		var value = circl_ease_in(current_time, start_value, END_VALUE, duration_ms)
		if current_time >= duration_ms:
			is_active = false
			cooldown.start()
			value = END_VALUE
			
		Engine.time_scale = value

func circl_ease_in(t, b, c, d):
	t /= d
	t -= 1
	return c * sqrt(1 - t * t) + b;
	
func _ready():
	Engine.time_scale = 1

func _on_Cooldown_timeout():
	can_slo = true