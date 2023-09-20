local NetherBot = NetherBot

-- 获取玩家职业
-- playerClassId 不一定能获取到，用 playerClassFilename 判断最保险
local playerClassName, playerClassFilename, playerClassId = UnitClass("player")
NetherBot.playerClassFilename = playerClassFilename

-- 职业 ClassFilename
NetherBot.CLASS_FILENAME = {
    WARRIOR = "WARRIOR", -- 战士
    PALADIN = "PALADIN", -- 圣骑士
    HUNTER = "HUNTER", -- 猎人
    ROGUE = "ROGUE", -- 盗贼
    PRIEST = "PRIEST", -- 牧师
    DEATH_KNIGHT = "DEATHKNIGHT", -- 死亡骑士
    SHAMAN = "SHAMAN", -- 萨满
    MAGE = "MAGE", -- 法师
    WARLOCK = "WARLOCK", -- 术士
    DRUID = "DRUID" -- 德鲁伊
}

-- 法术表
-- 每个职业每个法术的ID，法术等级从高到低降序排序：{法术等级10的ID, 法术等级9的ID, 法术等级8的ID...}
NetherBot.SPELL_TABLE = {
    -- 战士
    WARRIOR = {
        J_J = {
            NAME = "警戒",
            ICON = "Ability_Warrior_Vigilance",
            IDS = { 50720 }
        },
        Y_H = {
            NAME = "援护",
            ICON = "Ability_Warrior_VictoryRush",
            IDS = { 3411 }
        }
    },
    -- 圣骑士
    PALADIN = {
        B_H_Z_S = {
            NAME = "保护之手",
            ICON = "Spell_Holy_SealOfProtection",
            IDS = { 10278, 5599, 1022 }
        },
        Z_J_Z_S = {
            NAME = "拯救之手",
            ICON = "Spell_Holy_SealOfSalvation",
            IDS = { 1038 }
        },
        X_S_Z_S = {
            NAME = "牺牲之手",
            ICON = "Spell_Holy_SealOfSacrifice",
            IDS = { 6940 }
        },
        Z_Y_F_Y = {
            NAME = "正义防御",
            ICON = "INV_Shoulder_37",
            IDS = { 31789 }
        },
        S_G_D_B = {
            NAME = "圣光道标",
            ICON = "Ability_Paladin_BeaconofLight",
            IDS = { 53563 }
        },
        Q_X_L_L_Z_F = {
            NAME = "强效力量祝福",
            ICON = "Spell_Holy_GreaterBlessingofKings",
            IDS = { 48934, 48933, 27141, 25916, 25782 }
        },
        Q_X_Z_H_Z_F = {
            NAME = "强效智慧祝福",
            ICON = "Spell_Holy_GreaterBlessingofWisdom",
            IDS = { 48938, 48937, 27143, 25918, 25894 }
        },
        Q_X_W_Z_Z_F = {
            NAME = "强效王者祝福",
            ICON = "Spell_Magic_GreaterBlessingofKings",
            IDS = { 25898 }
        },
        Q_X_B_H_Z_F = {
            NAME = "强效庇护祝福",
            ICON = "Spell_Holy_GreaterBlessingofSanctuary",
            IDS = { 25899 }
        },
        J_S = {
            NAME = "救赎",
            ICON = "Spell_Holy_Resurrection",
            IDS = { 48950, 48949, 20773, 20772, 10324, 10322, 7328 }
        },
        S_S_G_S = {
            NAME = "圣神干涉",
            ICON = "Spell_Nature_TimeStop",
            IDS = { 19752 }
        }
    },
    -- 猎人
    HUNTER = {
        W_D = {
            NAME = "误导",
            ICON = "Ability_Hunter_Misdirection",
            IDS = { 34477 }
        }
    },
    -- 盗贼
    ROGUE = {
        J_H_J_Q = {
            NAME = "嫁祸诀窍",
            ICON = "Ability_Rogue_TricksOftheTrade",
            IDS = { 57934 }
        }
    },
    -- 牧师
    PRIEST = {
        Y_H_D_Y = {
            NAME = "愈合祷言",
            ICON = "Spell_Holy_PrayerOfMendingtga",
            IDS = { 48113, 48112, 33076 }
        },
        P_F_S = {
            NAME = "漂浮术",
            ICON = "Spell_Holy_LayOnHands",
            IDS = { 1706 }
        },
        F_H_S = {
            NAME = "复活术",
            ICON = "Spell_Holy_Resurrection",
            IDS = { 48171, 25435, 20770, 10881, 10880, 2010, 2006 }
        }
    },
    -- 死亡骑士
    DEATH_KNIGHT = {
        K_L = {
            NAME = "狂乱",
            ICON = "Spell_DeathKnight_BladedArmor",
            IDS = { 49016 }
        }
    },
    -- 萨满
    SHAMAN = {
        X_Z_Z_H = {
            NAME = "先祖之魂",
            ICON = "Spell_Nature_Regenerate",
            IDS = { 49277, 25590, 20777, 20776, 20610, 20609, 2008 }
        }
    },
    -- 法师
    MAGE = {
        H_L_S = {
            NAME = "缓落术",
            ICON = "Spell_Magic_FeatherFall",
            IDS = { 130 }
        },
        M_F_Y_Z = {
            NAME = "魔法抑制",
            ICON = "Spell_Nature_AbolishMagic",
            IDS = { 43015, 33944, 10174, 10173, 8451, 8450, 604 }
        },
        M_F_Z_X = {
            NAME = "魔法增效",
            ICON = "Spell_Holy_FlashHeal",
            IDS = { 43017, 33946, 27130, 10170, 10169, 8455, 1008 }
        }
    },
    -- 术士
    WARLOCK = {

    },
    -- 德鲁伊
    DRUID = {
        F_S = {
            NAME = "复生",
            ICON = "Spell_Nature_Reincarnation",
            IDS = { 48477, 26994, 20748, 20747, 20742, 20739, 20484 }
        },
        Q_S_H_S = {
            NAME = "起死回生",
            ICON = "Ability_Druid_LunarGuidance",
            IDS = { 50763, 50764, 50765, 50766, 50767, 50768, 50769 }
        }
    }
}

-- 计数器
local function CreateCounter()
    -- 初始值为 0
    local count = 0
    -- 返回一个函数，每次调用该函数，count 加 1 并返回新值
    return function()
        count = count + 1
        return count
    end
end
-- 创建计数器实例
local counter = CreateCounter()
-- 创建全局唯一名称，一般用来创建组件时，指定的组件名称
function NetherBot:CreateNameUnique()
    local count = counter()
    return "NetherBotNameUnique" .. count
end

-- 通过 16 位的 GUID 获取生物模板 entry
-- creature_template 表的 entry 字段值
local function GetCreatureTemplateEntry(guid)
    if guid then
        -- local knownTypes = {[0]="player", [3]="NPC", [4]="pet", [5]="vehicle"};
        -- 335-12340 版本暂时只发现 [0] [3] [5] 类型
        -- [0] 是玩家类型（无 entry）
        local creatureTemplateType = tonumber(guid:sub(5, 5), 16)
        if creatureTemplateType == 3 or creatureTemplateType == 5 then
            -- 生物模板的 entry
            local creatureTemplateEntry = tonumber(guid:sub(8, 12), 16)
            if creatureTemplateEntry then
                return creatureTemplateEntry
            end
        end
    end
end

-- 校验选中目标是否是玩家
function NetherBot:ValidateTargetIsPlayer()
    local targetGUID = UnitGUID("target")
    if targetGUID then
        local creatureTemplateType = tonumber(targetGUID:sub(5, 5), 16)
        if creatureTemplateType == 0 then
            return true
        end
    end
end

-- 校验参数是否大于 0，只支持数字和字符串类型
-- 字符串类型会转换后再判断，如果无法转换，返回 false
function NetherBot:ValidateIsGtZero(param)
    if param then
        local paramType = type(param)
        if paramType == "string" then
            if param ~= "" then
                -- 如果转换时 nil 溢出（例如："2323224a"），则返回 -1
                local t = tonumber(param) or -1
                if t and t > 0 then
                    return true
                end
            end
        elseif paramType == "number" then
            if param > 0 then
                return true
            end
        end
    end
end

-- 跟随玩家，并主动攻击进入攻击范围，且有仇恨的敌人
function NetherBot:CommandNPCBotCommandFollow_Player()
    SendChatMessage(".npcbot command follow", "SAY")
end

-- 跟随玩家，并在活跃与非活跃之间切换
-- 跟随（活跃）：跟随玩家，并主动攻击进入攻击范围，且有仇恨的敌人
-- 跟随（非活跃）：所有机器人在跟随玩家时，不会采取任何行动
function NetherBot:CommandNPCBotCommandFollowOnly_Player()
    SendChatMessage(".npcbot command follow only", "SAY")
end

-- 停在原地，不会采取任何行动
function NetherBot:CommandNPCBotCommandStopFully_Player()
    SendChatMessage(".npcbot command stopfully", "SAY")
end

-- 停在原地，会攻击进入攻击范围，且有仇恨的敌人（炮台模式）
function NetherBot:CommandNPCBotCommandStandstill_Player()
    SendChatMessage(".npcbot command standstill", "SAY")
end

-- 开启/关闭对话，关闭后，鼠标放在机器人身上，不会显示对话图标，打怪时关闭对话，可以防止误点
function NetherBot:CommandNPCBotCommandNoGossip_Player()
    SendChatMessage(".npcbot command nogossip", "SAY")
end

-- 机器人在走/跑之间切换
function NetherBot:CommandNPCBotCommandWalk_Player()
    SendChatMessage(".npcbot command walk", "SAY")
end

-- 在不解雇机器人的情况下暂时释放机器人，机器人将返回出生的位置，并在那里等待，直到使用 rebind 命令重新绑定（或服务器重新启动）
-- 参数支持传入多个不区分大小写的机器人姓名，多个姓名之间用空格分割，如果姓名中包含空格，必须将空格替换成下划线
-- 例如：机器人 A 的姓名是 "Vivian"，机器人 B 的姓名是 "Amanda Green"
-- 传入的参数应该是 "Vivian Amanda_Green"，或者是 "vivian amanda_green"
function NetherBot:CommandNPCBotCommandUnbind_Player(names)
    if names then
        SendChatMessage(".npcbot command unbind " .. names, "SAY")
    else
        SendChatMessage(".npcbot command unbind", "SAY")
    end
end

-- unbind 的反向操作，重新绑定已经解绑的机器人
-- 参数支持传入多个不区分大小写的机器人姓名，多个姓名之间用空格分割，如果姓名中包含空格，必须将空格替换成下划线
-- 例如：机器人 A 的姓名是 "Vivian"，机器人 B 的姓名是 "Amanda Green"
-- 传入的参数应该是 "Vivian Amanda_Green"，或者是 "vivian amanda_green"
function NetherBot:CommandNPCBotCommandRebind_Player(names)
    if names then
        SendChatMessage(".npcbot command rebind " .. names, "SAY")
    else
        SendChatMessage(".npcbot command rebind", "SAY")
    end
end

-- toggle NPCBots' ability to cast any spells
function NetherBot:CommandNPCBotCommandNoCast_Player()
    SendChatMessage(".npcbot command nocast", "SAY")
end

-- toggle NPCBots' ability to cast spells with non-zero cast time
function NetherBot:CommandNPCBotCommandNoLongCast_Player()
    SendChatMessage(".npcbot command nolongcast", "SAY")
end

-- 使机器人暂时下线，他们将从地图上传送出去，直到被允许回来，不能在战斗中使用
function NetherBot:CommandNPCBotHide_Player()
    SendChatMessage(".npcbot hide", "SAY")
end

-- 将下线的机器人，召唤回来，不能在战斗中使用
function NetherBot:CommandNPCBotShow_Player()
    SendChatMessage(".npcbot show", "SAY")
end

-- 杀死机器人，可以用来解决，有时在副本中，即使脱离了战斗，机器人仍然处于战斗中，导致无法对话，无法复活玩家的 BUG
function NetherBot:CommandNPCBotKill_Player()
    SendChatMessage(".npcbot kill", "SAY")
end

-- 机器人跟随距离（0 - 100）
function NetherBot:CommandNPCBotDistance_Player(param)
    SendChatMessage(".npcbot distance " .. param, "SAY")
end

-- 机器人远程攻击距离（支持数字类型以及两个字符串类型的参数）
-- 数字：0 - 50
-- "short"：最小远程攻击距离
-- "long"：最大远程攻击距离
function NetherBot:CommandNPCBotDistanceAttack_Player(param)
    SendChatMessage(".npcbot distance attack " .. param, "SAY")
end

-- 强制机器人直接移动到玩家的位置，死后可用
function NetherBot:CommandNPCBotRecall_Player()
    SendChatMessage(".npcbot recall", "SAY")
end

-- 必须选中玩家，显示玩家拥有的机器人的各种状态下的数量
function NetherBot:CommandNPCBotInfo_Player()
    SendChatMessage(".npcbot info", "SAY")
end

-- 对机器人使用法术
-- 根据法术等级从高到低的顺序，依次校验玩家是否已经学会该法术，优先对机器人使用高等级法术
-- 否则就算未学会这个法术，也能对机器人使用（不平衡）
function NetherBot:CommandNPCBotUseOnBotSpell_Player(spellIds)
    for index, spellId in pairs(spellIds) do
        -- 校验玩家是否已经学会了这个法术
        local isSpellKnown = IsSpellKnown(spellId)
        if isSpellKnown then
            SendChatMessage(".npcbot useonbot spell " .. spellId, "SAY")
            return
        end
    end
    ChatFrame1:AddMessage("|cffFFFF00你还没有学会这个法术！")
end

-- 对机器人使用物品，物品ID
function NetherBot:CommandNPCBotUseOnBotItem_Player(itemId)
    SendChatMessage(".npcbot useonbot item " .. itemId, "SAY")
end

-- 列出所有机器人的ID、名字、等级、位置、活跃状态（active、free）信息
function NetherBot:CommandNPCBotListSpawned_GM()
    SendChatMessage(".npcbot list spawned", "SAY")
end

-- 列出所有空闲（free）机器人的ID、名字、等级、位置、活跃状态（active、free）信息
function NetherBot:CommandNPCBotListSpawnedFree_GM()
    SendChatMessage(".npcbot list spawned free", "SAY")
end

-- 复活机器人
function NetherBot:CommandNPCBotRevive_GM()
    SendChatMessage(".npcbot revive", "SAY")
end

-- 免费招募一个选中的机器人（绕过购买），仅适用于无主的机器人
function NetherBot:CommandNPCBotAdd_GM()
    SendChatMessage(".npcbot add", "SAY")
end

-- 解雇，通过此方式解除招募的机器人，会保留装备，并会回到原先招募的位置
function NetherBot:CommandNPCBotRemove_GM()
    SendChatMessage(".npcbot remove", "SAY")
end

-- 将机器人移动到玩家当前的位置，只能移动无主机器人，支持选中目标和根据机器人模板 entry（creature_template.entry）两种方式
function NetherBot:CommandNPCBotMove_GM(entry)
    if entry then
        SendChatMessage(".npcbot move " .. entry, "SAY")
    else
        SendChatMessage(".npcbot move", "SAY")
    end
end

-- 删除一个机器人，机器人的装备会回到背包
function NetherBot:CommandNPCBotDelete_GM()
    SendChatMessage(".npcbot delete", "SAY")
end

-- 根据机器人模板 entry（creature_template.entry），永久删除一个机器人，机器人的装备会回到背包
function NetherBot:CommandNPCBotDeleteId_GM(entry)
    SendChatMessage(".npcbot delete id " .. entry, "SAY")
end

-- 删除所有无主的机器人
function NetherBot:CommandNPCBotDeleteFree_GM()
    SendChatMessage(".npcbot delete free", "SAY")
end

-- 根据职业编码，查询种族编码
function NetherBot:CommandNPCBotLookup_GM(classId)
    SendChatMessage(".npcbot lookup " .. classId, "SAY")
end

-- 根据种族编码，生成机器人
function NetherBot:CommandNPCBotSpawn_GM(entry)
    SendChatMessage(".npcbot spawn " .. entry, "SAY")
end

-- 在玩家的位置上生成一个 NPC
function NetherBot:CommandNPCAdd_GM(entry)
    SendChatMessage(".npc add " .. entry, "SAY")
end

-- 删除选中的 NPC，会校验选中的 NPC 的 entry 和参数 entry 是否一致
function NetherBot:CommandNPCDelete_GM(entry, message)
    local targetEntry = GetCreatureTemplateEntry(UnitGUID("target"))
    if entry and targetEntry and entry == targetEntry then
        SendChatMessage(".npc delete", "SAY")
    else
        if message then
            ChatFrame1:AddMessage(message)
        else
            ChatFrame1:AddMessage("|cffFFFF00目标错误！")
        end
    end
end