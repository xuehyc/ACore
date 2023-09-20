function GhostPanel_InitUI_Rune()
	for i=1,GHOST_MAX_RUNE_PAGES do
		Ghost.Rune.NavButtons[i] =  _G["GhostUI_Page1Nav"..i];
		Ghost.Rune.PageFrames[i] =  _G["GhostUI_Page1SubPage"..i];
		for j=1,GHOST_MAX_RUNE_BUNTTON do
			Ghost.Rune.PageButtons[i].Button[j] = _G["GhostUI_Page1SubPage"..i.."Button"..j];	
		end
    end
end

function GhostPanel_RuneNav_OnShow(self)
    GhostPanel_InitToken(self);
    if (self.Id > #Ghost.Data.RuneCategory) then
        self:Hide();
    else
		self.MText:SetText(Ghost.Data.RuneCategory[self.Id]["TITLE"]);
		self.MText:SetVertexColor(1, 1, 0, 1);
		self.MText:Show();
		self.Icon:SetTexture(Ghost.Data.RuneCategory[self.Id]["ICON"]);
    end

    if self.Id == Ghost.UI.SelectedSubPageId then
        self.Highlight:Show();
        self.Highlight:SetVertexColor(0, 1, 0, 1);
    end
end

function GhostPanel_RuneNav_OnEnter(self)
    self.Highlight:SetVertexColor(0, 1, 0, 1);
    self.Highlight:Show();
    GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 20);
    GameTooltip:AddLine(Ghost.Data.RuneCategory[self.Id]["TIP"], 1, 1, 1);
    GameTooltip:Show();
end

function GhostPanel_RuneNav_OnLeave(self)
    if (self.Id ~= Ghost.Rune.SelectedPageId) then
        self.Highlight:Hide();
    end
    GameTooltip:Hide();
end

function GhostPanel_RuneNav_OnClick(self, button, down)
    
    GhostPanel_HideSpecialUI();

	Ghost.Rune.PageFrames[self.Id]:Show();
    Ghost.Rune.SelectedPageId = self.Id;
    Ghost.UI.SelectedSubPageId = self.Id;
    GhostPanel_UpdateMainTitle();
    for i = 1, GHOST_MAX_RUNE_PAGES do
        if (i ~= Ghost.Rune.SelectedPageId) then
            Ghost.Rune.PageFrames[i]:Hide();
			Ghost.Rune.NavButtons[i].Highlight:Hide();
        end
    end
end

function GhostPanel_Button_OnUpdate_Rune(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["RUNE"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        local name, _, icon = GetSpellInfo(self.Entry)
        self.Icon:SetTexture(icon);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if not self.Active then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    end
end

function GhostPanel_Button_OnEnter_Rune(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["RUNE"] then
        GameTooltip:SetHyperlink("spell:"..self.Entry);
	    if not self.Active then
	    	if self.Price > 0 then
	    		Ghost_ReqTooltipText(GameTooltip, GHOST_STR_BUY_CLICK, "["..GetSpellInfo(self.Entry).."]", self.Price);
	    	else
	    		GameTooltip:AddDoubleLine(GHOST_STR_FETCH, GHOST_STR_GAME_CONTENT);
            end    
	    end	
	    local p = _G[GameTooltip:GetName().."TextRight1"];
	    if (self.Active) then
	    	p:SetText(GHOST_STR_RUNE_POSSESSED);
	    else
	    	p:SetText(GHOST_STR_RUNE_NOT_POSSESSED);
	    end
        p:Show();
    end
end

function GhostPanel_Button_OnClick_Rune(self,button,down)
    if self.ButtonType == GHOST_BUTTON_TYPE["RUNE"] then
		if self.Entry ~= 0 and not self.Active and self.Price > 0 then
            local popframe = Ghost_ReqRewPop_Show("购买|cFF00FF00["..GetSpellInfo(self.Entry).."]|r", nil, self.Price);
            popframe.ButtonType = self.ButtonType;
            popframe.Param1 = self.Param1;
            popframe.Param2 = self.Param2;

            --popframe.MainFrameToggle = true;
            --GhostPanel_Toggle();
		end
    end
end

function Ghost_ReqRewConfirm_Rune(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["RUNE"] then
		Ghost_SendData("GC_C_BUY_RUNE",Param1.." "..Param2);
    end
end

function Ghost_FetchData_Rune(data)

    local page,id,spellid,reqId,active = strsplit(" ",data);
    page      = tonumber(page);
    id        = tonumber(id);
    spellid   = tonumber(spellid);
    reqId     = tonumber(reqId);
    active    = tonumber(active);

    local button = Ghost.Rune.PageButtons[page].Button[id];
	button.Entry = spellid;
	button.Price = reqId;	
	button.Param1 = page;
	button.Param2 = id;
	
    if active == 1 then
        button.Active = true;
		
	else
        button.Active = false;
	end

    GhostPanel_Button_OnUpdate_Rune(button);
end

function Ghost_FetchData_RuneCategory(data)
    local page,title,tip,icon = strsplit(" ",data);
	Ghost.Data.RuneCategory[tonumber(page)] = {
		["TITLE"]               = title,
        ["TIP"]                 = "|cff00ff00"..tip.."|r",
        ["ICON"]                = icon,
	}
end

function Ghost_FetchData_RuneUpdate(data)

    local page,id,spellid,reqId = strsplit(" ",data);
    page      = tonumber(page);
    id        = tonumber(id);
    spellid   = tonumber(spellid);
    reqId     = tonumber(reqId);

    local button = Ghost.Rune.PageButtons[page].Button[id];
	button.Entry = spellid;
	button.Price = reqId;	
	button.Param1 = page;
    button.Param2 = id;
    button.Active = true;

    GhostPanel_Button_OnUpdate_Rune(button);
end