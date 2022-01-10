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

Actor Property PlayerRef Auto

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

	PlayerRef.RemoveItem(pTGCrownGem01.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem02.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem03.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem04.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem05.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem06.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem07.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem08.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem09.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem10.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem11.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem12.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem13.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem14.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem15.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem16.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem17.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem18.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem19.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem20.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem21.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem22.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem23.GetRef())
	PlayerRef.RemoveItem(pTGCrownGem24.GetRef())
	PlayerRef.RemoveItem(pTGCrown,1)
	pTGStand.Enable()

endFunction
