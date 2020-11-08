extends Node2D


var checkThread=Thread.new()
var checkThreadSemaphore=Semaphore.new()

func _on_Timer_timeout():
  if !checkThread.is_active():
    checkThread.start(self,"passivationCheck")
  else:
    checkThreadSemaphore.post()

func passivationCheck(userdata)->void:
  while true:
    checkThreadSemaphore.wait()
    
    var ip=$Object
    if ip is InstancePlaceholder :
      print("Going to crash now...")
      ip.replace_by_instance()
