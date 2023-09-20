local NetherBot = NetherBot

-- 管理菜单

local gameMasterTitle = NetherBot.gameMasterFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
gameMasterTitle:SetPoint("TOP", NetherBot.gameMasterFrame, "TOP", 0, -15)
gameMasterTitle:SetText("GM 菜单")

-- 创建管理按钮
local function CreateGameMasterButton(offsetX, offsetY, text, onClickFunc)
    local gameMasterButton = CreateFrame("Button", NetherBot:CreateNameUnique(), NetherBot.gameMasterFrame, "UIPanelButtonTemplate")
    gameMasterButton:SetSize(56, 22)
    gameMasterButton:SetPoint("TOPLEFT", NetherBot.gameMasterFrame, "TOPLEFT", offsetX, offsetY)
    gameMasterButton:SetText(text)
    gameMasterButton:GetNormalTexture():SetVertexColor(0.10, 1.00, 0.10)
    gameMasterButton:SetScript("OnClick", onClickFunc)
    return gameMasterButton
end

-- 雇佣
CreateGameMasterButton(10, -35, "雇佣", function()
    NetherBot:CommandNPCBotAdd_GM()
end)

-- 解雇
CreateGameMasterButton(70, -35, "解雇", function()
    NetherBot:CommandNPCBotRemove_GM()
end)

-- 复活
CreateGameMasterButton(10, -65, "复活", function()
    NetherBot:CommandNPCBotRevive_GM()
end)

-- 移动
CreateGameMasterButton(70, -65, "移动", function()
    local targetGUID = UnitGUID("target")
    if targetGUID then
        NetherBot:CommandNPCBotMove_GM()
    else
        StaticPopupDialogs["MOVE_NPC"] = {
            text = "输入NPC机器人ID，只能移动|cffFF0000无主|r的机器人",
            button1 = "确定",
            button2 = "取消",
            hasEditBox = true,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function(self)
                local npc = self.editBox:GetText()
                local bool = NetherBot:ValidateIsGtZero(npc)
                if bool then
                    NetherBot:CommandNPCBotMove_GM(npc)
                else
                    ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                end
            end
        }
        StaticPopup_Show("MOVE_NPC")
    end
end)

-- 召唤老鸨
CreateGameMasterButton(10, -95, "召唤老鸨", function()
    -- 在玩家位置生成一个提供机器人招募服务的 NPC
    NetherBot:CommandNPCAdd_GM(70000)
end)

-- 删除老鸨
CreateGameMasterButton(70, -95, "删除老鸨", function()
    NetherBot:CommandNPCDelete_GM(70000, "|cffFFFF00目标错误！请选中名为『Lagretta』的老鸨...")
end)

-- 所有Bots
CreateGameMasterButton(10, -125, "所有Bots", function()
    NetherBot:CommandNPCBotListSpawned_GM()
end)

-- 空闲Bots
CreateGameMasterButton(70, -125, "空闲Bots", function()
    NetherBot:CommandNPCBotListSpawnedFree_GM()
end)

-- 查找
CreateGameMasterButton(10, -195, "|cff6A5ACD查找", function()
    if NetherBot.lookupFrame:IsShown() then
        NetherBot.lookupFrame:Hide()
    else
        NetherBot.lookupFrame:Show()
    end
end)

-- 删除
CreateGameMasterButton(70, -195, "|cffFF0000删除", function()
    local targetGUID = UnitGUID("target")
    if targetGUID then
        StaticPopupDialogs["CONFIRM_DELETE"] = {
            text = "确定要|cffFF0000删除|r？",
            button1 = "|cffFF0000是",
            button2 = "否",
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function()
                NetherBot:CommandNPCBotDelete_GM()
            end
        }
        StaticPopup_Show("CONFIRM_DELETE")
    else
        StaticPopupDialogs["DELETE_NPC"] = {
            text = "输入NPC机器人ID:",
            button1 = "确定",
            button2 = "取消",
            hasEditBox = true,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            OnAccept = function(self)
                local npc = self.editBox:GetText()
                local bool = NetherBot:ValidateIsGtZero(npc)
                if bool then
                    StaticPopupDialogs["CONFIRM_DELETE"] = {
                        text = "确定要|cffFF0000删除|r？",
                        button1 = "|cffFF0000是",
                        button2 = "否",
                        timeout = 0,
                        whileDead = true,
                        hideOnEscape = true,
                        OnAccept = function()
                            NetherBot:CommandNPCBotDeleteId_GM(npc)
                        end
                    }
                    StaticPopup_Show("CONFIRM_DELETE")
                else
                    ChatFrame1:AddMessage("|cffFFFF00无效输入！")
                end
            end
        }
        StaticPopup_Show("DELETE_NPC")
    end
end)