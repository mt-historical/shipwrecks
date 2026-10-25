# Shipwrecks

This mod adds configurable shipwrecks to the ocean.
Shipwrecks come in various wood types, shapes (full ship, halves, etc) and their combinations.
Shipwrecks contain various loot.

## Requirements

- Luanti/Minetest v5.0.0+
- [lootchests_modpack](https://github.com/ClockGen/lootchests_modpack), Necessary for lootchest spawn in shipwrecks

## Recommended mods

- [decorations_sea](https://github.com/ClockGen/decorations_sea), Adds many new sea decorations

## Settingtypes

Modpack provides some settings, accessible via "Settings->All Settings->Mods->shipwrecks
You can also put these settings directly to your minetest.conf:

```text
shipwrecks:chance = 10, int, chance to spawn a shipwreck in a mapblock
shipwrecks:horizontal_displacement = 16, int, displacement from the center of mapblock
shipwrecks:vertical_displacement = 5, int, vertical displacement of the shipwreck
shipwrecks:seed = 0, int, general seed for shipwreck generation

```

## License

All code is GPLv3 [link to the license](https://www.gnu.org/licenses/gpl-3.0.en.html)
