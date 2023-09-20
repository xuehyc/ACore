-- MyID v1.3.5（Base版）
-- DIY的“法术/物品/宏/生物/雕文法术/物品附魔宝石/成就/任务/声望等级/图标路径 ...等ID” 的显示插件

local ael = {
  "魔兽世界.Vanila",
  "燃烧的远征.BC",
  "巫妖王之怒.WotLK",
  "大地的裂变.Cataclysm",
  "熊猫人之谜.MoP",
  "德拉诺之王.WoD", 
  "军团再临.Legion",
  "争霸艾泽拉斯.BfA",
}

local version, internalVersion, date, Interface = GetBuildInfo()
local zwmc = ael[GetAccountExpansionLevel()+1] or ""
ChatFrame1:AddMessage("※ ====== MyID v1.3.5（Base版）Load... ======", 0, 1, 0)
ChatFrame1:AddMessage("※ 客户端的版本号: "..version.." → "..zwmc, 1, 1, 0)
ChatFrame1:AddMessage("※ 客户端内部版本: "..internalVersion.."_"..GetLocale().."（Interface: "..Interface .."）", .75, .75, 1)
ChatFrame1:AddMessage("※ 登录服务器名称: "..GetRealmName(), 0, 1, 1)

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

local targetT = {
  ["pet"] = "宠物", 
  ["player"] = "你", 
  ["target"] = "目标", 
  ["focus"] = "焦点", 
  ["playertarget"] = "你的目标",
  ["none"] = "无目标",
}

local FYDJ = {
  [60] = 37.65, 
  [70] = 59.375, 
  [80] = 123.288, 
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
	local Mapm, posXY = "", ""
	local IsDM = GetCurrentMapContinent()
	local DML = GetNumDungeonMapLevels()
	local MDL = GetCurrentMapDungeonLevel()
	local pX, pY = GetPlayerMapPosition(t)
	if pX==0 and pY==0 then
		posXY="|cffFFFF00无坐标" 
	else posXY="|cffFFFF00"..string.format("%.1f",pX*100).." |cffFF8000 , |cffFFFF00"..string.format("%.1f",pY*100) 
	end	
	if IsDM==-1 and DML<=1 then
		Mapm=select(1,GetInstanceInfo())
	elseif IsDM==-1 and DML>1 then 
		Mapm=select(1,GetInstanceInfo()).."|cff7FFF00 区域 "..MDL
	elseif IsDM==0 then 
		Mapm="艾泽拉斯世界"
	elseif IsDM>=1 and GetCurrentMapZone()==0 then
		Mapm=select(IsDM,GetMapContinents())
	elseif IsDM>=1 and DML>1 then 
		Mapm=select(GetCurrentMapZone(),GetMapZones(IsDM)).."|cff7FFF00 区域 "..MDL
	else Mapm=select(GetCurrentMapZone(),GetMapZones(IsDM))
	end
	if 	g and ty == 0 and t=="player" then
		self:AddDoubleLine("|cffCCCCCC角色 GUID : ","|cff"..color..g)
		self:AddDoubleLine("|cffCCCCCC位置 : |cffFF8000"..Mapm, posXY)		
	elseif g and ty == 0 then
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

	local TF1 = select(3,GetTalentTabInfo(1))
	local TF2 = select(3,GetTalentTabInfo(2))
	local TF3 = select(3,GetTalentTabInfo(3))
	local ZTF, ZTD = "", ""
	if (TF1 > TF2) and (TF1 > TF3) then
	      ZTF = " |cff00FF00 "..GetTalentTabInfo(1).."|r"
		  ZTD = "|cff00FF00"..TF1.."|r / "..TF2.." / "..TF3
	elseif (TF2 > TF1) and (TF2 > TF3) then
	      ZTF = " |cff00FF00 "..GetTalentTabInfo(2).."|r"
		  ZTD = TF1.." / |cff00FF00"..TF2.."|r / "..TF3
	elseif (TF3 > TF1) and (TF3 > TF2) then
	      ZTF = " |cff00FF00 "..GetTalentTabInfo(3).."|r"
		  ZTD = TF1.." / "..TF2.." / |cff00FF00"..TF3.."|r"
	else  
	      ZTF = ""
	      ZTD = TF1.." / "..TF2.." / "..TF3
	end
	if t=="player" and (TF1+TF2+TF3)>0 and IsShiftKeyDown() then	
		self:AddDoubleLine("天赋 : |cffFFFFFF"..TF1+TF2+TF3.."|r"..ZTF, ZTD)
		self:Show()		
	end
	
	local reaction = UnitReaction(t, "player")
	if reaction and t~="player" and t~="pet" and IsShiftKeyDown() then
	    description = reactionNames[reaction]
        rgb = FACTION_BAR_COLORS[reaction]
		self:AddDoubleLine("关系/声望等级 : ",description ,.8 ,.8 ,.8 ,rgb.r ,rgb.g ,rgb.b )
		self:Show()
	end
	
	local PLV = UnitLevel(t)
	local PHJ = select(2,UnitArmor(t))
	local HJCS0, HJCS2, HJFZ = "", "", ""
	if PLV < 60 then
		HJCS0 = string.format("%.2f",min(100*PHJ/(PHJ+400+85*PLV),75))
	else
		HJCS0 = string.format("%.2f",min(100*PHJ/(PHJ+400+85*PLV+4.5*85*(PLV-59)),75))		
	end	
	if (PLV+3) < 60 then
		HJCS3 = string.format("%.2f",min(100*PHJ/(PHJ+400+85*(PLV+3)),75))
	else
		HJCS3 = string.format("%.2f",min(100*PHJ/(PHJ+400+85*(PLV+3)+4.5*85*((PLV+3)-59)),75))		
	end	
	if (PLV == 60) or (PLV == 70) or (PLV == 80) then
		HJFZ = (PLV+3)*1402.5-66502.5
	end
	if (t=="player" or t=="pet") and PLV <81 and IsShiftKeyDown() then	
		self:AddLine("|cffFFFFFF   ┏━━  [ "..targetT[t].." ] 伤害减免  ━━┓")
		self:AddLine("|cffCCCCCC"..PHJ.." 护甲，受到伤害减伤 "..HJCS0.." %")
		self:AddLine("|cffCCCCCC面对 |cffFF8000"..(PLV+3).." |cffCCCCCC级怪时，提供 |cff00FF00"..HJCS3.." %|cffCCCCCC 减伤")
		self:Show()		
	end
	if t=="player" and HJFZ~="" and IsShiftKeyDown() then	
		self:AddLine("|cffCCCCCC 受到 |cffFF00FF"..string.format("%.2f",(102.4-(GetDodgeChance()+GetParryChance()+5+GetCombatRating(CR_DEFENSE_SKILL)/FYDJ[PLV]))).." % |cffCCCCCC普通攻击 (防御类免伤)")
		self:Show()		
	end	
	if (t=="player" or t=="pet") and IsShiftKeyDown() and HJFZ~="" then	
		self:AddLine("|cffCCCCCC"..PLV.."级的护甲阀值为 "..((PLV+3)*1402.5-66502.5).."( |cff00FFFF"..string.format("%+d",(PHJ-HJFZ)).."|cffCCCCCC)")
		self:Show()		
	end

end)

hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
	local id = select(11,UnitBuff(...))
	local bs = select(8,UnitBuff(...))
	if id then
		if select(9,UnitBuff(...)) then
			self:AddDoubleLine("Buff id :","|cff00FF00可吸取 →  "..id)
			else
			self:AddDoubleLine("Buff id :",id)	
		end
		if bs=="player" then
			self:AddDoubleLine(" ┗来源于 :","|cff00FFFF[ 你 ]")		
		end
		if bs and bs~="player" then
			self:AddDoubleLine(" ┗来源于 :",bs.." _ "..UnitName(bs))		
		end
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
	local dbs = select(8,UnitDebuff(...))
	if id then
		self:AddDoubleLine("|cffCCCCCCDeBuff id :","|cff"..color..id)	
		if dbs=="player" then
			self:AddDoubleLine("|cffCCCCCC ┗来源于 :","|cffFF00FF[ 你 ]")		
		end
		if dbs and dbs~="player" then
			self:AddDoubleLine("|cffCCCCCC ┗来源于 :","|cff"..color..dbs.." _ "..UnitName(dbs))
		end	
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
	local as = select(8,UnitAura(...))
	if id then
		self:AddDoubleLine("Aura id :",id)
		if as=="player" then
			self:AddDoubleLine(" ┗来源于 :","|cff00FFFF[ 你 ]")		
		end
		if as and as~="player" then
			self:AddDoubleLine(" ┗来源于 :",as.." _ "..UnitName(as))
		end
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

GameTooltip:HookScript("OnTooltipSetItem", function(self, ...)
	local link = select(2,self:GetItem())
	if not link or not GetItemInfo(link) then return end
	local iLevel = select(4,GetItemInfo(link))
	local maxStack = select(8,GetItemInfo(link))
	local _, id, enchantId, jewelId1, jewelId2, jewelId3, jewelId4, suffixId, uniqueId,
  linkLevel, specializationID, reforgeId, unknown1, unknown2 = strsplit(":", link)
	if id then 
		self:AddDoubleLine("物品 Entry :", id)
		self:Show()
	end
	if iLevel > 1 then 
		self:AddDoubleLine("物品等级 : ", iLevel, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9)
		self:Show()
	end
	if IsShiftKeyDown() then
	if maxStack > 1 then 
		self:AddDoubleLine("最大堆叠数量 : ", maxStack, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9)
		self:Show()
	end
	if enchantId ~= "0" then 
		self:AddDoubleLine("物品 附魔id : ", enchantId, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId1 ~= "0" then 
		self:AddDoubleLine("宝石1 法术id : ", jewelId1, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId2 ~= "0" then 
		self:AddDoubleLine("宝石2 法术id : ", jewelId2, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId3 ~= "0" then 
		self:AddDoubleLine("宝石3 法术id : ", jewelId3, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	local spellName = GetItemSpell(link)
	if spellName then 
		self:AddDoubleLine("物品(使用)法术名 :", spellName, 0.9, 0.7, 0.75, 0.9, 0.9, 0.9)
		self:Show()
	end
	local icon = GetItemIcon(id)
	if icon then
		self:AddLine("图标: "..icon, 0.9, 0.9, 0.9)
		self:Show()
	end
	end
end)

ItemRefTooltip:HookScript("OnTooltipSetItem", function(self)
	local link = select(2,self:GetItem())	
	if not link or not GetItemInfo(link) then return end
	local iLevel = select(4,GetItemInfo(link))
	local maxStack = select(8,GetItemInfo(link))
	local _, id, enchantId, jewelId1, jewelId2, jewelId3, jewelId4, suffixId, uniqueId,
  linkLevel, specializationID, reforgeId, unknown1, unknown2 = strsplit(":", link)
	if id then 
		self:AddDoubleLine("物品 Entry :", id)
		self:Show()
	end
	if iLevel ~= "0" then 
		self:AddDoubleLine("物品等级 : ", iLevel, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9)
		self:Show()
	end
	if maxStack > 1 then 
		self:AddDoubleLine("最大堆叠数量 : ", maxStack, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9)
		self:Show()
	end
	if enchantId ~= "0" then 
		self:AddDoubleLine("物品 附魔id : ", enchantId, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId1 ~= "0" then 
		self:AddDoubleLine("宝石1 法术id : ", jewelId1, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId2 ~= "0" then 
		self:AddDoubleLine("宝石2 法术id : ", jewelId2, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	if jewelId3 ~= "0" then 
		self:AddDoubleLine("宝石3 法术id : ", jewelId3, 0.9, 0.7, 0.75, 0, 0.9, 0.9)
		self:Show()
	end
	local spellName = GetItemSpell(link)
	if spellName then 
		self:AddDoubleLine("物品(使用)法术名 :", spellName, 0.9, 0.7, 0.75, 0.9, 0.9, 0.9)
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
      if header or not name or not IsShiftKeyDown() then return end
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
