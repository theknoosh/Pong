extends Node2D

const PLAYERSPEED = 100
const INTBALLSPEED = 100

var screenSize
var padSize
var ballDirection = Vector2(1.0, 0.0)
var ballSpeed = INTBALLSPEED

func _ready():
	screenSize = get_viewport_rect().size
	set_process(true)

	pass
	
func _process(delta):

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

	
		
	
		
		
		
		
		