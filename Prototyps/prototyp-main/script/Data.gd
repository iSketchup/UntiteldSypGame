extends Node

# Raw data
var Deck_1 = ["res://Resource/sigmacart.tres","res://Resource/sigmacart.tres","res://Resource/sigmacart.tres",
			"res://Resource/sigmacart.tres","res://Resource/sigmacart.tres","res://Resource/sigmacart.tres",
			"res://Resource/sigmacart.tres","res://Resource/sigmacart.tres","res://Resource/sigmacart.tres", 
			"res://Resource/sigmacart.tres","res://Resource/sigmacart.tres","res://Resource/sigmacart.tres"]

# could be other => not useless
var DeckToLoad = Deck_1

# active game variablen -> change at runtime
var Deck 			:Array[Card]= []
var Drawpile		:Array[Card]= []
var Handcards 		:Array[Card]= []
var pile 			:Array[Variant] =[[[]]]

#Deck init sachen
func load_Deck():
	for Link in DeckToLoad:
		var Cardloaded = load(Link)
		Deck.append(Cardloaded)


func populate_Drawpile():
	Drawpile.clear()
	for card in Deck:
		Drawpile.append(card)

		

func _ready() -> void:
	load_Deck()
	

#abfeuer
var Money			:= 0

var Energy			:= 0
var EnergyMod		:= 1

var Handsize        := 7
var HandsizeMod     := 1

var DamageFlat      := 0
var DamageFlatMod   := 1

var DamageMult      := 0
var DamageMultMod   := 1

var Firerate        := 0
var FirerateMod     := 1

var Bulletsize      := 0
var BulletsizeMod   := 1

var Bulletspeed     := 0
var BulletspeedMod  := 1
var Roundcount := 1


