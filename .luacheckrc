-- created by `flint generate`, which leaves it alone once it exists

std = "luajit"

globals = {
	"shipwrecks",
}

read_globals = {
	-- Luanti
	"core",
	"minetest",
	"vector",
	"dump",
	"dump2",
	"DIR_DELIM",
	"INIT",
	"AreaStore",
	"ItemStack",
	"PcgRandom",
	"PerlinNoise",
	"PerlinNoiseMap",
	"PseudoRandom",
	"Raycast",
	"SecureRandom",
	"Settings",
	"ValueNoise",
	"ValueNoiseMap",
	"VoxelArea",
	"VoxelManip",
	"bit",
	"jit",
	math = { fields = { "factorial", "hypot", "round", "sign" } },
	string = { fields = { "split", "trim" } },
	table = { fields = { "copy", "indexof", "insert_all", "key_value_swap", "shuffle" } },
	-- dependencies
	"default",
	"lootchests_default",
	"stairs",
}
