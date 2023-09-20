-- MyID v1.3（Base版）
-- DIY的“法术/物品/宏/生物/雕文法术/成就/任务/声望等级/图标路径 ...等ID” 的显示插件

local ael = {
"魔兽世界.Vanila",
"燃烧的远征.BC",
"第三部曲.自由大世界",
"大地的裂变.Cataclysm",
"熊猫人之谜.MoP",
"德拉诺之王.WoD", 
"军团再临.Legion",
"争霸艾泽拉斯.BfA",
}

-- 加载信息显示
local version, internalVersion, date, Interface = GetBuildInfo()
local zwmc = ael[GetAccountExpansionLevel()+1] or ""
local hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, tonumber, tostring ,strfind
= hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, tonumber, tostring ,strfind
local color = "7FFF00"
local rgb = {}
local reactionNames = {	
"仇恨",
"敌对",
"冷淡",
"中立",
"友善",
"尊敬", 
"崇敬",
"崇拜",
}

local ChatN = {	
"SAY",
"YELL",
"PARTY",
"RAID",
"RAID_LEADER", 
"BATTLEGROUND",
"BATTLEGROUND_LEADER",
"GUILD",
"GUILD_OFFICER",
"WHISPER",
"WHISPER_INFORM", 
"SYSTEM",
}

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
local _, t = self:GetUnit()
if (not t or not UnitGUID(t)) then
return
end

local ty = tonumber(UnitGUID(t):sub( 5, 5),  16)
local g  = tonumber(UnitGUID(t):sub(13, 18), 16)
local IDConvert = {
["3"] = tonumber(UnitGUID(t):sub(8, 12), 16), 
["4"] = tonumber(UnitGUID(t):sub(6, 12), 16), 
["5"] = tonumber(UnitGUID(t):sub(8, 12), 16)
}

if g and ty == 0 then
self:AddDoubleLine("|cffCCCCCC角色 GUID : ","|cff"..color..g)
elseif g and ty == 3 then
self:AddDoubleLine("生物 Entry :  ",IDConvert[tostring(ty)])
self:AddDoubleLine("|cffCCCCCC生物 GUID : ","|cff"..color..g)
elseif g and ty == 4 then
self:AddLine("宠物 id : "..IDConvert[tostring(ty)])
elseif g and ty == 5 then
self:AddDoubleLine("载具 Entry :  ",IDConvert[tostring(ty)])
self:AddDoubleLine("|cffCCCCCC载具 GUID : ","|cff"..color..g)
end

local reaction = UnitReaction(t, "player")
if reaction and IsShiftKeyDown() then
description = reactionNames[reaction]
rgb = FACTION_BAR_COLORS[reaction]
self:AddDoubleLine("关系/声望等级 : ",description ,.8 ,.8 ,.8 ,rgb.r ,rgb.g ,rgb.b )
self:Show()
end
end)

hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
local id = select(11,UnitBuff(...))
if id then
self:AddDoubleLine("Buff id :",id)
self:Show()
end
local icon = select(3,UnitBuff(...))
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
local id = select(11,UnitDebuff(...))
if id then
self:AddDoubleLine("|cffCCCCCCDeBuff id :","|cff"..color..id)
self:Show()
end
local icon = select(3,UnitDebuff(...))
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
local id = select(11,UnitAura(...))
if id then
self:AddDoubleLine("Aura id :",id)
self:Show()
end
local icon = select(3,UnitAura(...))
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
local id = select(3,self:GetSpell())
if id then
self:AddDoubleLine("法术 id :",id)
self:Show()
end
local icon = select(3,GetSpellInfo(id))
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

ItemRefTooltip:HookScript("OnTooltipSetSpell",function(self)
local id = select(3,self:GetSpell())
local icon = select(3,GetSpellInfo(id))
if id then
self:AddDoubleLine("法术 ID :",id)
self:Show()
end
if icon then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

GameTooltip:HookScript("OnTooltipSetItem", function(self) 
local link = select(2,self:GetItem())	
if not link then 
return 
end
local id = select(3,strfind(link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)"))
if id then 
self:AddDoubleLine("物品 Entry :", id)
self:Show()
end
local icon = GetItemIcon(id)
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)

ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
local link = select(2,self:GetItem())	
if not link then 
return 
end
local id = select(3,strfind(link, "^|%x+|Hitem:(%-?%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%-?%d+)"))
if id then 
self:AddDoubleLine("物品 Entry :", id)
self:Show()
end
local icon = GetItemIcon(id)
if icon then 
self:AddLine("图标: "..GetItemIcon(id), 0.9, 0.9, 0.9)
self:Show()
end
end)

hooksecurefunc(GameTooltip, "SetGlyph", function(self, ...)	
local _, _, glyphSpell, icon = GetGlyphSocketInfo(...)
if glyphSpell then 
self:AddDoubleLine("雕文.法术id: ", glyphSpell, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
self:Show()
end
if icon and IsShiftKeyDown() then
self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
self:Show()
end
end)


hooksecurefunc(GameTooltip, "SetAction", function(self, slot)
local Actiontype = "Atype"
local atype, id, id2 = GetActionInfo(slot)
if atype == "companion" then
if id2 == "MOUNT" then Actiontype = "坐骑"
else Actiontype = "小伙伴"
end
end
local MacroNum = 36
if atype == "macro" then
if id > MacroNum then 
id = id - MacroNum
Actiontype = "角色专用宏"
else Actiontype = "通用宏"
end
end
if Actiontype ~= "Atype" then
self:AddLine("№: "..id.."  "..Actiontype, 0, 0.75, 0)
self:Show()
end
end)

local tags = {
["Normal"] = "普通", 
["精英"] = "精英", 
["组队"] = "组队", 
["地下城"] = "地下城", 
["团队"] = "团队",
["团队（10）"] = "(10人)团队",
["团队（25）"] = "(25人)团队",
["PvP"] = "PVP", 
["Daily"] = "<日常> ",
["英雄"]  = "(5H)地下城",
}

local qf = CreateFrame("frame")
qf:RegisterEvent("ADDON_LOADED")
qf:SetScript("OnEvent", function()
for i,button in ipairs(QuestLogScrollFrame.buttons) do
button:HookScript("OnEnter", function(self)
GameTooltip:SetOwner(button, "ANCHOR_NONE")
GameTooltip:SetPoint("BOTTOMLEFT", button, "TOPLEFT", 1, 13)
local qli = button:GetID(self)
local name, level, tag, group, header, _, complete, daily, questId = GetQuestLogTitle(qli)
--if header or not name then return end								-- 直接显示无需按下Shift键
if header or not name or not IsShiftKeyDown() then return end			-- 需要按下Shift键后才显示
if tag == "组队" and group == 0 then tag = "精英" end
if not tag and not daily then tag = "Normal" end		  
if not group or group == 0 then group = nil end
local newtag = string.format("  %s%s%s", daily and tags["Daily"] or "", group and "("..group.."人)" or "", tag and tags[tag] or "") 
GameTooltip:AddLine("["..level.."级] "..name)
GameTooltip:AddDoubleLine(newtag,"任务 id: "..questId, 0.0, 0.85, 0.85, 0.9, 0.7, 0.75)
GameTooltip:Show()
end)
button:HookScript("OnLeave", function()
GameTooltip:Hide()
end)
end
end)

local function filter(self, event, msg, ...)
if msg then
return false, msg:gsub("(|c%x+|Hquest:(%d+):%d-)", "【任务id: %2 】→ %1"), ...
end
end

for _,event in pairs(ChatN) do
ChatFrame_AddMessageEventFilter("CHAT_MSG_"..event, filter)
end

local af = CreateFrame("frame")	
af:RegisterEvent("ADDON_LOADED")
af:SetScript("OnEvent", function(_, _, what)
if what == "Blizzard_AchievementUI" then
for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
button:HookScript("OnEnter", function()
GameTooltip:SetOwner(button, "ANCHOR_NONE")
GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, -3)

if button.id and button.id ~= "" then
GameTooltip:AddLine("成就 ID : "..button.id)
GameTooltip:Show()
end
end)
button:HookScript("OnLeave", function()
GameTooltip:Hide()
end)

hooksecurefunc("AchievementButton_GetCriteria", function(index, renderOffScreen)
local frame = _G["AchievementFrameCriteria" .. (renderOffScreen and "OffScreen" or "") .. index]
if frame then
frame:HookScript("OnEnter", function(self)
local button = self:GetParent() and self:GetParent():GetParent()
if not button or not button.id then 
return 
end
local criteriaid = select(10, GetAchievementCriteriaInfo(button.id, index))
if criteriaid then
GameTooltip:SetOwner(button:GetParent(), "ANCHOR_NONE")
GameTooltip:SetPoint("TOPRIGHT", frame, "TOPLEFT", 23, -1)
GameTooltip:AddLine("父成就 ID : "..button.id)
GameTooltip:AddLine(" ┗ 子条件 id : "..criteriaid, 0.9, 0.9, 0.9)
GameTooltip:Show()			
end
end)
frame:HookScript("OnLeave", function()
GameTooltip:Hide()
end)
end
end)
end
end
end)
