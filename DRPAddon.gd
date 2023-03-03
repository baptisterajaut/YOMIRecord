extends "res://DiscordRichPresence/ModHook.gd"

onready var _yomirecord_options = get_tree().get_root().get_node("ModLoader/YOMIRecord/YOMIRecordOptions")

func _ready():
	var recorder = get_tree().get_root().get_node("ModLoader/YOMIRecord/YOMIRecorder")
	if recorder:
		recorder.connect("recording_starting", self, "_yomirecord_start")
		recorder.connect("recording_ended", self, "_yomirecord_end")

func _yomirecord_start():
	if not _yomirecord_options or not _yomirecord_options.get_option("drp_record"): return
	var activityHandler = get_tree().get_root().get_node("Main/DiscordRichPresenceActivityHandler")
	if activityHandler:
		activityHandler.activity["details"] = "Recording a replay"
		activityHandler._post_activity()

func _yomirecord_end():
	if not _yomirecord_options or not _yomirecord_options.get_option("drp_record"): return
	var activityHandler = get_tree().get_root().get_node("Main/DiscordRichPresenceActivityHandler")
	if activityHandler:
		activityHandler.activity["details"] = "Watching a replay"
		activityHandler._post_activity()
