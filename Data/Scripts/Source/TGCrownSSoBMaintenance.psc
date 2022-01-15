Scriptname TGCrownSSoBMaintenance Extends ReferenceAlias
{Performs maintenance on save load, renaming all gem inventory items and gem activator objects, if appropriate.}

Quest Property TGCrownQuest Auto
{A reference to the Stone of Barenziah collection quest.}

MiscObject Property TGCrownGemInventory Auto
Activator Property TGCrownGemActivator Auto

Event OnInit()
	;if this is a new game, name the stones Unusual Gem. This prevents players
	;who loaded a game in which the gems had been renamed to Stone of Barenziah,
	;then quit to the main menu and started a new game, from seeing "Stone of
	;Barenziah" when they shouldn't.
	TGCrownGemInventory.SetName("Unusual Gem")
	TGCrownGemActivator.SetName("Unusual Gem")
EndEvent

Event OnPlayerLoadGame()
	;if No Stone Unturned has progressed past the point where Unusual Gems should now be Stones of Barenziah and isn't completed
	if TGCrownQuest.GetStageDone(20) && !TGCrownQuest.GetStageDone(200)
		;rename all Unusual Gem inventory items and activators to Stone of Barenziah for the remainder of this game session
		TGCrownGemInventory.SetName("Stone of Barenziah")
		TGCrownGemActivator.SetName("Stone of Barenziah")
	;if No Stone Unturned is not at the point where Unusual Gems should be Stones of Barenziah
	else
		;rename them to Unusual Gem for the duration of this game session
		;this prevents players who loaded a save where No Stone Unturned was >= 20, then loaded a different
		;one where it was < 20, from seeing "Stone of Barenziah" when they shouldn't
		TGCrownGemInventory.SetName("Unusual Gem")
		TGCrownGemActivator.SetName("Unusual Gem")
	endif
EndEvent
