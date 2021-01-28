extends KinematicBody2D

const gravity = 200
var playerName = 'Claudio'
var hp = 100
var damage = 16.5
var isalive = false
var velocity = Vector2()
var speed = 100
onready var animatedSprite = $AnimatedSprite #Accediendo a un nodo hijo

func _ready():
	pass

func _process(delta):
	animation()

func _physics_process(delta):
	move(delta)
	move_and_slide(velocity,Vector2( 0 , -1)) #mover y deslizar, unico para kinematicbody
	

func move(delta):
	velocity.x = 0
	if(Input.is_action_pressed("left")):
		velocity.x -= speed
	if(Input.is_action_pressed("right")):
		velocity.x += speed
	if(!is_on_floor()):
		velocity.y += gravity * delta
	elif(Input.is_action_pressed('up')):
		velocity.y -= 200
		
		
func animation():
	if(velocity.x < 0):
		animatedSprite.animation = 'Walk'
		animatedSprite.flip_h = true
	if(velocity.x > 0):
		animatedSprite.animation = 'Walk'
		animatedSprite.flip_h = false
	if(velocity.x == 0):
		animatedSprite.animation = 'Idle'
#	if(velocity.y > 0):
		#animatedSprite.animation = 'Fall'
	if(velocity.y < 0):
		animatedSprite.animation = 'Jump'
func damage():
	pass
