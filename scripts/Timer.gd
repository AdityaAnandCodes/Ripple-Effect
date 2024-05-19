extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	Reset_Timer()


var seconds=0
var minutes=0
var Dseconds=0
var Dminutes=3

func _on_timer_timeout():
	if seconds == 0:
		if minutes>0:
			minutes-=1
			seconds=60
	seconds-=1
			
	$Label.text=str(minutes)+":"+str(seconds)
	

func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes

