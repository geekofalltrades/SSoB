Scriptname SSoBModConfigurationMenu extends SKI_ConfigBase

GlobalVariable Property SSoBGemMarkers Auto

Event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("Quest Markers")
	AddToggleOption("Quest Markers on Stones of Barenziah", SSoBGemMarkers.GetValueInt())
EndEvent

Event OnOptionSelect(int option)
	if SSoBGemMarkers.GetValueInt()
		SSoBGemMarkers.SetValue(0)
		SetToggleOptionValue(option, 0)
	else
		SSoBGemMarkers.SetValue(1)
		SetToggleOptionValue(option, 1)
	endif
EndEvent

Event OnOptionDefault(int option)
	SSoBGemMarkers.SetValue(0)
	SetToggleOptionValue(option, 0)
EndEvent

Event OnOptionHighlight(int option)
	SetInfoText("Add quest markers to Stones of Barenziah.\nMarkers only appear once Vex has instructed you to find the Stones.")
EndEvent
