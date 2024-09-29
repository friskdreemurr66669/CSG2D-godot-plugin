@tool
extends StaticBody2D
class_name csg2dcircle

@export var generate_children := true
@export var kill_children := false

@export_category("attributes")
@export var radius := 50.
@export var texture : Texture2D

func _ready() -> void:
	generate_children = true

func _process(delta: float) -> void:
	if generate_children:
		kc()
		
		var inst = MeshInstance2D.new()
		inst.mesh = SphereMesh.new()
		inst.mesh.radius = radius
		inst.mesh.height = radius * 2
		inst.texture = texture
		add_child(inst)
		
		
		inst = CollisionShape2D.new()
		inst.shape = CircleShape2D.new()
		inst.shape.radius = radius
		add_child(inst)
	
	if kill_children:
		kc()
		generate_children = false
		kill_children = false


func kc() -> void:
	for i in get_child_count():
		get_child(i).queue_free()
	
