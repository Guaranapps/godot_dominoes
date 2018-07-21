extends Spatial

const DOMINO_ITEM_SCENE=preload("res://domino_item.tscn")

export var nb_dominoes=200

func _ready():
	var first_domino=null
	var step=1.0/nb_dominoes
	var path_len=$Path.curve.get_baked_length()
	
	#generating dominoes
	for i in range(nb_dominoes):
		var pos=$Path.curve.interpolate_baked(i*step*path_len)
		#compute next domino position for rotation
		var pos_n=$Path.curve.interpolate_baked((i+1)*step*path_len)
		var domino=DOMINO_ITEM_SCENE.instance()
		add_child(domino)
		if(first_domino==null):
			first_domino=domino
		domino.translation=pos
		#compute rotation with next domino position
		domino.rotation.y=(Vector2(pos_n.z,pos_n.x)-Vector2(pos.z,pos.x)).angle()
		
	if(first_domino!=null):
		#push first domino (here direction is hardcoded, can change if path shape is different)
		first_domino.apply_impulse(Vector3(0,0,0),Vector3(0,0,1))
		$AnimationPlayer.play("anim")
		

