tool extends Camera

export(NodePath) var target=null setget set_target

var _target

func _ready():
	set_target(target)

func set_target(target_node):
	target=target_node
	if(target_node!=null):
		_target=get_node(target)
	else:
		_target=null

func _process(delta):
	if(_target!=null):
		look_at(_target.translation,Vector3(0,1,0))
