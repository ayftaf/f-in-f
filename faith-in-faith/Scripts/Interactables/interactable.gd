extends Area2D


var playerNearby = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		playerNearby = true
		print("E")
		
func _on_body_exited(body : Node2D) -> void:
	if body.name == "Player":
		playerNearby = false
		print("moved away")
		
func _input(event: InputEvent) -> void:
	if playerNearby and event.is_action_pressed("ui_accept"):
		interact()
		
func interact() -> void:
	print("*interaction*")
