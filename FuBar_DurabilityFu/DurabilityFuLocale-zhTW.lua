local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("zhTW", function() return {
	["Total"] = "總計",
	["Percent"] = "百分比",
	["Repair cost"] = "修理費用",
	["Repair"] = "修理",
	["Equipment"] = "裝備",
	["Inventory"] = "背包",
	["Show the armored man"] = "顯示裝備損壞狀態人偶",
	["Toggle whether to show Blizzard's armored man"] = "設定是否顯示 Blizzard 的裝備損壞狀態人偶。",
	["Show average value"] = "顯示平均值",
	["Toggle whether to show your average or minimum durability"] = "設定顯示損壞度的平均值還是最小值。",
	["Show healthy items"] = "顯示完好物品",
	["Toggle whether to show items that are healthy (100% repaired)"] = "設定是否顯示不需要修理的完好物品。",
	["Auto repair"] = "自動修理",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "設定當你和修理商人談話時是否自動修理物品。",
	["Show repair popup"] = "顯示修理彈出視窗",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "設定當你和修理商人談話時是否顯示修理彈出視窗，提醒你有物品需要修理。\n\n只會在有物品損壞時顯示。",
	["Use guild bank"] = "使用公會銀行",
	["Use the guild banks money when repairing."] = "當修理時使用公會銀行",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "你有待修的裝備，修理費用需要%s，是否現在修理?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "不能自動修理身上的裝備。你的金錢: %s。需要: %s",
	["Auto-repaired equipment: %s"] = "自動修理身上的裝備: %s",
	["Auto-repaired equipment using guild bank: %s"] = "使用公會銀行自動修理身上的裝備: %s",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)

