extends CanvasLayer

signal start_game
# Called when the node enters the scene tree for the first time.
func _ready():
	$PauseLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("toggle_inventory"):
		get_tree().paused = !get_tree().paused
		var visibility = $PauseLabel.visible
		$PauseLabel.visible = !visibility
		print("this is gettting called at every pressure of I")
		

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
