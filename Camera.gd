
extends Camera

export var state = "norm"

export var texture_subShieldZayavka : Material
export var texture_subShield1 : Material
export var texture_subShield2 : Material
export var texture_subShield3 : Material

export var texture_linuxInstall : Material
var flag = false


export var texture_camCorridor4 : Material
export var texture_camRoom1 : Material



export var mon1 : NodePath
export var mon2 : NodePath
export var mon3 : NodePath
export var mon4 : NodePath
export var mon5 : NodePath
export var mon6 : NodePath
export var mon7 : NodePath
export var mon8 : NodePath

func _ready():
	get_node(mon1).set_surface_material(0, texture_camRoom1)
	get_node(mon2).set_surface_material(0, texture_subShield1)
	get_node(mon3).set_surface_material(0, texture_subShield2)
	get_node(mon4).set_surface_material(0, texture_subShield1)
	get_node(mon5).set_surface_material(0, texture_subShield3)
	get_node(mon6).set_surface_material(0, texture_subShield3)
	get_node(mon7).set_surface_material(0, texture_subShieldZayavka)
	get_node(mon8).set_surface_material(0, texture_camCorridor4)
	pass

func set_state():
	if Input.is_action_pressed("game_watchDoor"):
		if state == "none":
			state = "door"
			$AnimationTree.set("parameters/conditions/wathDoor", true)
			$AnimationTree.set("parameters/conditions/to_norm", false)
		return
	else:
		$AnimationTree.set("parameters/conditions/wathDoor", false)
		
	if Input.is_action_pressed("game_zoomIn1"):
		if state == "none":
			state = "cams1"
			$AnimationTree.set("parameters/conditions/to_norm", false)
			$AnimationTree.set("parameters/conditions/ZoomIn", true)
		return
	else:
		$AnimationTree.set("parameters/conditions/ZoomIn", false)
			
	if Input.is_action_pressed("game_zoomIn2"):
		if state == "none":
			state = "cams2"
			$AnimationTree.set("parameters/conditions/to_norm", false)
			$AnimationTree.set("parameters/conditions/ZoomIn2", true)
		return
	else:
		$AnimationTree.set("parameters/conditions/ZoomIn2", false)
				
	if Input.is_action_pressed("game_watchBack"):
		if state == "none":
			state = "back"
			$AnimationTree.set("parameters/conditions/to_norm", false)
			$AnimationTree.set("parameters/conditions/Back", true)
		return
	else:
		$AnimationTree.set("parameters/conditions/Back", false)
	$AnimationTree.set("parameters/conditions/to_norm", true)
	state = "none"

func _process(_delta):
	#Перемещения
	set_state()
	#Гуишка музикбокса
	$"../MusixBox/TimeBar".value = $"../MusixBox/AudioStreamPlayer3D".get_playback_position()
	if $"../MusixBox/TimeBar".value > 60:
		if flag == true:
			return
		flag = true
		$"../MusixBox/AudioStreamPlayer3D".stop()
		$"../Cams/InstallingLinux/VideoPlayer".play()
		get_node(mon1).set_surface_material(0, texture_linuxInstall)
		get_node(mon2).set_surface_material(0, texture_linuxInstall)
		get_node(mon3).set_surface_material(0, texture_linuxInstall)
		get_node(mon4).set_surface_material(0, texture_linuxInstall)
		get_node(mon5).set_surface_material(0, texture_linuxInstall)
		get_node(mon6).set_surface_material(0, texture_linuxInstall)
		get_node(mon7).set_surface_material(0, texture_linuxInstall)
		get_node(mon8).set_surface_material(0, texture_linuxInstall)
	if state == "cams2":
		$"../MusixBox".show()
		$"../MusixBox/AudioStreamPlayer3D".unit_db = -25
	else:
		$"../MusixBox".hide()
		$"../MusixBox/AudioStreamPlayer3D".unit_db = -40
	#Гуишка Постера монетизации
	if state == "back":
		$"../Backs".show()
	else:
		$"../Backs".hide()
	#debug
	if Input.is_action_pressed("debug_on"):
		$"../Control".show()
	else:
		$"../Control".hide()
	$"../Control/AspectRatioContainer/Label".text = "Algert: " + $"../Альберт".position


func _on_ResetBut_pressed():
	flag = false
	get_node(mon1).set_surface_material(0, texture_camRoom1)
	get_node(mon2).set_surface_material(0, texture_subShield1)
	get_node(mon3).set_surface_material(0, texture_subShield2)
	get_node(mon4).set_surface_material(0, texture_subShield1)
	get_node(mon5).set_surface_material(0, texture_subShield3)
	get_node(mon6).set_surface_material(0, texture_subShield3)
	get_node(mon7).set_surface_material(0, texture_subShieldZayavka)
	get_node(mon8).set_surface_material(0, texture_camCorridor4)
	$"../MusixBox/AudioStreamPlayer3D".play()
	$"../Cams/InstallingLinux/VideoPlayer".stop()


func _on_Monetization_pressed():
	pass # Replace with function body.
