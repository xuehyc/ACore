function GhostPanel_OnLoad(self)
    tinsert(UISpecialFrames, "GhostFrame");
	self:RegisterEvent("CHAT_MSG_ADDON");
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_LEVEL_UP");
	self:RegisterEvent("GET_ITEM_INFO_RECEIVED");
    --LegacyPanel_HookItemTooltip(GameTooltip);
    --LegacyPanel_HookItemTooltip(ItemRefTooltip);
	--LegacyPanel_HookSpellTooltip(GameTooltip);
	GhostHookPlayerTooltip(GameTooltip);
    GhostPanel_InitUI();
end

function GhostPanel_InitUI()

    Ghost.UI.MainFrame = GhostFrame;
	Ghost.UI.UIFrame = GhostUI;
	Ghost.UI.Background = GhostPanelBG;
    Ghost.UI.CharName = GhostPanelCharName;

    for i=1,GHOST_MAX_PAGES do
        Ghost.UI.Pages[i] = _G["GhostUI_Page"..i];
        Ghost.UI.NavButtons[i] = _G["GhostUI_Nav"..i];
    end
	
    local _, cl = UnitClass("player");
	Ghost.UI.Background:SetTexture("Interface\\Addons\\GhostPanel\\Asset\\Image\\BG\\LegacyPanel_BG_GrayScaled_"..cl);
    Ghost.UI.Background:SetVertexColor(GHOST_CLASS_COLOR[cl].r, GHOST_CLASS_COLOR[cl].g, GHOST_CLASS_COLOR[cl].b, 0.3);
	Ghost.UI.CharName:SetText(UnitName("player"));
	
    GhostPanel_InitUI_ReqRew();
    GhostPanel_InitUI_ReqPanel();
    GhostPanel_InitUI_RewPanel();
    GhostPanel_InitUI_Rune();
    GhostPanel_InitUI_BlackMarket();
    GhostPanel_InitUI_TransMog();
    GhostPanel_InitUI_LuckDraw();
    GhostPanel_InitUI_VIP();
    GhostPanel_InitUI_HR();
    GhostPanel_InitUI_Talent();
end

function GhostPanel_OnShow()
    PlaySound("Glyph_MinorCreate");
    Ghost.UI.CharName:Show();
    GhostPanel_HideSpecialUI();

    for i = 1, 9 do
        Ghost.UI.Pages[i]:Hide();
        Ghost.UI.NavButtons[i]:Show();
    end

    if Ghost.UI.SelectedPageId == 10 then
        Ghost.UI.SelectedPageId = 1;
    end

    Ghost.UI.Pages[Ghost.UI.SelectedPageId]:Show();
    Ghost.UI.NavButtons[Ghost.UI.SelectedPageId].Highlight:Show();
    Ghost.UI.NavButtons[Ghost.UI.SelectedPageId].Highlight:SetVertexColor(0, 1, 0, 1);

    GhostPanel_UpdateMainTitle();
    GhostPanel_OnShow_LuckDraw();
    GhostPanel_VIP_UpateUI();
    GhostPanel_HR_UpateUI();
end

function TESTTT()
    for i = 1, 9 do
        Ghost.UI.Pages[i]:Hide();
        Ghost.UI.NavButtons[i]:Hide();
    end
    Ghost.UI.Background:SetTexture("Interface\\Addons\\GhostPanel\\Asset\\Image\\BG\\LegacyPanel_BG_GrayScaled");
    Ghost.UI.CharName:SetText("");
end

function GhostPanel_OnHide()
    PlaySound("Glyph_MinorDestroy");
    Ghost.UI.CharName:Hide();
    Ghost.UI.UIFrame:Hide();
end

function GhostPanel_UpdateMainTitle()
    local text = "";
    
    if Ghost.UI.SelectedPageId == 1 then
        if Ghost.Data.RuneCategory[Ghost.UI.SelectedSubPageId] then
            text = " - 符文 - "..Ghost.Data.RuneCategory[Ghost.UI.SelectedSubPageId]["TITLE"];
        end     
    elseif Ghost.UI.SelectedPageId == 2 then 
        text = " - 黑市";
    elseif Ghost.UI.SelectedPageId == 3 then 
        if Ghost.UI.SelectedSubPageId == 1 then
            text = " - 幻化 - 头部";
        elseif Ghost.UI.SelectedSubPageId == 2 then
            text = " - 幻化 - 肩部";
        elseif Ghost.UI.SelectedSubPageId == 3 then
            text = " - 幻化 - 衬衣";
        elseif Ghost.UI.SelectedSubPageId == 4 then
            text = " - 幻化 - 胸部";
        elseif Ghost.UI.SelectedSubPageId == 5 then
            text = " - 幻化 - 腰部";
        elseif Ghost.UI.SelectedSubPageId == 6 then
            text = " - 幻化 - 腿部";
        elseif Ghost.UI.SelectedSubPageId == 7 then
            text = " - 幻化 - 靴子";
        elseif Ghost.UI.SelectedSubPageId == 8 then
            text = " - 幻化 - 手腕";
        elseif Ghost.UI.SelectedSubPageId == 9 then
            text = " - 幻化 - 手套";
        elseif Ghost.UI.SelectedSubPageId == 10 then
            text = " - 幻化 - 披风";
        elseif Ghost.UI.SelectedSubPageId == 11 then
            text = " - 幻化 - 主手武器";
        elseif Ghost.UI.SelectedSubPageId == 12 then
            text = " - 幻化 - 副手武器";
        elseif Ghost.UI.SelectedSubPageId == 13 then
            text = " - 幻化 - 远程武器";
        elseif Ghost.UI.SelectedSubPageId == 14 then
            text = " - 幻化 - 战袍";
        end
    elseif Ghost.UI.SelectedPageId == 4 then 
        text = " - 抽奖";
    elseif Ghost.UI.SelectedPageId == 5 then 
        text = " - ";
    elseif Ghost.UI.SelectedPageId == 10 then
        if Ghost.UI.SelectedSubPageId == 1 then
            text = " - 升级物品";
        elseif Ghost.UI.SelectedSubPageId == 2 then
            text = " - 强化物品";
        elseif Ghost.UI.SelectedSubPageId == 3 then
            text = " - 移除宝石";
        end
    end

    Ghost.UI.CharName:SetText(UnitName("player")..text);
    
end

function GhostPanel_InitToken(self)
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
    local name = self:GetName();
    self.Id = self:GetID();
	self.Icon = _G[name .. "Icon"];
	self.Border = _G[name .. "Border"];
	self.Highlight = _G[name .. "Highlight"];

	self.Title = _G[name.."Title"];
    self.Desc = _G[name.."Desc"];

	self.TText = _G[name.."TText"];
	self.MText = _G[name.."MText"];
    self.BText = _G[name.."BText"];
    
    self.Entry = 0;
    self.ItemString = nil;
    
	self.Active = false;
	self.Price = 0;

    self.Count = 1;

	self.Title:Hide();
	self.Desc:Hide();
end

function GhostPanel_UpdateToken(button)
    GhostPanel_Button_OnUpdate_ReqPanel(button);
    GhostPanel_Button_OnUpdate_RewPanel(button);
    GhostPanel_Button_OnUpdate_ReqRewPop(button);
    GhostPanel_Button_OnUpdate_Rune(button);
    GhostPanel_Button_OnUpdate_BlackMarket(button);
    GhostPanel_Button_OnUpdate_TransMog(button);
    GhostPanel_Button_OnUpdate_LuckDraw(button);
    GhostPanel_Button_OnUpdate_VIP(button);
    GhostPanel_Button_OnUpdate_HR(button);
    GhostPanel_Button_OnUpdate_Talent(button);

    if button.ButtonType == GHOST_BUTTON_TYPE["ARROW_UP"] then
        button.Icon:SetTexture(GHOST_ICON["ARROW_UP"]);
    elseif button.ButtonType == GHOST_BUTTON_TYPE["ARROW_DOWN"] then
        button.Icon:SetTexture(GHOST_ICON["ARROW_DOWN"]);
        button:Show();
    elseif button.ButtonType == GHOST_BUTTON_TYPE["ARROW_LEFT"] then
        button.Icon:SetTexture(GHOST_ICON["ARROW_LEFT"]);
    elseif button.ButtonType == GHOST_BUTTON_TYPE["ARROW_RIGHT"] then
        button.Icon:SetTexture(GHOST_ICON["ARROW_RIGHT"]);
        button:Show();
    end
end

function GhostPanel_HomeNav_OnLoad(self)
    GhostPanel_InitToken(self);
    if (self.Id > GHOST_MAX_PAGES) then
        self:Hide();
    else
		self.MText:SetText(GHOST_BUTTON_DATA[self.Id].MTEXT);
		self.MText:SetVertexColor(1, 1, 1, 1);
		self.MText:Show();
        self.Icon:SetTexture(GHOST_BUTTON_DATA[self.Id].ICON);
    end
end

function GhostPanel_HomeNav_OnEnter(self)
    self.Highlight:SetVertexColor(0, 1, 0, 1);
    self.Highlight:Show();
    GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 20);
    GameTooltip:AddLine(GHOST_BUTTON_DATA[self.Id].TIP, 1, 1, 1);
    GameTooltip:Show();
end

function GhostPanel_HomeNav_OnLeave(self)
    if (self.Id ~= Ghost.UI.SelectedPageId) then
        self.Highlight:Hide();
    end
    GameTooltip:Hide();
end

function GhostPanel_HomeNav_OnClick(self, button, down)
    GhostPanel_HideSpecialUI();

    if Ghost.UI.SelectedPageId == self.Id then
        return;
    end

	Ghost.UI.Pages[self.Id]:Show();
    Ghost.UI.SelectedPageId = self.Id;
    for i = 1, GHOST_MAX_PAGES do
        if (i ~= Ghost.UI.SelectedPageId) then
            Ghost.UI.Pages[i]:Hide();
			Ghost.UI.NavButtons[i].Highlight:Hide();
        end
    end

    GhostPanel_UpdateMainTitle();
    GhostPanel_HomeNav_OnClick_TransMog(self);
    GhostPanel_HomeNav_OnClick_VIP(self);
    GhostPanel_HomeNav_OnClick_HR(self);
end

function GhostPanel_Button_OnLoad(self, type)
	GhostPanel_InitToken(self);
    self.Title:Hide();
	self.Desc:Hide();
	self.ButtonType = type;
    self:Hide();
    GhostPanel_UpdateToken(self);
end

function GhostPanel_Button_OnEnter(self)

    self.Highlight:SetVertexColor(0, 1, 0, 1);
    self.Highlight:Show();
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT", -30, -30);

    GhostPanel_Button_OnEnter_ReqRew(self);
    GhostPanel_Button_OnEnter_TransMog(self);
    GhostPanel_Button_OnEnter_LuckDraw(self);
    GhostPanel_Button_OnEnter_Rune(self);
    GhostPanel_Button_OnEnter_BlackMarket(self);
    GhostPanel_Button_OnEnter_VIP(self);
    GhostPanel_Button_OnEnter_HR(self);
    GhostPanel_Button_OnEnter_Talent(self);

    GameTooltip:Show();
end

function GhostPanel_Button_OnLeave(self)
    if not self.Selected  then
        self.Highlight:Hide();
    end

    GameTooltip:Hide();
end

function GhostPanel_Button_OnClick(self, button, down)
    GhostPanel_HideSpecialUI(self);
    -- if (button == "RightButton") then
    GhostPanel_Button_OnClick_Rune(self,button,down);
    GhostPanel_Button_OnClick_BlackMarket(self,button,down);
    GhostPanel_Button_OnClick_TransMog(self,button,down);
    GhostPanel_Button_OnClick_LuckDraw(self,button,down);
    GhostPanel_Button_OnClick_VIP(self,button,down);
    GhostPanel_Button_OnClick_HR(self,button,down);
    GhostPanel_Button_OnClick_Talent(self,button,down);
end

function GhostPanel_HideSpecialUI(self)

    if not self or self.ButtonType < GHOST_BUTTON_TYPE["REQ_LEVEL"] or self.ButtonType > GHOST_BUTTON_TYPE["POP_CANCEL"] then
        Ghost_ReqRewPop_Hide();
        Ghost_RewPanel_Hide();
        Ghost_ReqPanel_Hide();
    end
end

function GhostPanel_Button_Update_State( self, value )
    
    if self.Entry < value then
        self.ButtonState = GHOST_BUTTON_STATE["ACTIVE"];
    end

    if self.Entry > value then
        self.ButtonState = GHOST_BUTTON_STATE["DEACTIVE"];
    end

    if self.Entry == value then
        self.ButtonState = GHOST_BUTTON_STATE["JUST_ACTIVE"];
    end

    if self.Entry == value + 1 then
        self.ButtonState = GHOST_BUTTON_STATE["NEXT_ACTIVE"];
    end

    if self.ButtonState == GHOST_BUTTON_STATE["ACTIVE"] then
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
    end

    if self.ButtonState == GHOST_BUTTON_STATE["DEACTIVE"] then
        self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
        self.Icon:SetDesaturated(true);
    end

    if self.ButtonState == GHOST_BUTTON_STATE["JUST_ACTIVE"] then
        --self.Border:SetVertexColor(0, 1, 0, 1);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
    end

    if self.ButtonState == GHOST_BUTTON_STATE["NEXT_ACTIVE"] then
        self.Border:SetVertexColor(1, 1, 1, 1);
        self.Icon:SetDesaturated(false);
    end
end

if Ghost.Data.BGDailyRewId ~= 0 then
		--PVPBattlegroundFrameExtraRewardButton:Show();
	else
		--PVPBattlegroundFrameExtraRewardButton:Hide();
end