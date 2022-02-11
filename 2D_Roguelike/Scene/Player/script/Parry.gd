extends "res://Scene/Player/script/player_script_template.gd"

var is_parry = false

var parry_lockout = 10

func _ready():
	is_parry = false

func test_parry() -> bool:
	return is_parry
	
func sucessful_parry() -> void:
	print("parried")

func _physics_process(delta):
	if parry_lockout > 0:
		parry_lockout -= delta
	elif Input.is_action_just_pressed("parry"):
		is_parry = true

