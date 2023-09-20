GHOST_TRANSMOG_NAV_DATA = 
{
    [1] =   { MTEXT = "头部", TIP = "|cff00ff00点击查看背包中的[头部]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Head" },
	[2] =   { MTEXT = "肩部", TIP = "|cff00ff00点击查看背包中的[肩部]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Shoulder" },
	[3] =   { MTEXT = "衬衣", TIP = "|cff00ff00点击查看背包中的[衬衣]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Shirt" },
    [4] =   { MTEXT = "胸部", TIP = "|cff00ff00点击查看背包中的[胸部]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest" },
    [5] =   { MTEXT = "腰部", TIP = "|cff00ff00点击查看背包中的[腰部]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Waist" },
    [6] =   { MTEXT = "腿部", TIP = "|cff00ff00点击查看背包中的[腿部]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Legs" },
    [7] =   { MTEXT = "靴子", TIP = "|cff00ff00点击查看背包中的[靴子]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Feet" },
    [8] =   { MTEXT = "手腕", TIP = "|cff00ff00点击查看背包中的[手腕]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Wrists" },
    [9] =   { MTEXT = "手套", TIP = "|cff00ff00点击查看背包中的[手套]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Hands" },
    [10] =  { MTEXT = "披风", TIP = "|cff00ff00点击查看背包中的[披风]装备|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest" },
    [11] =  { MTEXT = "主手武器", TIP = "|cff00ff00点击查看背包中的[武器]|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-MainHand" },
    [12] =  { MTEXT = "副手武器", TIP = "|cff00ff00点击查看背包中的[武器]|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-SecondaryHand" },
    [13] =  { MTEXT = "远程武器", TIP = "|cff00ff00点击查看背包中的[远程武器]|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Ranged" },
    [14] =  { MTEXT = "战袍", TIP = "|cff00ff00点击查看背包中的[战袍]|r", ICON = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Tabard" },
};

function GhostPanel_InitUI_TransMog()
	for i=1,GHOST_MAX_TRANSMOG_PAGES do
		Ghost.TransMog.NavButtons[i] =  _G["GhostUI_Page3Nav"..i];
		Ghost.TransMog.PageFrames[i] =  _G["GhostUI_Page3SubPage"..i];
		for j=1,GHOST_MAX_TRANSMOG_BUNTTON do
			Ghost.TransMog.PageButtons[i].Button[j] = _G["GhostUI_Page3SubPage"..i.."Button"..j];	
		end
    end
end

function GhostPanel_TransMogNav_OnLoad(self)
    GhostPanel_InitToken(self);
	self.MText:SetText(GHOST_TRANSMOG_NAV_DATA[self.Id].MTEXT);
	self.MText:SetVertexColor(1, 1, 0, 1);
	self.MText:Show();
    self.Icon:SetTexture(GHOST_TRANSMOG_NAV_DATA[self.Id].ICON);

    if self.Id == Ghost.UI.SelectedSubPageId then
        self.Highlight:Show();
        self.Highlight:SetVertexColor(0, 1, 0, 1);
    end
end

function GhostPanel_TransMogNav_OnEnter(self)
    self.Highlight:SetVertexColor(0, 1, 0, 1);
    self.Highlight:Show();
    GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 20);
    

    

    if self.Entry > 0 then
        GameTooltip:SetHyperlink("item:"..self.Entry);
    else
        GameTooltip:AddLine("未装备任何物品", 1, 1, 1);
    end

    local p = _G[GameTooltip:GetName().."TextRight1"]; 
	p:SetText(GHOST_TRANSMOG_NAV_DATA[self.Id].TIP);
    p:Show();

    --GameTooltip:AddLine(GHOST_TRANSMOG_NAV_DATA[self.Id].TIP, 1, 1, 1);
    GameTooltip:Show();
end

function GhostPanel_TransMogNav_OnLeave(self)
    if (self.Id ~= Ghost.TransMog.SelectedPageId) then
        self.Highlight:Hide();
    end
    GameTooltip:Hide();
end

function GhostPanel_TransMogNav_OnClick(self, button, down)
    GhostPanel_HideSpecialUI();

	Ghost.TransMog.PageFrames[self.Id]:Show();
    Ghost.TransMog.SelectedPageId = self.Id;
    Ghost.UI.SelectedSubPageId = self.Id;
    GhostPanel_UpdateMainTitle();
    for i = 1, GHOST_MAX_TRANSMOG_PAGES do
        if (i ~= Ghost.TransMog.SelectedPageId) then
            Ghost.TransMog.PageFrames[i]:Hide();
			Ghost.TransMog.NavButtons[i].Highlight:Hide();
        end
    end
end

function GhostPanel_HomeNav_OnClick_TransMog(self)
    if self.Id == 3 then
        Ghost_SendData("GC_C_TRANSMOG"," ");
    end
end

function GhostPanel_Button_OnUpdate_TransMog(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["TRANSMOG"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self.Icon:SetTexture(GhostGetItemIcon(self.Entry));
        self:Show();
    end
end

function GhostPanel_Button_OnEnter_TransMog(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["TRANSMOG"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
        --GameTooltip:AddDoubleLine("|cff00ff00左键|r", "预览");
        --GameTooltip:AddDoubleLine("|cff00ff00右键|r", "幻化");

        --GameTooltip:SetHyperlink("item:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00[左键 - 预览][右键 - 幻化]|r");
        p:Show();
    end
end

function GhostPanel_Button_OnClick_TransMog(self,button,down)
    if self.ButtonType == GHOST_BUTTON_TYPE["TRANSMOG"] then
        GhostPanel_HideSpecialUI();
        if self.Entry ~= 0 then
            if (button == "RightButton") then
                if(self.Param2 ~= 0) then
                    local popframe = Ghost_ReqRewPop_Show("『"..GHOST_TRANSMOG_NAV_DATA[Ghost.TransMog.SelectedPageId].MTEXT.."』"..GhostGetItemLink(self.Param2).."\n\n幻化为", GhostGetItemLink(self.Entry));
			        popframe.ButtonType = self.ButtonType;
                    popframe.Entry = self.Entry;
                    popframe.Param1 = self.Param1;
                    popframe.Param2 = self.Param2;        
                else
                    Ghost_ReqRewPop_Show("『"..GHOST_TRANSMOG_NAV_DATA[Ghost.TransMog.SelectedPageId].MTEXT.."』[未装备任何物品]");
                end
            else
                DressUpItemLink(GhostGetItemLink(self.Entry));
            end
		end
    end
end

function Ghost_ReqRewConfirm_TransMog(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["TRANSMOG"] then
		Ghost_SendData("GC_C_BUY_TRANSMOG",Param1.." "..self.Entry);
    end
end

function Ghost_TransMog_CheckEquipLoc(item,invId)

    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType,itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(item);

    if itemType ~= "护甲" and itemType ~="武器" then
        return false;
    end

    if itemEquipLoc == "itemEquipLoc" and invId == 1 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_BODY" and invId == 3 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_SHOULDER" and invId == 2 then
        return true;
    end

    if (itemEquipLoc == "INVTYPE_CHEST" or itemEquipLoc == "INVTYPE_ROBE") and invId == 4 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_WAIST" and invId == 5 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_LEGS" and invId == 6 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_FEET" and invId == 7 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_WRIST" and invId == 8 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_HAND" and invId == 9 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_CLOAK" and invId == 10 then
        return true;
    end

    if (itemEquipLoc == "INVTYPE_WEAPON" or itemEquipLoc == "INVTYPE_2HWEAPON" or itemEquipLoc == "INVTYPE_WEAPONMAINHAND") and invId == 11 then
        return true;
    end

    if (itemEquipLoc == "INVTYPE_WEAPON" or itemEquipLoc == "INVTYPE_2HWEAPON" or itemEquipLoc == "INVTYPE_WEAPONMAINHAND" or itemEquipLoc == "INVTYPE_HOLDABLE" or itemEquipLoc == "INVTYPE_WEAPONOFFHAND" or itemEquipLoc == "INVTYPE_SHIELD" ) and invId == 12 then
        return true;
    end

    if (itemEquipLoc == "INVTYPE_RANGED" or itemEquipLoc == "INVTYPE_THROWN" or itemEquipLoc == "INVTYPE_RANGEDRIGHT") and invId == 13 then
        return true;
    end

    if itemEquipLoc == "INVTYPE_TABARD" and invId == 14 then
        return true;
    end

    return false;
end


function Ghost_TransMog_CheckNotRepeat(entry, page,count)
    for j=1,count do
        if Ghost.TransMog.PageButtons[page].Button[j].Entry == entry then
            return false;
        end
    end

    return true;
end

function GhostPanel_TransMog_ShowUI()
    for i=1,GHOST_MAX_TRANSMOG_PAGES do
		for j=1,GHOST_MAX_TRANSMOG_BUNTTON do
			Ghost.TransMog.PageButtons[i].Button[j].Entry = 0;
		end
    end   
    for i=1,GHOST_MAX_TRANSMOG_PAGES do
        local count = 1;
        for bag = 0,4 do
            for slot = 1,GetContainerNumSlots(bag) do
              local item = GetContainerItemLink(bag,slot);
              local entry = GetContainerItemID(bag,slot);

              if item and count < 38 and entry ~= Ghost.TransMog.NavButtons[i].Entry and Ghost_TransMog_CheckEquipLoc(item,i)  and Ghost_TransMog_CheckNotRepeat(entry,i,count) then
                Ghost.TransMog.PageButtons[i].Button[count].Entry =  entry;
                Ghost.TransMog.PageButtons[i].Button[count].Param1 = i;
                Ghost.TransMog.PageButtons[i].Button[count].Param2 = Ghost.TransMog.NavButtons[i].Entry;
                count = count + 1;                    
              end
            end
        end
    end

    for i=1,GHOST_MAX_TRANSMOG_PAGES do
		for j=1,GHOST_MAX_TRANSMOG_BUNTTON do
			GhostPanel_Button_OnUpdate_TransMog(Ghost.TransMog.PageButtons[i].Button[j]);
		end
    end
end

function Ghost_FetchData_TransMog(data)
	local invId = 1;
	local t = Split(data," ");

    for key,value in pairs(t) do
		if value~="" then
            local itemId,fakeId = strsplit("-",value);

            itemId = tonumber(itemId);
            fakeId = tonumber(fakeId);

            Ghost.TransMog.NavButtons[invId].Icon:SetTexture(GHOST_TRANSMOG_NAV_DATA[invId].ICON);

            if itemId~= 0 then
                Ghost.TransMog.NavButtons[invId].Icon:SetTexture(GhostGetItemIcon(itemId));
            end

            Ghost.TransMog.NavButtons[invId].Entry = tonumber(itemId);    
            
            for i=1,37 do
                Ghost.TransMog.PageButtons[invId].Button[i].Param2 = Ghost.TransMog.NavButtons[invId].Entry;
            end
            
			if fakeId~= 0 then
				Ghost.TransMog.NavButtons[invId].Icon:SetTexture(GhostGetItemIcon(fakeId));
            end
            
			invId = invId + 1;
		end
    end

    GhostPanel_TransMog_ShowUI();
end



