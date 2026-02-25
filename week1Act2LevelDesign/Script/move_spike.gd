extends Node2D

@onready var the_wall: Node2D = $"The Wall"
@onready var wall_timer: Timer = $Timer
var will_wall_move := false

func _ready():
	wall_timer.timeout.connect(_on_timer_timeout)

func _physics_process(delta: float) -> void:
	if not will_wall_move:
		return
	
	the_wall.position.x += 3

func _on_timer_timeout() -> void:
	will_wall_move = true
