extends Node3D

static var peer = ENetMultiplayerPeer.new()

func createServer():
	peer.create_server(12806)
	multiplayer.multiplayer_peer = peer
	get_tree().change_scene_to_file("res://world.tscn")
	
func createClient():
	# be sure to remove your IP from here before push to public git
	peer.create_client("localhost", 12806)
	
	multiplayer.multiplayer_peer = peer
	get_tree().change_scene_to_file("res://world.tscn")

func _on_host_button_down():
	createServer()

func _on_connect_to_server_button_down():
	createClient()
