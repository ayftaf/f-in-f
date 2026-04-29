extends Node
# variables
# EXPLORATION ---------------------------------------
var playerPosition: Vector2 = Vector2.ZERO
var currentArea: String = "starting_area"

# DECK SYSTEM ----------------------------------------
var isInDeckView: bool = false
var deckView=null

var collection: Dictionary = {}
var deck: Array = []

const deckMin = 10
const deckMax = 50

# start
func _ready() -> void:
	print("game manager started---")

# EXPLORATION -------------------------------------------------
func updatePlayerPosition(newPosition: Vector2) -> void:
	playerPosition = newPosition

func getPlayerPosition() -> Vector2:
	return playerPosition
#DECK MANAGEMENT BACK------------------------------------
func addCardToCollection(cardId : String) -> void:
	if not CardDatabase.cardExists(cardId):
		print("la carte suivante n'existe pas:", cardId)
		return
		
	if collection.has(cardId):
		collection[cardId] += 1
	else:
		collection[cardId] = 1
	print("la carte suivante a été ajoutée à la collection", cardId, "possédées:", collection[cardId])
	

#DECK MANAGEMENT FRONT-----------------------------------
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("openDeck"):
		toggleDeckView()

func toggleDeckView() -> void :
	isInDeckView = !isInDeckView
	if isInDeckView:
		openDeckView()
	else:
		closeDeckView()
		
func openDeckView() -> void:
	print("opening deck view")
	get_tree().get_root().get_node("Overworld/Player").process_mode = Node.PROCESS_MODE_DISABLED
	deckView.openDeck()
	
func closeDeckView() -> void:
	print("closing deck view")
	get_tree().get_root().get_node("Overworld/Player").process_mode = Node.PROCESS_MODE_INHERIT
	deckView.closeDeck()
