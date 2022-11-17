local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

L:RegisterTranslations("koKR", function() return {
	["Total"] = "총계",
	["Percent"] = "비율",
	["Repair cost"] = "수리 비용",
	["Repair"] = "수리",
	["Equipment"] = "장비",
	["Inventory"] = "가방",
	["Show the armored man"] = "기본 갑옷 내구도 표시",
	["Toggle whether to show Blizzard's armored man"] = "Blizzard의 부위별 내구도 표시 토글",
	["Show average value"] = "평균 내구도 표시",
	["Toggle whether to show your average or minimum durability"] = "평균 혹은 최소 내구도 표시",
	["Show healthy items"] = "상태가 좋은 아이템 표시",
	["Toggle whether to show items that are healthy (100% repaired)"] = "100% 수리된 아이템 표시 토글",
	["Auto repair"] = "자동 수리",
	["Toggle whether to auto repair all your equipment when you visit a repair vendor."] = "수리할 수 있는 상인을 만나면 자동으로 수리 팝업창 띄우는 것을 전환합니다.",
	["Show repair popup"] = "수리 팝업창 보기",
	["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."] = "상인을 만나면 내구도가 감소된 아이템을 기억했다가 수리 창 표시를 전환합니다.\n\n이것은 내구도가 감소한 아이템만 표시합니다.",
	["Use guild bank"] = "길드 은행 사용",
	["Use the guild banks money when repairing."] = "수리할 경우 길드 은행의 소지금을 사용합니다.",

	["You have equipment to repair, do you want to repair everything at the cost of %s now?"] = "당신은 장비수리가 필요한데, %s의 비용에 모두를 지금 수리 하실겁니까?",

	["Cannot auto-repair equipment. Your money: %s. Needed: %s"] = "착용장비를 자동 수리할 소지금이 부족합니다. 소지금: %s, 필요금액: %s",
	["Auto-repaired equipment: %s"] = "착용장비 자동 수리: %s",
	["Auto-repaired equipment using guild bank: %s"] = "길드 은행을 사용하여 착용장비 자동 수리: %s",
	["AceConsole-Commands"] = {"/durfu", "/durabilityfu"}
} end)
