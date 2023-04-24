print(">>Script: Teleport stone.")
--54844
--菜单所有者 --默认炉石
local itemEntry    =6948
--阵营
local TEAM_ALLIANCE=0
local TEAM_HORDE=1
--菜单号
local MMENU=1
local TPMENU=2
local GMMENU=3
local ENCMENU=4
local INSTANCESMENU=5
--菜单类型
local FUNC=1
local MENU=2
local TP=3
local ENC=4
local INSMRST=5

--GOSSIP_ICON 菜单图标
local GOSSIP_ICON_CHAT            = 0                    -- 对话
local GOSSIP_ICON_VENDOR          = 1                    -- 货物
local GOSSIP_ICON_TAXI            = 2                    -- 传送
local GOSSIP_ICON_TRAINER         = 3                    -- 训练（书）
local GOSSIP_ICON_INTERACT_1      = 4                    -- 复活
local GOSSIP_ICON_INTERACT_2      = 5                    -- 设为我的家
local GOSSIP_ICON_MONEY_BAG         = 6                    -- 钱袋
local GOSSIP_ICON_TALK            = 7                    -- 申请 说话+黑色点
local GOSSIP_ICON_TABARD          = 8                    -- 工会（战袍）
local GOSSIP_ICON_BATTLE          = 9                    -- 加入战场 双剑交叉
local GOSSIP_ICON_DOT             = 10                   -- 加入战场


--装备位置
local EQUIPMENT_SLOT_HEAD         = 0--头部
local EQUIPMENT_SLOT_NECK         = 1--颈部
local EQUIPMENT_SLOT_SHOULDERS    = 2--肩部
local EQUIPMENT_SLOT_BODY         = 3--身体
local EQUIPMENT_SLOT_CHEST        = 4--胸甲
local EQUIPMENT_SLOT_WAIST        = 5--腰部
local EQUIPMENT_SLOT_LEGS         = 6--腿部
local EQUIPMENT_SLOT_FEET         = 7--脚部
local EQUIPMENT_SLOT_WRISTS       = 8--手腕
local EQUIPMENT_SLOT_HANDS        = 9--手套
local EQUIPMENT_SLOT_FINGER1      = 10--手指1
local EQUIPMENT_SLOT_FINGER2      = 11--手指2
local EQUIPMENT_SLOT_TRINKET1     = 12--饰品1
local EQUIPMENT_SLOT_TRINKET2     = 13--饰品2
local EQUIPMENT_SLOT_BACK         = 14--背部
local EQUIPMENT_SLOT_MAINHAND     = 15--主手
local EQUIPMENT_SLOT_OFFHAND      = 16--副手
local EQUIPMENT_SLOT_RANGED       = 17--远程
local EQUIPMENT_SLOT_TABARD       = 18--徽章

--副本ID表
--{副本ID，难度，副本名，所需货币，所需数量}
local Instances={
        {249,0,"奥妮克希亚的巢穴",60003,5},{249,1,"奥妮克希亚的巢穴",60003,5},
		{269,1,"时光之穴:黑暗之门",60003,5},
		{309,0,"祖尔格拉布",60003,5},
        {409,0,"熔火之心",60003,10},
		{469,0,"黑翼之巢-黑石山",60003,10},
        {509,0,"安其拉废墟",60003,10},
		{531,0,"安其拉神庙",60003,10},
		{532,0,"卡拉赞",60003,20},
		{533,0,"纳克萨玛斯",60003,20},{533,1,"",60003,20},
        {534,0,"海加尔山战役，联盟基地",60003,10},
		{540,1,"破碎大厅",60003,30},
		{542,1,"鲜血熔炉",60003,30},
		{543,1,"地狱火堡垒",60003,30},
		{544,0,"玛瑟里顿的巢穴",60003,30},
		{545,1,"蒸汽洞窟",60003,50},
		{546,1,"幽暗沼泽",60003,50},
		{547,1,"奴隶围栏",60003,50},
		{548,0,"毒蛇神殿",60003,50},
        {550,0,"风暴之眼",60003,50},
		{552,1,"风暴要塞:拱廊区",60003,50},
		{553,1,"生态船",60003,80},
		{554,1,"能源舰",60003,80},
		{555,1,"暗影迷宫",60003,80},
		{556,1,"塞司克大厅",60003,80},
		{557,1,"法力陵墓",60003,80},
		{558,1,"奥金顿大厅",60003,100},
        {560,1,"时光之穴，旧希尔斯布莱德丘陵",60003,100},
		{564,0,"黑暗神庙",60003,100},
		{565,0,"格鲁尔的巢穴",60003,100},
		{568,0,"祖阿曼",60003,10},
        {574,1,"乌特加德城堡",60003,10},
		{575,1,"乌特加德之巅",60003,10},
		{576,1,"奥核之心",60003,10},
		{578,1,"奥核之眼",60003,10},
        {580,0,"太阳井高地",60003,10},
		{585,1,"魔导师平台",60003,10},
		{595,1,"时光之穴：净化斯坦索姆",60003,10},
		{599,1,"奥达尔:石头大厅",60003,10},
        {600,1,"达克萨隆要塞",60003,10},
		{601,1,"艾兹卓-尼鲁布",60003,10},
		{602,1,"奥达尔:光明大厅",60003,10},
		{603,0,"奥杜尔",60003,10},{603,1,"奥杜尔",60003,10},
		{604,1,"古达克",60003,10},
		{608,1,"紫罗兰监狱",60003,10},
        {615,0,"黑曜石圣殿",60003,10},{615,1,"黑曜石圣殿",60003,10},
		{616,0,"永恒之眼",60003,10},{616,1,"永恒之眼",60003,10},
		{619,1,"安卡赫特古代王国",60003,10},
		{624,0,"阿尔卡冯的宝库",60003,10},{624,1,"阿尔卡冯的宝库",60003,10},
        {631,0,"冰冠城塞",60003,10},{631,1,"冰冠城塞",60003,10},{631,2,"冰冠城塞",60003,10},{631,3,"冰冠城塞",60003,10},
		{632,1,"灵魂熔炉",60003,10},
        {649,0,"十字军的试炼",60003,10},{649,1,"十字军的试炼",60003,10},{649,2,"十字军的试炼",60003,10},{649,3,"十字军的试炼",60003,10},
        {650,1,"十字军的试炼",60003,10},
		{658,1,"萨伦之渊",60003,10},
		{668,1,"倒影大厅",60003,10},
        {724,0,"晶红圣所",60003,10},{724,1,"晶红圣所",60003,10},{724,2,"晶红圣所",60003,10},{724,3,"晶红圣所",60003,10},
}

--随身NPC
local ST={
    TIME=45,--45秒
    NPCID1=50008,
    NPCID2=50000,
    --[guid]=lasttime,
}

--双重附魔需求设置
local ReqEnchantItem = 60003
local ReqEnchantItemCount = 20

function Player:LoadInstancesALLFromDB()
	local guid = self:GetGUIDLow()--guid
	local playerNowInstances = {}
	local charinstance=CharDBQuery("SELECT instance FROM character_instance WHERE guid="..guid..";")
	if charinstance then
		repeat
			local result = CharDBQuery("SELECT id,map,difficulty FROM instance WHERE id="..charinstance:GetUInt32(0)..";")	
			if result then
				repeat
					playerNowInstances[result:GetUInt32(0)] = {guid,result:GetUInt32(0),result:GetUInt32(1),result:GetUInt32(2)}
				until not result:NextRow()
			end
		until not charinstance:NextRow()
	end
	return playerNowInstances
end

function ST.SummonNPC(player, entry)
    local guid=player:GetGUIDLow()
    local lastTime,nowTime=(ST[guid] or 0),os.time()


    if(player:IsInCombat())then
        player:SendAreaTriggerMessage("不能在战斗中召唤。")
    else
        if(nowTime>lastTime)then
            local map=player:GetMap()
            if(map)then
                player:SendAreaTriggerMessage(map:GetName())
                local x,y,z=player:GetX()+1,player:GetY(),player:GetZ()
                local nz=map:GetHeight(x,y)
                if(nz>z and nz<(z+5))then
                    z=nz
                end
                local NPC=player:SpawnCreature(entry,x,y,z,0, 3,ST.TIME*1000)
                if(NPC)then
                    player:SendAreaTriggerMessage("召唤随身NPC成功。")
                    NPC:SetFacingToObject(player)
                    NPC:SendUnitSay(string.format("%s,你好，需要点什么？",player:GetName()),0)
                    lastTime=os.time()+ST.TIME
                else
                    player:SendAreaTriggerMessage("召唤随身NPC失败。")
                end
            end
        else
            player:SendAreaTriggerMessage("召唤NPC不能太频繁。")
        end
    end
    ST[guid]=lastTime
end


function ST.SummonGNPC(player)--召唤商人
    ST.SummonNPC(player, ST.NPCID2)
end


function ST.SummonENPC(player)--召唤附魔
    ST.SummonNPC(player, ST.NPCID1)
end


local function ResetPlayer(player, flag, text)
    player:SetAtLoginFlag(flag)
    player:SendAreaTriggerMessage("你需要重新登录角色，才能修改"..text.."。")
    player:SendAreaTriggerMessage("正在返回选择角色菜单")
    player:LogoutPlayer(true)
end


local Stone={
    GetTimeASString=function(player)
        local inGameTime=player:GetTotalPlayedTime()
        local days=math.modf(inGameTime/(24*3600))
        local hours=math.modf((inGameTime-(days*24*3600))/3600)
        local mins=math.modf((inGameTime-(days*24*3600+hours*3600))/60)
        return days.."天"..hours.."时"..mins.."分"
    end,
    GoHome=function(player)--回到家
        player:CastSpell(player,8690,true)    
        player:ResetSpellCooldown(8690, true)    
        player:SendBroadcastMessage("已经回到家")
    end,


    SetHome=function(player)--设置当前位置为家
        local x,y,z,mapId,areaId=player:GetX(),player:GetY(),player:GetZ(),player:GetMapId(),player:GetAreaId() 
        player:SetBindPoint(x,y,z,mapId,areaId)
        player:SendBroadcastMessage("已经设置当前位置为家")
    end,


    OpenBank=function(player)--打开银行
        player:SendShowBank(player)
        player:SendBroadcastMessage("已经打开银行")
    end,


    WeakOut=function(player)--移除复活虚弱
        if(player:HasAura(15007))then
            player:RemoveAura(15007)    --移除复活虚弱
            player:SetHealth(player:GetMaxHealth())
            --self:RemoveAllAuras()    --移除所有状态
            player:SendBroadcastMessage("你的身上的复活虚弱状态已经被移除。")
        else
            player:SendBroadcastMessage("你的身上没有复活虚弱状态。")
        end
    end,


    OutCombat=function(player)--脱离战斗
        if(player:IsInCombat())then
            player:ClearInCombat()
            player:SendAreaTriggerMessage("你已经脱离战斗")
            player:SendBroadcastMessage("你已经脱离战斗。")
        else
            player:SendAreaTriggerMessage("你并没有在战斗。")
            player:SendBroadcastMessage("你并没有在战斗。")
        end
    end,


    WSkillsToMax=function(player)--技能熟练度
        player:AdvanceSkillsToMax()
        player:SendBroadcastMessage("当前技能熟练度已经达到最大值")
    end,
    MaxHealth=function(player)    --回复生命
        player:SetHealth(player:GetMaxHealth())
        player:SendBroadcastMessage("生命值已经回满。")
    end,
    ResetTalents = function(player)--重置天赋
        player:ResetTalents(true)--免费
        player:SendBroadcastMessage("已经重置天赋")
    end,


    ResetPetTalents=function(player)--重置宠物天赋
        player:ResetPetTalents()
        player:SendBroadcastMessage("已经重置宠物天赋")
    end,


    ResetAllCD=function(player)--刷新冷却
        player:ResetAllCooldowns()
        player:SendBroadcastMessage("已经重置物品和技能冷却")
    end,


    RepairAll=function(player)--修理装备
        player:DurabilityRepairAll(true,1,false)
        player:SendBroadcastMessage("修理完所有装备。")
    end,


    SaveToDB=function(player)--保存数据
        player:SaveToDB()
        player:SendAreaTriggerMessage("保存数据完成")
    end,


    Logout=function(player)--返回选择角色
        player:SendAreaTriggerMessage("正在返回选择角色菜单")
        player:LogoutPlayer(true)
    end,


    LogoutNosave=function(player)--不保存数据,返回选择角色
        player:SendAreaTriggerMessage("正在返回选择角色菜单")
        player:LogoutPlayer(false)
    end,
	
    UnBindALL=function(player)    --副本解绑
		local instancelist = player:LoadInstancesALLFromDB()
		if instancelist then
			for kkk, vvv in pairs(instancelist) do 
				if(vvv)then
						---1---------1---------230---------0
						---GUID---instenceid---mapid-----diff
					--print("k "..k..":"..v[1]..":"..v[2]..":"..v[3]..":"..v[4])
					local nowmap=player:GetMapId()
					for k, v in pairs(Instances) do 
						local mapid=v[1]
						local ReqItemID = v[4]
						local ReqItemCount= v[5]
						if(mapid~=nowmap) then
							if (vvv[3]==v[1]) and (vvv[4]==v[2]) then
								if player:HasItem(ReqItemID, ReqItemCount) then
									player:RemoveFromGroup() --移除队伍，防止未知错误
									player:RemoveItem(ReqItemID, ReqItemCount)
									player:UnbindInstance(v[1],v[2])
									player:SendAreaTriggerMessage("副本["..v[3].."]解绑成功")
									player:SendBroadcastMessage("副本["..v[3].."]解绑成功。")
								else
									player:SendAreaTriggerMessage(v[3].."解绑失败,"..GetItemLink(ReqItemID,4).." x "..ReqItemCount.."材料不足")
									player:SendBroadcastMessage(v[3].."解绑失败,"..GetItemLink(ReqItemID,4).." x "..ReqItemCount.."材料不足。")
								end
							end
						else
							player:SendBroadcastMessage("你所在的当前副本无法解除绑定。")
						end
					end
				end
			end
		end
        --player:SendAreaTriggerMessage("已经解除所有副本的绑定")
        --player:SendBroadcastMessage("已经解除所有副本的绑定。")
    end,    
    --[[登录标志
    AT_LOGIN_RENAME            = 0x01,
    AT_LOGIN_RESET_SPELLS      = 0x02,
    AT_LOGIN_RESET_TALENTS     = 0x04,
    AT_LOGIN_CUSTOMIZE         = 0x08,
    AT_LOGIN_RESET_PET_TALENTS = 0x10,
    AT_LOGIN_FIRST             = 0x20,
    AT_LOGIN_CHANGE_FACTION    = 0x40,
    AT_LOGIN_CHANGE_RACE       = 0x80
    ]]--
    ResetName=function(player,code)--修改名字
        local target=player:GetSelection()
        if(target and (target:GetTypeId()==player:GetTypeId()))then
            ResetPlayer(target, 0x1, "名字")
        else
            player:SendAreaTriggerMessage("请选中一个玩家。")
        end
    end,
    ResetFace=function(player)
        ResetPlayer(player, 0x8, "外貌")
    end,
    ResetRace=function(player)
        ResetPlayer(player, 0x80, "种族")
    end,
    ResetFaction=function(player)
        ResetPlayer(player, 0x40, "阵营")
    end,
    ResetSpell=function(player)
        ResetPlayer(player, 0x2, "所有法术")
    end,
}

local Menu={
    [MMENU]={--主菜单
        {FUNC, "传送回家",         Stone.GoHome,    GOSSIP_ICON_CHAT,        false,"是否传送回|cFFF0F000家|r ?"},
        {FUNC, "记录位置",         Stone.SetHome,    GOSSIP_ICON_INTERACT_1, false,"是否设置当前位置为|cFFF0F000家|r ?"},
        {FUNC, "在线银行",         Stone.OpenBank,    GOSSIP_ICON_MONEY_BAG},
        {MENU, "地图传送",         TPMENU,            GOSSIP_ICON_BATTLE},
        {MENU, "其他功能",        MMENU+0x10,        GOSSIP_ICON_INTERACT_1},
        {MENU, "双重附魔[需要:"..GetItemLink(ReqEnchantItem,4).." x "..ReqEnchantItemCount.."]",        ENCMENU,        GOSSIP_ICON_TABARD},
        {FUNC, "解除全部副本绑定",     Stone.UnBindALL,    GOSSIP_ICON_INTERACT_1, false,"是否解除所有副本绑定 ?"},
		{MENU, "解除指定副本绑定",     INSTANCESMENU,    GOSSIP_ICON_INTERACT_1},
        {FUNC, "召唤晶币银行",     ST.SummonGNPC,    GOSSIP_ICON_MONEY_BAG},
        {FUNC, "召唤新手商人",    ST.SummonENPC,    GOSSIP_ICON_TABARD},
        {MENU, "职业技能训练师",MMENU+0x20,        GOSSIP_ICON_BATTLE},
        {MENU, "专业技能训练师",MMENU+0x30,        GOSSIP_ICON_BATTLE},
        {FUNC, "强制脱离战斗",     Stone.OutCombat,GOSSIP_ICON_CHAT},
    },
    [MMENU+0x10]={--其他功能
        {FUNC, "解除虚弱",         Stone.WeakOut,        GOSSIP_ICON_INTERACT_1, false,"是否解除虚弱，并回复生命 ?"},
        {FUNC, "重置天赋"    ,    Stone.ResetTalents,    GOSSIP_ICON_TRAINER,    false,"确认重置天赋 ?"},
        {FUNC, "武器熟练度满值",Stone.WSkillsToMax,    GOSSIP_ICON_TRAINER,    false,"确认把武器熟练度加满 ?"},
        {FUNC, "修理所有装备",    Stone.RepairAll,    GOSSIP_ICON_VENDOR,        false,"需要花费金币修理装备 ?"},
        {FUNC, "修改名字",        Stone.ResetName,    GOSSIP_ICON_CHAT,        false,"是否更改名字？\n|cFFFFFF00需要重新登录才能修改。|r"},
        {FUNC, "修改外貌",        Stone.ResetFace,    GOSSIP_ICON_CHAT,        false,"是否更改外貌？\n|cFFFFFF00需要重新登录才能修改。|r"},
        {FUNC, "修改种族",        Stone.ResetRace,    GOSSIP_ICON_CHAT,        false,"是否更改种族？\n|cFFFFFF00需要重新登录才能修改。|r"},
        {FUNC, "修改阵营",        Stone.ResetFaction,    GOSSIP_ICON_CHAT,        false,"是否更改阵营？\n|cFFFFFF00需要重新登录才能修改。|r"},
        {FUNC, "遗忘所有法术",    Stone.ResetSpell,    GOSSIP_ICON_CHAT,        false,"是否遗忘所有法术？\n|cFFFFFF00需要重新登录才能生效。|r"},
    },
	[INSTANCESMENU]={--副本列表菜单
	},
    [GMMENU]={--GM菜单
        {FUNC, "重置所有冷却",    Stone.ResetAllCD,        GOSSIP_ICON_INTERACT_1,    false,"确认重置所有冷却 ?"},
        {FUNC, "保存角色",         Stone.SaveToDB,            GOSSIP_ICON_INTERACT_1},
        {FUNC, "返回选择角色",     Stone.Logout,            GOSSIP_ICON_INTERACT_1,    false,"返回选择角色界面 ?"},
        {FUNC, "|cFF800000不保存角色|r",Stone.LogoutNosave,GOSSIP_ICON_INTERACT_1,false,"|cFFFF0000不保存角色，并返回选择角色界面 ?|r"},
    },
    [TPMENU]={--传送菜单
        {MENU, "主要城市",            TPMENU+0x10,GOSSIP_ICON_BATTLE},
        {MENU, "东部王国",            TPMENU+0x20,GOSSIP_ICON_BATTLE},
        {MENU, "卡利姆多",            TPMENU+0x30,GOSSIP_ICON_BATTLE},
        {MENU, "外域",                TPMENU+0x40,GOSSIP_ICON_BATTLE},
        {MENU, "诺森德",                TPMENU+0x50,GOSSIP_ICON_BATTLE},
        {MENU, "经典旧世界地下城",    TPMENU+0x60,GOSSIP_ICON_BATTLE},
        {MENU, "燃烧的远征地下城",    TPMENU+0x70,GOSSIP_ICON_BATTLE},
        {MENU, "巫妖王之怒地下城",    TPMENU+0x80,GOSSIP_ICON_BATTLE},
        {MENU, "团队地下城",            TPMENU+0x90,GOSSIP_ICON_BATTLE},
        {MENU, "风景传送",            TPMENU+0xa0,GOSSIP_ICON_BATTLE},
        {MENU, "其他传送",            TPMENU+0xb0,GOSSIP_ICON_BATTLE},
        {MENU, "野外BOSS传送",        TPMENU+0xc0,GOSSIP_ICON_BATTLE},
    },
    [TPMENU+0x10]={--主要城市
        {TP, "暴风城", 0, -8842.09, 626.358, 94.0867, 3.61363,TEAM_ALLIANCE},
        {TP, "达纳苏斯", 1, 9869.91, 2493.58, 1315.88, 2.78897,TEAM_ALLIANCE},
        {TP, "铁炉堡", 0, -4900.47, -962.585, 501.455, 5.40538,TEAM_ALLIANCE},
        {TP, "埃索达", 530, -3864.92, -11643.7, -137.644, 5.50862,TEAM_ALLIANCE},
        {TP, "奥格瑞玛", 1, 1601.08, -4378.69, 9.9846, 2.14362,TEAM_HORDE},
        {TP, "雷霆崖",  1, -1274.45, 71.8601, 128.159, 2.80623,TEAM_HORDE},
        {TP, "幽暗城", 0, 1633.75, 240.167, -43.1034, 6.26128,TEAM_HORDE},
        {TP, "银月城", 530, 9738.28, -7454.19, 13.5605, 0.043914,TEAM_HORDE},
        {TP, "[诺森德]达拉然", 571, 5809.55, 503.975, 657.526, 2.38338},
        {TP, "[外域]沙塔斯", 530, -1887.62, 5359.09, -12.4279, 4.40435}, 
        {TP, "[中立]藏宝海湾",0, -14281.9, 552.564, 8.90422, 0.860144},
        {TP, "[中立]棘齿城",    1,    -955.21875,-3678.92,8.29946,    0},
        {TP, "[中立]加基森",    1,    -7122.79834,-3704.82,14.0526,    0},
    },
    [TPMENU+0x20]={--东部王国
        {TP, "艾尔文森林", 0,  -9449.06, 64.8392, 56.3581, 3.0704},
        {TP, "永歌森林", 530,  9024.37, -6682.55, 16.8973, 3.1413},
        {TP, "丹莫罗", 0,  -5603.76, -482.704, 396.98, 5.2349},
        {TP, "提瑞斯法林地", 0,  2274.95, 323.918, 34.1137, 4.2436},
        {TP, "幽魂之地", 530,  7595.73, -6819.6, 84.3718, 2.5656},
        {TP, "洛克莫丹", 0,  -5405.85, -2894.15, 341.972, 5.4823},
        {TP, "银松森林", 0,  505.126, 1504.63, 124.808, 1.7798},
        {TP, "西部荒野", 0,  -10684.9, 1033.63, 32.5389, 6.0738},
        {TP, "赤脊山", 0,  -9447.8, -2270.85, 71.8224, 0.28385},
        {TP, "暮色森林", 0,  -10531.7, -1281.91, 38.8647, 1.5695},
        {TP, "希尔斯布莱德丘陵", 0,  -385.805, -787.954, 54.6655, 1.0392},
        {TP, "湿地", 0,  -3517.75, -913.401, 8.86625, 2.6070},
        {TP, "奥特兰克山脉",0,  275.049, -652.044, 130.296, 0.50203},
        {MENU, "下一页", TPMENU+0x120,GOSSIP_ICON_CHAT},
    },
    [TPMENU+0x120]={--东部王国    2
        {TP, "阿拉希高地", 0,  -1581.45, -2704.06, 35.4168, 0.490373}, 
        {TP, "荆棘谷",  0,  -11921.7, -59.544, 39.7262, 3.7357},
        {TP, "荒芜之地", 0,  -6782.56, -3128.14, 240.48, 5.6591},
        {TP, "悲伤沼泽", 0,  -10368.6, -2731.3, 21.6537, 5.2923},
        {TP, "辛特兰", 0,  112.406, -3929.74, 136.358, 0.981903}, 
        {TP, "灼热峡谷",  0,  -6686.33, -1198.55, 240.027, 0.91688},
        {TP, "诅咒之地", 0,  -11184.7, -3019.31, 7.29238, 3.20542}, 
        {TP, "燃烧平原",  0,  -7979.78, -2105.72, 127.919, 5.10148},
        {TP, "西瘟疫之地", 0,    1743.69, -1723.86, 59.6648, 5.23722}, 
        {TP, "东瘟疫之地", 0,  2280.64, -5275.05, 82.0166, 4.747},
        {TP, "奎尔丹纳斯岛", 530,  12806.5, -6911.11, 41.1156, 2.2293},
    },
    [TPMENU+0x30]={--卡利姆多
        {TP, "秘蓝岛", 530, -4192.62, -12576.7, 36.7598, 1.62813},
        {TP, "秘血岛", 530, -2721.67, -12208.90, 9.08,     0},
        {TP, "达希尔", 1, 9889.03, 915.869, 1307.43, 1.9336},
        {TP, "杜隆塔尔", 1, 228.978, -4741.87, 10.1027, 0.416883},
        {TP, "莫高雷", 1, -2473.87, -501.225, -9.42465, 0.6525},
        {TP, "秘血岛", 530, -2095.7, -11841.1, 51.1557, 6.19288},
        {TP, "黑海岸", 1, 6463.25, 683.986, 8.92792, 4.33534},
        {TP, "贫瘠之地", 1, -575.772, -2652.45, 95.6384, 0.006469},
        {TP, "石爪山脉", 1, 1574.89, 1031.57, 137.442, 3.8013},
        {TP, "灰谷森林", 1, 1919.77, -2169.68, 94.6729, 6.14177},
        {TP, "千针石林", 1, -5375.53, -2509.2, -40.432, 2.41885},
        {TP, "凄凉之地", 1, -656.056, 1510.12, 88.3746, 3.29553},
        {TP, "尘泥沼泽", 1, -3350.12, -3064.85, 33.0364, 5.12666},
        {TP, "菲拉斯", 1, -4808.31, 1040.51, 103.769, 2.90655},
        {TP, "塔纳利斯沙漠", 1, -6940.91, -3725.7, 48.9381, 3.11174},
        {TP, "艾萨拉", 1, 3117.12, -4387.97, 91.9059, 5.49897},
        {TP, "费伍德森林", 1, 3898.8, -1283.33, 220.519, 6.24307},
        {TP, "安戈洛环形山", 1, -6291.55, -1158.62, -258.138, 0.457099},
        {TP, "希利苏斯", 1, -6815.25, 730.015, 40.9483, 2.39066},
        {TP, "冬泉谷", 1, 6658.57, -4553.48, 718.019, 5.18088},
    },
    [TPMENU+0x40]={--外域
        {TP, "地狱火半岛", 530, -207.335, 2035.92, 96.464, 1.59676},
        {TP, "地狱火半岛-荣耀堡",530,-683.05,2657.57,91.04,    0,TEAM_ALLIANCE},
        {TP, "地狱火半岛-萨尔玛",530,139.96,2671.51,85.509,    0,TEAM_HORDE},
        {TP, "赞加沼泽", 530, -220.297, 5378.58, 23.3223, 1.61718},
        {TP, "泰罗卡森林", 530, -2266.23, 4244.73, 1.47728, 3.68426},
        {TP, "纳格兰", 530, -1610.85, 7733.62, -17.2773, 1.33522}, 
        {TP, "刀锋山", 530, 2029.75, 6232.07, 133.495, 1.30395},
        {TP, "虚空风暴", 530, 3271.2, 3811.61, 143.153, 3.44101},
        {TP, "影月谷", 530, -3681.01, 2350.76, 76.587, 4.25995},
    },
    [TPMENU+0x50]={--诺森德
        {TP, "北风苔原", 571, 2954.24, 5379.13, 60.4538, 2.55544},
        {TP, "凛风峡湾", 571, 682.848, -3978.3, 230.161, 1.54207},
        {TP, "龙骨荒野", 571, 2678.17, 891.826, 4.37494, 0.101121},
        {TP, "灰熊丘陵", 571, 4017.35, -3403.85, 290, 5.35431},
        {TP, "祖达克", 571, 5560.23, -3211.66, 371.709, 5.55055},
        {TP, "索拉查盆地", 571, 5614.67, 5818.86, -69.722, 3.60807},
        {TP, "水晶之歌森林", 571, 5411.17, -966.37, 167.082, 1.57167},
        {TP, "风暴峭壁", 571, 6120.46, -1013.89, 408.39, 5.12322},
        {TP, "冰冠冰川", 571, 8323.28, 2763.5, 655.093, 2.87223},
        {TP, "冬拥湖", 571, 4522.23, 2828.01, 389.975, 0.215009},
    },
    [TPMENU+0x60]={--经典旧世界地下城
        {TP, "诺莫瑞根",0, -5163.54, 925.423, 257.181, 1.57423},
        {TP, "死亡矿井", 0, -11209.6, 1666.54, 24.6974, 1.42053},
        {TP, "暴风城监狱", 0, -8799.15, 832.718, 97.6348, 6.04085},
        {TP, "怒焰裂谷",  1, 1811.78, -4410.5, -18.4704, 5.20165},
        {TP, "剃刀高地",  1, -4657.3, -2519.35, 81.0529, 4.54808}, 
        {TP, "剃刀沼泽", 1, -4470.28, -1677.77, 81.3925, 1.16302}, 
        {TP, "血色修道院", 0, 2873.15, -764.523, 160.332, 5.10447},
        {TP, "影牙城堡", 0, -234.675, 1561.63, 76.8921, 1.24031},
        {TP, "哀嚎洞穴", 1, -731.607, -2218.39, 17.0281, 2.78486},
        {TP, "黑暗深渊", 1, 4249.99, 740.102, -25.671, 1.34062},
        {TP, "黑石深渊", 0, -7179.34, -921.212, 165.821, 5.09599}, 
        {TP, "黑石塔", 0, -7527.05, -1226.77, 285.732, 5.29626},
        {TP, "厄运之槌", 1, -3520.14, 1119.38, 161.025, 4.70454},
        {TP, "玛拉顿", 1, -1421.42, 2907.83, 137.415, 1.70718},
        {TP, "通灵学院", 0, 1269.64, -2556.21, 93.6088, 0.620623}, 
        {TP, "斯坦索姆", 0, 3352.92, -3379.03, 144.782, 6.25978}, 
        {TP, "沉没的神庙", 0, -10177.9, -3994.9, -111.239, 6.01885},
        {TP, "奥达曼",0, -6071.37, -2955.16, 209.782, 0.015708},
        {TP, "祖尔法拉克", 1, -6801.19, -2893.02, 9.00388, 0.158639},
    },
    [TPMENU+0x70]={--燃烧的远征地下城
        {TP, "奥金顿", 530, -3324.49, 4943.45, -101.239, 4.63901},
        {TP, "时光之穴", 1, -8369.65, -4253.11, -204.272, -2.70526},
        {TP, "盘牙水库", 530, 738.865, 6865.77, -69.4659, 6.27655},
        {TP, "地狱火堡垒", 530, -347.29, 3089.82, 21.394, 5.68114},
        {TP, "魔导师平台", 530, 12884.6, -7317.69, 65.5023, 4.799}, 
        {TP, "风暴要塞", 530, 3100.48, 1536.49, 190.3, 4.62226},
    },    
    [TPMENU+0x80]={--巫妖王之怒地下城
        {TP, "艾卓-尼鲁布", 571, 3707.86, 2150.23, 36.76, 3.22},
        {TP, "斯坦索姆的抉择", 1, -8756.39, -4440.68, -199.489, 4.66289},
        {TP, "冠军的试炼", 571, 8590.95, 791.792, 558.235, 3.13127},
        {TP, "达克萨隆堡垒", 571, 4765.59, -2038.24, 229.363, 0.887627},
        {TP, "古达克", 571, 6722.44, -4640.67, 450.632, 3.91123},
        {TP, "冰冠城塞", 571, 5643.16, 2028.81, 798.274, 4.60242},
        {TP, "魔枢", 571, 3782.89, 6965.23, 105.088, 6.14194},
        {TP, "紫罗兰监狱", 571, 5693.08, 502.588, 652.672, 4.0229},
        {TP, "闪电大厅", 571, 9136.52, -1311.81, 1066.29, 5.19113}, 
        {TP, "石头大厅", 571, 8922.12, -1009.16, 1039.56, 1.57044},
        {TP, "乌特加德城堡",571, 1203.41, -4868.59, 41.2486, 0.283237},
        {TP, "乌特加德之巅", 571, 1267.24, -4857.3, 215.764, 3.22768},
    },
    [TPMENU+0x90]={--团队地下城
        {TP, "黑暗神庙", 530, -3649.92, 317.469, 35.2827, 2.94285},
        {TP, "黑翼之巢", 229, 152.451, -474.881, 116.84, 0.001073},
        {TP, "海加尔山之巅", 1, -8177.89, -4181.23, -167.552, 0.913338}, 
        {TP, "毒蛇神殿", 530, 797.855, 6865.77, -65.4165, 0.005938},
        {TP, "十字军的试炼", 571, 8515.61, 714.153, 558.248, 1.57753},
        {TP, "格鲁尔的巢穴", 530, 3530.06, 5104.08, 3.50861, 5.51117},
        {TP, "玛瑟里顿的巢穴", 530, -336.411, 3130.46, -102.928, 5.20322}, 
        {TP, "冰冠城塞",571, 5855.22, 2102.03, 635.991, 3.57899},
        {TP, "卡拉赞", 0, -11118.9, -2010.33, 47.0819, 0.649895},
        {TP, "熔火之心", 230, 1126.64, -459.94, -102.535, 3.46095}, 
        {TP, "纳克萨玛斯", 571, 3668.72, -1262.46, 243.622, 4.785}, 
        {TP, "奥妮克希亚的巢穴", 1, -4708.27, -3727.64, 54.5589, 3.72786}, 
        {TP, "安其拉废墟", 1, -8409.82, 1499.06, 27.7179, 2.51868},
        {MENU, "下一页", TPMENU+0x190,GOSSIP_ICON_BATTLE},
    },
    [TPMENU+0x190]={--团队地下城2    
        {TP, "太阳井高地", 530, 12574.1, -6774.81, 15.0904, 3.13788}, 
        {TP, "风暴要塞",  530, 3088.49, 1381.57, 184.863, 4.61973},
        {TP, "安其拉神殿", 1, -8240.09, 1991.32, 129.072, 0.941603},
        {TP, "永恒之眼", 571, 3784.17, 7028.84, 161.258, 5.79993}, 
        {TP, "黑曜石圣殿", 571, 3472.43, 264.923, -120.146, 3.27923},
        {TP, "奥杜尔",571, 9222.88, -1113.59, 1216.12, 6.27549},
        {TP, "阿尔卡冯的宝库", 571, 5453.72, 2840.79, 421.28, 0},
        {TP, "祖尔格拉布", 0, -11916.7, -1215.72, 92.289, 4.72454},
        {TP, "祖阿曼",530, 6851.78, -7972.57, 179.242, 4.64691},
    },


    [TPMENU+0xa0]={--风景传送
        {TP, "GM之岛",            1, 16222.1,        16252.1,    12.5872,    0},
        {TP, "时光之穴",        1,-8173.93018,    -4737.46387,33.77735,    0},
        {TP, "双塔山",            1,-3331.35327,    2225.72827,    30.9877,    0},
        {TP, "梦境之树",        1,-2914.7561,    1902.19934,    34.74103,    0},
        {TP, "恐怖之岛",        1, 4603.94678,    -3879.25097,944.18347,    0},
        {TP, "天涯海滩",        1,-9851.61719,    -3608.47412,8.93973,    0},
        {TP, "安戈洛环形山",    1,-8562.09668,    -2106.05664,8.85254,    0},
        {TP, "石堡瀑布",        0,-9481.49316,    -3326.91528,8.86435,    0},
        {TP, "暴雪建设公司路障",1, 5478.06006,    -3730.8501,    1593.44,    0},
    },


    [TPMENU+0xb0]={--其他传送 
        {TP, "古拉巴什竞技场", 0, -13181.8, 339.356, 42.9805, 1.18013},
        --Alliance
        {TP, "奥特兰战场",0,    5.599396,-308.73822,132.26651,        0,TEAM_ALLIANCE},
        {TP, "阿拉希战场",0,    -1229.860352,-2545.07959,21.180079,    0,TEAM_ALLIANCE},
        --Horde
        {TP, "阿拉希战场",0,    -847.953491,-3519.764893,72.607727,    0,TEAM_HORDE},
        {TP, "奥特兰战场",0,    396.471863,-1006.229126,111.719086,    0,TEAM_HORDE},
        {TP, "战歌峡谷",  1,    1036.794800,-2106.138672,122.94553,    0,TEAM_HORDE},
    },
    [TPMENU+0xc0]={--野外BOSS传送
        {TP, "暮色森林",    0,-10526.16895,-434.996796,50.8948,    0},
        {TP, "辛特兰",    0,759.605713,-3893.341309,116.4753,    0},
        {TP, "灰谷",        1,3120.289307,-3439.444336,139.5663,0},
        {TP, "艾萨拉",    1,2622.219971,-5977.930176,100.5629,0},
        {TP, "菲拉斯",    1,-2741.290039,2009.481323,31.8773,    0},
        {TP, "诅咒之地",    0,-12234,-2474,-3,                    0},
        {TP, "水晶谷",    1,-6292.463379,1578.029053,0.1553,    0},
    },
    [MMENU+0x20]={--联盟职业技能训练师
        --Alliance
        {TP, "战士训练师",     0,-8682.700195, 322.091125, 109.437958,    0,TEAM_ALLIANCE},
        {TP, "圣骑士训练师",     0,-8573.793945, 877.343018, 106.519310,    0,TEAM_ALLIANCE},
        {TP, "死亡骑士训练师",     0,2365.21, -5658.35, 426.06,        0,TEAM_ALLIANCE},
        {TP, "萨满训练师",     0,-9032.573242, 545.842590, 72.160950,    0,TEAM_ALLIANCE},
        {TP, "猎人训练师",     0,-8422.097656, 550.078674, 95.448730,    0,TEAM_ALLIANCE},
        {TP, "德鲁伊训练师",    1, 7870.23, -2586.97, 486.95,            0,TEAM_ALLIANCE},
        {TP, "盗贼训练师",     0,-8751.876953, 381.321930, 101.056236,    0,TEAM_ALLIANCE},
        {TP, "法师训练师",    0,-9009.386719, 875.746765, 29.621387,    0,TEAM_ALLIANCE},
        {TP, "术士训练师",     0,-8972.834961, 1027.723511, 101.40416,    0,TEAM_ALLIANCE},
        {TP, "牧师训练师",     0,-8517.649414, 858.083801, 109.81385,     0,TEAM_ALLIANCE},
        --Horde
        {TP, "战士训练师",    1, 1971.24, -4805.08, 56.99,    0,TEAM_HORDE},
        {TP, "圣骑士训练师",1, 1936.14, -4138.31, 41.03,0,TEAM_HORDE},
        {TP, "死亡骑士训练师",0, 2365.21, -5658.35, 426.06,    0,TEAM_HORDE},
        {TP, "萨满训练师",    1, 1928.482, -4228.17, 42.3219,    0,TEAM_HORDE},
        {TP, "猎人训练师",    1, 2135.33, -4610.78, 54.3865,    0,TEAM_HORDE},
        {TP, "德鲁伊训练师",    1, 7870.23, -2586.97, 486.95,0,TEAM_HORDE},
        {TP, "盗贼训练师",    1, 1776.47, -4285.65, 7.44,        0,TEAM_HORDE},
        {TP, "法师训练师",    1, 1468.58, -4221.86, 59.22,    0,TEAM_HORDE},
        {TP, "术士训练师",    1, 1838.19, -4355.78, -14.71,    0,TEAM_HORDE},
        {TP, "牧师训练师",    1, 1454.71, -4179.42, 61.56,     0,TEAM_HORDE},
    },
    [MMENU+0x30]={--专业技能训练师
        --Alliance
        {TP, "武器训练师",     0,-8793.120117, 613.002991, 96.856400,    0,TEAM_ALLIANCE},
        {TP, "骑术训练师",     0,-9443.556641, -1388.178345, 46.9881,    0,TEAM_ALLIANCE},
        {TP, "飞行训练师",     530,-676.925598, 2730.669434, 93.9085,    0,TEAM_ALLIANCE},
        --Horde
        {TP, "武器训练师",    1, 2093.829346, -4821.349609, 24.382,    0,TEAM_HORDE},
        {TP, "骑术训练师",    530, 9268.768555, -7508.026367, 38.09,    0,TEAM_HORDE},
        {TP, "飞行训练师",     530,48.719337, 2741.370850, 85.255180,    0,TEAM_HORDE},
    },    
    [ENCMENU]={-- Enchanter 附魔
        {MENU, "主手",     ENCMENU+0x100,GOSSIP_ICON_TABARD},
        {MENU, "副手",     ENCMENU+0x200,GOSSIP_ICON_TABARD},
        {MENU, "远程",     ENCMENU+0x300,GOSSIP_ICON_TABARD},
        {MENU, "头盔",     ENCMENU+0x10,GOSSIP_ICON_TABARD},
		{MENU, "项链",     ENCMENU+0x20,GOSSIP_ICON_TABARD},
        {MENU, "肩甲",     ENCMENU+0x30,GOSSIP_ICON_TABARD},
        {MENU, "披风",     ENCMENU+0x40,GOSSIP_ICON_TABARD},
        {MENU, "胸甲",     ENCMENU+0x50,GOSSIP_ICON_TABARD},
        {MENU, "衬衣",     ENCMENU+0x60,GOSSIP_ICON_TABARD},
		{MENU, "战袍",     ENCMENU+0x70,GOSSIP_ICON_TABARD},
        {MENU, "护腕",     ENCMENU+0x80,GOSSIP_ICON_TABARD},
        {MENU, "手套",     ENCMENU+0x90,GOSSIP_ICON_TABARD},
        {MENU, "腰带",     ENCMENU+0xa0,GOSSIP_ICON_TABARD},
        {MENU, "裤子",     ENCMENU+0xb0,GOSSIP_ICON_TABARD},
        {MENU, "鞋子",     ENCMENU+0xc0,GOSSIP_ICON_TABARD},
		{MENU, "戒指",     ENCMENU+0xd0,GOSSIP_ICON_TABARD},
		{MENU, "饰品",     ENCMENU+0xe0,GOSSIP_ICON_TABARD},
    },
	
    [ENCMENU+0x100] = {-- 主手1
        {ENC, "攻强+110", 3827, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "法强+81", 3854, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "命中+25，爆击+25", 3788, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "破冰武器",  3239, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "邪恶武器",  1899, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "死亡霜冻",  3273, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "作战专家",  2675, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "生命偷取",  1898, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "生命护卫",  3241, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "巨人杀手",  3251, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "屠魔"    ,   912, EQUIPMENT_SLOT_MAINHAND},	
		{MENU, "下一页", ENCMENU+0x1100,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x1100]={-- 主手2
		{ENC, "狂暴"    ,  3789, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "斩杀"    ,  3225, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "猫鼬"    ,  2673, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "黑魔法"  ,  3790, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "精金神铁武器链", 3223, EQUIPMENT_SLOT_MAINHAND},--缴械时间-50%,招架+15
		{ENC, "泰坦神铁武器链", 3731, EQUIPMENT_SLOT_MAINHAND},--缴械时间-50%,命中+28
		{ENC, "毒皮毒药",  1003, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "速效药膏",  3769, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "致命药膏",  3771, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "致伤药膏",  3773, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "麻醉药膏",  3774, EQUIPMENT_SLOT_MAINHAND},
		{MENU, "下一页", ENCMENU+0x2100,GOSSIP_ICON_BATTLE},
    },		
    [ENCMENU+0x2100]={-- 主手3
		{ENC, "火舌武器",  3781, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "冰封武器",  3784, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "风怒武器",  3787, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "灼热武器",   803, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "冰冷武器",  1894, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "吸血 [75级]",  3870, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "利刃防护 [75级]", 3869, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "火焰石"  ,  3614, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "法术石"  ,  3620, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "暗影之油", 25, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰霜之油", 26, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰霜符文武器",  3322, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "清除主手武器附魔",-1,EQUIPMENT_SLOT_MAINHAND},
    },
    [ENCMENU+0x200]={-- 副手1
        {ENC, "攻强+110", 3827, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "法强+81", 3854, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "命中+25，爆击+25", 3788, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "防御+20", 1952, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "盾牌格挡+15", 2655, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "韧性+12", 3229, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "格挡值+36", 2653, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "强效护盾",  2720 , EQUIPMENT_SLOT_OFFHAND},
        {ENC, "破冰武器",  3239, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "作战专家",  2675, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "生命偷取",  1898, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "下一页", ENCMENU+0x1200,GOSSIP_ICON_BATTLE},
    },	
    [ENCMENU+0x1200]={-- 副手2
		{ENC, "生命护卫",  3241, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "巨人杀手",  3251, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "邪恶武器",  1899, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "屠魔"    ,   912, EQUIPMENT_SLOT_OFFHAND},	
		{ENC, "狂暴"    ,  3789, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "斩杀"    ,  3225, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "猫鼬"    ,  2673, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "黑魔法"  ,  3790, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "精金神铁武器链", 3223, EQUIPMENT_SLOT_OFFHAND},--缴械时间-50%,招架+15
		{ENC, "泰坦神铁武器链", 3731, EQUIPMENT_SLOT_OFFHAND},--缴械时间-50%,命中+28
		{ENC, "泰坦神铁盾刺 [70级]", 3748, EQUIPMENT_SLOT_OFFHAND},--格挡反伤45-67
		{MENU, "下一页", ENCMENU+0x2200,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x2200]={-- 副手3
		{ENC, "毒皮毒药",  1003, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "速效药膏",  3769, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "致命药膏",  3771, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "致伤药膏",  3773, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "麻醉药膏",  3774, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "火舌武器",  3781, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰封武器",  3784, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "风怒武器",  3787, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "火焰石"  ,  3614, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "法术石"  ,  3620, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "下一页", ENCMENU+0x3200,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x3200]={-- 副手4
		{ENC, "死亡霜冻",  3273, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "吸血 [75级]",  3870, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "利刃防护 [75级]", 3869, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "灼热武器",   803, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰冷武器",  1894, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "暗影之油", 25, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰霜之油", 26, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "冰霜符文武器", 3322, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "清除副手附魔",-1,EQUIPMENT_SLOT_OFFHAND},
    },
    [ENCMENU+0x300]={-- 远程
        {ENC, "攻强+110", 3827, EQUIPMENT_SLOT_RANGED},
        {ENC, "法强+81", 3854, EQUIPMENT_SLOT_RANGED},
        {ENC, "命中+25，爆击+25", 3788, EQUIPMENT_SLOT_RANGED},
        {ENC, "远程爆击+40 [70级]", 3608, EQUIPMENT_SLOT_RANGED},
        {ENC, "耐力+50",  3851, EQUIPMENT_SLOT_RANGED},
        {ENC, "破冰武器",  3239, EQUIPMENT_SLOT_RANGED},
		{ENC, "邪恶武器",  1899, EQUIPMENT_SLOT_RANGED},
		{ENC, "死亡霜冻",  3273, EQUIPMENT_SLOT_RANGED},
		{ENC, "作战专家",  2675, EQUIPMENT_SLOT_RANGED},
		{ENC, "速效药膏",  3769, EQUIPMENT_SLOT_RANGED},
		{ENC, "致命药膏",  3771, EQUIPMENT_SLOT_RANGED},
		{ENC, "致伤药膏",  3773, EQUIPMENT_SLOT_RANGED},
		{ENC, "麻醉药膏",  3774, EQUIPMENT_SLOT_RANGED},
		{ENC, "冰封武器",  3784, EQUIPMENT_SLOT_RANGED},
        {ENC, "清除远程武器附魔",-1,EQUIPMENT_SLOT_RANGED},
    },
    [ENCMENU+0x10] = { -- 帽子
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_HEAD},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_HEAD},
        {ENC, "耐力+30，冰抗+25 [80级]", 3812, EQUIPMENT_SLOT_HEAD},
        {ENC, "耐力+37，防御+20 [80级]", 3818, EQUIPMENT_SLOT_HEAD},
        {ENC, "耐力+30，韧性+25 [80级]", 3842, EQUIPMENT_SLOT_HEAD},
        {ENC, "攻强+50，爆击+20 [80级]", 3817, EQUIPMENT_SLOT_HEAD},
        {ENC, "攻强+50，韧性+20 [80级]", 3795, EQUIPMENT_SLOT_HEAD},
        {ENC, "法强+30，爆击+20 [80级]", 3820, EQUIPMENT_SLOT_HEAD},
        {ENC, "法强+29，韧性+20 [80级]", 3797, EQUIPMENT_SLOT_HEAD},
        {ENC, "法强+30，法力回复+10 [80级]", 3819, EQUIPMENT_SLOT_HEAD},
        {ENC, "清除头盔附魔",-1,EQUIPMENT_SLOT_HEAD},
    },
    [ENCMENU+0x20] = { -- 项链
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_NECK},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_NECK},
		{ENC, "生命回复+10", 2438, EQUIPMENT_SLOT_NECK},
        {ENC, "法力回复+8", 2381, EQUIPMENT_SLOT_NECK},
        {ENC, "韧性+20", 3245, EQUIPMENT_SLOT_NECK},
        {ENC, "防御+22", 1953, EQUIPMENT_SLOT_NECK},
        {ENC, "清除项链附魔",-1,EQUIPMENT_SLOT_NECK},
    },
    [ENCMENU+0x30] = { -- 肩部
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_SHOULDERS},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_SHOULDERS},
        {ENC, "法强+30", 2332, EQUIPMENT_SLOT_SHOULDERS},
        {ENC, "耐力+40", 3850, EQUIPMENT_SLOT_SHOULDERS},
        {ENC, "攻强+120,爆击+15 [铭文400]", 3835, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "法强+70 ,回蓝+8  [铭文400]", 3836, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "躲闪+60 ,防御+15 [铭文400]", 3837, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "法强+70 ,爆击+15 [铭文400]", 3838, EQUIPMENT_SLOT_SHOULDERS},
        {ENC, "清除肩甲附魔",-1,EQUIPMENT_SLOT_SHOULDERS},
    },
    [ENCMENU+0x40] = { -- 背部
        {ENC, "强化潜行，敏捷+10", 3256, EQUIPMENT_SLOT_BACK},
        {ENC, "精神+10，威胁-2%", 3296, EQUIPMENT_SLOT_BACK},
        {ENC, "防御+16", 1951, EQUIPMENT_SLOT_BACK},
        {ENC, "急速+23", 3831, EQUIPMENT_SLOT_BACK},
        {ENC, "护甲+225", 3294, EQUIPMENT_SLOT_BACK},
        {ENC, "敏捷+22", 1099, EQUIPMENT_SLOT_BACK},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_BACK},
        {ENC, "法术穿透+35", 3243, EQUIPMENT_SLOT_BACK},
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_BACK},
		{ENC, "法强+50,精神+20 [65级]", 3872, EQUIPMENT_SLOT_BACK},
		{ENC, "法强+50,耐力+30 [65级]", 3873, EQUIPMENT_SLOT_BACK},
		{ENC, "剑刃刺绣 [裁缝400]", 3730, EQUIPMENT_SLOT_BACK},--一定几率提升400攻强15秒
		{ENC, "黑光刺绣 [裁缝400]", 3728, EQUIPMENT_SLOT_BACK},--一定几率回复400法力值
		{ENC, "亮纹刺绣 [裁缝400]", 3722, EQUIPMENT_SLOT_BACK},--一定几率提升295法强15秒
		{ENC, "高弹力衬垫 [工程350]", 3605, EQUIPMENT_SLOT_BACK},--敏捷+23,降落伞
        {ENC, "清除披风附魔",-1,EQUIPMENT_SLOT_BACK},
    },
    [ENCMENU+0x50] = { -- 胸甲
		{ENC, "结界符文", 2791, EQUIPMENT_SLOT_CHEST},
        {ENC, "所有属性+10", 3832, EQUIPMENT_SLOT_CHEST},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_CHEST},
		{ENC, "法力+250", 3233, EQUIPMENT_SLOT_CHEST},
		{ENC, "生命回复+10", 2438, EQUIPMENT_SLOT_CHEST},
        {ENC, "法力回复+8", 2381, EQUIPMENT_SLOT_CHEST},
        {ENC, "韧性+20", 3245, EQUIPMENT_SLOT_CHEST},
        {ENC, "防御+22", 1953, EQUIPMENT_SLOT_CHEST},
        {ENC, "清除胸甲附魔",-1,EQUIPMENT_SLOT_CHEST},
    },
    [ENCMENU+0x60] = { -- 衬衣
        {ENC, "所有属性+10", 3832, EQUIPMENT_SLOT_BODY},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_BODY},
		{ENC, "法力+250", 3233, EQUIPMENT_SLOT_BODY},
		{ENC, "生命回复+10", 2438, EQUIPMENT_SLOT_BODY},
        {ENC, "法力回复+8", 2381, EQUIPMENT_SLOT_BODY},
        {ENC, "韧性+20", 3245, EQUIPMENT_SLOT_BODY},
        {ENC, "防御+22", 1953, EQUIPMENT_SLOT_BODY},
        {ENC, "清除衬衣附魔",-1,EQUIPMENT_SLOT_BODY},
    },
    [ENCMENU+0x70] = { -- 战袍
        {ENC, "所有属性+10", 3832, EQUIPMENT_SLOT_TABARD},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_TABARD},
		{ENC, "法力+250", 3233, EQUIPMENT_SLOT_TABARD},
		{ENC, "生命回复+10", 2438, EQUIPMENT_SLOT_TABARD},
        {ENC, "法力回复+8", 2381, EQUIPMENT_SLOT_TABARD},
        {ENC, "韧性+20", 3245, EQUIPMENT_SLOT_TABARD},
        {ENC, "防御+22", 1953, EQUIPMENT_SLOT_TABARD},
        {ENC, "清除战袍附魔",-1,EQUIPMENT_SLOT_TABARD},
    },
    [ENCMENU+0x80] = { -- 护腕
        {ENC, "耐力+40", 3850, EQUIPMENT_SLOT_WRISTS},
        {ENC, "法强+30", 2332, EQUIPMENT_SLOT_WRISTS},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_WRISTS},
        {ENC, "精准等级+15", 3231, EQUIPMENT_SLOT_WRISTS},
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_WRISTS},
        {ENC, "精神+18", 1147, EQUIPMENT_SLOT_WRISTS},
        {ENC, "智力+16", 1119, EQUIPMENT_SLOT_WRISTS},
        {ENC, "攻强+130 [制皮400]", 3756, EQUIPMENT_SLOT_WRISTS},
        {ENC, "法强+76  [制皮400]", 3758, EQUIPMENT_SLOT_WRISTS},
        {ENC, "耐力+102 [制皮400]", 3757, EQUIPMENT_SLOT_WRISTS},
        {ENC, "清除护腕附魔",-1,EQUIPMENT_SLOT_WRISTS},
    },
    [ENCMENU+0x90] = { -- 手套
        {ENC, "爆击+16", 3249, EQUIPMENT_SLOT_HANDS},
        {ENC, "威胁+2%，招架等级+10", 3253, EQUIPMENT_SLOT_HANDS},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_HANDS},
        {ENC, "法强+28", 3246, EQUIPMENT_SLOT_HANDS},
        {ENC, "增加敏捷+20", 3222, EQUIPMENT_SLOT_HANDS},
        {ENC, "命中等级+20", 3234, EQUIPMENT_SLOT_HANDS},
        {ENC, "精准等级+15", 3231, EQUIPMENT_SLOT_HANDS},
		{ENC, "采集 [熟练度+5]", 3238, EQUIPMENT_SLOT_HANDS},
		{ENC, "超级加速器 [工程400]", 3604, EQUIPMENT_SLOT_HANDS},
		{ENC, "手部火箭发射器 [工程400]", 3603, EQUIPMENT_SLOT_HANDS},
        {ENC, "清除手套附魔",-1,EQUIPMENT_SLOT_HANDS},
    },
    [ENCMENU+0xa0] = { -- 腰部
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_WAIST},
        {ENC, "生命+275", 3297, EQUIPMENT_SLOT_WAIST},
        {ENC, "法力回复+8", 2381, EQUIPMENT_SLOT_WAIST},
        {ENC, "韧性+20", 3245, EQUIPMENT_SLOT_WAIST},
        {ENC, "防御+22", 1953, EQUIPMENT_SLOT_WAIST},
        {ENC, "钴质破片炸弹 [工程350]", 3601, EQUIPMENT_SLOT_WAIST},
		{ENC, "电磁脉冲发生器 [工程350]", 3599, EQUIPMENT_SLOT_WAIST},
        {ENC, "清除腰带附魔",-1,EQUIPMENT_SLOT_WAIST},
    },
    [ENCMENU+0xb0] = { -- 腿部
        {ENC, "法强+30", 2332, EQUIPMENT_SLOT_LEGS},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_LEGS},
        {ENC, "全属性+10", 3832, EQUIPMENT_SLOT_LEGS},
		{ENC, "耐力+55,敏捷+22 [65级]", 3328, EQUIPMENT_SLOT_LEGS},
		{ENC, "攻强+75,爆击+22 [65级]", 3328, EQUIPMENT_SLOT_LEGS},
		{ENC, "法强+50,精神+20 [65级]", 3872, EQUIPMENT_SLOT_LEGS},
		{ENC, "法强+50,耐力+30 [65级]", 3873, EQUIPMENT_SLOT_LEGS},
        {ENC, "耐力+28,韧性+40 [80级]", 3853, EQUIPMENT_SLOT_LEGS},
        {ENC, "清除裤子附魔",-1,EQUIPMENT_SLOT_LEGS},
    },     
    [ENCMENU+0xc0] = { -- 脚部
		{ENC, "鞋垫", 2795, EQUIPMENT_SLOT_FEET},
        {ENC, "攻强+50", 3845, EQUIPMENT_SLOT_FEET},
        {ENC, "耐力+15，移动速度", 3232, EQUIPMENT_SLOT_FEET},
        {ENC, "敏捷+16", 983, EQUIPMENT_SLOT_FEET},
        {ENC, "精神+18", 1147, EQUIPMENT_SLOT_FEET},
        {ENC, "命中+12，爆击+12", 3826, EQUIPMENT_SLOT_FEET},
        {ENC, "耐力+22", 1075, EQUIPMENT_SLOT_FEET},
        {ENC, "硝化甘油推进器 [工程400]", 3606, EQUIPMENT_SLOT_FEET},
        {ENC, "清除靴子附魔",-1,EQUIPMENT_SLOT_FEET},
    },
    [ENCMENU+0xd0]={-- 戒指
        {ENC, "① 法力回复+8", 2381, EQUIPMENT_SLOT_FINGER1},
		{ENC, "① 生命回复+10", 2438, EQUIPMENT_SLOT_FINGER1},
        {ENC, "① 法强+23 [附魔400]", 3840, EQUIPMENT_SLOT_FINGER1},
        {ENC, "① 攻强+40 [附魔400]", 3839, EQUIPMENT_SLOT_FINGER1},
        {ENC, "① 耐力+30 [附魔400]", 3791, EQUIPMENT_SLOT_FINGER1},
        {ENC, "① 全属性+4 [附魔350]", 2931, EQUIPMENT_SLOT_FINGER1},
        {ENC, "② 法力回复+8", 2381, EQUIPMENT_SLOT_FINGER2},
		{ENC, "② 生命回复+10", 2438, EQUIPMENT_SLOT_FINGER2},
        {ENC, "② 法强+23 [附魔400]", 3840, EQUIPMENT_SLOT_FINGER2},
        {ENC, "② 攻强+40 [附魔400]", 3839, EQUIPMENT_SLOT_FINGER2},
        {ENC, "② 耐力+30 [附魔400]", 3791, EQUIPMENT_SLOT_FINGER2},
        {ENC, "② 全属性+4 [附魔350]", 2931, EQUIPMENT_SLOT_FINGER2},
        {ENC, "清除戒指①附魔",-1,EQUIPMENT_SLOT_FINGER1},
        {ENC, "清除戒指②附魔",-1,EQUIPMENT_SLOT_FINGER2},
    },
    [ENCMENU+0xe0]={-- 饰品
        {ENC, "① 法力回复+8", 2381, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "① 生命回复+10", 2438, EQUIPMENT_SLOT_TRINKET1},
        {ENC, "① 法术穿透+35", 3243, EQUIPMENT_SLOT_TRINKET1},
        {ENC, "① 急速+23", 3831, EQUIPMENT_SLOT_TRINKET1},
        {ENC, "① 耐力+30 [附魔400]", 3791, EQUIPMENT_SLOT_TRINKET1},
        {ENC, "① 全属性+4 [附魔350]", 2931, EQUIPMENT_SLOT_TRINKET1},
        {ENC, "② 法力回复+8", 2381, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "② 生命回复+10", 2438, EQUIPMENT_SLOT_TRINKET2},
        {ENC, "② 法术穿透+35", 3243, EQUIPMENT_SLOT_TRINKET2},
        {ENC, "② 急速+23", 3831, EQUIPMENT_SLOT_TRINKET2},
        {ENC, "② 耐力+30 [附魔400]", 3791, EQUIPMENT_SLOT_TRINKET2},
        {ENC, "② 全属性+4 [附魔350]", 2931, EQUIPMENT_SLOT_TRINKET2},
        {ENC, "清除饰品①附魔",-1,EQUIPMENT_SLOT_TRINKET1},
        {ENC, "清除饰品②附魔",-1,EQUIPMENT_SLOT_TRINKET2},
    },
}


local function Enchanting(player, EncSpell, Eid, money) --附魔 (玩家,附魔效果,附魔位置)
    local ID=Eid
    local Nowitem = player:GetEquippedItemBySlot(ID)--得到相应位置物品
	
    if (Nowitem and Eid )  then--存在物品
		if player:HasItem(ReqEnchantItem, ReqEnchantItemCount) then
			player:RemoveItem(ReqEnchantItem, ReqEnchantItemCount)
			--local WType = Nowitem:GetSubClass()--物品类型
			local WName = Nowitem:GetItemLink()--物品链接

			for solt=0,1 do
				local espellid=Nowitem:GetEnchantmentId(solt)
				if(espellid and espellid>0)then
					Nowitem:ClearEnchantment(solt)
					if(EncSpell<=0)then
						player:SendBroadcastMessage(WName.."已经清除附魔("..espellid..")")
					elseif(solt < 1 )then
						Nowitem:SetEnchantment(espellid, solt+1)
						break
					end
				end
			end
			if(EncSpell>0)then
				Nowitem:SetEnchantment(EncSpell, 0)
				player:CastSpell(player, 36937)
				player:SendBroadcastMessage(WName.."已经附魔。")
				player:SetHealth(player:GetMaxHealth())--回复生命
				return true
			end
		else
			player:SendAreaTriggerMessage("附魔失败,需要:["..GetItemLink(ReqEnchantItem,4).." x "..ReqEnchantItemCount.."]材料不足")
			player:SendBroadcastMessage("附魔失败,需要:["..GetItemLink(ReqEnchantItem,4).." x "..ReqEnchantItemCount.."]材料不足。")
		end
    else
        player:SendNotification("你身上没有装备相应的物品")
    end
    return false
end


function Stone.AddGossip(player, item, id)
    player:GossipClearMenu()--清除菜单
    local Rows=Menu[id] or {}
    local Pteam=player:GetTeam()
    local teamStr,team="",player:GetTeam()
    if(team==TEAM_ALLIANCE)then
        teamStr    ="[|cFF0070d0联盟|r]"
    elseif(team==TEAM_HORDE)then 
        teamStr    ="[|cFFF000A0部落|r]"
    end
    for k, v in pairs(Rows) do 
        local mtype,text,icon,intid=v[1],( v[2] or "???" ), (v[4] or GOSSIP_ICON_CHAT), (id*0x100+k)
        if(mtype==MENU)then
            player:GossipMenuAddItem(icon, text, 0, (v[3] or id )*0x100)
        elseif(mtype==FUNC or mtype==ENC)then
            local code,msg,money=v[5],(v[6]or ""), (v[7] or 0)
            if(mtype==ENC)then
                icon=GOSSIP_ICON_TABARD
            end
            if((code==true or code ==false))then
                player:GossipMenuAddItem(icon, text, money, intid, code, msg, money)
            else
                player:GossipMenuAddItem(icon, text, 0, intid)
            end
        elseif(mtype==TP)then
            local mteam=v[8] or TEAM_NONE
            if(mteam==Pteam)then
                player:GossipMenuAddItem(GOSSIP_ICON_TAXI, teamStr..text, 0, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",0)
            elseif(mteam ==TEAM_NONE)then
                player:GossipMenuAddItem(GOSSIP_ICON_TAXI, text, 0, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",0)
            end
        elseif(mtype==INSMRST)then
			local icode,imsg,imapid,idiff,imoney=v[5],(v[6]or ""),(v[3]or 0),(v[4]or 0), (v[7] or 0)
			if((icode==true or icode ==false))then
                player:GossipMenuAddItem(icon, text, imapid, intid, icode, imsg, imoney)
            else
                player:GossipMenuAddItem(icon, text, 0, intid)
            end
		else
            player:GossipMenuAddItem(icon, text, 0, intid)
        end
    end
    if(id > 0)then--添加返回上一页菜单
        local length=string.len(string.format("%x",id))
        if(length>1)then
            local temp=bit_and(id,2^((length-1)*4)-1)
            if(temp ~= MMENU)then
                player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"上一页", 0,temp*0x100)
            end
        end
    end
    if(id ~= MMENU)then--添加返回主菜单
        player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"主菜单", 0, MMENU*0x100)
    else
        if(player:GetGMRank()>=3)then--是GM
            player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"GM功能", 0, GMMENU*0x100)
        end
        player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "在线总时间：|cFF000080"..Stone.GetTimeASString(player).."|r", 0, MMENU*0x100)
    end


    player:GossipSendMenu(1, item)--发送菜单
end

function Player:AddInstanceMenu()--添加已绑定副本菜单
	Menu[INSTANCESMENU]={}
	local instancelist = self:LoadInstancesALLFromDB()
		if instancelist then
			for k, v in pairs(instancelist) do 
				if(v)then
						---1---------1---------230---------0
						---GUID---instenceid---mapid-----diff
					--print("k "..k..":"..v[1]..":"..v[2]..":"..v[3]..":"..v[4])
					for kkk, vvv in pairs(Instances) do 
						if (v[3]==vvv[1]) and (v[4]==vvv[2]) then
							Menu[INSTANCESMENU][k] = {INSMRST, "解绑["..vvv[3].."]\n需要:"..GetItemLink(vvv[4],4).." x "..vvv[5],         v[3],        v[4], false,"是否解除指定副本?"}
						end
					end
				end
			end
		end
end

function Stone.ShowGossip(event, player, item)
    player:MoveTo(0,player:GetX(),player:GetY(),player:GetZ()+0.01)--移动就停止当前施法
	player:AddInstanceMenu()
    Stone.AddGossip(player, item, MMENU)
	
end

function Stone.SelectGossip(event, player, item, sender, intid, code, menu_id)
    local menuid=math.modf(intid/0x100)    --菜单组
    local rowid    =intid-menuid*0x100        --第几项

    if(rowid== 0)then
        Stone.AddGossip(player, item, menuid)
    else
        player:GossipComplete()    --关闭菜单
        local v=Menu[menuid] and Menu[menuid][rowid]
        if(v)then                        --如果找到菜单项
            local mtype=v[1] or MENU
            if(mtype==MENU)then
                Stone.AddGossip(player, item, (v[3] or MMENU))
            elseif(mtype==FUNC)then                    --功能
                local f=v[3]
                if(f)then
                    player:ModifyMoney(-sender)        --扣费
                    f(player, code)
                end
            elseif(mtype==ENC)then
                local spellId,equipId=v[3],v[4]
                Enchanting(player, spellId, equipId, 0)
                Stone.AddGossip(player, item, menuid)
            elseif(mtype==TP)then                    --传送
                local map,mapid,x,y,z,o=v[2],v[3],v[4], v[5], v[6],v[7] or 0
                local pname=player:GetName()--得到玩家名
                if(player:Teleport(mapid,x,y,z,o,TELE_TO_GM_MODE))then--传送
                    Nplayer=GetPlayerByName(pname)--根据玩家名得到玩家
                    if(Nplayer)then
                        Nplayer:SendBroadcastMessage("已经到达 "..map)
                        Nplayer:ModifyMoney(-sender)--扣费
                    end
                else
                    print(">>Eluna Error: Teleport Stone : Teleport To "..mapid)
                end
            elseif(mtype==INSMRST)then
				local vv = Menu[menuid][rowid]
				if vv then
					--print(vv[1]..":"..vv[2]..":"..vv[3]..":"..vv[4])
					for kkkk, vvvv in pairs(Instances) do 
						if (vv[3]==vvvv[1]) and (vv[4]==vvvv[2]) then
							if vv[3]==sender then
								local nowmap=player:GetMapId()
								if(sender~=nowmap)then
									local ReqItemID = vvvv[4]
									local ReqItemCount= vvvv[5]
									if player:HasItem(ReqItemID, ReqItemCount) then
										player:RemoveFromGroup() --移除队伍，防止未知错误
										player:RemoveItem(ReqItemID, ReqItemCount)
										player:UnbindInstance(vv[3],vv[4])
										player:SendAreaTriggerMessage(vv[2].."成功")
										player:SendBroadcastMessage(vv[2].."成功。")
									else
										player:SendAreaTriggerMessage(vv[2].."失败,".."材料不足")
										player:SendBroadcastMessage(vv[2].."失败,".."材料不足。")
									end
								else
									player:SendBroadcastMessage("你所在的当前副本无法解除绑定。")
								end
							else
								player:SendAreaTriggerMessage(vv[2].."失败")
								player:SendBroadcastMessage(vv[2].."失败。")
							end
						end
					end

				end
			end
        end
    end
end


RegisterItemGossipEvent(itemEntry, 1, Stone.ShowGossip)
RegisterItemGossipEvent(itemEntry, 2, Stone.SelectGossip)   