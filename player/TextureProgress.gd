extends TextureProgress


var shield_timer: Timer


func _ready():
	shield_timer = get_node("../shield_timer")
	set_max(get_parent().SHIELD_MAX)
	$refill.set_max(shield_timer.get_wait_time()*100)


func _physics_process(_delta):
	self.set_rotation_degrees(-get_parent().get_rotation_degrees())
	self._set_global_position(Vector2(get_parent().get_global_position().x-128,global.screen_size.y-96))
	if get_parent().shield >= 0: # prevent negative values to add +1 to the bar
		set_value(get_parent().shield )
	if get_parent().shield < 3:
		$refill.set_value((shield_timer.get_wait_time()-shield_timer.get_time_left())*100)
	else:
		$refill.set_value(0)
