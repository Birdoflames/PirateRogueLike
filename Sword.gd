extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var sprite = $Sprite2D

const DAMAGE = 5

func swing(start_pos):
	rotation = start_pos
	sprite.show()
	collision_shape.set("disabled", false)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "rotation", rotation + 180, 0.7)	
	tween.tween_callback(dissapear)  # Waits for animation end to dissapear


func dissapear():
	sprite.set("visible", false)
	collision_shape.set("disabled", true)
