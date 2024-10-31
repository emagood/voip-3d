extends Node3D

const playerScene = preload("res://character.tscn")

func _ready():
	if multiplayer.is_server():
		push_warning("SERVER SESSION")
		multiplayer.peer_connected.connect(createPlayer)
		multiplayer.peer_disconnected.connect(removePlayer)
		print("CREATE SERVER %s" % 1)
		var player = playerScene.instantiate()
		player.name = str(1)
		playersNode.add_child(player, true)
	else:
		push_warning("CLIENT SESSION")
	pass

@onready var playersNode = $players
func createPlayer(id = 1):
	print("CREATE PLAYER %s" % id)
	var player = playerScene.instantiate()
	player.name = str(id)
	playersNode.add_child(player, true)

func removePlayer(id = 1):
	print("Player remove: ", str(id))
	var player = playersNode.get_node_or_null(str(id))
	if player:
		player.queue_free()
