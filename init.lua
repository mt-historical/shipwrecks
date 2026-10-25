local path = core.get_modpath("shipwrecks")
local schems = {}
for _, v in pairs({ "oak", "jungle", "pine" }) do
	for i = 1, 6 do
		table.insert(schems, path .. "/schematics/shipwreck_" .. v .. "_0" .. i .. ".mts")
	end
end

local old_settings = { -- These are old setting names before modname:setting
	["shipwrecks_chance"] = "shipwrecks:chance",
	["shipwrecks_horizontal_displacement"] = "shipwrecks:horizontal_displacement",
	["shipwrecks_vertical_displacement"] = "shipwrecks:vertical_displacement",
	["shipwrecks_seed"] = "shipwrecks:seed",
}

for old_setting, new_setting in ipairs(old_settings) do
	if core.settings:contains(old_setting) then
		local old_setting_value = core.settings:get(old_setting)
		core.settings:set(new_setting, old_setting_value)
		core.settings:remove(old_setting)
	end
end

local chance = tonumber(core.settings:get_int("shipwrecks:chance")) or 15
local disp = tonumber(core.settings:get("shipwrecks:horizontal_displacement")) or 16
local v_disp = tonumber(core.settings:get("shipwrecks:vertical_displacement")) or 5
local global_seed = tonumber(core.settings:get("shipwrecks:seed")) or 0

local rotations = { "0", "90", "180", "270" }

core.register_on_generated(function(minp, maxp, seed)
	if minp.y < -64 or maxp.y > 64 then
		return
	end
	local rand = PcgRandom(seed + global_seed)
	if rand:next(0, 100) > chance then
		return
	end

	local vm, emin, emax = core.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new({ MinEdge = emin, MaxEdge = emax })
	local data = vm:get_data()
	local sidelength = maxp.x - minp.x + 1

	local c_sand = core.get_content_id("default:sand")
	local c_water = core.get_content_id("default:water_source")

	local x_disp = rand:next(0, disp)
	local z_disp = rand:next(0, disp)
	local y_disp = rand:next(-v_disp, -1)

	for y = minp.y, maxp.y do
		local vi = area:index(minp.x + sidelength / 2 + x_disp, y, minp.z + sidelength / 2 + z_disp)
		if y < -2 and data[vi] == c_sand and data[vi + area.ystride] == c_water then
			local schem = schems[rand:next(1, #schems)]
			local rotation = rotations[rand:next(1, #rotations)]
			local s_pos = area:position(vi)
			core.place_schematic_on_vmanip(
				vm,
				{ x = s_pos.x, y = s_pos.y + y_disp, z = s_pos.z },
				schem,
				rotation,
				nil,
				true,
				"place_center_x, place_center_z"
			)
		end
	end

	vm:write_to_map(true)
end)
