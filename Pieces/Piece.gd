extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2.ZERO

var Effects = null
var dying = false
var wiggle = 0.0
<<<<<<< Updated upstream
export var wiggle_amount = 1.5

export var transparent_time = 1.0
export var scale_time = 1.5
export var rot_time = 3.0
=======
export var wiggle_amount = 3

export var transparent_time = 1.0
export var scale_time = 1.5
export var rot_time = 1.5
>>>>>>> Stashed changes

var sound_1 = null;
var sound_2 = null;
var sound_3 = null;
<<<<<<< Updated upstream
var rng = RandomNumberGenerator.new()

var Coin = preload("res://Coin.tscn")
=======

var Explosion = preload("res://Explosion/Explosion.tscn")
var Coin = preload("res://Coin.tscn")

var rng = RandomNumberGenerator.new()

>>>>>>> Stashed changes
func _ready():
	$Select.texture = $Sprite.texture
	$Select.scale = $Sprite.scale
	wiggle = randf()
<<<<<<< Updated upstream

func _physics_process(_delta):
=======
	rng.randomize()

func _physics_process(_delta):
	
>>>>>>> Stashed changes
	if dying and not $Tween.is_active():
		queue_free()
	elif position != target_position and not $Tween.is_active():
		position = target_position
	if selected:
		$Select.show()
		$Selected.emitting = true
	else:
		$Select.hide()
		$Selected.emitting = false
<<<<<<< Updated upstream
	wiggle += 0.075
	position.x = target_position.x + (sin(wiggle)*wiggle_amount + rng.randf_range(-0.025, 0.05))
=======
		wiggle += 0.05 + rng.randf_range(-0.02,0.02)
		position.x = target_position.x + (sin(wiggle)*wiggle_amount)
	
>>>>>>> Stashed changes

func generate(pos):
	position = Vector2(pos.x,-100)
	target_position = pos
	$Tween.interpolate_property(self, "position", position, target_position, randf()+0.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
	$Tween.start()
	if sound_3 == null:
		sound_3 = get_node_or_null("/root/Game/3")
	if sound_3 != null:
		sound_3.play()
	

func move_piece(change):
	target_position = target_position + change
<<<<<<< Updated upstream
	$Tween.interpolate_property(self, "position", position, target_position, 0.15, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
=======
>>>>>>> Stashed changes
	if sound_2 == null:
		sound_2 = get_node_or_null("/root/Game/2")
	if sound_2 != null:
		sound_2.play()
<<<<<<< Updated upstream

func die():
	dying = true;
=======
	$Tween.interpolate_property(self, "position", position, target_position, 0.15, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func _on_Timer_timeout():
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var explosion = Explosion.instance()
		explosion.position = position
		Effects.add_child(explosion)
		print("boom")
	dying = true;
	
func die():
>>>>>>> Stashed changes
	if sound_1 == null:
		sound_1 = get_node_or_null("/root/Game/1")
	if sound_1 != null:
		sound_1.play()
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var coin = Coin.instance()
		coin.position = target_position
		Effects.add_child(coin)
<<<<<<< Updated upstream
	$Tween.interpolate_property(self, "modulate:a", 1, 0, transparent_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property(self, "scale", scale, Vector2(3,3), scale_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property($Sprite, "rotation",rotation, (randf()*4*PI)-2*PI, rot_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
=======
		$Timer.wait_time = 0.5 + (randf() / 10.0)
		$Timer.start()
		$Tween.interpolate_property(self, "modulate:a", 1, 0, transparent_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()
		$Tween.interpolate_property(self, "scale", scale, Vector2(3,3), scale_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()
		$Tween.interpolate_property($Sprite, "rotation",rotation, (randf()*4*PI)-2*PI, rot_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()

>>>>>>> Stashed changes
