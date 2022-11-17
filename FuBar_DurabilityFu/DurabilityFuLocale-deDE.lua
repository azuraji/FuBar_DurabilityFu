local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("deDE", function() return {
	["Total"] = "Gesamt",
	["Percent"] = "Prozent",
	["Repair cost"] = "Reparaturkosten",
	["Repair"] = "Reparatur",
	["Equipment"] = "Ausrüstung",
	["Inventory"] = "Inventar",
	["Show the armored man"] = "Ausrüstungsfigur anzeigen",
	["Toggle whether to show Blizzard's armored man"] = "Anzeige der Ausrüstungsfigur ein/ausschalten.",
	["Show average value"] = "Mittelwert anzeigen",
	["Toggle whether to show your average or minimum durability"] = "Anzeige zwischen mittlerer oder minimaler Haltbarkeit umschalten.",
	["Show healthy items"] = "Unbeschädigte Gegenstände anzeigen",
	["Toggle whether to show items that are healthy (100% repaired)"] = "Anzeige unbeschädigter Gegenstände ein/ausschalten.",
	["Auto repair"] = "Automatische Reparatur",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "Automatische Reparatur beim Besuch eines Reparaturhändlers ein/ausschalten.",
	["Show repair popup"] = "Reparatur Popup anzeigen",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "Reparatur Popup beim Besuch eines Reparaturhändlers ein/ausschalten; erinnert Dich daran, daß Deine Ausrüstung beschädigt ist.\n\nWird nur angezeigt wenn Deine Ausrüstung beschädigt ist.",
	["Use guild bank"] = "Gildenbank benutzen",
	["Use the guild banks money when repairing."] = "Geld aus der Gildenbank zum reparieren benutzen.",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "Du hast beschädigte Ausrüstung. Willst Du alles für %s reparieren?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "Automatische Reparatur nicht möglich. Dein Geld: %s. Benötigt: %s.",
	["Auto-repaired equipment: %s"] = "Ausrüstung automatisch repariert: %s",
	["Auto-repaired equipment using guild bank: %s"] = "Ausrüstung automatisch mittels Gildenbank repariert: %s",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)
