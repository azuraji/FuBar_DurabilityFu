-- Russian Localization by Dr. Jet Cheshirsky
local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("ruRU", function() return {
	["Total"] = "Всего",
	["Percent"] = "Процент",
	["Repair cost"] = "Стоимость починки",
	["Repair"] = "Починка",
	["Equipment"] = "Снаряжение",
	["Inventory"] = "Инвентарь",
	["Show the armored man"] = "Показать манекен",
	["Toggle whether to show Blizzard's armored man"] = "Вкл/Выкл показ стандартного манекена Blizzard",
	["Show average value"] = "Показать среднее значение",
	["Toggle whether to show your average or minimum durability"] = "Показывать среднюю или минимальную прочность",
	["Show healthy items"] = "Показывать неповреждённые вещи",
	["Toggle whether to show items that are healthy (100% repaired)"] = "Показывать ли неповреждённые (%100 прочности) вещи.",
	["Auto repair"] = "Автопочинка",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "Вкл/выкл автоматическую починку всех ваших вещей при посещении торговца с опцией починки.",
	["Show repair popup"] = "Показать диалог починки",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "Показывать ли диалог ремонта у продавца, напоминая что у вас есть повреждения.\n\nБудет показан только при наличии повреждений.",
	["Use guild bank"] = "Использовать гильдбанк",
	["Use the guild banks money when repairing."] = "Использовать деньги гильдейского банка при починке",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "Вам нужно починить вещи, хотите починить всё за %s сейчас?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "Автопочинка невозможна. У вас денег: %s. Требуется: %s",
	["Auto-repaired equipment: %s"] = "Автоматически починено на %s",
	["Auto-repaired equipment using guild bank: %s"] = "Автоматически починено с использование денег гильдбанкана на %s",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)

