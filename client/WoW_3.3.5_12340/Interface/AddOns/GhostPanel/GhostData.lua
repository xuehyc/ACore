function OnDataRecv(self, event, opcode, msg, type, sender)
	if event == "CHAT_MSG_ADDON" then
		if opcode == "GC_S_CHAR" 			then	Ghost_FetchData_Char(msg)				end
		if opcode == "GC_S_SPIRITPOWER" 	then	Ghost_FetchData_CharSpiritPower(msg)	end
		if opcode == "GC_S_TOKEN" 			then	Ghost_FetchData_CharToken(msg)			end
		if opcode == "GC_S_TOKEN_UPDATE" 	then	Ghost_FetchData_CharTokenUpdate(msg)	end
		
		if opcode == "GC_S_VIP" 			then	Ghost_FetchData_VIP(msg)				end
		if opcode == "GC_S_HR" 				then	Ghost_FetchData_HR(msg)					end	
		if opcode == "GC_S_FACTION" 		then	Ghost_FetchData_Faction(msg)			end	
		if opcode == "GC_S_REINCARNATION" 	then	Ghost_FetchData_Reincarnation(msg)		end	
		if opcode == "GC_S_RANK" 			then	Ghost_FetchData_Rank(msg)				end			
		if opcode == "GC_S_OTHER_DATA" 		then	Ghost_FetchData_Other(msg)				end
		if opcode == "GC_S_REQ" 			then	Ghost_FetchData_Req(msg)				end
		if opcode == "GC_S_REQ_CHECK_PANEL" then	Ghost_FetchData_ReqPanelCheck(msg)		end
		if opcode == "GC_S_REQ_CHECK_POP" 	then	Ghost_FetchData_ReqPopCheck(msg)		end	
		if opcode == "GC_S_REW" 			then	Ghost_FetchData_Rew(msg)				end
		if opcode == "GC_S_ENCHANT" 		then	Ghost_FetchData_Enchant(msg)			end

		if opcode == "GC_S_RUNE" 			then	Ghost_FetchData_Rune(msg)				end
		if opcode == "GC_S_RUNE_CATEGORY" 	then	Ghost_FetchData_RuneCategory(msg)		end
		if opcode == "GC_S_RUNE_UPDATE" 	then	Ghost_FetchData_RuneUpdate(msg)			end

		if opcode == "GC_S_BLACKMARKET" 	then	Ghost_FetchData_BlackMarket(msg)		end

		if opcode == "GC_S_LUCKDRAW" 		then	Ghost_FetchData_LuckDraw(msg)			end
		if opcode == "GC_S_LUCKDRAW_UPDATE" then	Ghost_FetchData_LuckDrawUpdate(msg)		end
		if opcode == "GC_S_LUCKDRAW_STOP" 	then	Ghost_FetchData_LuckDrawStop(msg)		end
		if opcode == "GC_S_LUCKDRAW_REW" 	then	Ghost_FetchData_LuckDrawRew(msg)		end

		if opcode == "GC_S_LUCKDRAW_V3"		then	Ghost_FetchData_LuckDrawV3(msg)			end
		
		if opcode == "GC_S_TRANSMOG" 		then	Ghost_FetchData_TransMog(msg)			end
		if opcode == "GC_S_ITEMENTRY" 		then	Ghost_FetchData_ItemData(msg)			end
		if opcode == "GC_S_ITEMGUID" 		then	Ghost_FetchData_ItemGUIDData(msg)		end
		if opcode == "GC_S_DAYLIMIT" 		then	Ghost_FetchData_DayLimitData(msg)		end

		if opcode == "GC_S_GS" 				then	Ghost_FetchData_GSData(msg)				end
		if opcode == "GC_S_GS_SPELLDATA" 	then	Ghost_FetchData_GSSpellData(msg)		end

		if opcode == "GC_S_NAME_UPDATE" 	then	Ghost_FetchData_NameUpdate(msg)			end
		if opcode == "GC_S_RECOVERY" 		then	Ghost_FetchData_Recovery(msg)			end
		if opcode == "GC_S_ANTIFARM" 		then	Ghost_FetchData_AntiFarm(msg)			end
		if opcode == "GC_S_STATPOINTS" 		then	Ghost_FetchData_StatPoints(msg)			end
		if opcode == "GC_S_TALISMAM" 		then	Ghost_FetchData_TalismanUpdate(msg)		end
		if opcode == "GC_S_TALISMAN_VALUE" 	then	Ghost_FetchData_TalismanValue(msg)		end
		if opcode == "GC_S_RANKVALUE" 		then	Ghost_FetchData_RankValue(msg)			end
		if opcode == "GC_S_QRENCODE" 		then	Ghost_FetchData_QrenCode(msg)			end
		if opcode == "GC_S_QRENCODE_OPEN"	then	Recharge:Show()							end
    end
end

local GC_RECV_FRAME = CreateFrame("Frame")
GC_RECV_FRAME:RegisterEvent("CHAT_MSG_ADDON")
GC_RECV_FRAME:SetScript("OnEvent", OnDataRecv)

-- RELOAD更新
local RELOAD_FRAME = CreateFrame("Frame")
RELOAD_FRAME:RegisterEvent("PLAYER_LOGIN")
RELOAD_FRAME:SetScript("OnEvent", function(self, event, ...) GhostBanAddon();Ghost_SendData("GC_C_RELOAD"," ") end)

function Ghost_SendData( opcode, msg )
	SendAddonMessage(opcode, msg, "GUILD")
end

function Split(szFullString, szSeparator)
	if not szFullString then
		return nil
	end
	
	local nFindStartparam = 1
	local nSplitparam = 1
	local nSplitArray = {}
	while true do
		local nFindLastparam = string.find(szFullString, szSeparator, nFindStartparam)
		if not nFindLastparam then
			nSplitArray[nSplitparam] = string.sub(szFullString, nFindStartparam, string.len(szFullString))
		break
	end
	nSplitArray[nSplitparam] = string.sub(szFullString, nFindStartparam, nFindLastparam - 1)
	nFindStartparam = nFindLastparam + string.len(szSeparator)
	nSplitparam = nSplitparam + 1
	end
	return nSplitArray
end

function GhostGetItemIcon(Entry)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Entry);
    return itemTexture;
end

function GhostGetItemName(Entry)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Entry);
    return itemName;
end

function GhostGetItemLink(Entry)
	--local tooltip = CreateFrame("GameTooltip", "", UIParent, "GameTooltipTemplate");
	
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Entry);
	
	if not itemLink then
		GameTooltip:SetHyperlink("item:"..Entry..":0:0:0:0:0:0:0");
	end

	return itemLink;
end

function GhostGetItemLevel(Entry)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Entry);
    return tonumber(itemLevel);
end

function GhostGetItemPrice(Entry)
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(Entry);
    return itemSellPrice;
end

function GhostGetSpellLink(Entry)
    return GetSpellLink(Entry);
end

function GhostGetSpellIcon(Entry)
	local _, _, icon = GetSpellInfo(Entry);
	return icon;
end

function GhostIsAlliance()
	local team = UnitFactionGroup("player");
	return team == "Alliance";
end

function Ghost_FetchData_Faction(data)

    local t = Split(data," ");

    for key,value in pairs(t) do
		if value~="" then
            local v1,v2 = strsplit("-",value);
            Ghost.Data.FactionTitles[tonumber(v1)] = v2;
		end
    end
	
	if Ghost.Data.FactionTitles[0] == nil then
		Ghost.Data.FactionTitles[0] = "未加入门派";
	end
end

function Ghost_FetchData_Reincarnation(data)

	local v1,v2 = strsplit("^",data);
	Ghost.Data.ReincarnationTitles[tonumber(v1)] = v2;

	if Ghost.Data.ReincarnationTitles[0] == nil then
		Ghost.Data.ReincarnationTitles[0] = "未转生";
	end
end

function Ghost_FetchData_Rank(data)

	local v1,v2 = strsplit("^",data);
	Ghost.Data.RankTitles[tonumber(v1)] = v2;

	if Ghost.Data.RankTitles[0] == nil then
		Ghost.Data.RankTitles[0] = "无";
	end
end

function Ghost_FetchData_Enchant(data)

    local Id,name = strsplit("^",data);
	
	Ghost.Data.Enchant[Id] = name;
end

function Ghost_FetchData_QrenCode(data)
    local url,text1,text2 = strsplit(" ",data);
	RequestQrMatrix(url);
	RechargeText1:SetText(text1);
	RechargeText2:SetText(text2);
end

function Ghost_FetchData_Char(data)
    local VIP,HR,FACTION,RANK,REINCARNATION,MAP,ZONE,AREA = strsplit(" ",data);
    Ghost.Char.LEVEL 				= UnitLevel("player");
	Ghost.Char.VIP 				    = tonumber(VIP);
	Ghost.Char.HR 					= tonumber(HR);
	Ghost.Char.FACTION				= tonumber(FACTION);
	Ghost.Char.RANK	 			    = tonumber(RANK);
	Ghost.Char.REINCARNATION 		= tonumber(REINCARNATION);
	Ghost.Char.ACHIEVEMENTPOINTS 	= GetTotalAchievementPoints();
	Ghost.Char.GOLD 				= math.floor(GetMoney() / 100 / 100);
    Ghost.Char.XP 					= UnitXP("player");
	Ghost.Char.HONOR 				= GetHonorCurrency();
	Ghost.Char.ARENA 				= GetArenaCurrency();
	Ghost.Char.MAP 					= MAP;
	Ghost.Char.ZONE 				= ZONE;
	Ghost.Char.AREA 				= AREA;

	GhostPanel_VIP_UpateUI();
end

function Ghost_FetchData_CharToken(data)
	Ghost.Char.TOKEN = tonumber(data);
end

function Ghost_FetchData_CharTokenUpdate(data)
	Ghost.Char.TOKEN = Ghost.Char.TOKEN + tonumber(data);
	if (ContainerFrame1MoneyFrame) then
		MoneyFrame_UpdateMoney(ContainerFrame1MoneyFrame);
	end
	if AuctionFrameMoneyFrame then
		MoneyFrame_UpdateMoney(AuctionFrameMoneyFrame);
	end
end

function Ghost_FetchData_CharSpiritPower(data)
	local value,maxvalue = strsplit(" ",data);
	Ghost.Char.SPIRITPOWER = tonumber(value);
	Ghost_UpdateSpiritPower(value,maxvalue);
end

function Ghost_FetchData_RankValue(msg)
	local value,maxValue,text = strsplit(" ",msg);
	--RefreshLegendLevelBarValue(text, value, maxValue)
end

function Ghost_FetchData_Other(data)
	local param1,param2 = strsplit(" ",data);
	param1 = tonumber(param1);
	param2 = tonumber(param2);

	Ghost.Data.LuckDrawReqData[1] 	= param1;
	Ghost.Data.LuckDrawReqData[2] 	= param2;
end

function Ghost_FetchData_NameUpdate(data)
	SetCVar("UnitNameOwn", 0)
	SetCVar("UnitNameOwn", 1)
	SetCVar("UnitNameFriendlyPlayerName", 0)
	SetCVar("UnitNameFriendlyPlayerName", 1)
	SetCVar("UnitNameEnemyPlayerName", 0)
	SetCVar("UnitNameEnemyPlayerName", 1)
end

function Ghost_FetchData_TalismanValue(data)
	Ghost.Char.TALISMAN = tonumber(data);
end

-- Addon Ban
function GhostCheckAddonBan(name, title)
	for k,v in pairs(ADDON_BAN_LIST) do
		if string.find(name,v) then
			return true;
		end
	end

	for k,v in pairs(ADDON_BAN_LIST) do
		if string.find(title,v) then
			return true;
		end
	end

	return false;
end

function GhostBanAddon()
	for i=1, GetNumAddOns() do
		local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(i);
		if enabled and GhostCheckAddonBan(name, title) then
			DisableAddOn(i);
		end
	end
end