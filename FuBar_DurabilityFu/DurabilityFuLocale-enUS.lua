local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("enUS", function() return {
	["Total"] = true,
	["Percent"] = true,
	["Repair cost"] = true,
	["Repair"] = true,
	["Equipment"] = true,
	["Inventory"] = true,
	["Show the armored man"] = true,
	["Toggle whether to show Blizzard's armored man"] = true,
	["Show average value"] = true,
	["Toggle whether to show your average or minimum durability"] = true,
	["Show healthy items"] = true,
	["Toggle whether to show items that are healthy (100% repaired)"] = true,
	["Auto repair"] = true,
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = true,
	["Show repair popup"] = true,
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = true,
	["Use guild bank"] = true,
	["Use the guild banks money when repairing."] = true,

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = true,

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = true,
	["Auto-repaired equipment: %s"] = true,
	["Auto-repaired equipment using guild bank: %s"] = true,
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)

