function GhostPanel_InitUI_LuckDraw()
	for i=1,GHOST_MAX_LUCKDRAW_BUNTTON do
        Ghost.LuckDraw.Button[i] =  _G["GhostUI_Page4Button"..i];
    end

    for i=1,GHOST_MAX_LUCKDRAW_REW_BUNTTON do
        Ghost.LuckDraw.RewButton[i] =  _G["GhostUI_Page4RewButton"..i];
    end
    
    Ghost.LuckDraw.ActionButton[1] =  _G["GhostUI_Page4ActionButton1"];
    Ghost.LuckDraw.ActionButton[2] =  _G["GhostUI_Page4ActionButton10"];
end

function GhostPanel_OnShow_LuckDraw()
    Ghost_LuckDraw_ActionButtonEnable();
end

function GhostPanel_Button_OnUpdate_LuckDraw(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW"] then
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
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW_REW"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(self.Count);
        self.MText:Show();
        self.Border:SetVertexColor(1, 1, 1, 1);
        self.Icon:SetDesaturated(false);
        self.Icon:SetTexture(GhostGetItemIcon(self.Entry));
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW_ACTION"] then
        if self.Id == 1 then
            self.MText:SetText("抽一次");
            self.MText:Show();
            self.Border:SetVertexColor(1, 1, 1, 1);
            self.Icon:SetDesaturated(false);
            self.Icon:SetTexture(GHOST_ICON["LUCKDRAW"][1]);
        end
        if self.Id == 10 then
            self.MText:SetText("十连抽");
            self.MText:Show();
            self.Border:SetVertexColor(1, 1, 1, 1);
            self.Icon:SetDesaturated(false);
            self.Icon:SetTexture(GHOST_ICON["LUCKDRAW"][2]);
        end
        self:Show();
    end
end

function GhostPanel_Button_OnEnter_LuckDraw(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
	    local p = _G[GameTooltip:GetName().."TextRight1"];
	    p:SetText(GHOST_STR_LUCKDRAW.." X "..self.Count.."|r");
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW_REW"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
	    local p = _G[GameTooltip:GetName().."TextRight1"];
	    p:SetText(GHOST_STR_LUCKDRAW_REW.." X "..self.Count.."|r");
        p:Show();

    elseif self.ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW_ACTION"] then
        if self.Id == 1 then
            GameTooltip:AddLine("抽一次");
            Ghost_ReqTooltipText(GameTooltip,"123", "223", Ghost.Data.LuckDrawReqData[1]);
        elseif self.Id == 10 then
            GameTooltip:AddLine("十连抽");
            Ghost_ReqTooltipText(GameTooltip,"123", "223", Ghost.Data.LuckDrawReqData[2]);
        end
    end
end

function GhostPanel_Button_OnClick_LuckDraw(self,button,down)
    if self.ButtonType ~= GHOST_BUTTON_TYPE["LUCKDRAW_ACTION"] then
         return; 
    end
    if self.Id == 1 then
        local popframe = Ghost_ReqRewPop_Show("|cFF00FF00[抽一次]|r", nil, Ghost.Data.LuckDrawReqData[1]);
        popframe.ButtonType = self.ButtonType;
        popframe.Param1 = 1;

        --popframe.MainFrameToggle = true;
        --GhostPanel_Toggle();

    end
    if self.Id == 10 then
        local popframe = Ghost_ReqRewPop_Show("|cFF00FF00[十连抽]|r", nil, Ghost.Data.LuckDrawReqData[2]);
        popframe.ButtonType = self.ButtonType;
        popframe.Param1 = 10;

        --popframe.MainFrameToggle = true;
        --GhostPanel_Toggle();
	end
end

function Ghost_ReqRewConfirm_LuckDraw(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["LUCKDRAW_ACTION"] then
        Ghost_LuckDraw_ActionButtonDisable();
        Ghost_LuckDraw_Rest();
		Ghost_LuckDraw_Buy(Param1);
    end
end

function Ghost_LuckDraw_ActionButtonEnable()
    Ghost.LuckDraw.ActionButton[1]:Enable();
    Ghost.LuckDraw.ActionButton[2]:Enable();

    Ghost.LuckDraw.ActionButton[1].Border:SetVertexColor(01, 1, 1, 1);
    Ghost.LuckDraw.ActionButton[1].Icon:SetDesaturated(false);
    Ghost.LuckDraw.ActionButton[2].Border:SetVertexColor(1, 1, 1, 1);
    Ghost.LuckDraw.ActionButton[2].Icon:SetDesaturated(false);
end

function Ghost_LuckDraw_ActionButtonDisable()
    Ghost.LuckDraw.ActionButton[1]:Disable();
    Ghost.LuckDraw.ActionButton[2]:Disable();
    Ghost.LuckDraw.ActionButton[1].Border:SetVertexColor(0.5, 0.5, 0.5, 1);
    Ghost.LuckDraw.ActionButton[1].Icon:SetDesaturated(true);
    Ghost.LuckDraw.ActionButton[2].Border:SetVertexColor(0.5, 0.5, 0.5, 1);
    Ghost.LuckDraw.ActionButton[2].Icon:SetDesaturated(true);
end

function Ghost_LuckDraw_Rest()
    for i=1,GHOST_MAX_LUCKDRAW_REW_BUNTTON do
        Ghost.LuckDraw.RewButton[i].Entry = 0;
        GhostPanel_Button_OnUpdate_LuckDraw(Ghost.LuckDraw.RewButton[i]);
    end
end

function Ghost_LuckDraw_Buy(Param1)
    Ghost_SendData("GC_C_BUY_LUCKDRAW",Param1);
end

function Ghost_FetchData_LuckDraw(data)

	for i=1,GHOST_MAX_LUCKDRAW_BUNTTON do
        Ghost.LuckDraw.Button[i].Entry = 0;
    end

    local t = Split(data," ");

    local id = 1;
    for key,value in pairs(t) do
		if value~="" then
            local itemId,itemCount = strsplit("-",value);
            Ghost.LuckDraw.Button[id].Entry = itemId;
            Ghost.LuckDraw.Button[id].Count = itemCount;
            GHOST_MAX_LUCKDRAW_ID = id;
            id = id + 1;
		end
    end

	for i=1,GHOST_MAX_LUCKDRAW_BUNTTON do
		GhostPanel_Button_OnUpdate_LuckDraw(Ghost.LuckDraw.Button[i]);
    end

    for i=1,GHOST_MAX_LUCKDRAW_REW_BUNTTON do
        Ghost.LuckDraw.RewButton[i].Entry = 0;
		GhostPanel_Button_OnUpdate_LuckDraw(Ghost.LuckDraw.RewButton[i]);
    end
end

function Ghost_FetchData_LuckDrawUpdate(data)
	
	for i=1,GHOST_MAX_LUCKDRAW_BUNTTON do
		Ghost.LuckDraw.Button[i].Border:SetVertexColor(0.5, 0.5, 1, 1);
        Ghost.LuckDraw.Button[i].Icon:SetDesaturated(false);
    end

	local id = math.random(GHOST_MAX_LUCKDRAW_ID);
	local button = Ghost.LuckDraw.Button[id];
	button.Border:SetVertexColor(0, 1, 0, 1);
    button.Icon:SetDesaturated(true);   
end

function Ghost_FetchData_LuckDrawRew(data)
    
    local itemId,count, id = strsplit(" ",data);

    itemId = tonumber(itemId);
    count= tonumber(count);
    id = tonumber(id);

    Ghost.LuckDraw.RewButton[id].Entry = itemId;
    Ghost.LuckDraw.RewButton[id].Count = count;
	GhostPanel_Button_OnUpdate_LuckDraw(Ghost.LuckDraw.RewButton[id]);

    for i=1,GHOST_MAX_LUCKDRAW_BUNTTON do
		Ghost.LuckDraw.Button[i].Border:SetVertexColor(0.5, 0.5, 1, 1);
        Ghost.LuckDraw.Button[i].Icon:SetDesaturated(false);
    end

    for i= id + 1,GHOST_MAX_LUCKDRAW_REW_BUNTTON do
        Ghost.LuckDraw.RewButton[i].Entry = 0;
        GhostPanel_Button_OnUpdate_LuckDraw(Ghost.LuckDraw.RewButton[i]);
    end
end

function Ghost_FetchData_LuckDrawStop(data)
    Ghost_LuckDraw_ActionButtonEnable();
end