Scriptname TGCrownSSoBMaintenance  Extends ReferenceAlias
{Performs maintenance on save load, renaming all gem inventory items and gem activator objects, if appropriate.}

Quest Property TGCrownQuest Auto
{A reference to the Stone of Barenziah collection quest.}

GlobalVariable Property SSoBDebugMode Auto
{Is SSoB debug mode enabled?}

MiscObject Property TGCrownGemInventory Auto
Activator Property TGCrownGemActivator Auto

Event OnPlayerLoadGame()	;run every time the player loads their game
	if SSoBDebugMode.getValueInt()
		Debug.Trace(self + ": OnPlayerLoadGame() event triggered; determining whether to rename stones")
	endif
	
	if TGCrownQuest.GetStageDone(20) && !TGCrownQuest.GetStageDone(200)	;if No Stone Unturned has progressed past the point where Unusual Gems should now be Stones of Barenziah and isn't completed
		if SSoBDebugMode.getValueInt()
			Debug.Trace(self + ": conditions met: renaming unusual gem inventory and activator to \"Stone of Barenziah\"")
		endif
		TGCrownGemInventory.SetName("Stone of Barenziah")	;rename all Unusual Gem inventory items and activators to Stone of Barenziah for the remainder of this game session
		TGCrownGemActivator.SetName("Stone of Barenziah")
	else	;if No Stone Unturned is not at the point where Unusual Gems should be Stones of Barenziah
		if SSoBDebugMode.getValueInt()
			Debug.Trace(self + ": conditions not met: renaming unusual gem inventory and activator to \"Unusual Gem\" (prevents players with multiple characters from seeing Stone of Barenziah when they shouldn't)")
		endif
		TGCrownGemInventory.SetName("Unusual Gem")	;rename them to Unusual Gem for the duration of this game session
		TGCrownGemActivator.SetName("Unusual Gem")	;this prevents players who loaded a save where No Stone Unturned was >= 20, then loaded a different one where it was < 20 from seeing "Stone of Barenziah" when they shouldn't
	endif
endEvent
