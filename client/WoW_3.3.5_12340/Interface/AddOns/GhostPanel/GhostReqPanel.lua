function GhostPanel_InitUI_ReqPanel()

    Ghost.UI.ReqPanel = GhostUI_ReqPanel;

    Ghost.UI.ReqFrame = GhostUI_Req;
    Ghost.Req.LevelButton                   =   _G["GhostUI_ReqPanelLevelButton"];
    Ghost.Req.VIPButton                     =   _G["GhostUI_ReqPanelVIPButton"];
    Ghost.Req.HRButton                      =   _G["GhostUI_ReqPanelHRButton"];
    Ghost.Req.FactionButton                 =   _G["GhostUI_ReqPanelFactionButton"];
    Ghost.Req.RankButton                    =   _G["GhostUI_ReqPanelRankButton"];
    Ghost.Req.ReincarnationButton           =   _G["GhostUI_ReqPanelReincarnationButton"];
    Ghost.Req.AchievementPointsButton       =   _G["GhostUI_ReqPanelAchievementPointsButton"];
    Ghost.Req.GoldButton                    =   _G["GhostUI_ReqPanelGoldButton"];
    Ghost.Req.TokenButton                   =   _G["GhostUI_ReqPanelTokenButton"];
    Ghost.Req.XPButton                      =   _G["GhostUI_ReqPanelXPButton"];
    Ghost.Req.HonorButton                   =   _G["GhostUI_ReqPanelHonorButton"];
    Ghost.Req.ArenaButton                   =   _G["GhostUI_ReqPanelArenaButton"];
    Ghost.Req.SpiritPowerButton             =   _G["GhostUI_ReqPanelSpiritPowerButton"];
    Ghost.Req.MapDataButton                 =   _G["GhostUI_ReqPanelMapDataButton"];
    Ghost.Req.QuestDataButton               =   _G["GhostUI_ReqPanelQuestDataButton"];
    Ghost.Req.AchievementDataButton         =   _G["GhostUI_ReqPanelAchievementDataButton"];
    Ghost.Req.SpellDataButton               =   _G["GhostUI_ReqPanelSpellDataButton"];

    for i=1,10 do
        Ghost.Req.ItemButtons[i] = _G["GhostUI_ReqPanelItemButton"..i];
        Ghost.Req.CMDButtons[i] = _G["GhostUI_ReqPanelCMDButton"..i];
    end
end

function Ghost_ReqPanel_Show(reqId)
    Ghost_ReqPanel_SendCheckData(reqId);
    Ghost_ReqPanel_Reset();
    Ghost_ReqPanel_Update(reqId);
    Ghost_ReqPanel_UpdateUI();
end

function Ghost_ReqPanel_Hide()
    Ghost_ReqPanel_Reset();
    Ghost.UI.ReqPanel:Hide();
end

function Ghost_ReqPanel_Update(reqId)
    Ghost.Req.LevelButton.Entry                 = Ghost.Data.Req[reqId]["level"];
    Ghost.Req.VIPButton.Entry                   = Ghost.Data.Req[reqId]["vip"];
    Ghost.Req.HRButton.Entry                    = Ghost.Data.Req[reqId]["hr"];
    Ghost.Req.FactionButton.Entry               = Ghost.Data.Req[reqId]["faction"];
    Ghost.Req.RankButton.Entry                  = Ghost.Data.Req[reqId]["rank"];
    Ghost.Req.ReincarnationButton.Entry         = Ghost.Data.Req[reqId]["reincarnation"];
    Ghost.Req.AchievementPointsButton.Entry     = Ghost.Data.Req[reqId]["achievementPoints"];
    Ghost.Req.GoldButton.Entry                  = Ghost.Data.Req[reqId]["gold"];
    Ghost.Req.TokenButton.Entry                 = Ghost.Data.Req[reqId]["token"];
    Ghost.Req.XPButton.Entry                    = Ghost.Data.Req[reqId]["xp"];
    Ghost.Req.HonorButton.Entry                 = Ghost.Data.Req[reqId]["honor"];
    Ghost.Req.ArenaButton.Entry                 = Ghost.Data.Req[reqId]["arena"];
    Ghost.Req.SpiritPowerButton.Entry           = Ghost.Data.Req[reqId]["spiritPower"];
	
    Ghost.Req.MapDataButton.Desc                = Ghost.Data.Req[reqId]["mapDesc"];
    Ghost.Req.QuestDataButton.Desc              = Ghost.Data.Req[reqId]["questDesc"];
    Ghost.Req.AchievementDataButton.Desc        = Ghost.Data.Req[reqId]["achieveDesc"];
    Ghost.Req.SpellDataButton.Desc              = Ghost.Data.Req[reqId]["spellDesc"];

    for i=1,10 do
        Ghost.Req.ItemButtons[i].Entry = Ghost.Data.Req[reqId]["item"..i];
        Ghost.Req.ItemButtons[i].Count = Ghost.Data.Req[reqId]["itemCount"..i];
        Ghost.Req.CMDButtons[i].Entry = Ghost.Data.Req[reqId]["cmdIcon"..i];
        Ghost.Req.CMDButtons[i].Count = Ghost.Data.Req[reqId]["cmdDes"..i];
    end
end

function Ghost_ReqPanel_Reset()
    Ghost.Req.LevelButton.Entry                   = 0;
    Ghost.Req.VIPButton.Entry                     = 0;
    Ghost.Req.HRButton.Entry                      = 0;
    Ghost.Req.FactionButton.Entry                 = 0;
    Ghost.Req.RankButton.Entry                    = 0;
    Ghost.Req.ReincarnationButton.Entry           = 0;
    Ghost.Req.AchievementPointsButton.Entry       = 0;
    Ghost.Req.GoldButton.Entry                    = 0;
    Ghost.Req.TokenButton.Entry                   = 0;
    Ghost.Req.XPButton.Entry                      = 0;
    Ghost.Req.HonorButton.Entry                   = 0;
    Ghost.Req.ArenaButton.Entry                   = 0;
    Ghost.Req.SpiritPowerButton.Entry             = 0;
    Ghost.Req.MapDataButton.Desc                  = "";
    Ghost.Req.QuestDataButton.Desc                = "";
    Ghost.Req.AchievementDataButton.Desc          = "";
    Ghost.Req.SpellDataButton.Desc                = "";
     for i=1,10 do
        Ghost.Req.ItemButtons[i].Entry = 0;
        Ghost.Req.CMDButtons[i].Entry = "0";
    end
end

function Ghost_ReqPanel_UpdateUI()
    GhostPanel_Button_OnUpdate_ReqPanelAllButtons();
    local MeetButtons = {};
    local ReqIndex = 0;
    if Ghost.Req.LevelButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.LevelButton;
    end
    if Ghost.Req.VIPButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.VIPButton;
    end
    if Ghost.Req.HRButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.HRButton;  
    end
    if Ghost.Req.FactionButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.FactionButton;   
    end
    if Ghost.Req.RankButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.RankButton;
    end
    if Ghost.Req.ReincarnationButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.ReincarnationButton;
    end
    if Ghost.Req.AchievementPointsButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.AchievementPointsButton;
    end
    if Ghost.Req.GoldButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.GoldButton;       
    end
    if Ghost.Req.TokenButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.TokenButton;     
    end
    if Ghost.Req.XPButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.XPButton;      
    end
    if Ghost.Req.HonorButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.HonorButton;       
    end
    if Ghost.Req.ArenaButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.ArenaButton;        
    end
    if Ghost.Req.SpiritPowerButton.Entry ~= 0 then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.SpiritPowerButton;       
    end
    if Ghost.Req.MapDataButton.Desc ~= "" then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.MapDataButton;        
    end
    if Ghost.Req.QuestDataButton.Desc ~= "" then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.QuestDataButton;      
    end
    if Ghost.Req.AchievementDataButton.Desc ~= "" then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.AchievementDataButton;      
    end
    if Ghost.Req.SpellDataButton.Desc ~= "" then
        ReqIndex = ReqIndex + 1;
        MeetButtons[ReqIndex] = Ghost.Req.SpellDataButton;
    end

    for i=1,10 do
        if Ghost.Req.ItemButtons[i].Entry ~= 0 then
            ReqIndex = ReqIndex + 1;
            MeetButtons[ReqIndex] = Ghost.Req.ItemButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.Req.CMDButtons[i].Entry ~= "0" then
            ReqIndex = ReqIndex + 1;
            MeetButtons[ReqIndex] = Ghost.Req.CMDButtons[i];
        end
    end

    local x, y = -418, 38;

    if next(MeetButtons)~=nil then
        MeetButtons[1]:SetPoint("CENTER", "GhostUI_ReqPanel", "CENTER", x, y);
        x = x + 89;
        for i=2,ReqIndex do
            MeetButtons[i]:SetPoint("CENTER", "GhostUI_ReqPanel", "CENTER", x, y);
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
 
    Ghost.UI.ReqPanel:Show();
end

function GhostPanel_Button_OnUpdate_ReqPanel(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["REQ_LEVEL"] then
        self.Icon:SetTexture(GHOST_ICON["LEVEL"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("等级\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.LEVEL) or (self.Entry == 0 and self.Entry ~= Ghost.Char.LEVEL)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_VIP"] then
        self.Icon:SetTexture(GHOST_ICON["VIP"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(Ghost.Data.VIP[math.abs(self.Entry)]["title"]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.VIP) or (self.Entry == 0 and self.Entry ~= Ghost.Char.VIP)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_HR"] then
        self.Icon:SetTexture(GHOST_ICON["HR"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(Ghost.Data.HRTitles[math.abs(self.Entry)]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.HR) or (self.Entry == 0 and self.Entry ~= Ghost.Char.HR)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show(); 
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_FACTION"] then
        self.Icon:SetTexture(GHOST_ICON["FACTION"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(Ghost.Data.FactionTitles[math.abs(self.Entry)]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry ~= Ghost.Char.FACTION)then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_RANK"] then
        self.Icon:SetTexture(GHOST_ICON["RANK"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(Ghost.Data.RankTitles[math.abs(self.Entry)]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.RANK) or (self.Entry == 0 and self.Entry ~= Ghost.Char.RANK)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_REINCARNATION"] then
        self.Icon:SetTexture(GHOST_ICON["REINCARNATION"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(Ghost.Data.ReincarnationTitles[math.abs(self.Entry)]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.REINCARNATION) or (self.Entry == 0 and self.Entry ~= Ghost.Char.REINCARNATION)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ACHIEVEMENTPOINTS"] then
        self.Icon:SetTexture(GHOST_ICON["ACHIEVEMENTPOINTS"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("成就\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.ACHIEVEMENTPOINTS) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_GOLD"] then
        self.Icon:SetTexture(GHOST_ICON["GOLD"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("金币\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.GOLD) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_TOKEN"] then
        self.Icon:SetTexture(GHOST_ICON["TOKEN"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("积分\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.TOKEN) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_XP"] then
        self.Icon:SetTexture(GHOST_ICON["XP"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("经验\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.XP) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_HONOR"] then
        self.Icon:SetTexture(GHOST_ICON["HONOR"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("荣誉\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.HONOR) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ARENA"] then
        self.Icon:SetTexture(GHOST_ICON["ARENA"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("竞技点数\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.ARENA) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_SPIRITPOWER"] then
        self.Icon:SetTexture(GHOST_ICON["SPIRITPOWER"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("灵力\n"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.SPIRITPOWER) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_MAP_DATA"] then
        self.Icon:SetTexture(GHOST_ICON["MAP_DATA"]);
        if self.Desc == "" then
            self:Hide();
            return;
        end
        self.MText:SetText("区域");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if self.Entry ~=1 then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_QUEST_DATA"] then
        self.Icon:SetTexture(GHOST_ICON["QUEST_DATA"]);
        if self.Desc == "" then
            self:Hide();
            return;
        end
        self.MText:SetText("任务");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if self.Entry ~=1 then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ACHIEVEMENT_DATA"] then
        self.Icon:SetTexture(GHOST_ICON["ACHIEVEMENT_DATA"]);
        if self.Desc == "" then
            self:Hide();
            return;
        end
        self.MText:SetText("成就");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if self.Entry ~=1 then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_SPELL_DATA"] then
        self.Icon:SetTexture(GHOST_ICON["SPELL_DATA"]);
        if self.Desc == "" then
            self:Hide();
            return;
        end
        self.MText:SetText("技能或光环");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if self.Entry ~=1 then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ITEM"] then
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
        if GetItemCount(self.Entry) < self.Count then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_CMD"] then
        if self.Entry == "0" then
            self:Hide();
            return;
        end
        self.MText:SetText("其他");
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture("Interface\\ICONS\\"..self.Entry);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    end
end

function GhostPanel_Button_OnUpdate_ReqPanelAllButtons()
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.LevelButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.VIPButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.HRButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.FactionButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.RankButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.ReincarnationButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.AchievementPointsButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.GoldButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.TokenButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.XPButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.HonorButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.ArenaButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.SpiritPowerButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.MapDataButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.QuestDataButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.AchievementDataButton);
    GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.SpellDataButton);

    for i=1,10 do
        GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.ItemButtons[i]);
        GhostPanel_Button_OnUpdate_ReqPanel(Ghost.Req.CMDButtons[i]);
    end
end

function Ghost_FetchData_Req(data)

    local reqId,level,vip,hr,faction,rank,reincarnation,achievementPoints,gold,token,xp,honor,arena,spiritPower,
    item1,itemCount1,item2,itemCount2,item3,itemCount3,item4,itemCount4,item5,itemCount5,item6,itemCount6,item7,itemCount7,item8,itemCount8,item9,itemCount9,item10,itemCount10,
    mapData,spellData,questData,achieveData,
    cmdDes1,cmdIcon1,cmdDes2,cmdIcon2,cmdDes3,cmdIcon3,cmdDes4,cmdIcon4,cmdDes5,cmdIcon5,cmdDes6,cmdIcon6,cmdDes7,cmdIcon7,cmdDes8,cmdIcon8,cmdDes9,cmdIcon9,cmdDes10,cmdIcon10
    = strsplit("#",data);

    Ghost.Data.Req[tonumber(reqId)] = {
        ["level"]               = tonumber(level),
        ["vip"]                 = tonumber(vip),
        ["hr"]                  = tonumber(hr),
        ["faction"]             = tonumber(faction),
        ["rank"]                = tonumber(rank),
        ["reincarnation"]       = tonumber(reincarnation),
        ["achievementPoints"]   = tonumber(achievementPoints),
        ["gold"]                = math.floor(gold / 100 / 100),
        ["token"]               = tonumber(token),
        ["xp"]                  = tonumber(xp),
        ["honor"]               = tonumber(honor),
        ["arena"]               = tonumber(arena),
        ["spiritPower"]         = tonumber(spiritPower),
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
        ["mapDesc"]             = Ghost_Req_GetMapDesc(mapData),
        ["questDesc"]           = Ghost_Req_GetQuestDesc(questData),
		["achieveDesc"]         = Ghost_Req_GetAchieveDesc(achieveData),
        ["spellDesc"]           = Ghost_Req_GetSpellDesc(spellData),
        
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

function Ghost_FetchData_ReqPanelCheck(data)
    local reqId,mapcheck,questcheck,spellcheck,achievecheck = strsplit(" ",data);
    
    reqId           = tonumber(reqId);
    mapcheck        = tonumber(mapcheck);
    questcheck      = tonumber(questcheck);
    achievecheck    = tonumber(achievecheck);
    spellcheck      = tonumber(spellcheck);	

	Ghost.Req.MapDataButton.Entry               = mapcheck;
    Ghost.Req.QuestDataButton.Entry             = questcheck;
    Ghost.Req.AchievementDataButton.Entry       = achievecheck;
    Ghost.Req.SpellDataButton.Entry             = spellcheck;	
    Ghost_ReqPanel_Update(reqId);
    Ghost_ReqPanel_UpdateUI();
end

function Ghost_ReqPanel_SendCheckData(reqId)

    if not Ghost.Data.Req[reqId] then
        return;
    end

	if Ghost.Data.Req[reqId]["mapDesc"] ~="" or Ghost.Data.Req[reqId]["questDesc"] ~="" or Ghost.Data.Req[reqId]["spellDesc"] ~="" or Ghost.Data.Req[reqId]["achieveDesc"] ~="" then
		Ghost_SendData("GC_C_CHECK_REQ_PANEL", reqId);
	end
end

function Ghost_Req_GetMapDesc(mapData)
	
	if mapData == "0" then
		return "";
	end
	
	local t = Split(mapData,",");
	local map = "";
    for key,value in pairs(t) do
		if value~="" then
           map = map.."["..value.."]";
		end
    end
	
	return "处于"..map;
end

function Ghost_Req_GetQuestDesc(questData)
	
	if questData == "0" then
		return "";
	end
	
	local t = Split(questData,",");
	local hasQuest = "";
	local comQuest = "";
	
    for key,value in pairs(t) do
		if value~="" then
            local v1,v2 = strsplit("*",value);
            
			if v1 == "1" then
				hasQuest = hasQuest.."["..v2.."]";
			end
			if v1 == "-1" then
				comQuest = comQuest.."["..v2.."]";
			end
		end
    end
	
	if hasQuest ~="" then
		hasQuest = "授受任务"..hasQuest;
	end
	
	if comQuest ~="" then
		comQuest = "完成任务"..comQuest;
	end
	
	return hasQuest..comQuest;
end

function Ghost_Req_GetSpellDesc(spellData)
	
	if spellData == "0" then
		return "";
	end
	
	local t = Split(spellData,",");
	local hasSpell = "";
	local hasAura = "";
	
    for key,value in pairs(t) do
		if value~="" then
            local v1,v2 = strsplit("*",value);
            
			if v1 == "1" then
				hasSpell = hasSpell.."["..v2.."]";
			end
			if v1 == "-1" then
				hasAura = hasAura.."["..v2.."]";
			end
		end
    end
	
	if hasSpell ~="" then
		hasSpell = "学会技能"..hasSpell;
	end
	
	if hasAura ~="" then
		hasAura = "开启光环"..hasAura;
	end
	
	return hasSpell..hasAura;
end

function Ghost_Req_GetAchieveDesc(achieveData)

	if achieveData == "0" then
		return "";
	end
	
	local t = Split(achieveData,",");
	local achieve = "";
    for key,value in pairs(t) do
		if value~="" then
           achieve = achieve.."["..value.."]";
		end
    end
	
	return "达成成就"..achieve;
end