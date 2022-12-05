
DurabilityFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceDB-2.0", "AceEvent-2.0", "AceHook-2.1", "AceConsole-2.0")
local DurabilityFu = DurabilityFu

DurabilityFu.date = string.sub("$Date: 2022-11-16 23:20:00 +0100 (Wed, 16 Nov 2022) $", 8, 17)
DurabilityFu.hasIcon = true
DurabilityFu.canHideText = true

local L = AceLibrary("AceLocale-2.2"):new("FuBar_DurabilityFu")

local Tablet = AceLibrary("Tablet-2.0")
local Abacus = AceLibrary("Abacus-2.0")
local Crayon = AceLibrary("Crayon-2.0")

local repairIndex = 0
local itemStatus = {
	-- value, max, cost, name, slot
	{ 0, 0, 0, INVTYPE_HEAD, "Head" },
	{ 0, 0, 0, INVTYPE_SHOULDER, "Shoulder" },
	{ 0, 0, 0, INVTYPE_CHEST, "Chest" },
	{ 0, 0, 0, INVTYPE_WAIST, "Waist" },
	{ 0, 0, 0, INVTYPE_LEGS, "Legs" },
	{ 0, 0, 0, INVTYPE_FEET, "Feet" },
	{ 0, 0, 0, INVTYPE_WRIST, "Wrist" },
	{ 0, 0, 0, INVTYPE_HAND, "Hands" },
	{ 0, 0, 0, INVTYPE_WEAPONMAINHAND, "MainHand" },
	{ 0, 0, 0, INVTYPE_WEAPONOFFHAND, "SecondaryHand" },
	{ 0, 0, 0, INVTYPE_RANGED, "Ranged" },
	{ 0, 0, 0, INVENTORY_TOOLTIP },
}
local INVENTORY_SLOT = 12
local VALUE = 1
local MAX = 2
local COST = 3
local NAME = 4
local SLOT = 5

-----------------------------------------------------------------------
-- Initialization
--

function DurabilityFu:OnInitialize()
	self:RegisterDB("DurabilityFuDB")
	self:RegisterDefaults("profile", {
		showMan = false,
		showAverage = false,
		showHealthy = false,
		autoRepairEquipment = true,
		showPopup = false,
		useGuildBank = false,
	})

	self.OnMenuRequest = {
		type = "group",
		pass = true,
		get = function(k)
			return self.db.profile[k]
		end,
		set = function(k, v)
			self.db.profile[k] = v
      self:OnDataUpdate()
      self:OnTextUpdate()
		end,
		args = {
			showMan = {
				type = "toggle",
				name = L["Show the armored man"],
				desc = L["Toggle whether to show Blizzard's armored man"],
				set = "ToggleShowingMan"
			},
			showAverage = {
				type = "toggle",
				name = L["Show average value"],
				desc = L["Toggle whether to show your average or minimum durability"],
			},
			showHealthy = {
				type = "toggle",
				name = L["Show healthy items"],
				desc = L["Toggle whether to show items that are healthy (100% repaired)"],
			},
			autoRepairEquipment = {
				type = "toggle",
				name = L["Auto repair"],
				desc = L["Toggle whether to auto repair all your equipment when you visit a repair vendor."],
			},
			showPopup = {
				type = "toggle",
				name = L["Show repair popup"],
				desc = L["Toggle whether to show the repair popup at a vendor, reminding you that your equipment is damaged.\n\nWill only show if your equipment is damaged."],
				disabled = function() return self.db.profile.autoRepairEquipment end,
			},
			useGuildBank = {
				type = "toggle",
				name = L["Use guild bank"],
				desc = L["Use the guild banks money when repairing."],
			},
		},
		handler = self,
	}
end

function DurabilityFu:OnEnable()
	self:RegisterEvent("PLAYER_UNGHOST", "OnBagUpdate")
	self:RegisterEvent("PLAYER_DEAD", "OnBagUpdate")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "OnBagUpdate")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("UPDATE_INVENTORY_ALERTS", 1)
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("MERCHANT_CLOSED")

	self:SecureHook(DurabilityFrame, "SetAlerts", "DurabilityFrame_SetAlerts")
	self:SecureHook("RepairAllItems", "ScheduleUpdate")
	self:DurabilityFrame_SetAlerts()
end

function DurabilityFu:OnDisable()
	DurabilityFrameMixin:SetAlerts()
end

-----------------------------------------------------------------------
-- Local utility
--

local function canRepair()
	local cost, canRepair = GetRepairAllCost()
	if not canRepair or cost == 0 then return end
	local money = GetMoney()
	local gbAmount = GetGuildBankWithdrawMoney()
	local gbMoney = GetGuildBankMoney()
	if IsInGuild() and DurabilityFu.db.profile.useGuildBank and ((gbAmount == -1 and gbMoney > cost) or gbAmount > cost) then
		return 2, cost
	elseif money > cost then
		return 1, cost
	end
end

local function doRepair()
	local method, cost = canRepair()
	if not method then return end
	if method == 2 then
		RepairAllItems(1)
		DurabilityFu:Print(L["Auto-repaired equipment using guild bank: %s"], Abacus:FormatMoneyFull(cost))
	elseif method == 1 then
		RepairAllItems()
		DurabilityFu:Print(L["Auto-repaired equipment: %s"], Abacus:FormatMoneyFull(cost))
	end
end

local function showPopup(totalCost)
	if totalCost <= 0 then return end
	if not StaticPopupDialogs["DurabilityFuRepair"] then
		StaticPopupDialogs["DurabilityFuRepair"] = {
			button1 = YES,
			button2 = NO,
			showAlert = 1,
			timeout = 0,
			OnAccept = function()
				doRepair()
			end,
		}
	end
	StaticPopupDialogs["DurabilityFuRepair"].text = L["You have equipment to repair, do you want to repair everything at the cost of %s now?"]:format(Abacus:FormatMoneyFull(totalCost, true))
	StaticPopup_Show("DurabilityFuRepair")
end

function DurabilityFu:ToggleShowingMan(value)
	if value == nil then
		value = not self.db.profile.showMan
	end
	self.db.profile.showMan = value
	self:DurabilityFrame_SetAlerts()
end

-----------------------------------------------------------------------
-- Events and hooks
--

function DurabilityFu:MERCHANT_SHOW()
	if CanMerchantRepair() then
		local repair, cost = canRepair()
		if not repair then return end
		if self.db.profile.autoRepairEquipment then
			doRepair()
		elseif self.db.profile.showPopup then
			showPopup(cost)
		end
	end
end

function DurabilityFu:MERCHANT_CLOSED()
	StaticPopup_Hide("DurabilityFuRepair")
end

function DurabilityFu:UNIT_INVENTORY_CHANGED()
	self:UpdateInventoryData(INVENTORY_ALERT_STATUS_SLOTS)
  self:UpdateBagData()
  self:UpdateTooltip()
end

function DurabilityFu:UPDATE_INVENTORY_ALERTS()
	self:UpdateInventoryData(INVENTORY_ALERT_STATUS_SLOTS)
	self:UpdateText()
	self:UpdateTooltip()
end

function DurabilityFu:OnBagUpdate()
	self:UpdateInventoryData()
	self:UpdateBagData()
	self:UpdateText()
	self:UpdateTooltip()
end

function DurabilityFu:ScheduleUpdate()
	self:ScheduleEvent(self.name, self.Update, 4, self)
end

function DurabilityFu:DurabilityFrame_SetAlerts()
	if not self.db.profile.showMan then
		DurabilityFrame:Hide()
	end
end

-----------------------------------------------------------------------
-- Data updating
--

function DurabilityFu:OnDataUpdate()
	self:UpdateBagData()
	self:UpdateInventoryData()
end

local lastUpdate
function DurabilityFu:UpdateBagData()
	if lastUpdate and GetTime() - lastUpdate < 1 then
		return
	end
	lastUpdate = GetTime()
	local minStatus = 1.0
	local minValue = 0
	local minMax = 0

	itemStatus[INVENTORY_SLOT][VALUE] = 0
	itemStatus[INVENTORY_SLOT][MAX] = 0
	itemStatus[INVENTORY_SLOT][COST] = 0

	for containerIndex = Enum.BagIndex.Backpack, Enum.BagIndex.Bag_4 do
		for slotIndex = 1, C_Container.GetContainerNumSlots(containerIndex) do
			local status, value, max, cost = self:GetStatus(slotIndex, containerIndex)
			if not self.db.profile.showAverage then
				if status and status < minStatus then
					minStatus = status
					minValue = value
					minMax = max

					if (repairIndex == 0 or status < self:GetPercent(itemStatus[repairIndex][VALUE], itemStatus[repairIndex][MAX])) and max ~= 0 then
						repairIndex = INVENTORY_SLOT
					end

					itemStatus[INVENTORY_SLOT][VALUE] = value
					itemStatus[INVENTORY_SLOT][MAX] = max
				end
			elseif cost then
				itemStatus[INVENTORY_SLOT][VALUE] = itemStatus[INVENTORY_SLOT][VALUE] + value
				itemStatus[INVENTORY_SLOT][MAX] = itemStatus[INVENTORY_SLOT][MAX] + max
			end
			if cost then
				itemStatus[INVENTORY_SLOT][COST] = itemStatus[INVENTORY_SLOT][COST] + cost
			end
		end
	end
	if self.db.profile.showAverage then
		local status = self:GetPercent(itemStatus[INVENTORY_SLOT][VALUE], itemStatus[INVENTORY_SLOT][MAX])
		if (repairIndex == 0 or status < self:GetPercent(itemStatus[repairIndex][VALUE], itemStatus[repairIndex][MAX])) and itemStatus[INVENTORY_SLOT][MAX] ~= 0 then
			repairIndex = INVENTORY_SLOT
		end
	end
end

local tmp = {}
for i = 1, 11 do
	tmp[i] = true
end
function DurabilityFu:UpdateInventoryData(toCheck)
	if not toCheck then
		toCheck = tmp
	end

	local minStatus = 1.0
	local minValue = 0
	local minMax = 0
	local minIndex = 0

	for index,_ in pairs(toCheck) do
		local status, value, max, cost = self:GetStatus(index)
		if status and status < minStatus then
			minStatus = status
			minValue = value
			minMax = max
			minIndex = index
		end

		itemStatus[index][VALUE] = value or 0
		itemStatus[index][MAX] = max or 0
		itemStatus[index][COST] = cost or 0
	end

	repairIndex = minIndex

	self:DurabilityFrame_SetAlerts()
end

function DurabilityFu:GetPercent(quotient, denominator)
	if denominator ~= 0 then
		return quotient / denominator
	else
		return 1
	end
end

function DurabilityFu:GetStatus(slotIndex, containerIndex)
	local value, max, repairCost, hasItem, _
	if containerIndex then
    hasItem = C_Container.GetContainerItemInfo(containerIndex, slotIndex) ~= nil
    
    if hasItem then
      local tooltipData = C_TooltipInfo.GetBagItem(containerIndex, slotIndex)
      if tooltipData then
        TooltipUtil.SurfaceArgs(tooltipData)
        repairCost = tooltipData.repairCost
      end
    end
		
    value, max = C_Container.GetContainerItemDurability(containerIndex, slotIndex)
	else
		local slotName = itemStatus[slotIndex][SLOT] .. "Slot"

		if slotName == 'RangedSlot' then
			return
		end

    local id = GetInventorySlotInfo(slotName)

    local tooltipData = C_TooltipInfo.GetInventoryItem("player", id)
    if tooltipData then
      hasItem = true
      TooltipUtil.SurfaceArgs(tooltipData)
      repairCost = tooltipData.repairCost

      value, max = GetInventoryItemDurability(id)
    end
	end

	if hasItem and value then
		return self:GetPercent(value, max), value, max, repairCost
	end
end

-----------------------------------------------------------------------
-- UI
--

function DurabilityFu:OnTextUpdate()
	local percent
	if not self.db.profile.showAverage then
		if repairIndex == 0 then
			percent = 1
		else
			percent = self:GetPercent(itemStatus[repairIndex][VALUE], itemStatus[repairIndex][MAX])
		end
	else
		local value = 0
		local max = 0
		for i,item in pairs(itemStatus) do
			if i ~= INVENTORY_SLOT then
				value = value + item[VALUE]
				max = max + item[MAX]
			end
		end
		percent = self:GetPercent(value, max)
	end
	self:SetText(string.format("|cff%s%d%%|r", Crayon:GetThresholdHexColor(percent), percent * 100))
end

do
	local TEXT_FRIENDLY = FACTION_STANDING_LABEL5
	local TEXT_HONORED = FACTION_STANDING_LABEL6
	local TEXT_REVERED = FACTION_STANDING_LABEL7
	local TEXT_EXALTED = FACTION_STANDING_LABEL8
	function DurabilityFu:OnTooltipUpdate()
		local cost = 0
		local cat = Tablet:AddCategory(
			"columns", 3,
			"child_textR", 1,
			"child_textG", 1,
			"child_textB", 0
		)

		for index, item in pairs(itemStatus) do
			if item[MAX] > 0 then
				cost = cost + item[COST]
				local percent = self:GetPercent(item[VALUE], item[MAX])
				if self.db.profile.showHealthy or percent < 1 then
					local r, g, b = Crayon:GetThresholdColor(percent)
					cat:AddLine(
						"text", item[NAME],
						"text2", string.format("%.0f%%", percent * 100),
						"text2R", r,
						"text2G", g,
						"text2B", b,
						"text3", Abacus:FormatMoneyShort(item[COST], true)
					)
				end
			end
		end
		local value = 0
		local max = 0
		for i,item in pairs(itemStatus) do
			if i ~= INVENTORY_SLOT then
				value = value + item[VALUE]
				max = max + item[MAX]
			end
		end

		cat = Tablet:AddCategory(
			"columns", 2,
			"text", L["Total"],
			"child_textR", 1,
			"child_textG", 1,
			"child_textB", 0,
			"child_text2R", 1,
			"child_text2G", 1,
			"child_text2B", 1,
			'hideBlankLine', cost == 0
		)
		local r, g, b = Crayon:GetThresholdColor(value / max)
		cat:AddLine(
			"text", L["Percent"],
			"text2", string.format("%.0f%%", value / max * 100),
			"text2R", r,
			"text2G", g,
			"text2B", b
		)

		if cost > 0 then
			cat:AddLine(
				"text", L["Repair cost"],
				"text2", Abacus:FormatMoneyFull(cost, true)
			)
			cat:AddLine(
				"text", TEXT_FRIENDLY,
				"text2", Abacus:FormatMoneyFull(cost * 0.95, true)
			)
			cat:AddLine(
				"text", TEXT_HONORED,
				"text2", Abacus:FormatMoneyFull(cost * 0.9, true)
			)
			cat:AddLine(
				"text", TEXT_REVERED,
				"text2", Abacus:FormatMoneyFull(cost * 0.85, true)
			)
			cat:AddLine(
				"text", TEXT_EXALTED,
				"text2", Abacus:FormatMoneyFull(cost * 0.80, true)
			)
		end
	end
end

