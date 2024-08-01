extends Area2D

@export var speed = 400 # a quantos pixels/seg

@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D

var screen_size  # tamanho da tela

func  _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2(0, 0) # O movimento do player
	if Input.is_action_just_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized()*speed
		animation_player.play("walk")
	else:
		animation_player.stop()
		
	position += velocity*delta
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)			
