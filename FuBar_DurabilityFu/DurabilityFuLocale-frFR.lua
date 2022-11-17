local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("frFR", function() return {
	["Total"] = "Total",
	["Percent"] = "Pourcentage",
	["Repair cost"] = "Coût des réparations",
	["Repair"] = "Réparer",
	["Equipment"] = "Équipement",
	["Inventory"] = "Inventaire",
	["Show the armored man"] = "Afficher le pantin en armure",
	["Toggle whether to show Blizzard's armored man"] = "Affiche ou non le pantin en armure de Blizzard.",
	["Show average value"] = "Afficher la valeur moyenne",
	["Toggle whether to show your average or minimum durability"] = "Affiche la valeur moyenne de votre durabilité au lieu de la valeur minimale.",
	["Show healthy items"] = "Afficher les objects intacts",
	["Toggle whether to show items that are healthy (100% repaired)"] = "Affiche ou non les objets intacts (à 100% de durabilité).",
	["Auto repair"] = "Réparer auto.",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "Répare ou non automatiquement votre équipement aux marchands-réparateurs.",
	["Show repair popup"] = "Afficher la fenêtre de réparation",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "Affiche ou non la fenêtre de réparation aux vendeurs vous rappelant que votre équipement est endommagé.\n\nNe s'affichera que si votre équipement est endommagé.",
	["Use guild bank"] = "Utiliser la banque de guilde",
	["Use the guild banks money when repairing."] = "Utilise l'argent de la banque de guilde pour vos réparations.",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "Votre équipement a besoin d'être réparé. Souhaitez-vous le faire maintenant pour %s ?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "Impossible de réparer auto. l'équipement. Votre argent : %s. Nécessaire : %s.",
	["Auto-repaired equipment: %s"] = "Réparation auto. de l'équipement : %s.",
	["Auto-repaired equipment using guild bank: %s"] = "Réparation auto. de l'équipement avec la banque de guilde : %s.",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)
