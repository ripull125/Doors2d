extends RichTextLabel

func _ready():
	self.hide()

func _on_Text_body_entered(body):
	if (body is Player):
		body.inspectable_text = self

func _on_Text_body_exited(body):
	if (body is Player):
		body.inspectable_text = null
		self.hide()
