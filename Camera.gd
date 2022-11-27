
extends Camera

export var state = "none"

export var texture_subShieldZayavka : Material
export var texture_subShield1 : Material
export var texture_subShield2 : Material
export var texture_subShield3 : Material
export var texture_camCorridor4 : Material
export var texture_camRoom1 : Material


func _process(delta):
	if Input.is_action_pressed("game_watchDoor"):
		$AnimationTree.set("parameters/conditions/wathDoor", true)
		$AnimationTree.set("parameters/conditions/to_norm", false)
	else:
		$AnimationTree.set("parameters/conditions/wathDoor", false)
		
		if Input.is_action_pressed("game_zoomIn1"):
			$AnimationTree.set("parameters/conditions/to_norm", false)
			$AnimationTree.set("parameters/conditions/ZoomIn", true)
		else:
			$AnimationTree.set("parameters/conditions/ZoomIn", false)
			
			if Input.is_action_pressed("game_zoomIn2"):
				$AnimationTree.set("parameters/conditions/to_norm", false)
				$AnimationTree.set("parameters/conditions/ZoomIn2", true)
			else:
				$AnimationTree.set("parameters/conditions/ZoomIn2", false)
				
				if Input.is_action_pressed("game_watchBack"):
					$AnimationTree.set("parameters/conditions/to_norm", false)
					$AnimationTree.set("parameters/conditions/Back", true)
				else:
					$AnimationTree.set("parameters/conditions/Back", false)
					$AnimationTree.set("parameters/conditions/to_norm", true)

