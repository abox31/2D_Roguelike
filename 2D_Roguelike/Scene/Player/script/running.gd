extends "res://Scene/player/script/player_script_template.gd"

var fall_gravity : float

# How fast the player moves in meters per second.
export var speed = 14

var velocity = Vector2.ZERO

func turn_on()->void:
	.turn_on()
	animator._play("run");

func _physics_process(delta):
	if is_able:
		var direction = Vector2.ZERO

		direction.x = get_horizental_input()
		
		velocity.x = direction.x * speed
		# gravity dont need for now 
		
		if Input.is_action_just_released("ui_left"):
			statemachine.change_state_to("Idle")
		if Input.is_action_just_released("ui_right"):
			statemachine.change_state_to("Idle")
		if Input.is_action_just_pressed("ui_up"):
			statemachine.change_state_to("Jump")
		if Input.is_action_just_pressed("skill_use"):
			statemachine.change_state_to("ChargeSkill")
			
		apply_gravity(fall_gravity, delta)
			
#		if not player.is_on_floor():
#			statemachine.change_state_to("Jump")
#			statemachine.get_node("Jump").leave_floor = true
		
		velocity = player.move_and_slide(velocity, Vector2.UP)
