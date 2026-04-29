extends Node

var allCards: Dictionary = {}

func getCard(cardId: String) -> Dictionary:
	if allCards.has(cardId):
		return allCards[cardId]
	print("WARNING: Card not found: ", cardId)
	return {}

func cardExists(cardId: String) -> bool:
	return allCards.has(cardId)
