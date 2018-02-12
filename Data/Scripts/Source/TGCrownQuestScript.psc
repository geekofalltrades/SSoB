Scriptname TGCrownQuestScript extends Quest  Conditional

GlobalVariable Property pTGCrownFound Auto
GlobalVariable Property pTGCrownTotal Auto
ReferenceAlias Property pTGCrownGem01 Auto
ReferenceAlias Property pTGCrownGem02 Auto
ReferenceAlias Property pTGCrownGem03 Auto
ReferenceAlias Property pTGCrownGem04 Auto
ReferenceAlias Property pTGCrownGem05 Auto
ReferenceAlias Property pTGCrownGem06 Auto
ReferenceAlias Property pTGCrownGem07 Auto
ReferenceAlias Property pTGCrownGem08 Auto
ReferenceAlias Property pTGCrownGem09 Auto
ReferenceAlias Property pTGCrownGem10 Auto
ReferenceAlias Property pTGCrownGem11 Auto
ReferenceAlias Property pTGCrownGem12 Auto
ReferenceAlias Property pTGCrownGem13 Auto
ReferenceAlias Property pTGCrownGem14 Auto
ReferenceAlias Property pTGCrownGem15 Auto
ReferenceAlias Property pTGCrownGem16 Auto
ReferenceAlias Property pTGCrownGem17 Auto
ReferenceAlias Property pTGCrownGem18 Auto
ReferenceAlias Property pTGCrownGem19 Auto
ReferenceAlias Property pTGCrownGem20 Auto
ReferenceAlias Property pTGCrownGem21 Auto
ReferenceAlias Property pTGCrownGem22 Auto
ReferenceAlias Property pTGCrownGem23 Auto
ReferenceAlias Property pTGCrownGem24 Auto
MiscObject Property pTGCrown Auto
ObjectReference Property pTGStand Auto
Quest Property pTGCrownQuest Auto
Quest Property pTG02BQuest Auto
Quest Property pTGCrownMiscQuest Auto

Function GemCheck()

	if pTGCrownQuest.GetStageDone(20)	;if No Stone Unturned is >= stage 20
		if ModObjectiveGlobal(1, pTGCrownFound, 20, pTGCrownTotal.value)
			SetStage(30)
		endif
	elseif !pTGCrownQuest.GetStageDone(20)	;if No Stone Unturned isn't >= stage 20
		if !pTG02BQuest.GetStageDone(40)	;if Meet The Family isn't at stage 40
			if pTGCrownMiscQuest.GetStageDone(10)	;if the Unusual Gem quest is already started
				pTGCrownFound.Value += 1	;add a gem to the count of gems found
			else	;if the Unusual Gem quest hasn't already started
				pTGCrownMiscQuest.SetStage(10)	;start the unusual gem quest
				pTGCrownFound.Value += 1	;add a gem to the count of gems found
			endif
		elseif pTG02BQuest.GetStageDone(40)	;if Meet The Family is at stage 40
			if !pTGCrownQuest.GetStageDone(10)	;if No Stone Unturned isn't >= stage 10
				pTGCrownQuest.SetStage(10)	;set No Stone Unturned to Stage 10
				pTGCrownFound.Value += 1	;add a gem to the count of gems found
			else	;if No Stone Unturned is >= stage 10
				pTGCrownFound.Value += 1	;add a gem to the count of gems found
			endif
		endif
	endif

endFunction

Function CleanUp()

	Game.GetPlayer().RemoveItem(pTGCrownGem01.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem02.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem03.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem04.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem05.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem06.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem07.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem08.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem09.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem10.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem11.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem12.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem13.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem14.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem15.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem16.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem17.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem18.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem19.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem20.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem21.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem22.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem23.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrownGem24.GetRef())
	Game.GetPlayer().RemoveItem(pTGCrown,1)
	pTGStand.Enable()

endFunction
