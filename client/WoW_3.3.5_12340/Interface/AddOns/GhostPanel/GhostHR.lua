function GhostPanel_InitUI_HR()
    for i=1,14 do
        Ghost.HR.Button[i] =  _G["GhostUI_Page6HRButton"..i];
    end

    Ghost.Data.HR.A[0] = {
        ["title"]           = "|cFFFF6600[新兵]|r",
        ["icon"]            = "",   
    }

    Ghost.Data.HR.H[0] = {
        ["title"]           = "|cFFFF6600[新兵]|r",
        ["icon"]            = "",   
    }
end

function Ghost_FetchData_HR(data)
    
    local level,reqId,rewId = strsplit(" ",data);
    
    level = tonumber(level);
    reqId = tonumber(reqId);
    rewId = tonumber(rewId);


    if level > 14 then
        level = level - 14;

        if level == 1 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[斥候]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_01";
            };
        elseif level == 2 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[步兵]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_02";
            };
        elseif level == 3 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[中士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_03";
            };
        elseif level == 4 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[高阶军士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_04";
            };
        elseif level == 5 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[一等军士长]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_05";
            };
        elseif level == 6 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[石头守卫]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_06";
            };
        elseif level == 7 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[血卫士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_07";
            };
        elseif level == 8 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[军团士兵]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_08";
            };
        elseif level == 9 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[百夫长]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_09";
            };
        elseif level == 10 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[勇士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_10";
            };
        elseif level == 11 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[中将]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_11";
            };
        elseif level == 12 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[将军]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_12";
            };
        elseif level == 13 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[督军]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_13";
            };
        elseif level == 14 then
            Ghost.Data.HR.H[level] = {
                ["title"] = "|cFFFF6600[高阶督军]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_H_14";
            };
        end
        if  Ghost.Data.HR.H[level] then
            Ghost.Data.HR.H[level]["reqId"] = reqId;
            Ghost.Data.HR.H[level]["rewId"] = rewId;
        end
    else
        if level == 1 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[列兵]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_01";
            };
            
        elseif level == 2 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[下士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_02";
            };
        elseif level == 3 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[中士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_03";
            };
        elseif level == 4 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[军士长]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_04";
            };
        elseif level == 5 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[士官长]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_05";
            };
        elseif level == 6 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[骑士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_06";
            };
        elseif level == 7 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[骑士中尉]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_07";
            };
        elseif level == 8 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[骑士队长]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_08";
            };
        elseif level == 9 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[护卫骑士]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_09";
            };
        elseif level == 10 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[少校]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_10";
            };
        elseif level == 11 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[司令]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_11";
            };
        elseif level == 12 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[统帅]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_12";
            };
        elseif level == 13 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[元帅]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_13";
            };
        elseif level == 14 then
            Ghost.Data.HR.A[level] = {
                ["title"] = "|cFFFF6600[大元帅]|r";
                ["icon"] = "Interface\\ICONS\\Achievement_PVP_A_14";
            };
        end
        if  Ghost.Data.HR.A[level] then
            Ghost.Data.HR.A[level]["reqId"] = reqId;
            Ghost.Data.HR.A[level]["rewId"] = rewId;
        end
    end
    if Ghost.HR.Button[level] then
        Ghost.HR.Button[level].Entry = level;
    end
end

function GhostPanel_Button_OnUpdate_HR(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["HR"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        
        GhostPanel_Button_Update_State(self, Ghost.Char.HR);

        self.MText:SetSize(100,100);   
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        if GhostIsAlliance() then
            self.MText:SetText(Ghost.Data.HR.A[self.Entry]["title"]);
            self.Icon:SetTexture(Ghost.Data.HR.A[self.Entry]["icon"]);
        else
            self.MText:SetText(Ghost.Data.HR.H[self.Entry]["title"]);
            self.Icon:SetTexture(Ghost.Data.HR.H[self.Entry]["icon"]);
        end

        self:Show();
    end
end

function GhostPanel_Button_OnEnter_HR(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["HR"] then
        
        if self.ButtonState == GHOST_BUTTON_STATE["ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "已获得该军衔等级");   
        end

        if self.ButtonState == GHOST_BUTTON_STATE["DEACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "");
        end

        if self.ButtonState == GHOST_BUTTON_STATE["JUST_ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "当前军衔等级");        
        end

        if self.ButtonState == GHOST_BUTTON_STATE["NEXT_ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "点击[右键]提升军衔等级");    
        end

        if GhostIsAlliance() then
            Ghost_ReqTooltipText(GameTooltip,"提升至"..Ghost.Data.HR.A[self.Entry]["title"],"", Ghost.Data.HR.A[self.Entry]["reqId"]);
            Ghost_RewTooltipText(GameTooltip,"提升至"..Ghost.Data.HR.A[self.Entry]["title"],"", Ghost.Data.HR.A[self.Entry]["rewId"]);
        else
            Ghost_ReqTooltipText(GameTooltip,"提升至"..Ghost.Data.HR.A[self.Entry]["title"],"", Ghost.Data.HR.H[self.Entry]["reqId"]);
            Ghost_RewTooltipText(GameTooltip,"提升至"..Ghost.Data.HR.H[self.Entry]["title"],"", Ghost.Data.HR.H[self.Entry]["rewId"]);
        end
        
    end
end

function GhostPanel_Button_OnClick_HR(self,button,down)
    if self.ButtonType == GHOST_BUTTON_TYPE["HR"] then
        GhostPanel_HideSpecialUI();
        if self.Entry ~= 0 then
            if button == "RightButton" and self.ButtonState == GHOST_BUTTON_STATE["NEXT_ACTIVE"] then
                local popframe;
                if GhostIsAlliance() then
                    popframe = Ghost_ReqRewPop_Show("升级"..Ghost.Data.HR.A[self.Entry]["title"], nil, Ghost.Data.HR.A[self.Entry]["reqId"]);
                else
                    popframe = Ghost_ReqRewPop_Show("升级"..Ghost.Data.HR.H[self.Entry]["title"], nil, Ghost.Data.HR.H[self.Entry]["reqId"]);
                end
                popframe.ButtonType = self.ButtonType;
            end
            GhostPanel_HR_UpateSelected(self.Entry);  
		end
    end
end

function GhostPanel_HR_UpateSelected( level )
    for i=1,14 do
        Ghost.HR.Button[i].Highlight:Hide();
        Ghost.HR.Button[i].Selected = false;
        
        if i == level then
            Ghost.HR.Button[i].Highlight:Show();
            Ghost.HR.Button[i].Highlight:SetVertexColor(0, 1, 0, 1);
            Ghost.HR.Button[i].Selected = true;
            if GhostIsAlliance() then
                Ghost_RewPanel_Show(Ghost.Data.HR.A[i]["rewId"]);
                Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.HR.A[i]["title"]));
            else
                Ghost_RewPanel_Show(Ghost.Data.HR.H[i]["rewId"]);
                Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.HR.H[i]["title"]));
            end
        end
    end
end

function GhostPanel_HR_UpateUI()
    for i=1,14 do
        GhostPanel_Button_OnUpdate_HR(Ghost.HR.Button[i]);
    end

    GhostPanel_HR_UpateSelected(Ghost.Char.HR);
end

function GhostPanel_HomeNav_OnClick_HR(self)
    if self.Id == 6 then
        local level = Ghost.Char.HR;

        if GhostIsAlliance() then
            if Ghost.Data.HR.A[Ghost.Char.HR + 1] then
                level = level + 1;
            end
            Ghost_RewPanel_Show(Ghost.Data.HR.A[level]["rewId"]);
            Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.HR.A[level]["title"]));
        else
            if Ghost.Data.HR.H[Ghost.Char.HR + 1] then
                level = level + 1;
            end
            Ghost_RewPanel_Show(Ghost.Data.HR.H[level]["rewId"]);
            Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.HR.H[level]["title"]));
        end
    end
end

function Ghost_ReqRewConfirm_HR(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["HR"] then
        Ghost_SendData("GC_C_BUY_HR","");
        print ("GC_C_BUY_HR")
    end
end