local NetherBot = NetherBot

-- 标头菜单

local title = NetherBot.titleFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", NetherBot.titleFrame, "TOP", 0, -10)
title:SetText("NetherBot")

-- Create the "reload" button
local reloadButton = CreateFrame("Button", NetherBot:CreateNameUnique(), NetherBot.titleFrame, "UIPanelButtonTemplate")
reloadButton:SetSize(21, 20)
reloadButton:SetPoint("TOPLEFT", NetherBot.titleFrame, "TOPLEFT", 20, -7)
reloadButton:SetText("|cff00C957RL")
reloadButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
reloadButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("重载插件")
    GameTooltip:Show()
end)
reloadButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)
reloadButton:SetScript("OnClick", function()
    StaticPopupDialogs["CONFIRM_RELOAD"] = {
        text = "确定要|cff00C957重载插件|r？",
        button1 = "|cff00C957是",
        button2 = "否",
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        OnAccept = function()
            -- 重载插件
            ReloadUI()
        end
    }
    StaticPopup_Show("CONFIRM_RELOAD")
end)

local switchButton = CreateFrame("Button", NetherBot:CreateNameUnique(), NetherBot.titleFrame, "UIPanelButtonTemplate")
switchButton:SetSize(21, 20)
switchButton:SetPoint("TOPRIGHT", NetherBot.titleFrame, "TOPRIGHT", -20, -7)
switchButton:SetText("|cff00C957▽")
switchButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
switchButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("展开/收起")
    GameTooltip:Show()
end)
switchButton:SetScript("OnLeave", function()
    GameTooltip:Hide()
end)
switchButton:SetScript("OnClick", function()
    if NetherBot.mainFrame:IsShown() then
        NetherBot.mainFrame:Hide()
        NetherBot.gameMasterFrame:Hide()
        NetherBot.lookupFrame:Hide()
        NetherBot.castSpellFrame:Hide()
    else
        NetherBot.mainFrame:Show()
    end
end)