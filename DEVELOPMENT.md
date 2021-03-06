# Developing SSoB

These notes are more for me than for anyone else.

## Branches

SSoB has two variants (with and without MCM) and exists for two games (Skyrim
[a.k.a. oldrim] and Skyrim Special Edition [a.k.a. se]). There are four
development branches, each housing one of the combinations of those attributes:

* `oldrim`
* `oldrim-no-mcm`
* `se`
* `se-no-mcm`

Note that these are _development_ branches, and so the tip of any of them is not
guaranteed to be in a stable, usable state. If you're looking for stable, usable
versions, you need to look to the tags (see the next section).

`master` is used only for boilerplate repo stuff - for example, this file - not
for mod content. Whenever changes are made on master, they should be merged into
each of the development branches for consistency's sake.

At any given time there may exist other feature branches. If we're lucky, I'll
have given them informative names. Features may eventually be merged from a
feature branch to one or more of the four development branches.

## Releases

Releases are tagged. oldrim releases are tagged only with the version number.
se releases are tagged with the version number suffixed with `-se`. The no-mcm
versions have `-no-mcm` at the very end of the tag.

Sample tags:

* `v0.1`: Version 0.1 for oldrim.
* `v1.0-no-mcm`: Version 1.0 for oldrim, no MCM.
* `v1.0-se`: Version 1.0 for se (with MCM).
* `v1.0-se-no-mcm`: Version 1.0 for se, no MCM.

You get the idea.
