function GhostPanel_InitUI_VIP()
    for i=1,14 do
        Ghost.VIP.Button[i] =  _G["GhostUI_Page5VIPButton"..i];
    end

    Ghost.Data.VIP[0] = {
        ["title"]           = "[非会员]",
        ["icon"]            = "",   
    }
end

function Ghost_FetchData_VIP(data)

    local level,icon,title,reqId,rewId = strsplit(" ",data);

    level = tonumber(level);
    reqId = tonumber(reqId);
    rewId = tonumber(rewId);

    Ghost.Data.VIP[level] = {
        ["title"]           = title,
        ["icon"]            = icon,  
        ["reqId"]            = reqId, 
        ["rewId"]            = rewId, 
    };
    
    if Ghost.VIP.Button[level] then
        Ghost.VIP.Button[level].Entry = level;
    end
end

function GhostPanel_Button_OnUpdate_VIP(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["VIP"] then
        if self.Entry == 0 then
            self:Hide();
            return;
        end
        
        GhostPanel_Button_Update_State(self, Ghost.Char.VIP);

        self.MText:SetSize(100,100);
        self.MText:SetText(Ghost.Data.VIP[self.Entry]["title"]);
        self.MText:SetVertexColor(1, 1, 1, 1);
        self.MText:Show();
        self.Icon:SetTexture("Interface\\ICONS\\"..Ghost.Data.VIP[self.Entry]["icon"]);
        self:Show();
    end
end

function GhostPanel_Button_OnEnter_VIP(self)
    if self.ButtonType == GHOST_BUTTON_TYPE["VIP"] then
        
        if self.ButtonState == GHOST_BUTTON_STATE["ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "已获得该会员等级");   
        end

        if self.ButtonState == GHOST_BUTTON_STATE["DEACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "");
        end

        if self.ButtonState == GHOST_BUTTON_STATE["JUST_ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "当前会员等级");        
        end

        if self.ButtonState == GHOST_BUTTON_STATE["NEXT_ACTIVE"] then
            GameTooltip:AddDoubleLine("|cff00ff00提示|r", "点击[右键]提升会员等级");    
        end

        Ghost_ReqTooltipText(GameTooltip,"提升至"..Ghost.Data.VIP[self.Entry]["title"],"", Ghost.Data.VIP[self.Entry]["reqId"]);
        Ghost_RewTooltipText(GameTooltip,"提升至"..Ghost.Data.VIP[self.Entry]["title"],"", Ghost.Data.VIP[self.Entry]["rewId"]);
    end
end

function GhostPanel_Button_OnClick_VIP(self,button,down)
    if self.ButtonType == GHOST_BUTTON_TYPE["VIP"] then
        GhostPanel_HideSpecialUI();
        if self.Entry ~= 0 then
            if button == "RightButton" and self.ButtonState == GHOST_BUTTON_STATE["NEXT_ACTIVE"] then
                local popframe = Ghost_ReqRewPop_Show("升级"..Ghost.Data.VIP[self.Entry]["title"], nil, Ghost.Data.VIP[self.Entry]["reqId"]);
                popframe.ButtonType = self.ButtonType;
            end
            GhostPanel_VIP_UpateSelected(self.Entry);  
		end
    end
end

function GhostPanel_VIP_UpateSelected( level )
    for i=1,14 do
        Ghost.VIP.Button[i].Highlight:Hide();
        Ghost.VIP.Button[i].Selected = false;
        
        if i == level then
            Ghost.VIP.Button[i].Highlight:Show();
            Ghost.VIP.Button[i].Highlight:SetVertexColor(0, 1, 0, 1);
            Ghost.VIP.Button[i].Selected = true;
            if Ghost.Data.VIP[i] then
                Ghost_RewPanel_Show(Ghost.Data.VIP[i]["rewId"]);
                Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.VIP[i]["title"]));
            end
        end
    end
end

function GhostPanel_VIP_UpateUI()
    for i=1,14 do
        GhostPanel_Button_OnUpdate_VIP(Ghost.VIP.Button[i]);
    end
    GhostPanel_VIP_UpateSelected(Ghost.Char.VIP);
end

function GhostPanel_HomeNav_OnClick_VIP(self)
    if self.Id == 5 then
        local level = Ghost.Char.VIP;
        if Ghost.Data.VIP[Ghost.Char.VIP + 1] then
            level = level + 1;
        end
        Ghost_RewPanel_Show(Ghost.Data.VIP[level]["rewId"]);
        Ghost_RewPanel_TooltipAddDesc(string.format( " - %s奖励", Ghost.Data.VIP[level]["title"]));
    end
end

function Ghost_ReqRewConfirm_VIP(self, ButtonType,Param1,Param2)
    if ButtonType == GHOST_BUTTON_TYPE["VIP"] then
        Ghost_SendData("GC_C_BUY_VIP","");
        print ("GC_C_BUY_VIP")
    end
end