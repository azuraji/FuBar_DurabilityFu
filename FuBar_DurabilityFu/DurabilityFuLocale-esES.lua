-- Spanish translation by shiftos

local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("esES", function() return {
	["Total"] = "Total",
	["Percent"] = "Porcentaje",
	["Repair cost"] = "Costes de reparaci\195\179n",
	["Repair"] = "Reparar",
	["Equipment"] = "Equipo",
	["Inventory"] = "Inventario",
	["Show the armored man"] = "Mostrar el icono de da\195\177os",
	["Toggle whether to show Blizzard's armored man"] = "Determina si se muestra la silueta donde se muestran los da\195\177os a tu equipo (el hombre con armadura)",
	["Show average value"] = "Mostrar el valor medio",
	["Toggle whether to show your average or minimum durability"] = "Determina si se muestra tu durabilidad media o m\195\173nima",
	["Show healthy items"] = "Mostrar objetos intactos",
	["Toggle whether to show items that are healthy (100% repaired)"] = "Determina si se muestran los objetos no da\195\177ados (100% reparados)",
	["Auto repair"] = "Auto reparar",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "Determina si reparar automaticamente todo tu equipo cuando visitas un vendedor que repare.",
	["Show repair popup"] = "Mostrar ventana emergente de reparar",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "Determina si mostrar la ventana emergente de reparacion de un vendedor, recordando que su equipo esta da\195\177ado.\n\nSolo la mostrara si su equipo esta da\195\177ado.",
	["Use guild bank"] = "Usar banco de la Hermandad",
	["Use the guild banks money when repairing."] = "Usar el dinero de los bancos de la Hermandad al reparar",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "Tienes equipo para reparar, \194\191deseas repararlo todo ahora con un coste de %?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "No puedo reparar automaticamente el equipo. Tu dinero: %s. Necesario: %s",
	["Auto-repaired equipment: %s"] = "Equipo Auto-Reparado: %s",
	["Auto-repaired equipment using guild bank: %s"] = "Equipo Auto-Reparado usando el banco de la Hermandad: %s",

	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)
