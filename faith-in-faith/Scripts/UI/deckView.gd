extends Control


func _ready() -> void:
	GameManager.deckView = self
	visible= false
	
func openDeck() -> void:
	visible = true
	
func closeDeck() -> void:
	visible = false
