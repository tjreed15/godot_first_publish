extends CharacterBody2D

const WIDTH: int = 128
const HEIGHT: int = 128

@export var SLOW_SPEED: int = 100
@export var FAST_SPEED: int = 500
@onready var speed: int = self.SLOW_SPEED
@onready var SCREEN: ColorRect = get_node('/root/World/Background')
@onready var LEFT_BOUND: Vector2 = Vector2(WIDTH/2.0, HEIGHT/2.0)
@onready var RIGHT_BOUND: Vector2 = Vector2(self.SCREEN.size.x - WIDTH/2.0, self.SCREEN.size.y - HEIGHT/2.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		self.speed = self.FAST_SPEED
	else:
		self.speed = self.SLOW_SPEED
	
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	self.velocity = self.velocity.slerp(input * self.speed, 0.9)
	self.move_and_slide()
	self.position = self.position.clamp(LEFT_BOUND, RIGHT_BOUND) 
	
		
