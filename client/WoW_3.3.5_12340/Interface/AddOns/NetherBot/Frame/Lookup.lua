local NetherBot = NetherBot

-- 查找菜单

local lookupTitle = NetherBot.lookupFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
lookupTitle:SetPoint("TOPLEFT", NetherBot.lookupFrame, "TOPLEFT", 10, -14)
lookupTitle:SetText("选择职业:")

-- Create the scrollFrame for the list
local lookupScrollFrame = CreateFrame("ScrollFrame", NetherBot:CreateNameUnique(), NetherBot.lookupFrame, "UIPanelScrollFrameTemplate")
lookupScrollFrame:SetPoint("TOPLEFT", NetherBot.lookupFrame, "TOPLEFT", 4, -25)
lookupScrollFrame:SetPoint("BOTTOMRIGHT", NetherBot.lookupFrame, "BOTTOMRIGHT", -4, 4)

-- Create the list frame
local lookupList = CreateFrame("Frame", NetherBot:CreateNameUnique(), lookupScrollFrame)
lookupList:SetSize(lookupScrollFrame:GetWidth(), lookupScrollFrame:GetHeight())
lookupScrollFrame:SetScrollChild(lookupList)

-- Create the key-value store
local classTable = {
    ["|cffC69B6D战士"] = 1,
    ["|cffF58CBA圣骑士"] = 2,
    ["|cffAAD372猎人"] = 3,
    ["|cffFFF468盗贼"] = 4,
    ["|cffF0EBE0牧师"] = 5,
    ["|cffC41E3B死亡骑士"] = 6,
    ["|cff2359FF萨满"] = 7,
    ["|cff68CCEF法师"] = 8,
    ["|cff9382C9术士"] = 9,
    ["|cff00FF96------------------------------"] = 10,
    ["|cffFF7C0A德鲁伊"] = 11,
    ["|cffC69B6D------------------------------"] = 12,
    ["|cffF0EBE0War3黑曜石毁灭者"] = 13,
    ["|cff68CCEFWar3大魔导师"] = 14,
    ["|cffA330C9War3恐惧魔王"] = 15,
    ["|cff68CCEFWar3破法者"] = 16,
    ["|cffAAD372War3黑暗游侠"] = 17,
    ["|cff9382C9War3死灵法师"] = 18,
    ["|cff68CCEFWar3娜迦女海巫"] = 19,
    ["|cff009ABFWar3地穴领主"] = 20
}

-- Create the buttons for the list items
for key, value in pairs(classTable) do
    local button = CreateFrame("Button", NetherBot:CreateNameUnique(), lookupList, "UIPanelButtonTemplate")
    button:SetSize(180, 25)
    button:SetPoint("TOPLEFT", lookupList, "TOPLEFT", 10, -10 - (value - 1) * 30)
    button:SetText(key)
    button:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)

    -- Handle the button's click event
    button:SetScript("OnClick", function()
        NetherBot:CommandNPCBotLookup_GM(value)
        -- You can add your custom functionality here like running a command or doing some other action
    end)
end

-- Create the "hideLookup" button
local hideLookupButton = CreateFrame("Button", NetherBot:CreateNameUnique(), NetherBot.lookupFrame, "UIPanelButtonTemplate")
hideLookupButton:SetSize(21, 20)
hideLookupButton:SetPoint("TOPRIGHT", NetherBot.lookupFrame, "TOPRIGHT", -10, -8)
hideLookupButton:SetText("|cffFF0000X")
hideLookupButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
-- Handle Lookup buttons click event
hideLookupButton:SetScript("OnClick", function()
    NetherBot.lookupFrame:Hide()
end)

-- Create the spawnFrame
local spawnFrame = CreateFrame("Frame", NetherBot:CreateNameUnique(), NetherBot.lookupFrame)
spawnFrame:SetSize(200, 45)
spawnFrame:SetPoint("BOTTOM", NetherBot.lookupFrame, "BOTTOM", 0, -50)
spawnFrame:SetBackdrop({
    bgFile = "Interface/BUTTONS/WHITE8X8",
    edgeFile = "Interface/BUTTONS/WHITE8X8",
    edgeSize = 1,
    insets = { left = 0, right = 0, top = 0, bottom = 0 } })
spawnFrame:SetBackdropColor(0, 0, 1, 0.3)
spawnFrame:SetBackdropBorderColor(0, 0, 1, 1)

-- Create the "buttonSpawnBot" button
local spawnBotButton = CreateFrame("Button", NetherBot:CreateNameUnique(), spawnFrame, "UIPanelButtonTemplate")
spawnBotButton:SetSize(80, 25)
spawnBotButton:SetPoint("TOPLEFT", spawnFrame, "TOPLEFT", 15, -10)
spawnBotButton:SetText("生成机器人")
spawnBotButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
-- Create the "classInput" input box
local classInput = CreateFrame("EditBox", NetherBot:CreateNameUnique(), spawnFrame, "InputBoxTemplate")
classInput:SetSize(80, 25)
classInput:SetPoint("TOPLEFT", spawnFrame, "TOPLEFT", 105, -10)
classInput:SetAutoFocus(false)
-- Handle the buttons click event
spawnBotButton:SetScript("OnClick", function()
    local input = classInput:GetText()
    if input ~= "" then
        NetherBot:CommandNPCBotSpawn_GM(input)
        classInput:SetText("")
        classInput:ClearFocus()
    else
        ChatFrame1:AddMessage("|cffFFFF00请输入聊天框中查询出的机器人『ID』，例如：『70XXX』")
    end
end)
-- 回车触发点击事件
classInput:SetScript("OnEnterPressed", function()
    spawnBotButton:Click()
end)