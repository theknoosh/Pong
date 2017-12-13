extends Node2D

const PLAYERSPEED = 100
const INTBALLSPEED = 100

var screenSize
var padSize
var ballDirection = Vector2(-1.0, 0.0)
var ballSpeed = INTBALLSPEED
var rightScore = 0
var leftScore = 0

func _ready():
	
	screenSize = get_viewport_rect().size
	padSize = get_node("rightPlayer").get_texture().get_size()
	
	set_process(true)

	pass
	
func _process(delta):

	# Ball position
	var ballPosition = get_node("ball").get_pos()
	
	#Colliders
	var leftCollider = Rect2(get_node("LeftPlayer").get_pos() - padSize * 0.5, padSize)
	var rightCollider = Rect2(get_node("rightPlayer").get_pos() - padSize * 0.5, padSize)
	
	var rightPlayerPosition = get_node("rightPlayer").get_pos()
	var leftPlayerPosition = get_node("LeftPlayer").get_pos()

	if (Input.is_action_pressed("ui_down")):
		rightPlayerPosition.y += PLAYERSPEED * delta
		
	if (Input.is_action_pressed("ui_up")):
		rightPlayerPosition.y += -PLAYERSPEED * delta
			
	get_node("rightPlayer").set_pos(rightPlayerPosition)
		
	if (Input.is_action_pressed("left_down")):
		leftPlayerPosition.y += PLAYERSPEED * delta
		
	if (Input.is_action_pressed("left_up")):
		leftPlayerPosition.y += -PLAYERSPEED * delta
			
	get_node("rightPlayer").set_pos(rightPlayerPosition)
	get_node("LeftPlayer").set_pos(leftPlayerPosition)
	
	# Check to see if paddle has left the screen
	if (rightPlayerPosition.y < -14):
		var resetPos = Vector2(rightPlayerPosition.x, screenSize.height)
		get_node("rightPlayer").set_pos(resetPos)
		
	if (rightPlayerPosition.y > screenSize.height):
		var resetPos = Vector2(rightPlayerPosition.x, -14.0)
		get_node("rightPlayer").set_pos(resetPos)
		
	if (leftPlayerPosition.y < -14):
		var resetPos = Vector2(leftPlayerPosition.x, screenSize.height)
		get_node("LeftPlayer").set_pos(resetPos)
		
	if (leftPlayerPosition.y > screenSize.height):
		var resetPos = Vector2(leftPlayerPosition.x, -14.0)
		get_node("LeftPlayer").set_pos(resetPos)
		
	ballPosition += ballDirection * ballSpeed * delta
	if ((ballPosition                                                                                                                                   .y < 0 and ballDirection.y < 0) or (ballPosition.y > screenSize.height and ballDirection.y > 0)):
		ballDirection.y = -ballDirection.y
		
	if (leftCollider.has_point(ballPosition) or rightCollider.has_point(ballPosition)):
		ballDirection.x = -ballDirection.x
		ballDirection.y = randf()*2 -1
		ballDirection.normalized()
		if(ballSpeed < 300):
			ballSpeed *= 1.4
			
	#Game Over!
	if (ballPosition.x < 0):
		ballPosition = screenSize * 0.5
		ballSpeed = INTBALLSPEED
		rightScore += 1
		ballDirection.x = -ballDirection.x
		ballDirection.y = 0
		
	if (ballPosition.x > screenSize.width):
		ballPosition = screenSize * 0.5
		ballSpeed = INTBALLSPEED
		leftScore += 1
		ballDirection.x = - ballDirection.x
		ballDirection.y = 0
	
	get_node("ball").set_pos(ballPosition)
	get_node("leftScore").set_text(str(leftScore))
	get_node("rightScore").set_text(str(rightScore))

	
		
	
		
		
		
		
		