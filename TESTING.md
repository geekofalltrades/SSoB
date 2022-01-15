# Testing SSoB

These notes are more for me than for anyone else.

The ["No Stone Unturned" UESP page][1] is a fantastic resource for all of this.

[1]: https://en.uesp.net/wiki/Skyrim:No_Stone_Unturned

## Glossary

* activator/stone activator: The in-world Unusual Gem/Stone of Barenziah, before
  you have picked it up and added it to your inventory, is not a "real" in-world
  item, but belongs to a class of Creation Kit abstractions called "activators."
  I will refer to the in-world stones as "stone activators" throughout this
  document.
* reglar-style vs. door-style quest marker: Because I don't know what else to
  call these. A regular-style quest marker is a plain arrowhead pointing down at
  a quest object. A door-style quest marker is found on a door when the quest
  object is through that door, and looks like the same arrowhead, but pointing
  through a door.

## Known Issues

* If you save your game looking at a stone activator, then, upon reloading the
  save or reloading the game, it may have the incorrect name ("Unusual Gem" when
  it should be called "Stone of Barenziah", or vice versa). If you move your
  crosshair off the activator, then back on, its name will be correct. This is
  because the game has not yet had time to run its maintenance script, which
  runs on save load. I consider this not critical, and am unsure whether it is
  fixable.

## Testing Load Order

1. Unofficial Skyrim Special Edition Patch: Required for Alternate Start: Live
   Another Life.
2. SkyUI: Required for MCM and because it's SkyUI.
3. Alternate Start: Live Another Life: Start the game much more quickly than
   normal, without potentially breaking things by running `coc` from the main
   menu.
4. SSoB.

skse64 is also required. The [Copy and Paste in Console](https://www.nexusmods.com/skyrimspecialedition/mods/30928)
plugin could potentially be useful for pasting commands from this document into
the console, but is broken in Anniversary Edition as of 2022-01-09.

## Testing Methodology

Read each section fully before starting, then proceed through each section in
order.

Considerations:

* Pay attention to which and how many stones you've collected. The Dark
  Brotherhood Sanctuary gem has a section devoted to it, so don't collect it
  before that section. Make sure that there are enough gems left to collect to
  complete each section.
* Test toggling quest markers both via the console and via the MCM at least
  once each.
* Start new characters using Alternate Start: Live Another Life, *not* by
  `coc`-ing from the main menu. Even though the `coc` approach is faster, it
  results in a game that isn't fully, properly initialized.
* In each testing run, when collecting the first few stones, choose different
  stones each time. Across different testing runs, this will help make sure that
  all quest markers correctly disappear when stones are collected. We collect
  the first few stones before quest markers appear, so don't normally get to see
  them.
* Use the following console commands:
    * `coc`: Teleport to quest locations, most notably to Stones of Barenziah.
      See the [Quest Locations](#quest-locations) section for a list of their
      locations.
    * `tgm`: Turn on god mode for invincibility and infinite stamina so you can
      sprint to stone locations.
    * `tdetect`: Turn off enemy AI detection so no enemies notice or attack you.
    * `tcl`: Turn off collision so you can fly through walls and obstacles to
      reach stones more quickly.
* Skyrim limits how many quest markers it will show in the game world and on the
  compass, but does not limit how many are shown on the map. I've seen in at
  least one place that the limit is 16. Since there are 24 stones, not all
  stones will have quest markers in-world until 8 are collected. If a stone
  isn't showing a quest marker in-world or on the compass, but it shows a quest
  marker in the map, then the quest marker is working.

### Test Quest Marker Activation, Renaming, and Stacking

1. Start a new character with Alternate Start: Live Another Life. After choosing
   your alternate start and sleeping in the bed, wait for all game start quests
   and messages to complete.
2. Before collecting any stones, toggle quest markers on and off. Verify that no
   markers appear.
3. Collect a few stones. Do not collect the stone in the Dark Brotherhood
   Sanctuary. Verify that stone activators and the inventory item are both
   both called "Unusual Gem."
4. Toggle quest markers on and off. Verify that no markers appear.
5. Become a full member of the Thieves' Guild:
    1. `setstage TG02 0`
    2. Exit the console and wait for all quest messages to complete. You should
       end up starting "Loud and Clear."
    3. `setstage TG02 35`
6. Toggle quest markers on and off. Verify that no markers appear.
7. Progress "No Stone Unturned."
    * Talk to Vex (`coc RiftenRaggedFlagon`) and mash through her intro dialogue
      to get to the prompt about the unusual gems.
    * OR use the console: `setstage TGCrown 20`. This skips testing early quest
      progression in the `TGCrown` quest, though, so only do it if you're
      confident things are working up to this point.
8. Verify that the stones are renamed to "Stone of Barenziah" in your inventory.
9. Toggle quest markers on and off. Verify that they appear when toggled on, and
   disappear when toggled off. At the end of this step, leave quest markers
   *on*.
10. Collect more (but not all) of the stones. Do not collect the stone in the
    Dark Brotherhood Sanctuary. Verify that the stone activators have been
    renamed to "Stone of Barenziah." Verify that they stack in your inventory.
    Verify that the quest marker over each stone activator disappears when the
    stone is collected.

### Test Quest Marker for Dark Brotherhood Stone

1. Verify that a quest marker appears on the Dark Brotherhood Sanctuary door
   (`coc DarkBrotherhoodSanctuaryExterior`). It is a regular-style quest marker,
   not a door-style quest marker. This is expected.
2. Start the Dark Brotherhood questline:
    1. `setstage DB02 10`
    2. `player.moveto 1BDE8`
    3. Kill one of the hostages, then complete Astrid's dialogue.
3. Return to the Dark Brotherhood Sanctuary exterior. Verify that a quest marker
   still appears on the door.
4. Interact with the door using the dialogue option, "Silence, my brother," to
   enter the sanctuary.
5. Verify that a quest marker appears on the Stone of Barenziah inside the Dark
   Brotherhood Sanctuary (should be visible immediately upon entering.)
6. Leave the Dark Brotherhood Sanctuary. Verify that a quest marker still
   appears on the door from outside. It will have changed to a door-style quest
   marker. This is expected.
7. If the stone inside the Dark Brotherhood Sanctuary is the last one you
   haven't collected, don't collect it yet.

### Test Renaming Across Saves and New Games

1. Poise yourself near a stone activator, but _do not collect it_ yet.
2. Save your game. I will refer to this as "save A."
3. Exit to the main menu.
4. Start a new character with Alternate Start: Live Another Life.
5. Collect a stone. Verify that the stone activator and the inventory item are
   both called "Unusual Gem."
6. Poise yourself near a stone activator, but _do not collect it_ yet.
7. Save your game. I will refer to this as "save B."
8. Load save A. Verify that the stone activator you are next to is named "Stone
   of Barenziah." Verify that the stones are named "Stone of Barenziah" in your
   inventory.
9. Load save B. Verify that the stone activator you are next to is named
   "Unusual Gem." Verify that the stones are named "Unusual Gem" in your
   inventory.

We are now finished with save B.

### Test Renaming Across Game Restart

1. Exit the game.
2. Start the game.
3. Load save A. Verify that the stone activator you are next to is named "Stone
   of Barenziah." Verify that the stones are named "Stone of Barenziah" in your
   inventory.

### Test Quest Completion

1. Collect the remaining stones. Verify that the stones continue to stack in
   your inventory, all the way up to 24. Verify that the quest marker over each
   stone activator disappears when the stone is collected.
2. Progress "No Stone Unturned."
    * Talk to Vex (`coc RiftenRaggedFlagon`) and tell her you've found all of
      the stones.
    * OR use the console: `setstage TGCrown 30`. Again, this skips testing
      normal quest progress, so use it only if you're confident that already
      works.
3. Collect the Crown of Barenziah and return to Vex to complete "No Stone
   Unturned." Verify that the Stones of Barenziah are removed from your
   inventory.

We are now finished with save A.

## Quest Locations

`coc` commands for reaching quest locations.

### Vex

`coc RiftenRaggedFlagon`

### Unusual Gems/Stones of Barenziah

These are in easy-to-reach locations and are good candidates for the first 1-3
gems to collect (before quest markers are enabled):

* `coc WhiterunHalloftheDeadCatacombs`: It's directly in front of you.
* `coc WhiterunDragonsreachJarlsQuarters`: Go through the door directly in
  front of you and turn left. It's on a bedside table.
* `coc WhiterunJorrvaskrBasement`: Turn right. Go through the door at the end
  of the hall. Go through the door on the right. It's on a bookshelf across the
  room.
* `coc SolitudeBluePalace`: Go upstairs. Turn left at the top of the stairs and
  left down that hallway. Go through the door at the end of the hallway. It's
  on a bedside table.
* `coc SolitudeProudspireManor`: Go up two flights of stairs to the bedroom at
  the top. It's on a dresser on your left through the bedroom door.
* `coc RiftenMistveilKeepJarlsChambers`: It's on a bedside table.
* `coc WindhelmPalaceUpstairs01`: It's directly in front of you.
* `coc WindhelmHouseofClanShatterShield`: It's directly in front of you.
* `coc MarkarthTreasuryHouse`: Go left around the desk and through the locked
  door straight ahead. It's on a bedside table.
* `coc MarkarthWizardsQuarters01`: Go to the left through a locked gate. It's
  on a table to your right.
* `coc WinterholdCollegeArchMageQuarters`: Turn left. It's on a bookshelf 
  about 1/3 of the way around the back of the room.
* `coc DeadCroneRockExterior02`: Go up the stairs. It's on the altar.
* `coc BlackBriarLodge01`: Go through the door on the right and straight
  across the landing. It's on a bedside table.
* `coc ThalmorEmbassy05`: It's at the end of the (short) cave, past the troll,
  by the dead body.

These are in difficult-to-reach locations. Reach them using their quest markers,
`tcl`, and infinite sprint with `tgm`.

* `coc RannveigsFast01`
* `coc Ansilvund02`
* `coc StonyCreekCave01`
* `coc FellglowKeep02`
* `coc DaintySload01`
* `coc SunderstoneGorge01`
* `coc Yngvild02`
* `coc HobsFallCave01`
* `coc Pinewatch02`
* `coc DarkBrotherhoodSanctuary`

### Crown of Barenziah

`coc TolvaldsCave03`
