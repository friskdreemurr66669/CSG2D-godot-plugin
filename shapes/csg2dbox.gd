@tool
extends StaticBody2D
class_name csg2dbox

@export var generate_children := true
@export var kill_children := false

@export_category("attributes")
@export var dimensions := Vector2(100, 100)
@export var texture : Texture2D

func _ready() -> void:
	generate_children = true

func _process(delta: float) -> void:
	if generate_children:
		kc()
		
		var inst = MeshInstance2D.new()
		inst.mesh = QuadMesh.new()
		inst.mesh.size = dimensions
		inst.texture = texture
		add_child(inst)
		
		
		inst = CollisionShape2D.new()
		inst.shape = RectangleShape2D.new()
		inst.shape.size = dimensions
		add_child(inst)
	
	if kill_children:
		kc()
		generate_children = false
		kill_children = false

func kc() -> void:
	for i in get_child_count():
		get_child(i).queue_free()
	
