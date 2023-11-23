extends CharacterBody3D

var player_speed: float = 10.0

@onready var velocity_component: Node = $VelocityComponent

func _physics_process(delta: float) -> void:
	var movement_vector: Vector3 = get_movement_vector()
	var direction: Vector3 = movement_vector.normalized()
	
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)


func get_movement_vector() -> Vector3:
	var x_movement: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var z_movement: float = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	return Vector3(x_movement, 0, z_movement)
