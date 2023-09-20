function GhostPanel_InitUI_ReqRew()

    Ghost.UI.ReqRewPopFrame = GhostUI_ReqRewPop;

    Ghost.ReqRewPop.ReqTitleFontString                     =   _G["GhostUI_ReqRewPopReqTitleFontString"];
    Ghost.ReqRewPop.ReqMeetFontString                      =   _G["GhostUI_ReqRewPopReqMeetFontString"];
    Ghost.ReqRewPop.ReqDestroyFontString                   =   _G["GhostUI_ReqRewPopReqDestroyFontString"];
    Ghost.ReqRewPop.ReqOtherFontString                      =   _G["GhostUI_ReqRewPopReqOtherFontString"];

    Ghost.ReqRewPop.RewTitleFontString                     =   _G["GhostUI_ReqRewPopRewTitleFontString"];

    Ghost.ReqRewPop.ConfirmButton                    =   _G["GhostUI_ReqRewPopConfirmButton"];
    Ghost.ReqRewPop.CancelButton                     =   _G["GhostUI_ReqRewPopCancelButton"];

    Ghost.ReqRewPop.ReqLevelButton                   =   _G["GhostUI_ReqRewPopReqLevelButton"];
    Ghost.ReqRewPop.ReqVIPButton                     =   _G["GhostUI_ReqRewPopReqVIPButton"];
    Ghost.ReqRewPop.ReqHRButton                      =   _G["GhostUI_ReqRewPopReqHRButton"];
    Ghost.ReqRewPop.ReqFactionButton                 =   _G["GhostUI_ReqRewPopReqFactionButton"];
    Ghost.ReqRewPop.ReqRankButton                    =   _G["GhostUI_ReqRewPopReqRankButton"];
    Ghost.ReqRewPop.ReqReincarnationButton           =   _G["GhostUI_ReqRewPopReqReincarnationButton"];
    Ghost.ReqRewPop.ReqAchievementPointsButton       =   _G["GhostUI_ReqRewPopReqAchievementPointsButton"];
    Ghost.ReqRewPop.ReqGoldButton                    =   _G["GhostUI_ReqRewPopReqGoldButton"];
    Ghost.ReqRewPop.ReqTokenButton                   =   _G["GhostUI_ReqRewPopReqTokenButton"];
    Ghost.ReqRewPop.ReqXPButton                      =   _G["GhostUI_ReqRewPopReqXPButton"];
    Ghost.ReqRewPop.ReqHonorButton                   =   _G["GhostUI_ReqRewPopReqHonorButton"];
    Ghost.ReqRewPop.ReqArenaButton                   =   _G["GhostUI_ReqRewPopReqArenaButton"];
    Ghost.ReqRewPop.ReqSpiritPowerButton             =   _G["GhostUI_ReqRewPopReqSpiritPowerButton"];
    Ghost.ReqRewPop.ReqMapDataButton                 =   _G["GhostUI_ReqRewPopReqMapDataButton"];
    Ghost.ReqRewPop.ReqQuestDataButton               =   _G["GhostUI_ReqRewPopReqQuestDataButton"];
    Ghost.ReqRewPop.ReqAchievementDataButton         =   _G["GhostUI_ReqRewPopReqAchievementDataButton"];
    Ghost.ReqRewPop.ReqSpellDataButton               =   _G["GhostUI_ReqRewPopReqSpellDataButton"];
    

    for i=1,10 do
        Ghost.ReqRewPop.ReqItemButtons[i]   = _G["GhostUI_ReqRewPopReqItemButton"..i];
        Ghost.ReqRewPop.ReqCMDButtons[i]     = _G["GhostUI_ReqRewPopReqCMDButton"..i];
    end
    
    Ghost.ReqRewPop.RewGoldButton                    =   _G["GhostUI_ReqRewPopRewGoldButton"];
    Ghost.ReqRewPop.RewTokenButton                   =   _G["GhostUI_ReqRewPopRewTokenButton"];
    Ghost.ReqRewPop.RewXPButton                      =   _G["GhostUI_ReqRewPopRewXPButton"];
    Ghost.ReqRewPop.RewStatPointButton               =   _G["GhostUI_ReqRewPopRewStatPointButton"];
    Ghost.ReqRewPop.RewHonorButton                   =   _G["GhostUI_ReqRewPopRewHonorButton"];
    Ghost.ReqRewPop.RewArenaButton                   =   _G["GhostUI_ReqRewPopRewArenaButton"];

    for i=1,10 do
        Ghost.ReqRewPop.RewItemButtons[i]           = _G["GhostUI_ReqRewPopRewItemButton"..i];
        Ghost.ReqRewPop.RewCMDButtons[i]            = _G["GhostUI_ReqRewPopRewCMDButton"..i];
        Ghost.ReqRewPop.RewAuraButtons[i]           = _G["GhostUI_ReqRewPopRewAuraButton"..i];
        Ghost.ReqRewPop.RewSpellButtons[i]          = _G["GhostUI_ReqRewPopRewSpellButton"..i];
    end
end

function GhostPanel_Button_OnEnter_ReqRew(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["REQ_VIP"] or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_VIP"] then
        local meet = false;
        if self.Entry > 0 then
            GameTooltip:AddLine("需达到|cff00ff00"..Ghost.Data.VIP[math.abs(self.Entry)]["title"].."|r - ".."当前|cff00ff00"..Ghost.Data.VIP[Ghost.Char.VIP]["title"].."|r");
            if  Ghost.Char.VIP >= self.Entry then
                meet = true;
            end
        else
            GameTooltip:AddLine("必须是|cff00ff00"..Ghost.Data.VIP[math.abs(self.Entry)]["title"].."|r - ".."当前|cff00ff00"..Ghost.Data.VIP[Ghost.Char.VIP]["title"].."|r");
            if  Ghost.Char.VIP == math.abs(self.Entry) then
                meet = true;           
            end
        end      
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_HR"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_HR"] then
        local meet = false;
        if self.Entry > 0 then
            GameTooltip:AddLine("需达到|cff00ff00"..Ghost.Data.HRTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.HRTitles[Ghost.Char.HR].."|r");
            if  Ghost.Char.HR >= self.Entry then
                meet = true;
            end
        else
            GameTooltip:AddLine("必须是|cff00ff00"..Ghost.Data.HRTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.HRTitles[Ghost.Char.HR].."|r");
            if  Ghost.Char.HR == math.abs(self.Entry) then
                meet = true;           
            end
        end      
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_REINCARNATION"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_REINCARNATION"] then
        local meet = false;
        if self.Entry > 0 then
            GameTooltip:AddLine("需达到|cff00ff00"..Ghost.Data.ReincarnationTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.ReincarnationTitles[Ghost.Char.REINCARNATION].."|r");
            if  Ghost.Char.REINCARNATION >= self.Entry then
                meet = true;
            end
        else
            GameTooltip:AddLine("必须是|cff00ff00"..Ghost.Data.ReincarnationTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.ReincarnationTitles[Ghost.Char.REINCARNATION].."|r");
            if  Ghost.Char.REINCARNATION == math.abs(self.Entry) then
                meet = true;           
            end
        end      
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_RANK"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_RANK"] then
        local meet = false;
        if self.Entry > 0 then
            GameTooltip:AddLine("需达到|cff00ff00"..Ghost.Data.RankTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.RankTitles[Ghost.Char.RANK].."|r");
            if  Ghost.Char.RANK >= self.Entry then
                meet = true;
            end
        else
            GameTooltip:AddLine("必须是|cff00ff00"..Ghost.Data.RankTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.RankTitles[Ghost.Char.RANK].."|r");
            if  Ghost.Char.RANK == math.abs(self.Entry) then
                meet = true;           
            end
        end      
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_FACTION"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_FACTION"] then
        local meet = false;
        GameTooltip:AddLine("必须是|cff00ff00"..Ghost.Data.FactionTitles[math.abs(self.Entry)].."|r - ".."当前|cff00ff00"..Ghost.Data.FactionTitles[Ghost.Char.FACTION].."|r");
        if  Ghost.Char.FACTION == math.abs(self.Entry) then
            meet = true;           
        end   
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_LEVEL"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_LEVEL"] then
        local meet = false;
        if self.Entry > 0 then
            GameTooltip:AddLine("需达到|cff00ff00"..math.abs(self.Entry).."|r级 - ".."当前|cff00ff00"..Ghost.Char.LEVEL.."|r级");
            if  Ghost.Char.LEVEL >= self.Entry then
                meet = true;
            end
        else
            GameTooltip:AddLine("必须是|cff00ff00"..math.abs(self.Entry).."|r级 - ".."当前|cff00ff00"..Ghost.Char.LEVEL.."|r级");
            if  Ghost.Char.LEVEL == math.abs(self.Entry) then
                meet = true;           
            end
        end      
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ACHIEVEMENTPOINTS"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ACHIEVEMENTPOINTS"] then
        local meet = false;
        GameTooltip:AddLine("成就点数需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前成就点数|cff00ff00"..Ghost.Char.ACHIEVEMENTPOINTS.."|r");
        if  Ghost.Char.ACHIEVEMENTPOINTS >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_GOLD"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_GOLD"] then
        local meet = false;
        GameTooltip:AddLine("金币数量需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前金币数量|cff00ff00"..Ghost.Char.GOLD.."|r");
        if  Ghost.Char.GOLD >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_TOKEN"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_TOKEN"] then
        local meet = false;
        GameTooltip:AddLine("积分需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前积分|cff00ff00"..Ghost.Char.TOKEN.."|r");
        if  Ghost.Char.TOKEN >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_XP"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_XP"] then
        local meet = false;
        GameTooltip:AddLine("经验值需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前经验值|cff00ff00"..Ghost.Char.XP.."|r");
        if  Ghost.Char.XP >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_HONOR"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_HONOR"] then
        local meet = false;
        GameTooltip:AddLine("荣誉点数需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前荣誉点数|cff00ff00"..Ghost.Char.HONOR.."|r");
        if  Ghost.Char.HONOR >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ARENA"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ARENA"] then
        local meet = false;
        GameTooltip:AddLine("竞技点数需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前竞技点数|cff00ff00"..Ghost.Char.ARENA.."|r");
        if  Ghost.Char.ARENA >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_SPIRITPOWER"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_SPIRITPOWER"] then
        local meet = false;
        GameTooltip:AddLine("灵力值需达到|cff00ff00"..math.abs(self.Entry).."|r - ".."当前灵力值|cff00ff00"..Ghost.Char.SPIRITPOWER.."|r");
        if  Ghost.Char.SPIRITPOWER >= self.Entry then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_MAP_DATA"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_MAP_DATA"] then
        local meet = false;
        
        if  self.Entry == 1 then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_QUEST_DATA"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_QUEST_DATA"] then
        local meet = false;
        
        if  self.Entry == 1 then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ACHIEVEMENT_DATA"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ACHIEVEMENT_DATA"] then
        local meet = false;
        
        if  self.Entry == 1 then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_SPELL_DATA"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_SPELL_DATA"] then
        local meet = false;
        
        if  self.Entry == 1 then
            meet = true;
        end 
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REQ_ITEM"]  or self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ITEM"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
        local meet = false;
        local count = GetItemCount(self.Entry);
        
        if  count >= self.Count then
            meet = true;
        end
        if  meet then
            GameTooltip:AddLine(GHOST_STR_REQ_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_MEET_ICON);
        else
            GameTooltip:AddLine(GHOST_STR_REQ_NOT_MEET);
            GameTooltip:AddTexture(GHOST_STR_REQ_NOT_MEET_ICON);           
        end
        
        p:SetText("需求数量|cff00ff00".. self.Count.."|r".." - 当前数量|cff00ff00"..count.."|r");
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_CMD"] or self.ButtonType == GHOST_BUTTON_TYPE["REQ_CMD"]  then
        GameTooltip:AddLine(self.Count);
    --Rew
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_ITEM"] then
        GameTooltip:SetHyperlink("item:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00获得『物品』 X "..self.Count);
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_SPELL"] then
        GameTooltip:SetHyperlink("spell:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00学会『技能』");
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_AURA"] then
        GameTooltip:SetHyperlink("spell:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00获得『光环』");
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_GOLD"]  then
        GameTooltip:AddLine("|cff00ff00获得『金币』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_TOKEN"]  then
        GameTooltip:AddLine("|cff00ff00获得『积分』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_XP"]  then
        GameTooltip:AddLine("|cff00ff00获得『经验』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_STATPOINT"]  then
        GameTooltip:AddLine("|cff00ff00获得『斗气点数』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_HONOR"]  then
        GameTooltip:AddLine("|cff00ff00获得『荣誉点数』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_ARENA"]  then
        GameTooltip:AddLine("|cff00ff00获得『竞技点数』 X "..self.Entry);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_CMD"]  then
        GameTooltip:AddLine(self.Count);
    
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_ITEM"] then  
        GameTooltip:SetHyperlink("item:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00获得『物品』 X "..self.Count..self.Desc);
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_SPELL"]  then
        GameTooltip:SetHyperlink("spell:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00学会『技能』"..self.Desc);
        p:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_AURA"]  then
        GameTooltip:SetHyperlink("spell:"..self.Entry);
        local p = _G[GameTooltip:GetName().."TextRight1"]; 
	    p:SetText("|cff00ff00获得『光环』|r"..self.Desc);
        p:Show();
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_GOLD"]  then   
        GameTooltip:AddLine("|cff00ff00获得『金币』 X "..self.Entry..self.Desc);
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_TOKEN"]  then        
        GameTooltip:AddLine("|cff00ff00获得『积分』 X "..self.Entry..self.Desc);
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_XP"]  then        
        GameTooltip:AddLine("|cff00ff00获得『经验』 X "..self.Entry..self.Desc);
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_STATPOINT"]  then        
        GameTooltip:AddLine("|cff00ff00获得『斗气点数』 X "..self.Entry..self.Desc);
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_HONOR"]  then       
        GameTooltip:AddLine("|cff00ff00获得『荣誉点数』 X "..self.Entry..self.Desc);
    elseif  self.ButtonType == GHOST_BUTTON_TYPE["REW_ARENA"]  then        
        GameTooltip:AddLine("|cff00ff00获得『竞技点数』 X "..self.Entry..self.Desc);
    elseif self.ButtonType == GHOST_BUTTON_TYPE["REW_CMD"]  then       
        GameTooltip:AddLine("|cff00ff00同时使"..self.Count..self.Desc);
    end
end

function GhostPanel_Button_OnUpdate_ReqRewPop(self)
    -- Req
    if self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_LEVEL"] then
        self.Icon:SetTexture(GHOST_ICON["LEVEL"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("等级"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > 0 and self.Entry > Ghost.Char.LEVEL) or (self.Entry == 0 and self.Entry ~= Ghost.Char.LEVEL)  then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_VIP"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_HR"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_FACTION"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_RANK"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_REINCARNATION"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ACHIEVEMENTPOINTS"] then
        self.Icon:SetTexture(GHOST_ICON["ACHIEVEMENTPOINTS"]);
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("成就点数"..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.ACHIEVEMENTPOINTS) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_GOLD"] then   
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("金币 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["GOLD"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.GOLD) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_TOKEN"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("积分 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["TOKEN"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.TOKEN) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_XP"] then   
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("经验 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["XP"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.XP) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_HONOR"] then    
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("荣誉点数 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["HONOR"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.HONOR) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ARENA"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("竞技点数 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["ARENA"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.ARENA) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_SPIRITPOWER"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("灵力 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["SPIRITPOWER"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        if (self.Entry > Ghost.Char.SPIRITPOWER) then
            self.Border:SetVertexColor(0.5, 0.5, 0.5, 1);
            self.Icon:SetDesaturated(true);
        end
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_MAP_DATA"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_QUEST_DATA"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ACHIEVEMENT_DATA"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_SPELL_DATA"] then
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_ITEM"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end      
        self.MText:SetText(GhostGetItemLink(self.Entry).." X "..self.Count);
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
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REQ_CMD"] then
        if self.Entry == "0" then
            self:Hide();
            return;
        end
        self.MText:SetText(self.Count);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture("Interface\\ICONS\\"..self.Entry);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    -- Rew
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_GOLD"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00金币 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["GOLD"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_TOKEN"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00积分 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["TOKEN"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_XP"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00经验 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["XP"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_HONOR"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00荣誉点数 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["HONOR"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_ARENA"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00竞技点数 X "..math.abs(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["ARENA"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_STATPOINT"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText("|cff00ff00斗气点数 X "..self.Entry);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GHOST_ICON["STATPOINT"]);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_ITEM"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end      
        self.MText:SetText(GhostGetItemLink(self.Entry).." X "..self.Count);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetItemIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_AURA"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(GetSpellLink(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetSpellIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_SPELL"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        self.MText:SetText(GetSpellLink(self.Entry));
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture(GhostGetSpellIcon(self.Entry));
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_REW_CMD"] then
        if self.Entry == "0" then
            self:Hide();
            return;
        end
        self.MText:SetText(self.Count);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture("Interface\\ICONS\\"..self.Entry);
        self.Border:SetVertexColor(0.5, 0.5, 1, 1);
        self.Icon:SetDesaturated(false);
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_CONFIRM"] then
        self:Show();
    elseif self.ButtonType == GHOST_BUTTON_TYPE["POP_CANCEL"] then
        self:Show();
    end
end

function GhostPanel_UpdateReqRewPopUI()

    GhostPanel_Button_OnUpdate_ReqRewPopAllButtons();

    local MeetButtons = {};
    local MeetIndex = 0;
    local DestroyButtons = {};
    local DestroyIndex = 0;
    local OtherButtons = {};
    local OtherIndex = 0;
    local RewButtons = {};
    local RewIndex = 0;

    if Ghost.ReqRewPop.ReqLevelButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqLevelButton;
    end
    if Ghost.ReqRewPop.ReqVIPButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqVIPButton;
    end
    if Ghost.ReqRewPop.ReqHRButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqHRButton;  
    end
    if Ghost.ReqRewPop.ReqFactionButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqFactionButton;   
    end
    if Ghost.ReqRewPop.ReqRankButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqRankButton;
    end
    if Ghost.ReqRewPop.ReqReincarnationButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqReincarnationButton;
    end
    if Ghost.ReqRewPop.ReqAchievementPointsButton.Entry ~= 0 then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqAchievementPointsButton;
    end

    if Ghost.ReqRewPop.ReqMapDataButton.Desc ~= "" then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqMapDataButton;        
    end
    if Ghost.ReqRewPop.ReqQuestDataButton.Desc ~= "" then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqQuestDataButton;      
    end
    if Ghost.ReqRewPop.ReqAchievementDataButton.Desc ~= "" then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqAchievementDataButton;      
    end
    if Ghost.ReqRewPop.ReqSpellDataButton.Desc ~= "" then
        MeetIndex = MeetIndex + 1;
        MeetButtons[MeetIndex] = Ghost.ReqRewPop.ReqSpellDataButton;        
    end

    if Ghost.ReqRewPop.ReqGoldButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqGoldButton;       
    end
    if Ghost.ReqRewPop.ReqTokenButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqTokenButton;     
    end
    if Ghost.ReqRewPop.ReqXPButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqXPButton;      
    end
    if Ghost.ReqRewPop.ReqHonorButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqHonorButton;       
    end
    if Ghost.ReqRewPop.ReqArenaButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqArenaButton;        
    end
    if Ghost.ReqRewPop.ReqSpiritPowerButton.Entry ~= 0 then
        DestroyIndex = DestroyIndex + 1;
        DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqSpiritPowerButton;       
    end
    
    for i=1,10 do
        if Ghost.ReqRewPop.ReqItemButtons[i].Entry ~= 0 then
            DestroyIndex = DestroyIndex + 1;
            DestroyButtons[DestroyIndex] = Ghost.ReqRewPop.ReqItemButtons[i];
        end
    end

    for i=1,10 do
        if Ghost.ReqRewPop.ReqCMDButtons[i].Entry ~= "0" then
            OtherIndex = OtherIndex + 1;
            OtherButtons[OtherIndex] = Ghost.ReqRewPop.ReqCMDButtons[i];
        end
    end

    if Ghost.ReqRewPop.RewGoldButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewGoldButton;       
    end
    if Ghost.ReqRewPop.RewTokenButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewTokenButton;     
    end
    if Ghost.ReqRewPop.RewXPButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewXPButton;      
    end
    if Ghost.ReqRewPop.RewHonorButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewHonorButton;       
    end
    if Ghost.ReqRewPop.RewArenaButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewArenaButton;        
    end
    if Ghost.ReqRewPop.RewStatPointButton.Entry ~= 0 then
        RewIndex = RewIndex + 1;
        RewButtons[RewIndex] = Ghost.ReqRewPop.RewStatPointButton;       
    end
    
    for i=1,10 do
        if Ghost.ReqRewPop.RewItemButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.ReqRewPop.RewItemButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.ReqRewPop.RewSpellButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.ReqRewPop.RewSpellButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.ReqRewPop.RewAuraButtons[i].Entry ~= 0 then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.ReqRewPop.RewAuraButtons[i];
        end
    end
    for i=1,10 do
        if Ghost.ReqRewPop.RewCMDButtons[i].Entry ~= "0" then
            RewIndex = RewIndex + 1;
            RewButtons[RewIndex] = Ghost.ReqRewPop.RewCMDButtons[i];
        end
    end

    local y = - 100;
    local count = 0;
    
    if Ghost.ReqRewPop.ReqTitleText then
        Ghost.ReqRewPop.ReqTitleFontString:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 0, y);
        Ghost.ReqRewPop.ReqTitleFontString:Show();
        count = count + 1;
        y = y - 40;
    else
        Ghost.ReqRewPop.ReqTitleFontString:Hide();
    end
    
    if next(MeetButtons)~=nil then
        Ghost.ReqRewPop.ReqMeetFontString:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 0, y);
        Ghost.ReqRewPop.ReqMeetFontString:Show();
        count = count + 1;
        y = y - 50;
        for i=1,MeetIndex do
            MeetButtons[i]:SetPoint("RIGHT", "GhostUI_ReqRewPop", "TOP", -50, y);
            count = count + 1;
            y = y - 50;
        end
    else
        Ghost.ReqRewPop.ReqMeetFontString:Hide();
    end

    if next(DestroyButtons)~=nil then
        Ghost.ReqRewPop.ReqDestroyFontString:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 0, y);
        Ghost.ReqRewPop.ReqDestroyFontString:Show();
        count = count + 1;
        y = y - 50;
        for i=1,DestroyIndex do
            DestroyButtons[i]:SetPoint("RIGHT", "GhostUI_ReqRewPop", "TOP", -50, y);
            count = count + 1;
            y = y - 50;
        end
    else
        Ghost.ReqRewPop.ReqDestroyFontString:Hide();
    end

    if next(OtherButtons)~=nil then
        Ghost.ReqRewPop.ReqOtherFontString:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 0, y);
        Ghost.ReqRewPop.ReqOtherFontString:Show();
        count = count + 1;
        y = y - 50;
        for i=1,OtherIndex do
            OtherButtons[i]:SetPoint("RIGHT", "GhostUI_ReqRewPop", "TOP", -50, y);
            count = count + 1;
            y = y - 50;
        end
    else
        Ghost.ReqRewPop.ReqOtherFontString:Hide();
    end

    if Ghost.ReqRewPop.RewTitleText then
        y = y - 20;
        Ghost.ReqRewPop.RewTitleFontString:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 0, y);
        Ghost.ReqRewPop.RewTitleFontString:Show();
        count = count + 1;
        y = y - 40;
    else
        Ghost.ReqRewPop.RewTitleFontString:Hide();
    end

    if next(RewButtons)~=nil then
        for i=1,RewIndex do
            RewButtons[i]:SetPoint("RIGHT", "GhostUI_ReqRewPop", "TOP", -50, y);
            count = count + 1;
            y = y - 50;
        end
    end

    Ghost.ReqRewPop.ConfirmButton:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", -50, y - 80);
    Ghost.ReqRewPop.CancelButton:SetPoint("CENTER", "GhostUI_ReqRewPop", "TOP", 50, y - 80);

    y = count * 50 + 240;
    x = 0.5 * y;

    if x < 250 then
        x = 250;
    end

    Ghost.UI.ReqRewPopFrame:SetSize(x, y);

    Ghost.UI.ReqRewPopFrame:Show();
end

function GhostPanel_Button_OnUpdate_ReqRewPopAllButtons()
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ConfirmButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.CancelButton);

    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqLevelButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqVIPButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqHRButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqFactionButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqRankButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqReincarnationButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqAchievementPointsButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqGoldButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqTokenButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqXPButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqHonorButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqArenaButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqSpiritPowerButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqMapDataButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqQuestDataButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqAchievementDataButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqSpellDataButton);
    for i=1,10 do
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqItemButtons[i]);
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.ReqCMDButtons[i]);
    end

    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewGoldButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewTokenButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewXPButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewStatPointButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewHonorButton);
    GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewArenaButton);
    for i=1,10 do
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewItemButtons[i]);
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewAuraButtons[i]);
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewSpellButtons[i]);
        GhostPanel_Button_OnUpdate_ReqRewPop(Ghost.ReqRewPop.RewCMDButtons[i]);
    end
end

function Ghost_ReqRewPop_UpdateText(ReqTitleText,RewTitleText)

    Ghost.ReqRewPop.ReqTitleText = ReqTitleText;
    if ReqTitleText then      
        Ghost.ReqRewPop.ReqTitleFontString:SetText(ReqTitleText);
    end

    Ghost.ReqRewPop.RewTitleText = RewTitleText;
    if RewTitleText then      
        Ghost.ReqRewPop.RewTitleFontString:SetText(RewTitleText);
    end

    Ghost.ReqRewPop.ReqMeetFontString:SetText("需满足");
    Ghost.ReqRewPop.ReqDestroyFontString:SetText("将消耗");
    Ghost.ReqRewPop.ReqOtherFontString:SetText("同时使");
end

function Ghost_ReqRewPop_Show(ReqTitleText,RewTitleText,reqId,rewId)
	Ghost_ReqRewPop_SendCheckData(reqId);
    Ghost_ReqRewPop_UpdateText(ReqTitleText,RewTitleText);
    Ghost_ReqRewPop_Reset();
    Ghost_ReqRewPop_UpdateReq(reqId);
    Ghost_ReqRewPop_UpdateRew(rewId);
    GhostPanel_UpdateReqRewPopUI();
    return Ghost.UI.ReqRewPopFrame;
end

function Ghost_ReqRewPop_Hide()
    Ghost_ReqRewPop_Reset();
    Ghost.UI.ReqRewPopFrame:Hide();
end

function Ghost_ReqRewPop_Reset()

    Ghost.ReqRewPop.ReqLevelButton.Entry                   = 0;
    Ghost.ReqRewPop.ReqVIPButton.Entry                     = 0;
    Ghost.ReqRewPop.ReqHRButton.Entry                      = 0;
    Ghost.ReqRewPop.ReqFactionButton.Entry                 = 0;
    Ghost.ReqRewPop.ReqRankButton.Entry                    = 0;
    Ghost.ReqRewPop.ReqReincarnationButton.Entry           = 0;
    Ghost.ReqRewPop.ReqAchievementPointsButton.Entry       = 0;
    Ghost.ReqRewPop.ReqGoldButton.Entry                    = 0;
    Ghost.ReqRewPop.ReqTokenButton.Entry                   = 0;
    Ghost.ReqRewPop.ReqXPButton.Entry                      = 0;
    Ghost.ReqRewPop.ReqHonorButton.Entry                   = 0;
    Ghost.ReqRewPop.ReqArenaButton.Entry                   = 0;
    Ghost.ReqRewPop.ReqSpiritPowerButton.Entry             = 0;
    Ghost.ReqRewPop.ReqMapDataButton.Desc                  = "";
    Ghost.ReqRewPop.ReqQuestDataButton.Desc                = "";
    Ghost.ReqRewPop.ReqAchievementDataButton.Desc          = "";
    Ghost.ReqRewPop.ReqSpellDataButton.Desc                = "";

    for i=1,10 do
        Ghost.ReqRewPop.ReqItemButtons[i].Entry = 0;
        Ghost.ReqRewPop.ReqCMDButtons[i].Entry = "0";
    end

    Ghost.ReqRewPop.RewGoldButton.Entry                    = 0;
    Ghost.ReqRewPop.RewTokenButton.Entry                   = 0;
    Ghost.ReqRewPop.RewXPButton.Entry                      = 0;
    Ghost.ReqRewPop.RewStatPointButton.Entry               = 0;
    Ghost.ReqRewPop.RewHonorButton.Entry                   = 0;
    Ghost.ReqRewPop.RewArenaButton.Entry                   = 0;

    for i=1,10 do
        Ghost.ReqRewPop.RewItemButtons[i].Entry = 0;
        Ghost.ReqRewPop.RewAuraButtons[i].Entry = 0;
        Ghost.ReqRewPop.RewSpellButtons[i].Entry = 0;
        Ghost.ReqRewPop.RewCMDButtons[i].Entry = "0";
    end
end

function Ghost_ReqRewPop_UpdateReq(reqId)
    if Ghost.Data.Req[reqId] then
        Ghost.ReqRewPop.ReqLevelButton.Entry                 = Ghost.Data.Req[reqId]["level"];
        Ghost.ReqRewPop.ReqVIPButton.Entry                   = Ghost.Data.Req[reqId]["vip"];
        Ghost.ReqRewPop.ReqHRButton.Entry                    = Ghost.Data.Req[reqId]["hr"];
        Ghost.ReqRewPop.ReqFactionButton.Entry               = Ghost.Data.Req[reqId]["faction"];
        Ghost.ReqRewPop.ReqRankButton.Entry                  = Ghost.Data.Req[reqId]["rank"];
        Ghost.ReqRewPop.ReqReincarnationButton.Entry         = Ghost.Data.Req[reqId]["reincarnation"];
        Ghost.ReqRewPop.ReqAchievementPointsButton.Entry     = Ghost.Data.Req[reqId]["achievementPoints"];
        Ghost.ReqRewPop.ReqGoldButton.Entry                  = Ghost.Data.Req[reqId]["gold"];
        Ghost.ReqRewPop.ReqTokenButton.Entry                 = Ghost.Data.Req[reqId]["token"];
        Ghost.ReqRewPop.ReqXPButton.Entry                    = Ghost.Data.Req[reqId]["xp"];
        Ghost.ReqRewPop.ReqHonorButton.Entry                 = Ghost.Data.Req[reqId]["honor"];
        Ghost.ReqRewPop.ReqArenaButton.Entry                 = Ghost.Data.Req[reqId]["arena"];
        Ghost.ReqRewPop.ReqSpiritPowerButton.Entry           = Ghost.Data.Req[reqId]["spiritPower"];
        
        Ghost.ReqRewPop.ReqMapDataButton.Desc                = Ghost.Data.Req[reqId]["mapDesc"];
        Ghost.ReqRewPop.ReqQuestDataButton.Desc              = Ghost.Data.Req[reqId]["questDesc"];
        Ghost.ReqRewPop.ReqAchievementDataButton.Desc        = Ghost.Data.Req[reqId]["achieveDesc"];
        Ghost.ReqRewPop.ReqSpellDataButton.Desc              = Ghost.Data.Req[reqId]["spellDesc"];

        for i=1,10 do
            Ghost.ReqRewPop.ReqItemButtons[i].Entry = Ghost.Data.Req[reqId]["item"..i];
            Ghost.ReqRewPop.ReqItemButtons[i].Count = Ghost.Data.Req[reqId]["itemCount"..i];
            Ghost.ReqRewPop.ReqCMDButtons[i].Entry   = Ghost.Data.Req[reqId]["cmdIcon"..i];
            Ghost.ReqRewPop.ReqCMDButtons[i].Count   = Ghost.Data.Req[reqId]["cmdDes"..i];
        end
    end
end

function Ghost_ReqRewPop_UpdateRew(rewId)
    if Ghost.Data.Rew[rewId] then

        Ghost.ReqRewPop.RewGoldButton.Entry                  = Ghost.Data.Rew[rewId]["gold"];
        Ghost.ReqRewPop.RewTokenButton.Entry                 = Ghost.Data.Rew[rewId]["token"];
        Ghost.ReqRewPop.RewXPButton.Entry                    = Ghost.Data.Rew[rewId]["xp"];
        Ghost.ReqRewPop.RewHonorButton.Entry                 = Ghost.Data.Rew[rewId]["honor"];
        Ghost.ReqRewPop.RewArenaButton.Entry                 = Ghost.Data.Rew[rewId]["arena"];
        Ghost.ReqRewPop.RewStatPointButton.Entry             = Ghost.Data.Rew[rewId]["statpoint"];
        
        for i=1,10 do
            Ghost.ReqRewPop.RewItemButtons[i].Entry  = Ghost.Data.Rew[rewId]["item"..i];
            Ghost.ReqRewPop.RewItemButtons[i].Count  = Ghost.Data.Rew[rewId]["itemCount"..i];
            Ghost.ReqRewPop.RewSpellButtons[i].Entry = Ghost.Data.Rew[rewId]["spell"..i];
            Ghost.ReqRewPop.RewAuraButtons[i].Entry  = Ghost.Data.Rew[rewId]["aura"..i];
            Ghost.ReqRewPop.RewCMDButtons[i].Entry   = Ghost.Data.Rew[rewId]["cmdIcon"..i];
            Ghost.ReqRewPop.RewCMDButtons[i].Count   = Ghost.Data.Rew[rewId]["cmdDes"..i];
        end
    end
end

function Ghost_ReqRewConfirm(self, ButtonType,Param1,Param2)
    Ghost_ReqRewConfirm_Rune(self, ButtonType,Param1,Param2);
    Ghost_ReqRewConfirm_BlackMarket(self, ButtonType,Param1,Param2);
    Ghost_ReqRewConfirm_TransMog(self, ButtonType,Param1,Param2);
    Ghost_ReqRewConfirm_LuckDraw(self, ButtonType,Param1,Param2);
    Ghost_ReqRewConfirm_VIP(self, ButtonType,Param1,Param2);
    Ghost_ReqRewConfirm_HR(self, ButtonType,Param1,Param2);
end

function Ghost_ReqRewPop_Confirm(self)
    Ghost_Req_ToggleMainFrame(self);
    Ghost_ReqRewPop_Hide();
    local popframe = self:GetParent();
    Ghost_ReqRewConfirm(popframe,popframe.ButtonType,popframe.Param1,popframe.Param2);
end

function Ghost_ReqRewPop_Cancel(self)
    Ghost_Req_ToggleMainFrame(self);
    Ghost_ReqRewPop_Hide();
end

function Ghost_Req_ToggleMainFrame(self)
    if self:GetParent().MainFrameToggle then
        GhostPanel_Toggle();
    end
end

function Ghost_FetchData_ReqPopCheck(data)
    local reqId,mapcheck,questcheck,spellcheck,achievecheck = strsplit(" ",data);
    
    reqId           = tonumber(reqId);
    mapcheck        = tonumber(mapcheck);
    questcheck      = tonumber(questcheck);
    achievecheck    = tonumber(achievecheck);
    spellcheck      = tonumber(spellcheck);	

    Ghost.ReqRewPop.ReqMapDataButton.Entry               = mapcheck;
    Ghost.ReqRewPop.ReqQuestDataButton.Entry             = questcheck;
    Ghost.ReqRewPop.ReqAchievementDataButton.Entry       = achievecheck;
    Ghost.ReqRewPop.ReqSpellDataButton.Entry             = spellcheck;
    	
    Ghost_ReqRewPop_UpdateReq(reqId);
    GhostPanel_UpdateReqRewPopUI();
end

function Ghost_ReqRewPop_SendCheckData(reqId)

    if not Ghost.Data.Req[reqId] then
        return;
    end

	if Ghost.Data.Req[reqId]["mapDesc"] ~="" or Ghost.Data.Req[reqId]["questDesc"] ~="" or Ghost.Data.Req[reqId]["spellDesc"] ~="" or Ghost.Data.Req[reqId]["achieveDesc"] ~="" then
		Ghost_SendData("GC_C_CHECK_REQ_POP", reqId);
	end
end