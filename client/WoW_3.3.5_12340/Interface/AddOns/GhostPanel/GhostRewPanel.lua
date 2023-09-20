function GhostPanel_InitUI_RewPanel()

    Ghost.UI.RewPanel = GhostUI_RewPanel;

    Ghost.Rew.GoldButton                    =   _G["GhostUI_RewPanelGoldButton"];
    Ghost.Rew.TokenButton                   =   _G["GhostUI_RewPanelTokenButton"];
    Ghost.Rew.XPButton                      =   _G["GhostUI_RewPanelXPButton"];
    Ghost.Rew.StatPointButton               =   _G["GhostUI_RewPanelStatPointButton"];
    Ghost.Rew.HonorButton                   =   _G["GhostUI_RewPanelHonorButton"];
    Ghost.Rew.ArenaButton                   =   _G["GhostUI_RewPanelArenaButton"];

    for i=1,10 do
        Ghost.Rew.ItemButtons[i]           = _G["GhostUI_RewPanelItemButton"..i];
        Ghost.Rew.CMDButtons[i]            = _G["GhostUI_RewPanelCMDButton"..i];
        Ghost.Rew.AuraButtons[i]           = _G["GhostUI_RewPanelAuraButton"..i];
        Ghost.Rew.SpellButtons[i]          = _G["GhostUI_RewPanelSpellButton"..i];
    end
end

function Ghost_RewPanel_Show(rewId)
    Ghost_RewPanel_Reset();
    Ghost_RewPanel_Update(rewId);
    Ghost_RewPanel_UpdateUI();
end

function Ghost_RewPanel_Hide()
    Ghost_RewPanel_Reset();
    Ghost.UI.RewPanel:Hide();
end

function Ghost_RewPanel_Update(rewId)
    if Ghost.Data.Rew[rewId] then

        Ghost.Rew.GoldButton.Entry                  = Ghost.Data.Rew[rewId]["gold"];
        Ghost.Rew.TokenButton.Entry                 = Ghost.Data.Rew[rewId]["token"];
        Ghost.Rew.XPButton.Entry                    = Ghost.Data.Rew[rewId]["xp"];
        Ghost.Rew.HonorButton.Entry                 = Ghost.Data.Rew[rewId]["honor"];
        Ghost.Rew.ArenaButton.Entry                 = Ghost.Data.Rew[rewId]["arena"];
        Ghost.Rew.StatPointButton.Entry             = Ghost.Data.Rew[rewId]["statpoint"];
        
        for i=1,10 do
            Ghost.Rew.ItemButtons[i].Entry  = Ghost.Data.Rew[rewId]["item"..i];
            Ghost.Rew.ItemButtons[i].Count  = Ghost.Data.Rew[rewId]["itemCount"..i];
            Ghost.Rew.SpellButtons[i].Entry = Ghost.Data.Rew[rewId]["spell"..i];
            Ghost.Rew.AuraButtons[i].Entry  = Ghost.Data.Rew[rewId]["aura"..i];
            Ghost.Rew.CMDButtons[i].Entry   = Ghost.Data.Rew[rewId]["cmdIcon"..i];
            Ghost.Rew.CMDButtons[i].Count   = Ghost.Data.Rew[rewId]["cmdDes"..i];
        end
    end
end

function Ghost_RewPanel_Reset()
    Ghost.Rew.GoldButton.Entry                  = 0;
    Ghost.Rew.TokenButton.Entry                 = 0;
    Ghost.Rew.XPButton.Entry                    = 0;
    Ghost.Rew.HonorButton.Entry                 = 0;
    Ghost.Rew.ArenaButton.Entry                 = 0;
    Ghost.Rew.StatPointButton.Entry             = 0;
    
    for i=1,10 do
        Ghost.Rew.ItemButtons[i].Entry  = 0;
        Ghost.Rew.ItemButtons[i].Count  = 0;
        Ghost.Rew.SpellButtons[i].Entry = 0;
        Ghost.Rew.AuraButtons[i].Entry  = 0;
        Ghost.Rew.CMDButtons[i].Entry   = "0";
        Ghost.Rew.CMDButtons[i].Count   = "0";
    end
end

function Ghost_RewPanel_UpdateUI()

    GhostPanel_Button_OnUpdate_RewPanelAllButtons();

    local RewButtons = {};
    local RewIndex = 0;
    
    if Ghost.Rew.GoldButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.GoldButton;       
    end
    if Ghost.Rew.TokenButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.TokenButton;     
    end
    if Ghost.Rew.XPButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.XPButton;      
    end
    if Ghost.Rew.HonorButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.HonorButton;       
    end
    if Ghost.Rew.ArenaButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.ArenaButton;        
    end
    if Ghost.Rew.StatPointButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.Rew.StatPointButton;       
    end
    
    for i=1,10 do
        if Ghost.Rew.ItemButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.Rew.ItemButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.Rew.SpellButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.Rew.SpellButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.Rew.AuraButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.Rew.AuraButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.Rew.CMDButtons[i].Entry ~= "0" then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.Rew.CMDButtons[i];
        end
    end


    local x, y = -418, 38;

    if next(RewButtons)~=nil then
        RewButtons[1]:SetPoint("CENTER", "GhostUI_RewPanel", "CENTER", x, y);
        x = x + 89;
        for i=2,RewIndex do
            RewButtons[i]:SetPoint("CENTER", "GhostUI_RewPanel", "CENTER", x, y);
            x = x + 89;
            if i == 13 then
                y = y - 79;
                x = -418 - 44;
            end
            if i == 27 then
                y = y - 79;
                x = -418; 
            end
        end
    end

    Ghost.UI.RewPanel:Show();
end

function GhostPanel_Button_OnUpdate_RewPanel(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["REW_GOLD"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00金币\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["GOLD"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_TOKEN"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00积分\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["TOKEN"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_XP"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00经验\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["XP"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_HONOR"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00荣誉\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["HONOR"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_ARENA"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00竞技点数\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["ARENA"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_STATPOINT"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00斗气点数\n"..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["STATPOINT"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_ITEM"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end      
        self.MText:SetText("|cff00ff00"..self.Count);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetItemIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_AURA"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00获得\n光环");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetSpellIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_SPELL"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00学会\n技能");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetSpellIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_CMD"] then
        if self.Entry == "0" then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00其他|r");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture("Interface\\ICONS\\"..self.Entry);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();

    elseif self.ButtonType == GHOST_BUTTON_TYPE["CONFIRM"] then
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["CANCEL"] then
        self:Show();
    end
end

function GhostPanel_Button_OnUpdate_RewPanelAllButtons()
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.GoldButton);
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.TokenButton);
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.XPButton);
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.StatPointButton);
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.HonorButton);
    GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.ArenaButton);
    for i=1,10 do
        GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.ItemButtons[i]);
        GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.AuraButtons[i]);
        GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.SpellButtons[i]);
        GhostPanel_Button_OnUpdate_RewPanel(Ghost.Rew.CMDButtons[i]);
    end
end

function Ghost_FetchData_Rew(data)

    local  rewId,gold,token,xp,statpoint,honor,arena,
    item1,itemCount1,item2,itemCount2,item3,itemCount3,item4,itemCount4,item5,itemCount5,item6,itemCount6,item7,itemCount7,item8,itemCount8,item9,itemCount9,item10,itemCount10,
    spell1,spell2,spell3,spell4,spell5,spell6,spell7,spell8,spell9,spell10,aura1,aura2,aura3,aura4,aura5,aura6,aura7,aura8,aura9,aura10, 
    cmdDes1,cmdIcon1,cmdDes2,cmdIcon2,cmdDes3,cmdIcon3,cmdDes4,cmdIcon4,cmdDes5,cmdIcon5,cmdDes6,cmdIcon6,cmdDes7,cmdIcon7,cmdDes8,cmdIcon8,cmdDes9,cmdIcon9,cmdDes10,cmdIcon10
    = strsplit("#",data);
    
    Ghost.Data.Rew[tonumber(rewId)] = {
        ["gold"]                = math.floor(gold / 100 / 100),
        ["token"]               = tonumber(token),
        ["xp"]                  = tonumber(xp),
        ["honor"]               = tonumber(honor),
        ["arena"]               = tonumber(arena),
        ["statpoint"]           = tonumber(statpoint),
        ["item1"]               = tonumber(item1),
        ["item2"]               = tonumber(item2),
        ["item3"]               = tonumber(item3),
        ["item4"]               = tonumber(item4),
        ["item5"]               = tonumber(item5),
        ["item6"]               = tonumber(item6),
        ["item7"]               = tonumber(item7),
        ["item8"]               = tonumber(item8),
        ["item9"]               = tonumber(item9),
        ["item10"]              = tonumber(item10),
        ["itemCount1"]          = tonumber(itemCount1),
        ["itemCount2"]          = tonumber(itemCount2),
        ["itemCount3"]          = tonumber(itemCount3),
        ["itemCount4"]          = tonumber(itemCount4),
        ["itemCount5"]          = tonumber(itemCount5),
        ["itemCount6"]          = tonumber(itemCount6),
        ["itemCount7"]          = tonumber(itemCount7),
        ["itemCount8"]          = tonumber(itemCount8),
        ["itemCount9"]          = tonumber(itemCount9),
        ["itemCount10"]         = tonumber(itemCount10),

        ["spell1"]               = tonumber(spell1),
        ["spell2"]               = tonumber(spell2),
        ["spell3"]               = tonumber(spell3),
        ["spell4"]               = tonumber(spell4),
        ["spell5"]               = tonumber(spell5),
        ["spell6"]               = tonumber(spell6),
        ["spell7"]               = tonumber(spell7),
        ["spell8"]               = tonumber(spell8),
        ["spell9"]               = tonumber(spell9),
        ["spell10"]              = tonumber(spell10),

        ["aura1"]               = tonumber(aura1),
        ["aura2"]               = tonumber(aura2),
        ["aura3"]               = tonumber(aura3),
        ["aura4"]               = tonumber(aura4),
        ["aura5"]               = tonumber(aura5),
        ["aura6"]               = tonumber(aura6),
        ["aura7"]               = tonumber(aura7),
        ["aura8"]               = tonumber(aura8),
        ["aura9"]               = tonumber(aura9),
        ["aura10"]              = tonumber(aura10),

        ["cmdDes1"]           = cmdDes1,
        ["cmdDes2"]           = cmdDes2,
        ["cmdDes3"]           = cmdDes3,
        ["cmdDes4"]           = cmdDes4,
        ["cmdDes5"]           = cmdDes5,
        ["cmdDes6"]           = cmdDes6,
        ["cmdDes7"]           = cmdDes7,
        ["cmdDes8"]           = cmdDes8,
        ["cmdDes9"]           = cmdDes9,
        ["cmdDes10"]          = cmdDes10,
        ["cmdIcon1"]          = cmdIcon1,
        ["cmdIcon2"]          = cmdIcon2,
        ["cmdIcon3"]          = cmdIcon3,
        ["cmdIcon4"]          = cmdIcon4,
        ["cmdIcon5"]          = cmdIcon5,
        ["cmdIcon6"]          = cmdIcon6,
        ["cmdIcon7"]          = cmdIcon7,
        ["cmdIcon8"]          = cmdIcon8,
        ["cmdIcon9"]          = cmdIcon9,
        ["cmdIcon10"]         = cmdIcon10,
    }
end

function Ghost_RewPanel_TooltipAddDesc(Desc)
    Ghost.Rew.GoldButton.Des = Desc;
    Ghost.Rew.TokenButton.Desc = Desc;
    Ghost.Rew.XPButton.Desc = Desc;
    Ghost.Rew.StatPointButton.Desc = Desc;
    Ghost.Rew.HonorButton.Desc = Desc;
    Ghost.Rew.ArenaButton.Desc = Desc;
    for i=1,10 do
        Ghost.Rew.ItemButtons[i].Desc = Desc;
        Ghost.Rew.AuraButtons[i].Desc = Desc;
        Ghost.Rew.SpellButtons[i].Desc = Desc;
        Ghost.Rew.CMDButtons[i].Desc = Desc;
    end
end