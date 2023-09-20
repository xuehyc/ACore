local NetherBot = NetherBot

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 初始化标头菜单 frame

NetherBot.titleFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), UIParent)
local titleFrame = NetherBot.titleFrame
titleFrame:SetSize(200, 35)
titleFrame:SetPoint("RIGHT", UIParent, "RIGHT", -200, 0)
titleFrame:Show()
titleFrame:SetBackdrop({
    bgFile = "Interface/Buttons/WHITE8X8",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
titleFrame:SetBackdropColor(0.35, 0.14, 0.73, 0.25)
titleFrame:SetBackdropBorderColor(0.53, 0.07, 0.89, 1)
titleFrame:SetMovable(true)
titleFrame:EnableMouse(true)
titleFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
titleFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 初始化主菜单 frame

NetherBot.mainFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), UIParent)
local mainFrame = NetherBot.mainFrame
mainFrame:SetSize(200, 300)
mainFrame:SetPoint("TOP", titleFrame, "BOTTOM", 0, 0)
mainFrame:Show()
mainFrame:SetBackdrop({
    bgFile = "Interface/Buttons/WHITE8X8",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
mainFrame:SetBackdropColor(0.35, 0.14, 0.73, 0.25)
mainFrame:SetBackdropBorderColor(0.53, 0.07, 0.89, 1)
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 初始化管理菜单 frame

NetherBot.gameMasterFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), UIParent)
local gameMasterFrame = NetherBot.gameMasterFrame
gameMasterFrame:SetSize(136, 230)
gameMasterFrame:SetPoint("RIGHT", mainFrame, "LEFT", 0, 0)
gameMasterFrame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                              edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                              tile = true, tileSize = 16, edgeSize = 16,
                              insets = { left = 4, right = 4, top = 4, bottom = 4 } })
gameMasterFrame:SetBackdropColor(1, 0, 0, 0.2) -- Set the background color to red and transparency to 20%.
gameMasterFrame:SetBackdropBorderColor(0, 1, 0, 1)
gameMasterFrame:Hide() -- hide the admin frame by default
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 初始化查找菜单 frame

NetherBot.lookupFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), UIParent)
local lookupFrame = NetherBot.lookupFrame
lookupFrame:SetSize(200, 310)
lookupFrame:SetPoint("RIGHT", gameMasterFrame, "LEFT", -20, 0)
lookupFrame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
lookupFrame:SetBackdropColor(0, 0, 1, 0.3)
lookupFrame:SetBackdropBorderColor(0, 0, 1, 1)
lookupFrame:Hide()
-- Make the frame movable
lookupFrame:SetMovable(true)
lookupFrame:EnableMouse(true)
lookupFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
lookupFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 初始化施法菜单 frame

NetherBot.castSpellFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), UIParent)
local castSpellFrame = NetherBot.castSpellFrame
castSpellFrame:SetSize(50, 300)
castSpellFrame:SetPoint("LEFT", mainFrame, "RIGHT", 0, 0)
castSpellFrame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                             edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                             tile = true, tileSize = 16, edgeSize = 16,
                             insets = { left = 4, right = 4, top = 4, bottom = 4 } })
castSpellFrame:SetBackdropColor(1, 0, 0, 0.2) -- Set the background color to red and transparency to 20%.
castSpellFrame:SetBackdropBorderColor(0, 1, 0, 1)
castSpellFrame:Hide()
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- 自定义插件显示/隐藏命令

-- 固定写法：[SLASH_] + [名称] + [数字]，[名称]可以使用下划线
-- SlashCmdList 集合新增元素时，必须使用[名称]
SLASH_NETHER_BOT_CMD1 = '/netherbot'
SLASH_NETHER_BOT_CMD2 = '/nb'
SlashCmdList['NETHER_BOT_CMD'] = function(msg)
    if msg == "show" or msg == "s" then
        titleFrame:Show()
        mainFrame:Show()
    elseif msg == "hide" or msg == "h" then
        titleFrame:Hide()
        mainFrame:Hide()
        gameMasterFrame:Hide()
        lookupFrame:Hide()
        castSpellFrame:Hide()
    end
end
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<