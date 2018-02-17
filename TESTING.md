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

## Known Issues

* If you save your game looking at a stone activator, then, upon reloading the
  save or reloading the game, it may have the incorrect name ("Unusual Gem" when
  it should be called "Stone of Barenziah", or vice versa). If you move your
  crosshair off the activator, then back on, its name will be correct. This is
  because the game has not yet had time to run its maintenance script, which
  runs on save load. I consider this not critical, and am unsure whether it is
  fixable.

## Testing Methodology

Proceed through each section in order.

Considerations:

* Every time you toggle quest markers, do so both via the console and (if
  applicable) via the MCM. On in the console, verify, off in the console,
  verify, on in the MCM, verify, off in the MCM, verify.
* Obvious Tip of the Day: When `coc`ing to start a new character, `coc` to one
  of the stone locations, so you can get started collecting right away.
* In each testing run, when collecting the first few stones, choose different
  stones each time. Across different testing runs, this will help make sure that
  all quest markers correctly disappear when stones are collected.
* Use the following console commands:
  * `tgm`: Turn on god mode for invincibility and infinite stamina so you can
    sprint to stone locations.
  * `tdetect`: Turn off enemy AI detection so no enemies notice or attack you.
  * `tcl`: Turn off collision so you can fly through walls and obstacles to
    reach stones more quickly.
  * `sgtm`: You might experiment with this to increase game speed, therefore
    making yourself able to move faster and reach stones more quickly.

### Test Quest Marker Activation, Renaming, and Stacking

1. Start a new default character by `coc`ing from the main menu.
2. Before collecting any stones, toggle quest markers on and off. Verify that no
   markers appear.
3. Collect a few stones. Verify that stone activators and the inventory item are
   both called "Unusual Gem."
4. Toggle quest markers on and off. Verify that no markers appear.
5. Become a full member of the Thieves' Guild:

    ```
    setstage TG00 200
    setstage TG01 200
    setstage TG02 40
    ```
6. Toggle quest markers on and off. Verify that no markers appear.
7. Talk to Vex to start "No Stone Unturned."
8. Verify that the stones are renamed to "Stone of Barenziah" in your inventory.
9. Toggle quest markers on and off. Verify that they appear when toggled on, and
   disappear when toggled off. At the end of this step, leave quest markers
   *on*.
10. Collect more (but not all) of the stones. Verify that the stone activators
    have been renamed to "Stone of Barenziah." Verify that they stack in your
    inventory. Verify that the quest marker over each stone activator disappears
    when the stone is collected.
11. Poise yourself near a stone activator, but _do not collect it_ yet.

### Test Renaming Across Saves

1. Save your game. I will refer to this as "save A."
2. Exit to the main menu.
3. Start a new default character by `coc`ing from the main menu.
4. Collect a stone. Verify that the stone activator and the inventory item are
   both called "Unusual Gem."
5. Poise yourself near a stone activator, but _do not collect it_ yet.
6. Save your game. I will refer to this as "save B."
7. Load save A. Verify that the stone activator you are next to is named "Stone
   of Barenziah." Verify that the stones are named "Stone of Barenziah" in your
   inventory.
8. Load save B. Verify that the stone activator you are next to is named
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
2. Complete "No Stone Unturned." Verify that the remainder of the quest
   completes correctly.

We are now finished with save A.

## Quest Locations

`coc` commands for reaching quest locations.

### Vex

```
coc RiftenRaggedFlagon
```

### Unusual Gems/Stones of Barenziah

```
coc WhiterunHalloftheDeadCatacombs
coc WhiterunDragonsreachJarlsQuarters
coc WhiterunJorrvaskrBasement
coc SolitudeBluePalace
coc SolitudeProudspireManor
coc RiftenMistveilKeepJarlsChambers
coc WindhelmPalaceUpstairs01
coc WindhelmHouseofClanShatterShield
coc MarkarthTreasuryHouse
coc MarkarthUnderStoneKeep
coc WinterholdCollegeArchMageQuarters
coc DeadCroneRockExterior
coc BlackBriarLodge01
coc Ansilvund02
coc StonyCreekCave01
coc RannveigsFastExterior01
coc FellglowKeep01
coc DaintySload01
coc SunderstoneGorge01
coc Yngvild02
coc HobsFallCave01
coc ThalmorEmbassy05
coc Pinewatch01
coc DarkBrotherhoodSanctuary
```

### Crown of Barenziah

```
coc TolvaldsCave03
```
