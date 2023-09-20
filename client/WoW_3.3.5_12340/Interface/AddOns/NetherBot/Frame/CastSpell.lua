local NetherBot = NetherBot

-- 施法菜单

-- 创建施法按钮
local function CreateCastSpellButton(offsetX, offsetY, table, pressKey)
    local castSpellButton = CreateFrame("Button", NetherBot:CreateNameUnique(), NetherBot.castSpellFrame, "UIPanelButtonTemplate")
    castSpellButton:SetPoint("TOPLEFT", NetherBot.castSpellFrame, "TOPLEFT", offsetX, offsetY)
    castSpellButton:SetSize(30, 30)
    castSpellButton:SetNormalFontObject("GameFontNormal")
    local spellTexture = castSpellButton:CreateTexture(nil, "BACKGROUND")
    spellTexture:SetTexture("Interface\\Icons\\" .. table.ICON)
    spellTexture:SetAllPoints()
    castSpellButton:SetNormalTexture(spellTexture)
    local spellPushedTexture = castSpellButton:CreateTexture(nil, "BACKGROUND")
    spellPushedTexture:SetTexture("Interface\\Icons\\spell_magic_polymorphrabbit")
    spellPushedTexture:SetAllPoints()
    castSpellButton:SetPushedTexture(spellPushedTexture)
    castSpellButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(table.NAME .. " [" .. pressKey .. "]")
        GameTooltip:Show()
    end)
    castSpellButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    castSpellButton:SetScript("OnClick", function()
        NetherBot:CommandNPCBotUseOnBotSpell_Player(table.IDS)
    end)
    -- 绑定按键，触发按钮点击事件，此设置会覆盖系统按键设置
    SetOverrideBindingClick(castSpellButton, true, pressKey, castSpellButton:GetName())
    return castSpellButton
end

-- >>>>>>>>>>>>>>>>>> 战士 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.WARRIOR then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 90)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.WARRIOR.J_J, "NUMPAD1")
    CreateCastSpellButton(10, -50, NetherBot.SPELL_TABLE.WARRIOR.Y_H, "NUMPAD2")
end
-- >>>>>>>>>>>>>>>>>> 圣骑士 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.PALADIN then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(90, 210)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.PALADIN.B_H_Z_S, "NUMPAD1")
    CreateCastSpellButton(10, -50, NetherBot.SPELL_TABLE.PALADIN.Z_J_Z_S, "NUMPAD2")
    CreateCastSpellButton(10, -90, NetherBot.SPELL_TABLE.PALADIN.X_S_Z_S, "NUMPAD3")
    CreateCastSpellButton(10, -130, NetherBot.SPELL_TABLE.PALADIN.Z_Y_F_Y, "NUMPAD4")
    CreateCastSpellButton(10, -170, NetherBot.SPELL_TABLE.PALADIN.S_G_D_B, "NUMPAD5")
    CreateCastSpellButton(50, -10, NetherBot.SPELL_TABLE.PALADIN.Q_X_L_L_Z_F, "CTRL-NUMPAD1")
    CreateCastSpellButton(50, -50, NetherBot.SPELL_TABLE.PALADIN.Q_X_Z_H_Z_F, "CTRL-NUMPAD2")
    CreateCastSpellButton(50, -90, NetherBot.SPELL_TABLE.PALADIN.Q_X_W_Z_Z_F, "CTRL-NUMPAD3")
    CreateCastSpellButton(50, -130, NetherBot.SPELL_TABLE.PALADIN.Q_X_B_H_Z_F, "CTRL-NUMPAD4")
    CreateCastSpellButton(50, -170, NetherBot.SPELL_TABLE.PALADIN.J_S, "CTRL-NUMPAD5")
    -- 对机器人使用神圣干涉没啥用，机器人不会自己取消
    --CreateCastSpellButton(50, -210, NetherBot.SPELL_TABLE.PALADIN.S_S_G_S, "CTRL-NUMPAD6")
end
-- >>>>>>>>>>>>>>>>>> 猎人 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.HUNTER then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 50)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.HUNTER.W_D, "NUMPAD1")
end
-- >>>>>>>>>>>>>>>>>> 盗贼 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.ROGUE then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 50)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.ROGUE.J_H_J_Q, "NUMPAD1")
end
-- >>>>>>>>>>>>>>>>>> 牧师 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.PRIEST then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 130)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.PRIEST.Y_H_D_Y, "NUMPAD1")
    CreateCastSpellButton(10, -50, NetherBot.SPELL_TABLE.PRIEST.P_F_S, "NUMPAD2")
    CreateCastSpellButton(10, -90, NetherBot.SPELL_TABLE.PRIEST.F_H_S, "NUMPAD3")
end
-- >>>>>>>>>>>>>>>>>> 死亡骑士 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.DEATH_KNIGHT then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 50)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.DEATH_KNIGHT.K_L, "NUMPAD1")
end
-- >>>>>>>>>>>>>>>>>> 萨满 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.SHAMAN then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 50)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.SHAMAN.X_Z_Z_H, "NUMPAD1")
end
-- >>>>>>>>>>>>>>>>>> 法师 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.MAGE then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 130)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.MAGE.H_L_S, "NUMPAD1")
    CreateCastSpellButton(10, -50, NetherBot.SPELL_TABLE.MAGE.M_F_Y_Z, "NUMPAD2")
    CreateCastSpellButton(10, -90, NetherBot.SPELL_TABLE.MAGE.M_F_Z_X, "NUMPAD3")
end
-- >>>>>>>>>>>>>>>>>> 术士 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.WARLOCK then

end
-- >>>>>>>>>>>>>>>>>> 德鲁伊 <<<<<<<<<<<<<<<<<<<
if NetherBot.playerClassFilename == NetherBot.CLASS_FILENAME.DRUID then
    -- 重置施法菜单尺寸
    NetherBot.castSpellFrame:SetSize(50, 90)
    CreateCastSpellButton(10, -10, NetherBot.SPELL_TABLE.DRUID.F_S, "NUMPAD1")
    CreateCastSpellButton(10, -50, NetherBot.SPELL_TABLE.DRUID.Q_S_H_S, "NUMPAD2")
end