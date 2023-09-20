function Ghost_ReqTooltipText(tooltip,leftText,rightText, reqId)

    tooltip:AddDoubleLine("|cffcccccc┌|r", "|cffcccccc┐|r");

    if leftText and rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r"..leftText, "|cFF00FF00"..rightText.."|r|cffcccccc│|r");
    elseif not leftText and rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r", "|cFF00FF00"..rightText.."|r|cffcccccc│|r");
    elseif leftText and not rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r"..leftText, "|cffcccccc│|r");
    end

    if Ghost.Data.Req[reqId] then
        local  level,vip,hr,faction,rank,reincarnation,achievementPoints,gold,token,xp,honor,arena,spiritPower = 
		Ghost.Data.Req[reqId]["level"],Ghost.Data.Req[reqId]["vip"],Ghost.Data.Req[reqId]["hr"],Ghost.Data.Req[reqId]["faction"],
		Ghost.Data.Req[reqId]["rank"],Ghost.Data.Req[reqId]["reincarnation"],Ghost.Data.Req[reqId]["achievementPoints"],Ghost.Data.Req[reqId]["gold"],Ghost.Data.Req[reqId]["token"],Ghost.Data.Req[reqId]["xp"],
		Ghost.Data.Req[reqId]["honor"],Ghost.Data.Req[reqId]["arena"],Ghost.Data.Req[reqId]["spiritPower"];
        local mapDesc,questDesc,achieveDesc,spellDesc = 
	    	Ghost.Data.Req[reqId]["mapDesc"],Ghost.Data.Req[reqId]["questDesc"],Ghost.Data.Req[reqId]["achieveDesc"],Ghost.Data.Req[reqId]["spellDesc"];

        if math.abs(level) > 0 or math.abs(vip) > 0 or math.abs(hr) > 0 or math.abs(faction) > 0 or math.abs(rank) > 0 or  achievementPoints > 0 or mapDesc~="" or questDesc~="" or achieveDesc~="" or spellDesc~="" then
            tooltip:AddDoubleLine("|cffcccccc│|r需满足", "|cffcccccc│|r");
            if math.abs(level) > 0 then
                if level > 0 then
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[等级]|r", math.abs(level).."级".."|cffcccccc│|r");
                else
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[等级]|r", "当前是"..math.abs(level).."级".."|cffcccccc│|r");
                end
            end
            if math.abs(vip) > 0 then
                if vip > 0 then
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[会员]|r", Ghost.Data.VIP[math.abs(vip)]["title"].."|cffcccccc│|r");
                else
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[会员]|r", "当前是"..Ghost.Data.VIP[math.abs(vip)]["title"].."|cffcccccc│|r");
                end
            end
            if math.abs(hr) > 0 then
                local f,_ = UnitFactionGroup("player");
                if f == "Alliance" then
                    if hr > 0 then
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[军衔]|r", Ghost.Data.HRTitles[math.abs(hr)].."|cffcccccc│|r");
                    else
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[军衔]|r", "当前是"..Ghost.Data.HRTitles[math.abs(hr)].."|cffcccccc│|r");
                    end
                else
                    if hr > 0 then
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[军衔]|r", Ghost.Data.HRTitles[math.abs(hr) + 14].."|cffcccccc│|r");
                    else
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[军衔]|r", "当前是"..Ghost.Data.HRTitles[math.abs(hr) + 14].."|cffcccccc│|r");
                    end
                end
            end
            if math.abs(reincarnation) > 0 and Ghost.Data.ReincarnationTitles[math.abs(reincarnation)] then
                if reincarnation > 0 then
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[转生]|r", Ghost.Data.ReincarnationTitles[math.abs(reincarnation)].."|cffcccccc│|r");
                else
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[转生]|r", "当前是"..Ghost.Data.ReincarnationTitles[math.abs(reincarnation)].."|cffcccccc│|r");
                end
            end
	    	if math.abs(faction) > 0 and Ghost.Data.FactionTitles[math.abs(faction)] then
                if faction > 0 then
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[门派]|r", Ghost.Data.FactionTitles[math.abs(faction)].."|cffcccccc│|r");
                else
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[门派]|r", "当前是"..Ghost.Data.FactionTitles[math.abs(faction)].."|cffcccccc│|r");
                end
            end
            if math.abs(rank) > 0 and Ghost.Data.RankTitles[math.abs(rank)] then
                if rank > 0 then
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[修炼]|r", Ghost.Data.RankTitles[math.abs(rank)].."|cffcccccc│|r");
                else
                    tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[修炼]|r", "当前是"..Ghost.Data.RankTitles[math.abs(rank)].."|cffcccccc│|r");
                end
            end

            if achievementPoints > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[成就点]|r", achievementPoints.."|cffcccccc│|r");
            end

            if mapDesc ~= "" then
                tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[区域]|r", mapDesc.."|cffcccccc│|r");
            end
            if questDesc ~= "" then
                tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[任务]|r", questDesc.."|cffcccccc│|r");
            end
            if achieveDesc ~= "" then
                tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[成就]|r", achieveDesc.."|cffcccccc│|r");
            end
            if spellDesc ~= "" then
                tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00[技能或光环]|r", spellDesc.."|cffcccccc│|r");
            end
        end

        local reqItem = false;
        for i=1,10 do
            if Ghost.Data.Req[reqId]["item"..i] > 0 and Ghost.Data.Req[reqId]["itemCount"..i] > 0 then
                reqItem = true;
            end
        end

        if gold > 0 or token > 0 or xp > 0 or honor > 0 or arena > 0 or spiritPower > 0 or reqItem then
            tooltip:AddDoubleLine("|cffcccccc│|r将消耗", "|cffcccccc│|r");
            if gold > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINBI.."|cFF00FF00[金币]|r", gold.."|cffcccccc│|r");
            end
            if token > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JIFEN.."|cFF00FF00[积分]|r", token.."|cffcccccc│|r");
            end
            if xp > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINGYAN.."|cFF00FF00[经验]|r", xp.."|cffcccccc│|r");
            end
            if honor > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_RONGYU.."|cFF00FF00[荣誉点数]|r", honor.."|cffcccccc│|r");
            end
            if arena > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINGJI.."|cFF00FF00[竞技点数]|r", arena.."|cffcccccc│|r");
            end
            if spiritPower > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINBI.."|cFF00FF00[灵力]|r", spiritPower.."|cffcccccc│|r");
            end
            for i=1,10 do
                if Ghost.Data.Req[reqId]["item"..i] > 0 and Ghost.Data.Req[reqId]["itemCount"..i] > 0 then
                    local itemLink = GhostGetItemLink(Ghost.Data.Req[reqId]["item"..i]);
                    local count = Ghost.Data.Req[reqId]["itemCount"..i]
                    if itemLink then
                        tooltip:AddDoubleLine("|cffcccccc│|r".."|T"..GhostGetItemIcon(Ghost.Data.Req[reqId]["item"..i])..":15:15:20:-2|t     "..itemLink, count.."|cffcccccc│|r");
                    end
                end
            end
        end

        for i=1,10 do
            if Ghost.Data.Req[reqId]["cmdDes"..i] ~= "0" then
                tooltip:AddDoubleLine("|cffcccccc│|r同时使", "|cffcccccc│|r");
                for j=1,10 do
                    if Ghost.Data.Req[reqId]["cmdDes"..j] ~= "0" then
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00"..Ghost.Data.Req[reqId]["cmdDes"..j], "|cffcccccc│|r");
                    end
                end
                break;
            end
        end
    end

    tooltip:AddDoubleLine("|cffcccccc└|r", "|cffcccccc┘|r");
    tooltip:Show();
end

function Ghost_RewTooltipText(tooltip,leftText,rightText, rewId)
 
    tooltip:AddDoubleLine("|cffcccccc┌|r", "|cffcccccc┐|r");

    if leftText and rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r"..leftText, "|cFF00FF00"..rightText.."|r|cffcccccc│|r");
    elseif not leftText and rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r", "|cFF00FF00"..rightText.."|r|cffcccccc│|r");
    elseif leftText and not rightText then
        tooltip:AddDoubleLine("|cffcccccc│|r"..leftText, "|cffcccccc│|r");
    end

    if Ghost.Data.Rew[rewId] then
        local  gold,token,xp,honor,arena,statpoint,spell,aura = 
		Ghost.Data.Rew[rewId]["gold"],Ghost.Data.Rew[rewId]["token"],Ghost.Data.Rew[rewId]["xp"],
        Ghost.Data.Rew[rewId]["honor"],Ghost.Data.Rew[rewId]["arena"],Ghost.Data.Rew[rewId]["statpoint"],
        Ghost.Data.Rew[rewId]["spell"],Ghost.Data.Rew[rewId]["aura"];
    
        local rewItem = false;
        for i=1,10 do
            if Ghost.Data.Rew[rewId]["item"..i] > 0 and Ghost.Data.Rew[rewId]["itemCount"..i] > 0 then
                rewItem = true;
            end
        end

        for i=1,10 do
            if Ghost.Data.Rew[rewId]["spell"..i] > 0 and  GhostGetSpellLink(Ghost.Data.Rew[rewId]["spell"..i]) then
                rewSpell = true;
            end
        end

        for i=1,10 do
            if Ghost.Data.Rew[rewId]["aura"..i] > 0 and  GhostGetSpellLink(Ghost.Data.Rew[rewId]["aura"..i]) then
                rewAura = true;
            end
        end


        if gold > 0 or token > 0 or xp > 0 or honor > 0 or arena > 0 or statpoint > 0 or rewSpell or rewAura or rewItem then
            tooltip:AddDoubleLine("|cffcccccc│|r将获得", "|cffcccccc│|r");
            if gold > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINBI.."|cFF00FF00[金币]|r", gold.."|cffcccccc│|r");
            end
            if token > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JIFEN.."|cFF00FF00[积分]|r", token.."|cffcccccc│|r");
            end
            if xp > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINGYAN.."|cFF00FF00[经验]|r", xp.."|cffcccccc│|r");
            end
            if honor > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_RONGYU.."|cFF00FF00[荣誉点数]|r", honor.."|cffcccccc│|r");
            end
            if arena > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_JINGJI.."|cFF00FF00[竞技点数]|r", arena.."|cffcccccc│|r");
            end
            if statpoint > 0 then
                tooltip:AddDoubleLine("|cffcccccc│|r"..TOOLTIP_ICON_DOUQI.."|cFF00FF00[斗气点数]|r", statpoint.."|cffcccccc│|r");
            end
            
            for i=1,10 do
                if Ghost.Data.Rew[rewId]["spell"..i] > 0  then
                    local link = GhostGetSpellLink(Ghost.Data.Rew[rewId]["spell"..i]);
                    tooltip:AddDoubleLine("|cffcccccc│|r".."|T"..GhostGetSpellIcon(Ghost.Data.Rew[rewId]["spell"..i])..":15:15:20:-2|t     ".."|cFF00FF00[技能]|r", link.."|cffcccccc│|r");
                end
            end

            for i=1,10 do
                if Ghost.Data.Rew[rewId]["aura"..i] > 0  then
                    local link = GhostGetSpellLink(Ghost.Data.Rew[rewId]["aura"..i]);
                    if link then
                        tooltip:AddDoubleLine("|cffcccccc│|r".."|T"..GhostGetSpellIcon(Ghost.Data.Rew[rewId]["aura"..i])..":15:15:20:-2|t     ".."|cFF00FF00[光环]|r", link.."|cffcccccc│|r");
                    end
                end
            end

            for i=1,10 do
                if Ghost.Data.Rew[rewId]["item"..i] > 0 and Ghost.Data.Rew[rewId]["itemCount"..i] > 0 then
                    local itemLink = GhostGetItemLink(Ghost.Data.Rew[rewId]["item"..i]);
                    local count = Ghost.Data.Rew[rewId]["itemCount"..i]
                    if itemLink then
                        tooltip:AddDoubleLine("|cffcccccc│|r".."|T"..GhostGetItemIcon(Ghost.Data.Rew[rewId]["item"..i])..":15:15:20:-2|t     "..itemLink, count.."|cffcccccc│|r");
                    end
                end
            end
        end

        for i=1,10 do
            if Ghost.Data.Rew[rewId]["cmdDes"..i] ~= "0" then
                tooltip:AddDoubleLine("|cffcccccc│|r同时使", "|cffcccccc│|r");
                for j=1,10 do
                    if Ghost.Data.Rew[rewId]["cmdDes"..j] ~= "0" then
                        tooltip:AddDoubleLine("|cffcccccc│|r|cFF00FF00"..Ghost.Data.Rew[rewId]["cmdDes"..j], "|cffcccccc│|r");
                    end
                end
                break;
            end
        end
    end
    

    tooltip:AddDoubleLine("|cffcccccc└|r", "|cffcccccc┘|r");
    tooltip:Show();
end


function GhostGetSpellDescription(spellId)
	if not SpellDescriptionTooltip then
		CreateFrame("GameTooltip","SpellDescriptionTooltip",UIParent,"GameTooltipTemplate");
		SpellDescriptionTooltip:SetOwner(UIParent,"ANCHOR_NONE");
	end
	SpellDescriptionTooltip:ClearLines();
	SpellDescriptionTooltip:SetHyperlink("spell:"..spellId);
	local des = "-".._G["SpellDescriptionTooltipTextLeft"..SpellDescriptionTooltip:NumLines()]:GetText();
	des = "|cFF00FF00"..des.."|r";	
	return des;
end

function GhostOnTooltipShow(self)
    
    --Hook Item
	local _, itemLink = self:GetItem()
	
	if itemLink then
		--print(string.find(itemLink,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?"))
		local _,_,_,_, itemId, enchantId, jewelId1, jewelId2, jewelId3, jewelId4, suffixId, uniqueId,linkLevel,_ = string.find(itemLink,"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")

        if tonumber(uniqueId) > 1000000 then

			local guid = tonumber(uniqueId) - 1000000;
			local t = Ghost.Data.Item.GUID[guid];
			
			if t then
				local icons = "";
				for key,spell in pairs(t) do
					if spell and spell~="" then
						if spell == "0" then
							icons = icons.."|TInterface\\AddOns\\GhostPanel\\3.0\\Icons\\i_42403:30:30:0:-2|t";
						else
							icons = icons.."|T"..GhostGetSpellIcon(spell)..":30:30:0:-2|t";-- "|TInterface\\AddOns\\GhostPanel\\3.0\\Icons\\i_42404:30:30:0:-2|t";
						end				
					end
				end
				
				self:AddLine(icons);
				self:AddLine("\n");
				
				for key,spell in pairs(t) do
					if spell and spell~="" and spell ~= "0"then
						self:AddLine(GhostGetSpellDescription(spell));
					end
				end
			end
			
			self:AddLine("\n");
        end
		
        if not Ghost.Data.Item.Entry[itemId] then
			Ghost_SendData("GC_C_ITEMENTRY",itemId);
			
			Ghost.Data.Item.Entry[itemId] = {
				["des"]                 = "",
				["heroText"]            = "",
				["daylimit"]            = 0,
				["maxGems"]             = 0,
				["exchange1"]           = 0,
				["exchangeReqId1"]      = 0,
				["exchange2"]           = 0,
				["exchangeReqId2"]      = 0,
				["unbindReqId"]         = 0,
				["useReqId"]            = 0,
				["equipReqId"]          = 0,
				["buyReqId"]            = 0,
				["sellRewId"]           = 0,
				["recoveryRewId"]       = 0,
				["gs"]                  = 0,
			}
		end
		
		if Ghost.Data.Item.Entry[itemId] then
		
			if Ghost.Data.Item.Entry[itemId]["des"] ~="" then
                self:AddLine(Ghost.Data.Item.Entry[itemId]["des"]);
            end
		
            if Ghost.Data.Item.Entry[itemId]["daylimit"] ~=0 then
                if not Ghost.Char.DayLimitItem[itemId] then
                    Ghost_ReqTooltipText(self,"每日上限","0/"..Ghost.Data.Item.Entry[itemId]["daylimit"],0);
                else
                    Ghost_ReqTooltipText(self,"每日上限",Ghost.Char.DayLimitItem[itemId].."/"..Ghost.Data.Item.Entry[itemId]["daylimit"],0);
                end
            end

            if Ghost.Data.Item.Entry[itemId]["maxGems"] ~=0 then
                Ghost_ReqTooltipText(self,"最大镶嵌数量",Ghost.Data.Item.Entry[itemId]["maxGems"],0);
            end
        
            if Ghost.Data.Item.Entry[itemId]["exchange1"] ~=0 then
                -- Ghost_ReqTooltipText(self,"升级",GhostGetItemLink(Ghost.Data.Item.Entry[itemId]["exchange1"]),Ghost.Data.Item.Entry[itemId]["exchangeReqId1"]);
				Ghost_ReqTooltipText(self,"","升级",Ghost.Data.Item.Entry[itemId]["exchangeReqId1"]);
            end
			
			if Ghost.Data.Item.Entry[itemId]["exchange2"] ~=0 then
                --Ghost_ReqTooltipText(self,"升级",GhostGetItemLink(Ghost.Data.Item.Entry[itemId]["exchange2"]),Ghost.Data.Item.Entry[itemId]["exchangeReqId2"]);
				Ghost_ReqTooltipText(self,"","升级",Ghost.Data.Item.Entry[itemId]["exchangeReqId2"]);
            end
			
            if Ghost.Data.Item.Entry[itemId]["unbindReqId"] ~=0 then
                Ghost_ReqTooltipText(self,"","解绑",Ghost.Data.Item.Entry[itemId]["unbindReqId"]);
            end
        
            if Ghost.Data.Item.Entry[itemId]["equipReqId"] ~=0 then
                Ghost_ReqTooltipText(self,"","装备",Ghost.Data.Item.Entry[itemId]["equipReqId"]);
            end
        
            if Ghost.Data.Item.Entry[itemId]["useReqId"] ~=0 then
                Ghost_ReqTooltipText(self,"","使用",Ghost.Data.Item.Entry[itemId]["useReqId"]);
            end
        
            if Ghost.Data.Item.Entry[itemId]["buyReqId"] ~=0 then
                Ghost_ReqTooltipText(self,"","购买",Ghost.Data.Item.Entry[itemId]["buyReqId"]);
            end
        
            if Ghost.Data.Item.Entry[itemId]["sellRewId"] ~=0 then
                Ghost_RewTooltipText(self,"","售卖",Ghost.Data.Item.Entry[itemId]["sellRewId"]);
            end
        
            if Ghost.Data.Item.Entry[itemId]["recoveryRewId"] ~=0 then
                Ghost_RewTooltipText(self,"","回收",Ghost.Data.Item.Entry[itemId]["recoveryRewId"]);
            end     
        end

        Ghost_SetItemDes(self,itemId);

        GameTooltip_ClearMoney(self);
        local price = GhostGetItemPrice(itemId);
        if price and price > 0 then
            GameTooltip_OnTooltipAddMoney(self, GhostGetItemPrice(itemId));
        end
    end
    
    --Hook Spell
    local _,_, spellId = self:GetSpell();
    if spellId then
        Ghost_GS_SetSpellGS(self,spellId);
    end
end

GameTooltip:HookScript("OnShow", GhostOnTooltipShow);
ItemRefTooltip:HookScript("OnShow", GhostOnTooltipShow);

-- GossipExtend
local function GossipExtend(frame)
	-- itemString 服务端生成 "Hitem:XXXX"
	-- spellString 服务端生成 "Hspell:XXXX"
	local itemString = string.match(frame:GetText(), "Hitem[%-?%d:]+")
	local spellString = string.match(frame:GetText(), "Hspell[%-?%d:]+")
	if itemString then
		local _, itemId = strsplit(":", itemString)
		SetCursor("ATTACK_CURSOR")
		GameTooltip:SetOwner(_G["GossipFrame"], "ANCHOR_RIGHT", -30) 
		GameTooltip:ClearLines() 
		GameTooltip:SetHyperlink("Hitem:"..itemId)
		GameTooltip:Show()
	end
	
	if spellString then
		local _, spellId = strsplit(":", spellString)
		SetCursor("ATTACK_CURSOR")
		GameTooltip:SetOwner(_G["GossipFrame"], "ANCHOR_RIGHT", -30) 
		GameTooltip:ClearLines()
		GameTooltip:SetSpellByID(spellId)
		GameTooltip:Show()
	end 
end

for i=1,32 do if _G["GossipTitleButton"..i] then _G["GossipTitleButton"..i]:SetScript("OnEnter", GossipExtend) _G["GossipTitleButton"..i]:SetScript("OnLeave", function() GameTooltip:Hide()end) end end


-- function TESTTT()
--     local locX, locY, locZ = GetCurrentPosition("player");
--     DEFAULT_CHAT_FRAME:AddMessage(locX .. ", " .. locY .. ", " .. locZ);
-- end


-- local buffName = "神圣之灵"
-- 
-- local UnitAura, UIParent = UnitAura, UIParent
-- local tooltip = CreateFrame("GameTooltip","BuffCheckDisplayTooltip",UIParent,"GameTooltipTemplate")
-- 
-- function tooltip:Update()
-- 	local i=1
-- 	local aura = UnitAura("player",i)
-- 	while aura and (aura ~= buffName) do
-- 		i=i+1
-- 		aura = UnitAura("player",i)
-- 	end
-- 	if aura then
-- 		tooltip:ClearLines()
-- 		tooltip:SetOwner(UIParent,"ANCHOR_PRESERVE")
--         tooltip:SetUnitAura("player",i)
--         local px,py=GetPlayerMapPosition("player")
-- 
--         px = px - 32.07
--         py = py - 49.96
--         tooltip:ClearAllPoints();
--         tooltip:SetPoint("CENTER", 32.07 - px, 49.96 - py)
-- 		tooltip:Show()
-- 	else
-- 		tooltip:Hide()
-- 	end
-- end
-- 
-- CreateFrame("Frame"):SetScript("OnUpdate",function(self,elapsed) self.elapsed = (self.elapsed or 0)+elapsed if self.elapsed > 0.5 then self.elapsed = 0 tooltip:Update() end end)
-- 
-- 
-- 
-- 
-- function setMyFrame(f,x,y)
--     f:SetSize(288,100)
--     f:SetPoint("TOPLEFT",UIParent,"TOPLEFT",x,y) 
--     f.text = f.text or f:CreateFontString(nil,"ARTWORK","QuestFont_Shadow_Huge")   
--     f.text:SetAllPoints(true)     
--  end
-- 
-- ctotel = 0
-- creft = 0.1
-- function myCoords(f,i)
--    ctotel = ctotel + i
--    if ctotel >= creft then
--       px,py=GetPlayerMapPosition("player")
-- 
--       f.text:SetText(format("( %s ) [%f , %f]",GetZoneText(), px *100, py *100))
--       ctotel = 0
--    end
-- end
-- 
-- myCoordsFrame = CreateFrame("Frame","MyCoordsFrame",UIParent)
-- setMyFrame(myCoordsFrame, 500, 0)
-- myCoordsFrame:SetScript("OnUpdate", myCoords)

