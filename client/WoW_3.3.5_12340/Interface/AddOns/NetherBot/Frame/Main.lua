local NetherBot = NetherBot

-- 主菜单

-- 创建主菜单按钮函数
local function CreateMainButton(offsetX, offsetY, text, icon, onClickFunc)
    local mainButton = CreateFrame("Button", NetherBot.CreateNameUnique(), NetherBot.mainFrame, "ActionButtonTemplate")
    mainButton:SetPoint("TOPLEFT", NetherBot.mainFrame, "TOPLEFT", offsetX, offsetY)
    mainButton:SetSize(40, 40)
    mainButton:SetText(text)
    mainButton:SetNormalFontObject("GameFontNormal")
    local mainTexture = mainButton:CreateTexture(nil, "BACKGROUND")
    mainTexture:SetTexture("Interface\\Icons\\" .. icon)
    mainTexture:SetAllPoints()
    mainButton:SetNormalTexture(mainTexture)
    local mainPushedTexture = mainButton:CreateTexture(nil, "BACKGROUND")
    mainPushedTexture:SetTexture("Interface\\Icons\\spell_magic_polymorphrabbit")
    mainPushedTexture:SetAllPoints()
    mainButton:SetPushedTexture(mainPushedTexture)
    mainButton:SetScript("OnClick", onClickFunc)
    return mainButton
end

-- 跟随模式
CreateMainButton(20, -20, "|cff00FF96跟随\n模式", "Ability_Tracking", function()
    NetherBot:CommandNPCBotCommandFollowOnly_Player()
end)

-- 呆立模式
CreateMainButton(80, -20, "|cff00FF96呆立\n模式", "ABILITY_SEAL", function()
    NetherBot:CommandNPCBotCommandStopFully_Player()
end)

-- 炮台模式
CreateMainButton(140, -20, "|cff00FF96炮台\n模式", "Ability_Vehicle_SiegeEngineCannon", function()
    NetherBot:CommandNPCBotCommandStandstill_Player()
end)

-- 对话开关
CreateMainButton(20, -70, "|cff00FF96对话\n开关", "Spell_Holy_Silence", function()
    NetherBot:CommandNPCBotCommandNoGossip_Player()
end)

-- 下线
CreateMainButton(80, -70, "|cff00FF96下线", "Spell_Nature_SpiritWolf", function()
    NetherBot:CommandNPCBotHide_Player()
end)

-- 上线
CreateMainButton(140, -70, "|cff00FF96上线", "Ability_Hunter_BeastCall", function()
    NetherBot:CommandNPCBotShow_Player()
end)

-- 召回
CreateMainButton(20, -120, "|cff00FF96召回", "Ability_Hunter_BeastTraining", function()
    NetherBot:CommandNPCBotRecall_Player()
end)

-- 杀死
CreateMainButton(80, -120, "|cff00FF96杀死", "Ability_Hunter_RapidKilling", function()
    NetherBot:CommandNPCBotKill_Player()
end)

-- 走跑切换
CreateMainButton(140, -120, "|cff00FF96走跑\n切换", "Ability_Rogue_FleetFooted", function()
    NetherBot:CommandNPCBotCommandWalk_Player()
end)

-- 解除绑定
CreateMainButton(20, -170, "|cff00FF96解除\n绑定|r", "INV_Misc_GroupLooking", function()
    local targetGUID = UnitGUID("target")
    if targetGUID then
        NetherBot:CommandNPCBotCommandUnbind_Player()
    else
        StaticPopupDialogs["UNBIND_NPC"] = {
            text = "输入一个或者多个NPC机器人姓名，不区分大小写，多个姓名之间用|cffFF0000空格|r分割，如果姓名中包含|cffFF0000空格|r，请将|cffFF0000空格|r替换成|cffFF0000下划线|r（[Bots信息]可以查看已解绑机器人的姓名等信息）",
            button1 = "确定",
            button2 = "取消",
            hasEditBox = true,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function(self)
                local npc = self.editBox:GetText()
                if npc then
                    if npc ~= "" then
                        NetherBot:CommandNPCBotCommandUnbind_Player(npc)
                    else
                        ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                    end
                else
                    ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                end
            end
        }
        StaticPopup_Show("UNBIND_NPC")
    end
end)

-- 恢复绑定
CreateMainButton(80, -170, "|cff00FF96恢复\n绑定|r", "INV_Misc_GroupNeedMore", function()
    local targetGUID = UnitGUID("target")
    if targetGUID then
        NetherBot:CommandNPCBotCommandRebind_Player()
    else
        StaticPopupDialogs["REBIND_NPC"] = {
            text = "输入一个或者多个NPC机器人姓名，不区分大小写，多个姓名之间用|cffFF0000空格|r分割，如果姓名中包含|cffFF0000空格|r，请将|cffFF0000空格|r替换成|cffFF0000下划线|r（[Bots信息]可以查看已解绑机器人的姓名等信息）",
            button1 = "确定",
            button2 = "取消",
            hasEditBox = true,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function(self)
                local npc = self.editBox:GetText()
                if npc then
                    if npc ~= "" then
                        NetherBot:CommandNPCBotCommandRebind_Player(npc)
                    else
                        ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                    end
                else
                    ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                end
            end
        }
        StaticPopup_Show("REBIND_NPC")
    end
end)

-- Bots信息
CreateMainButton(140, -170, "|cff00FF96Bots\n信息|r", "Spell_Magic_PolymorphChicken", function()
    local bool = NetherBot:ValidateTargetIsPlayer()
    if bool then
        NetherBot:CommandNPCBotInfo_Player()
    else
        ChatFrame1:AddMessage("|cffFFFF00必须选中玩家！")
    end
end)

-- 30码跟随
CreateMainButton(20, -220, "|cff00FF9630码\n跟随|r", "achievement_pvp_g_01", function()
    NetherBot:CommandNPCBotDistance_Player(30)
end)

-- 50码跟随
CreateMainButton(80, -220, "|cff00FF9650码\n跟随|r", "achievement_pvp_o_02", function()
    NetherBot:CommandNPCBotDistance_Player(50)
end)

-- 85码跟随
CreateMainButton(140, -220, "|cff00FF9685码\n跟随|r", "achievement_pvp_h_03", function()
    NetherBot:CommandNPCBotDistance_Player(85)
end)

local mainGameMasterButton = CreateFrame("Button", NetherBot.CreateNameUnique(), NetherBot.mainFrame, "UIPanelButtonTemplate")
mainGameMasterButton:SetSize(50, 22)
mainGameMasterButton:SetPoint("BOTTOMLEFT", NetherBot.mainFrame, "BOTTOMLEFT", 20, 8)
mainGameMasterButton:SetText("GM")
mainGameMasterButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
mainGameMasterButton:SetScript("OnClick", function()
    if NetherBot.gameMasterFrame:IsShown() then
        NetherBot.gameMasterFrame:Hide()
    else
        NetherBot.gameMasterFrame:Show()
    end
end)

local mainCastSpellButton = CreateFrame("Button", NetherBot.CreateNameUnique(), NetherBot.mainFrame, "UIPanelButtonTemplate")
mainCastSpellButton:SetSize(50, 22)
mainCastSpellButton:SetPoint("BOTTOMRIGHT", NetherBot.mainFrame, "BOTTOMRIGHT", -20, 8)
mainCastSpellButton:SetText("施法")
mainCastSpellButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
mainCastSpellButton:SetScript("OnClick", function()
    if NetherBot.castSpellFrame:IsShown() then
        NetherBot.castSpellFrame:Hide()
    else
        NetherBot.castSpellFrame:Show()
    end
end)