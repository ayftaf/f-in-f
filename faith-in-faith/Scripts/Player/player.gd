extends CharacterBody2D

# speed est builtin
const SPEED = 200.0

func _ready() -> void:
	print("player ready---")
	
#la physique de player est gérée par la fonciton handlemovement	
func _physics_process(delta: float) -> void:
	handleMovement()
	
	GameManager.updatePlayerPosition(global_position)
	#global_position built-in, position relative à 0,0 sur le repere entier
	

func handleMovement() -> void:
	
	var inputDirection = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		inputDirection.y -= 1
	if Input.is_action_pressed("ui_down"):
		inputDirection.y += 1
	if Input.is_action_pressed("ui_left"):
		inputDirection.x -= 1
	if Input.is_action_pressed("ui_right"):
		inputDirection.x += 1
	# normalisation de la vitesse diagonale
	if inputDirection.length() > 0:
		inputDirection = inputDirection.normalized()
		velocity = inputDirection * SPEED
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
