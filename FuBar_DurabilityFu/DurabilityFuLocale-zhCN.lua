local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("zhCN", function() return {
	["Total"] = "总计",
	["Percent"] = "百分比",
	["Repair cost"] = "修理费用",
	["Repair"] = "修理",
	["Equipment"] = "装备",
	["Inventory"] = "背包",
	["Show the armored man"] = "显示装备损坏状态人偶",
	["Toggle whether to show Blizzard's armored man"] = "设置是否显示暴雪的装备损坏状态人偶",
	["Show average value"] = "显示平均值",
	["Toggle whether to show your average or minimum durability"] = "设置显示损坏度的平均值还是最小值",
	["Show healthy items"] = "显示完好物品",
	["Toggle whether to show items that are healthy (100% repaired)"] = "设置是否显示不需要修理的完好物品",
	["Auto repair"] = "自动修理",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "设置当你和修理商人对话时是否自动修理物品。",
	["Show repair popup"] = "显示修理弹出窗口",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "设置当你和修理商人对话时是否显示修理弹出窗口，提醒你有物品需要修理。\n\n只会在有物品损坏时显示。",
	["Use guild bank"] = "使用工会银行",
	["Use the guild banks money when repairing."] = "使用工会银行里的钱来修理装备",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "你有待修的装备，修理费用需要%s，是否现在修理?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "不能自动修理你身上的装备. 你当前金钱: %s. 需要: %s",
	["Auto-repaired equipment: %s"] = "已自动修理的身上装备: %s",
	["Auto-repaired equipment using guild bank: %s"] = "已经自动使用工会银行修理身上的装备: %s",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)
