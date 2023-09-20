function GhostPanel_InitUI_Talent()
	for i=1,GHOST_MAX_TALENT_BUNTTON do
        Ghost.Talent.Button[i] =  _G["GhostUI_Page_TalentsButton"..i];
        --Ghost.Talent.Button[i].Entry = 25
        --GhostPanel_Button_OnUpdate_Talent(Ghost.Talent.Button[i])
    end
end

function GhostPanel_Button_OnUpdate_Talent(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["TALENT"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(self.Count);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self.Icon:SetTexture(GhostGetItemIcon(self.Entry));
        if not self.Active then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    end
end

function GhostPanel_Button_OnEnter_Talent(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["TALENT"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
	    if self.Active and self.Price > 0 then
	    	Ghost_ReqTooltipText(GameTooltip,GHOST_STR_BUY_CLICK, GhostGetItemName(self.Entry), self.Price);
        end
	    local p = _G[GameTooltip:GetName().."TextRight1"];
	    if (self.Active) then
	    	p:SetText(GHOST_STR_TALENT_ENABLE);
	    else
	    	p:SetText(GHOST_STR_TALENT_DISABLE);
	    end
        p:Show();
    end
end

function GhostPanel_Button_OnClick_Talent(self,button,down)
    if self.ButtonType == GHOST_BUTTON_TYPE["TALENT"] then
		if self.Entry ~= 0 and self.Active and self.Price > 0 then
            local popframe = Ghost_ReqRewPop_Show("购买|cFF00FF00["..GhostGetItemName(self.Entry).."]|r", nil, self.Price);
            popframe.ButtonType = self.ButtonType;
            popframe.Param1 = self.Param1;
            popframe.Param2 = self.Param2;
		end
    end
end

function Ghost_ReqRewConfirm_Talent(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["TALENT"] then
		Ghost_SendData("GC_C_BUY_TALENT",Param1);
    end
end

function Ghost_FetchData_Talent(data)
	local Id,itemId,itemCount,reqId,enable = strsplit(" ",data);
    Id          = tonumber(Id);
    itemId      = tonumber(itemId);
    itemCount   = tonumber(itemCount);
    reqId       = tonumber(reqId);
    enable      = tonumber(enable);
    

    local button = Ghost.Talent.Button[Id];
	button.Entry    = itemId;	
	button.Price    = reqId;	
    button.Count    = itemCount;
    button.Param1   = Id;

	if enable == 1 then
		button.Active = true;
	else
		button.Active = false;
    end
    
    GhostPanel_Button_OnUpdate_Talent(button);
end