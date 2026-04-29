extends Node

# Raw data
var Deck_1 = ["res://Resource/sigmacart.tres"]


# active game variablen -> change at runtime
var Deck :Array[Card]= []
var Handcards :Array[Card]= []
var pile

#abfeuer
var Money			:= 0

var Energy			:= 0
var EnergyMod		:= 0

var Handsize        := 8
var HandsizeMod     := 0

var DamageFlat      := 0
var DamageFlatMod   := 0

var DamageMult      := 0
var DamageMultMod   := 0

var Firerate        := 0
var FirerateMod     := 0

var Bulletsize      := 0
var BulletsizeMod   := 0

var Bulletspeed     := 0
var BulletspeedMod  := 0



