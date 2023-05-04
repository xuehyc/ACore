--https://uiwow.com/thread-16746-1-1.html?_dsign=9cb08609
--[[信息：
	超级炉石  （Teleport stone）
	修改日期：2021-01-20
	功能：除了传送，还有召唤NPC，其他更多功能
]]--
--print(">>Script: TeleportStone loading...OK")

--菜单所有者 --默认炉石6948
local itemEntry	=6948
--阵营
local TEAM_ALLIANCE=0
local TEAM_HORDE=1
--菜单号
local MMENU=1
local TPMENU=2
local GMMENU=3
local ENCMENU=4
local TBMENU=5
local SYMENU=6
local BUYMENU=7
--菜单类型
local FUNC=1
local MENU=2
local TP=3
local ENC=4

--GOSSIP_ICON 菜单图标
local GOSSIP_ICON_CHAT            = 0                    -- 对话
local GOSSIP_ICON_VENDOR          = 1                    -- 货物
local GOSSIP_ICON_TAXI            = 2                    -- 传送
local GOSSIP_ICON_TRAINER         = 3                    -- 训练（书）
local GOSSIP_ICON_INTERACT_1      = 4                    -- 复活
local GOSSIP_ICON_INTERACT_2      = 5                    -- 设为我的家
local GOSSIP_ICON_MONEY_BAG   	  = 6                    -- 钱袋
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

local playerTeleportPoints = {}

local Instances={--副本表
		{249,0},{249,1},{269,1},{309,0},
		{409,0},{469,0},
		{509,0},{531,0},{532,0},{533,0},{533,1},
		{534,0},{540,1},{542,1},{543,1},{544,0},{545,1},{546,1},{547,1},{548,0},
		{550,0},{552,1},{553,1},{554,1},{555,1},{556,1},{557,1},{558,1},
		{560,1},{564,0},{565,0},{568,0},
		{574,1},{575,1},{576,1},{578,1},
		{580,0},{585,1},{595,1},{598,1},{599,1},
		{600,1},{601,1},{602,1},{603,0},{603,1},{604,1},{608,1},
		{615,0},{615,1},{616,0},{616,1},{619,1},{624,0},{624,1},
		{631,0},{631,1},{631,2},{631,3},{632,1},
		{649,0},{649,1},{649,2},{649,3},--十字军的试炼
		{650,1},{658,1},{668,1},
		{724,0},{724,1},{724,2},{724,3},
}
--随身NPC
local ST={
	TIME=60,
	NPCID501=28703,--商业技能训练师
	NPCID501A=33630,--商业技能训练师
	NPCID502=28694,--商业技能训练师
	NPCID503=28693,--商业技能训练师
	NPCID503A=33633,--商业技能训练师
	NPCID504=28697,--商业技能训练师
	NPCID505=28704,--商业技能训练师
	NPCID506=28702,--商业技能训练师
	NPCID507=28701,--商业技能训练师
	NPCID508=28700,--商业技能训练师
	NPCID509=28698,--商业技能训练师
	NPCID510=28696,--商业技能训练师
	NPCID511=28699,--商业技能训练师
	NPCID512=28705,--商业技能训练师
	NPCID513=28706,--商业技能训练师
	NPCID514=28742,--商业技能训练师
	--结束商业技能
    --{guid,npc,time},
	NPCID601=35364,--部落锁定经验
	NPCID601A=35365,--联盟锁定经验
	NPCID602=90003,--幻化大师
}
function ST.SummonNPCblsd(player)--经验锁定NPC
	ST.SummonNPC(player, ST.NPCID601)
end
function ST.SummonNPClmsd(player)--经验锁定NPC
	ST.SummonNPC(player, ST.NPCID601A)
end
function ST.SummonNPCds(player)--幻化大师
	ST.SummonNPC(player, ST.NPCID602)
end
function ST.SummonNPC(player, entry)
	local guid=player:GetGUIDLow()
	local lastTime,nowTime=(ST[guid] or 0),os.time()

	if(player:IsInCombat())then
    player:SendAreaTriggerMessage("不能在战斗中召唤。")
        --if(language==cn)then  --尝试失败,会导致脚本用不了
		    --player:SendAreaTriggerMessage("不能在战斗中召唤。")--中文版输出
        --if(language==en)then
            --player:SendAreaTriggerMessage("Can not summon in battle.")--英文版输出
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
					player:SendAreaTriggerMessage("召唤成功。")
					NPC:SetFacingToObject(player)
					NPC:SendUnitSay(string.format("%s,我响应你的召唤，从远方来到你的身边。请问你需要什么？",player:GetName()),0)
					lastTime=os.time()+ST.TIME
				else
					player:SendAreaTriggerMessage("召唤失败。")
				end
			end
		else
			player:SendAreaTriggerMessage("召唤NPC不能太频繁。")
		end
	end
	ST[guid]=lastTime
end


		--{FUNC, "召唤传家宝商人", 	    ST.SummonNPCcj,	    GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤战士雕文商人", 	ST.SummonNPCwor,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤小德雕文商人", 	ST.SummonNPChun,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤萨满雕文商人", 	ST.SummonNPCsha,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤骑士雕文商人", 	ST.SummonNPCkni,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤牧师雕文商人", 	ST.SummonNPCpri,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤圣骑雕文商人", 	ST.SummonNPCwar,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤盗贼雕文商人", 	ST.SummonNPCrog,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤法师雕文商人", 	ST.SummonNPCmag,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤小德雕文商人", 	ST.SummonNPCdru,	GOSSIP_ICON_VENDOR},
		--{FUNC, "召唤死骑雕文商人", 	ST.SummonNPCdk,	    GOSSIP_ICON_VENDOR},

function ST.SummonNPC_4001001(player)
	ST.SummonNPC(player, 190001)
end
function ST.SummonNPC_4001002(player)
	ST.SummonNPC(player, 190002)
end
function ST.SummonNPC_4001003(player)
	ST.SummonNPC(player, 190003)
end
function ST.SummonNPC_4001004(player)
	ST.SummonNPC(player, 190004)
end
function ST.SummonNPC_4001005(player)
	ST.SummonNPC(player, 190005)
end
function ST.SummonNPC_4001006(player)
	ST.SummonNPC(player, 190006)
end
function ST.SummonNPC_4001007(player)
	ST.SummonNPC(player, 190007)
end
function ST.SummonNPC_4001008(player)
	ST.SummonNPC(player, 190008)
end
function ST.SummonNPC_4001009(player)
	ST.SummonNPC(player, 190009)
end
function ST.SummonNPC_4001010(player)
	ST.SummonNPC(player, 190010)
end
function ST.SummonNPC_4001011(player)
	ST.SummonNPC(player, 190011)
end

--联盟技能训练师
function ST.SummonNPC_1zs(player)
	ST.SummonNPC(player, 5479)
end
function ST.SummonNPC_1qs(player)
	ST.SummonNPC(player, 928)
end
function ST.SummonNPC_1dk(player)
	ST.SummonNPC(player, 29194)
end
function ST.SummonNPC_1sm(player)
	ST.SummonNPC(player, 20407)
end
function ST.SummonNPC_1lr(player)
	ST.SummonNPC(player, 5515)
end
function ST.SummonNPC_1xd(player)
	ST.SummonNPC(player, 12042)
end
function ST.SummonNPC_1dz(player)
	ST.SummonNPC(player, 918)
end
function ST.SummonNPC_1fs(player)
	ST.SummonNPC(player, 5498)
end
function ST.SummonNPC_1ss(player)
	ST.SummonNPC(player, 5495)
end
function ST.SummonNPC_1ms(player)
	ST.SummonNPC(player, 376)
end

--部落技能训练师
function ST.SummonNPC_2zs(player)
	ST.SummonNPC(player, 3354)
end
function ST.SummonNPC_2qs(player)
	ST.SummonNPC(player, 23128)
end
function ST.SummonNPC_2dk(player)
	ST.SummonNPC(player, 29194)
end
function ST.SummonNPC_2sm(player)
	ST.SummonNPC(player, 13417)
end
function ST.SummonNPC_2lr(player)
	ST.SummonNPC(player, 3352)
end
function ST.SummonNPC_2xd(player)
	ST.SummonNPC(player, 12042)
end
function ST.SummonNPC_2dz(player)
	ST.SummonNPC(player, 3401)
end
function ST.SummonNPC_2fs(player)
	ST.SummonNPC(player, 5882)
end
function ST.SummonNPC_2ss(player)
	ST.SummonNPC(player, 3324)
end
function ST.SummonNPC_2ms(player)
	ST.SummonNPC(player, 5994)
end

--商业技能师
function ST.SummonNPCAlchemy(player)
	ST.SummonNPC(player, ST.NPCID501)
	ST.SummonNPC(player, ST.NPCID501A)
end

function ST.SummonNPCBlacksmithing(player)
	ST.SummonNPC(player, ST.NPCID502)
end

function ST.SummonNPCEnchanting(player)
	ST.SummonNPC(player, ST.NPCID503)
	ST.SummonNPC(player, ST.NPCID503A)
end

function ST.SummonNPCEngineering(player)
	ST.SummonNPC(player, ST.NPCID504)
end

function ST.SummonNPCHerbalism(player)
	ST.SummonNPC(player, ST.NPCID505)
end

function ST.SummonNPCInscription(player)
	ST.SummonNPC(player, ST.NPCID506)
end

function ST.SummonNPCJewelcrafting(player)
	ST.SummonNPC(player, ST.NPCID507)
end

function ST.SummonNPCLeatherworking(player)
	ST.SummonNPC(player, ST.NPCID508)
end

function ST.SummonNPCMining(player)
	ST.SummonNPC(player, ST.NPCID509)
end

function ST.SummonNPCSkinning(player)
	ST.SummonNPC(player, ST.NPCID510)
end

function ST.SummonNPCTailoring(player)
	ST.SummonNPC(player, ST.NPCID511)
end

function ST.SummonNPCCooking(player)
	ST.SummonNPC(player, ST.NPCID512)
end

function ST.SummonNPCFirstAid(player)
	ST.SummonNPC(player, ST.NPCID513)
end

function ST.SummonNPCFishing(player)
	ST.SummonNPC(player, ST.NPCID514)
end
		-- {FUNC, "召唤炼金训练师", 	ST.SummonNPCAlchemy,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤锻造训练师", 	ST.SummonNPCBlacksmithing,	GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤附魔训练师", 	ST.SummonNPCEnchanting,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤工程训练师", 	ST.SummonNPCEngineering,	GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤草药训练师", 	ST.SummonNPCHerbalism,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤铭文训练师", 	ST.SummonNPCInscription,	GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤珠宝训练师", 	ST.SummonNPCJewelcrafting,	GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤皮甲训练师", 	ST.SummonNPCLeatherworking,	GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤采矿训练师", 	ST.SummonNPCMining,	        GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤剥皮训练师", 	ST.SummonNPCSkinning,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤裁缝训练师", 	ST.SummonNPCTailoring,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤烹饪训练师", 	ST.SummonNPCCooking,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤急救训练师", 	ST.SummonNPCFirstAid,	    GOSSIP_ICON_TRAINER},
		-- {FUNC, "召唤钓鱼训练师", 	ST.SummonNPCFishing,	    GOSSIP_ICON_TRAINER},
local function ResetPlayer(player, flag, text)
	player:SetAtLoginFlag(flag)
	player:SendAreaTriggerMessage("返回角色选择或者重新登录角色，即可进行修改"..text.."。")
	--player:SendAreaTriggerMessage("正在返回选择角色菜单")
end

local Stone={
	GetTimeASString=function(player)
		local inGameTime=player:GetTotalPlayedTime()
		local days=math.modf(inGameTime/(24*3600))
		local hours=math.modf((inGameTime-(days*24*3600))/3600)
		local mins=math.modf((inGameTime-(days*24*3600+hours*3600))/60)
		return days.."天"..hours.."时"..mins.."分"
	end,
	GoHome=function(player)--穿越回去
		player:CastSpell(player,8690,true)
		player:ResetSpellCooldown(8690, true)
		player:SendBroadcastMessage("已经穿越回来了")
	end,
	GoSelectPlayer=function(player)--传送到所选队友那里
        local target=player:GetSelection()
        if(target)then
            local x,y,z,mapId,areaId=target:GetX(),target:GetY(),target:GetZ(),target:GetMapId(),player:GetAreaId()
            player:SendBroadcastMessage("马上瞬移到 "..target:GetName().." 身边去.")
            if(player:Teleport(mapId,x,y,z,0,TELE_TO_GM_MODE))then--传送
                player:SendBroadcastMessage("你瞬移到了"..target:GetName().."身边。")
            else
                print(">>Eluna Error: Teleport Stone : Teleport To "..mapId..","..x..","..y..","..z)
            end
        else
            player:SendBroadcastMessage("请选中一个目标玩家。")
        end
    end,
	SetHome=function(player)--记录当前位置
		local x,y,z,mapId,areaId=player:GetX(),player:GetY(),player:GetZ(),player:GetMapId(),player:GetAreaId()
		player:SetBindPoint(x,y,z,mapId,areaId)
		player:SendBroadcastMessage("已经记录当前位置")
	end,

	OpenBank=function(player)--打开银行
		player:SendShowBank(player)
		player:SendBroadcastMessage("已经打开银行")
	end,
	OpenMailBox=function(player)--打开邮箱
		player:SendShowMailBox(player:GetGUID())
		player:SendBroadcastMessage("已经打开邮箱")
	end,
	WeakOut=function(player)--移除复活虚弱
		if(player:HasAura(15007))then
			player:RemoveAura(15007)	--移除复活虚弱
			player:SetHealth(player:GetMaxHealth())
			--self:RemoveAllAuras()	--移除所有状态
			player:SendBroadcastMessage("你的身上的复活虚弱状态已经被移除。")
		else
			player:SendBroadcastMessage("你的身上没有复活虚弱状态。")
			player:ModifyMoney(20000)--返还
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

	WSkillsToMax=function(player)--武器熟练度
		player:AdvanceSkillsToMax()
		player:SendBroadcastMessage("当前武器熟练度已经达到最大值")
	end,

	MaxHealth=function(player)	--回复生命
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
	

	UnBind=function(player)	--副本解绑
		local nowmap=player:GetMapId()
		for k, v in pairs(Instances) do
			local mapid=v[1]
			if(mapid~=nowmap)then
				player:UnbindInstance(v[1],v[2])
			else
				player:SendBroadcastMessage("你所在的当前副本无法解除绑定。")
			end
		end
		player:SendAreaTriggerMessage("已经解除所有副本的绑定。")
		player:SendBroadcastMessage("已经解除所有副本的绑定。")
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
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x8, "容貌")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetRace=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x80, "种族")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetFaction=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x40, "阵营")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetSpell=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x2, "所有法术")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end
	end,

	TBPoint1=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][1] = playerTeleportPoints[pGuid][1] or {}
		playerTeleportPoints[pGuid][1] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定1号坐标。")
	end,

	TTPoint1=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][1]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(10000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功。")
	end,

	TBPoint2=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][2] = playerTeleportPoints[pGuid][2] or {}
		playerTeleportPoints[pGuid][2] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定2号坐标。")
	end,

	TTPoint2=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][2]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(20000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功。")
	end,

	TBPoint3=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][3] = playerTeleportPoints[pGuid][3] or {}
		playerTeleportPoints[pGuid][3] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定3号坐标。")
	end,

	TTPoint3=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][3]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(30000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功。")
	end,

	TBPoint4=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][4] = playerTeleportPoints[pGuid][4] or {}
		playerTeleportPoints[pGuid][4] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定4号坐标。")
	end,

	TTPoint4=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][4]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(40000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功。")
	end,

	TBPoint5=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][5] = playerTeleportPoints[pGuid][5] or {}
		playerTeleportPoints[pGuid][5] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定5号坐标。")
	end,

	TTPoint5=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][5]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(50000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功。")
	end,

	SY01=function(player)--商业技能熟练度
		if player:HasSpell( 50310 ) then
			player:SendBroadcastMessage("你的采矿专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2575)
			player:LearnSpell(2576)
			player:LearnSpell(3564)
			player:LearnSpell(10248)
			player:LearnSpell(29354)
			player:LearnSpell(50310)
			player:AdvanceSkill(186, 450)--1
    end,

	SY02=function(player)--商业技能熟练度
        if player:HasSpell( 50300 ) then
			player:SendBroadcastMessage("你的草药学专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2366)
			player:LearnSpell(2368)
			player:LearnSpell(3570)
			player:LearnSpell(11993)
			player:LearnSpell(28695)
			player:LearnSpell(50300)
			player:AdvanceSkill(182, 450)--2
    end,

	SY03=function(player)--商业技能熟练度
        if player:HasSpell( 50305 ) then
			player:SendBroadcastMessage("你的剥皮专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(8613)
			player:LearnSpell(8617)
			player:LearnSpell(8618)
			player:LearnSpell(10768)
			player:LearnSpell(32678)
			player:LearnSpell(50305)
			player:AdvanceSkill(393, 450)--3
    end,

	SY04=function(player)--商业技能熟练度
        if player:HasSpell( 51306 ) then
			player:SendBroadcastMessage("你的工程学专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(4036)
			player:LearnSpell(4037)
			player:LearnSpell(4038)
			player:LearnSpell(12656)
			player:LearnSpell(30350)
			player:LearnSpell(51306)
			player:AdvanceSkill(202, 450)--4
    end,

	SY05=function(player)--商业技能熟练度
        if player:HasSpell( 51304 ) then
			player:SendBroadcastMessage("你的炼金专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2259)
			player:LearnSpell(3101)
			player:LearnSpell(3464)
			player:LearnSpell(11611)
			player:LearnSpell(28596)
			player:LearnSpell(51304)
			player:AdvanceSkill(171, 450)--5
    end,

	SY06=function(player)--商业技能熟练度
        if player:HasSpell( 51302 ) then
			player:SendBroadcastMessage("你的制皮专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2108)
			player:LearnSpell(3104)
			player:LearnSpell(3811)
			player:LearnSpell(10662)
			player:LearnSpell(32549)
			player:LearnSpell(51302)
			player:AdvanceSkill(165, 450)--6
    end,

	SY07=function(player)--商业技能熟练度
        if player:HasSpell( 51309 ) then
			player:SendBroadcastMessage("你的裁缝专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(3908)
			player:LearnSpell(3909)
			player:LearnSpell(3910)
			player:LearnSpell(12180)
			player:LearnSpell(26790)
			player:LearnSpell(51309)
			player:AdvanceSkill(197, 450)--7
    end,

	SY08=function(player)--商业技能熟练度
        if player:HasSpell( 51300 ) then
			player:SendBroadcastMessage("你的锻造专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2018)
			player:LearnSpell(3100)
			player:LearnSpell(3538)
			player:LearnSpell(9785)
			player:LearnSpell(29844)
			player:LearnSpell(51300)
			player:AdvanceSkill(164, 450)--8
    end,

	SY09=function(player)--商业技能熟练度
        if player:HasSpell( 51313 ) then
			player:SendBroadcastMessage("你的附魔专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(7411)
			player:LearnSpell(7412)
			player:LearnSpell(7413)
			player:LearnSpell(13920)
			player:LearnSpell(28029)
			player:LearnSpell(51313)
			player:AdvanceSkill(333, 450)--9
    end,

	SY10=function(player)--商业技能熟练度
       if player:HasSpell( 51311 ) then
			player:SendBroadcastMessage("你的珠宝专业已满。")
			player:ModifyMoney(3000000)--返还
		return
	end
			player:LearnSpell(25229)
			player:LearnSpell(25230)
			player:LearnSpell(28894)
			player:LearnSpell(28895)
			player:LearnSpell(28897)
			player:LearnSpell(51311)
			player:AdvanceSkill(755, 450)--10
    end,

	SY11=function(player)--商业技能熟练度
        if player:HasSpell( 45363 ) then
			player:SendBroadcastMessage("你的铭文专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(45357)
			player:LearnSpell(45358)
			player:LearnSpell(45359)
			player:LearnSpell(45360)
			player:LearnSpell(45361)
			player:LearnSpell(45363)
			player:AdvanceSkill(773, 450)--11
    end,

	SY12=function(player)--商业技能熟练度
        if player:HasSpell( 51296 ) then
			player:SendBroadcastMessage("你的烹饪专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2550)
			player:LearnSpell(3102)
			player:LearnSpell(3413)
			player:LearnSpell(18260)
			player:LearnSpell(33359)
			player:LearnSpell(51296)
			player:AdvanceSkill(185, 450)--12
    end,

	SY13=function(player)--商业技能熟练度
        if player:HasSpell( 45542 ) then
			player:SendBroadcastMessage("你的急救专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(3273)
			player:LearnSpell(3274)
			player:LearnSpell(7924)
			player:LearnSpell(10846)
			player:LearnSpell(27028)
			player:LearnSpell(45542)
			player:AdvanceSkill(129, 450)--13
    end,

	SY14=function(player)--商业技能熟练度
		if player:HasSpell( 51294 ) then
			player:SendBroadcastMessage("你的钓鱼专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(7620)
			player:LearnSpell(7731)
			player:LearnSpell(7732)
			player:LearnSpell(18248)
			player:LearnSpell(33095)
			player:LearnSpell(51294)
			player:AdvanceSkill(356, 450)--14
    end,
}

local Menu={
    --中文版
	[MMENU]={--主菜单
		{MENU, "|TInterface/ICONS/Spell_Arcane_PortalIronForge:35:35|t地图传送", 	TPMENU,			GOSSIP_ICON_BATTLE},
		{MENU, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000副本传送", 	TPMENU+0xe0,			GOSSIP_ICON_BATTLE},
		{MENU, "|TInterface/ICONS/INV_Misc_Rune_01:35:35|t|cff0000ff炉石功能", 	TBMENU,	GOSSIP_ICON_TAXI,},
		{MENU, "|TInterface/ICONS/Spell_Arcane_Rune:35:35|t|cFF9932CC技能训练|r", 	TBMENU+0x20,	GOSSIP_ICON_VENDOR},
		{MENU, "|TInterface/ICONS/INV_Misc_Book_09:35:35|t|cFFB22222双重附魔|r",		ENCMENU,		GOSSIP_ICON_TRAINER},
		{MENU, "|TInterface/ICONS/INV_Misc_Book_09:35:35|t|c00722FFF其他功能",		MMENU+0x10,		GOSSIP_ICON_TABARD},--cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别
		{MENU, "|TInterface/ICONS/INV_Misc_Book_09:35:35|tGM|cFF548B54※|r功能",		GMMENU,		GOSSIP_ICON_TABARD},
		{TP,   "|TInterface/ICONS/Achievement_Reputation_08:35:35|t|cffff0000商业中心|r(|cff0000ff商人广场|r)", 1, -8545.5, 2005.471, 100.349, 1,	TEAM_NONE},
	},
    [TBMENU]={--炉石功能
	    {FUNC, "|TInterface/ICONS/Achievement_Reputation_08:35:35|t目标瞬移",   Stone.GoSelectPlayer,	GOSSIP_ICON_TAXI,          false,"是否瞬移到目标身边 ?"},
		{FUNC, "|TInterface/ICONS/INV_Misc_Rune_02:35:35|t记录炉石", 	Stone.SetHome,	GOSSIP_ICON_TAXI,          false,"是否记录当前|cFFF0F000位置|r ?"},
		{FUNC, "|TInterface/ICONS/INV_Misc_Rune_01:35:35|t炉石传回", 	Stone.GoHome,	GOSSIP_ICON_TAXI,		  false,"是否穿越回|cFFF0F000记录位置|r ?"},
		{MENU, "|TInterface/ICONS/INV_Misc_Rune_06:35:35|t|cFFB22222定点传送|r", 	 TBMENU+0x10,			GOSSIP_ICON_TAXI},
	},	
	[TBMENU+0x10]={--定点传送
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportStormWind:35:35|t定1号点",		Stone.TBPoint1,	GOSSIP_ICON_TAXI,	false,"是否记录当前|cFFF0F000位置|r 1号点传回1金1次?"},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_PortalShattrath:35:35|t传到1号点 1金/次",	    Stone.TTPoint1,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ?",10000},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportTheramore:35:35|t定2号点",		Stone.TBPoint2,	GOSSIP_ICON_TAXI,	false,"是否记录当前|cFFF0F000位置|r 2号点传回2金1次?"},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_PortalStonard:35:35|t传到2号点 2金/次",	    Stone.TTPoint2,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ?",20000},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportThunderBluff:35:35|t定3号点",		Stone.TBPoint3,	GOSSIP_ICON_TAXI,	false,"是否记录当前|cFFF0F000位置|r 3号点传回3金1次?"},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_PortalTheramore:35:35|t传到3号点 3金/次",	    Stone.TTPoint3,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ?",30000},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportUnderCity:35:35|t定4号点",		Stone.TBPoint4,	GOSSIP_ICON_TAXI,	false,"是否记录当前|cFFF0F000位置|r 4号点传回4金1次?"},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t传到4号点 4金/次",	    Stone.TTPoint4,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ?",40000},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportStonard:35:35|t定5号点",		Stone.TBPoint5,	GOSSIP_ICON_TAXI,	false,"是否记录当前|cFFF0F000位置|r 5号点传回5金1次?"},
		{FUNC, "|TInterface/ICONS/Spell_Arcane_PortalUnderCity:35:35|t传到5号点 5金/次",	    Stone.TTPoint5,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ?",50000},	--增加收费金额参数,默认情况下失败也会扣金币，因此在失败时返还金币，在游戏里也不会出现减钱再加钱
	},
	[TBMENU+0x20]={--技能训练
	    {FUNC, "|TInterface/ICONS/Spell_Arcane_Rune:35:35|t【|cFFB22222幻化大师|r】", 	ST.SummonNPCds,	GOSSIP_ICON_TRAINER},
		{MENU, "|TInterface/ICONS/Spell_Arcane_Rune:35:35|t【|cFFB22222随身商人|r】", 	BUYMENU+0x10,	GOSSIP_ICON_VENDOR},
		{MENU,  "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t【|cff0000ff职业训练】",    				MMENU+0x20,		TEAM_ALLIANCE,GOSSIP_ICON_TAXI},
		{MENU,  "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t【|cffff0000商业训练】",    				MMENU+0x30,		GOSSIP_ICON_TAXI},
		{MENU, "|TInterface/ICONS/Spell_Arcane_Rune:35:35|t【|cff0000ff商业技能满级|r】", 	SYMENU,	GOSSIP_ICON_VENDOR},	
		},
	[MMENU+0x10]={--其他功能
		{FUNC, "|TInterface/ICONS/Spell_Holy_PowerWordBarrier:35:35|t立刻满血",	Stone.MaxHealth,	GOSSIP_ICON_TRAINER,	false,"确认回复生命?"},
		{FUNC, "|TInterface/ICONS/Spell_Shadow_MindTwisting:35:35|t强制脱离战斗", 	Stone.OutCombat,GOSSIP_ICON_CHAT},
		{FUNC, "|TInterface/ICONS/Spell_Deathknight_ClassIcon:35:35|t武器熟练度",	Stone.WSkillsToMax,	GOSSIP_ICON_TRAINER,	false,"确认武器熟练度?"},
		{FUNC, "|TInterface/ICONS/Spell_Shadow_DeathScream:35:35|t解除虚弱", 		Stone.WeakOut,		GOSSIP_ICON_INTERACT_1, false,"是否解除虚弱，并回复生命 ?",20000},
		{FUNC, "|TInterface/ICONS/INV_Sword_116:35:35|t修理装备",	    Stone.RepairAll,	GOSSIP_ICON_MONEY_BAG,	false,"需要花费金币修理装备 ?"},
		{FUNC, "|TInterface/ICONS/Spell_Holy_HolyGuidance:35:35|t【|cff0000ff联盟锁经验|r】", 	ST.SummonNPClmsd, GOSSIP_ICON_TAXI},
	    {FUNC, "|TInterface/ICONS/Spell_Holy_DevineAegis:35:35|t【|cFFB22222部落锁经验|r】", 	ST.SummonNPCblsd, GOSSIP_ICON_TAXI},
		{FUNC, "|TInterface/ICONS/INV_Misc_Coin_02:35:35|t在线银行", 		Stone.OpenBank,	GOSSIP_ICON_VENDOR},
		{FUNC, "|TInterface/ICONS/INV_Letter_06:35:35|t空中邮箱", 		Stone.OpenMailBox,	GOSSIP_ICON_CHAT},
		{FUNC, "|TInterface/ICONS/Spell_Frost_WindWalkOn:35:35|t重置宠物天赋",	Stone.ResetPetTalents,	GOSSIP_ICON_TRAINER,	false,"确认重置宠物天赋?"},
	},

	[SYMENU]={
		{FUNC, "|TInterface/ICONS/Trade_Mining:35:35|t|cFFB22222提升采矿450级",		Stone.SY01,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00采矿|r技能？",3000000},--增加收费金额参数,默认情况下失败也会扣金币，因此在失败时返还金币，在游戏里也不会出现减钱再加钱
		{FUNC, "|TInterface/ICONS/Trade_Herbalism:35:35|t|cFFB22222提升草药450级",		Stone.SY02,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00草药|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/INV_Misc_LeatherScrap_01:35:35|t|cFFB22222提升剥皮450级",		Stone.SY03,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00剥皮|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_Engineering:35:35|t|cFFB22222提升工程450级",		Stone.SY04,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00工程|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_Alchemy:35:35|t|cFFB22222提升炼金450级",		Stone.SY05,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00炼金|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_LeatherWorking:35:35|t|cFFB22222提升制皮450级",		Stone.SY06,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00制皮|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_Tailoring:35:35|t|cFFB22222提升裁缝450级",		Stone.SY07,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00裁缝|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_BlackSmithing:35:35|t|cFFB22222提升锻造450级",		Stone.SY08,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00锻造|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_Engraving:35:35|t|cFFB22222提升附魔450级",		Stone.SY09,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00附魔|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/INV_Misc_Gem_02:35:35|t|cFFB22222提升珠宝450级",		Stone.SY10,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00珠宝|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/INV_Scroll_11:35:35|t|cFFB22222提升铭文450级",		Stone.SY11,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00铭文|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Achievement_WorldEvent_Thanksgiving:35:35|t|cFFB22222提升烹饪到450级",		Stone.SY12,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00烹饪|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Spell_Holy_SealOfSacrifice:35:35|t|cFFB22222提升急救450级",		Stone.SY13,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00急救|r技能？",3000000},
		{FUNC, "|TInterface/ICONS/Trade_Fishing:35:35|t|cFFB22222提升钓鱼450级",		Stone.SY14,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00钓鱼|r技能？",3000000},
	},

	[GMMENU]={--GM菜单
		{FUNC, "|TInterface/ICONS/ABILITY_SEAL:35:35|t修改名字",		Stone.ResetName,	GOSSIP_ICON_CHAT,		false,"是否修改名字？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/Ability_Rogue_Disguise:35:35|t改变容貌",		Stone.ResetFace,	GOSSIP_ICON_CHAT,		false,"是否重置容貌？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/Ability_Mage_TormentOfTheWeak:35:35|t变更种族",		Stone.ResetRace,	GOSSIP_ICON_CHAT,		false,"是否变更种族？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/Ability_Creature_Cursed_04:35:35|t叛变阵营",		Stone.ResetFaction,	GOSSIP_ICON_CHAT,		false,"是否叛变阵营？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		--{FUNC, "|TInterface/ICONS/Spell_Shadow_MindTwisting:35:35|t重置天赋",	Stone.ResetTalents,	GOSSIP_ICON_TRAINER,	false,"确认重置天赋?"},
		--{FUNC, "|TInterface/ICONS/Spell_Frost_Stun:35:35|t重置副本",	Stone.UnBind,	GOSSIP_ICON_TRAINER,	false,"确认重置副本?"},
		--{FUNC, "|TInterface/ICONS/Spell_Holy_BorrowedTime:35:35|t重置冷却",	Stone.ResetAllCD,		GOSSIP_ICON_INTERACT_1,	false,"确认重置所有冷却 ?"},
		{FUNC, "|TInterface/ICONS/Ability_Ambush:35:35|t保存角色", 		Stone.SaveToDB,			GOSSIP_ICON_INTERACT_1},
		{FUNC, "|TInterface/ICONS/Ability_Ambush:35:35|t返回选择角色", 	Stone.Logout,			GOSSIP_ICON_INTERACT_1,	false,"返回选择角色界面 ?"},
		{FUNC, "|TInterface/ICONS/Ability_Ambush:35:35|t|cFF800000不保存角色|r",Stone.LogoutNosave,GOSSIP_ICON_INTERACT_1,false,"|cFFFF0000不保存角色，并返回选择角色界面 ?|r"},
	},

	[TPMENU+0xe0]={--副本传送
		{MENU,  "|TInterface/ICONS/Achievement_Arena_2v2_7:35:35|t|cFF9932CC战场传送",						TPMENU+0xb0,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_Magtheridon:35:35|t|cFFA52A2A经典旧世副本",	TPMENU+0x70,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_Illidan:35:35|t|cFFA52A2A燃烧远征副本",	TPMENU+0x80,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_LichKing:35:35|t|cFFA52A2A巫妖王副本",	TPMENU+0x90,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_Sindragosa:35:35|t|cFFA52A2A团队副本",			TPMENU+0xa0,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/INV_Misc_ShadowEgg:35:35|t野外BOSS传送",						TPMENU+0xd0,	GOSSIP_ICON_BATTLE},
	},	
	[TPMENU]={--主菜单
		{MENU,	"|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff城市传送",							TPMENU+0x10,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Mail_GMIcon:35:35|t|cff0000ff初始之地",						TPMENU+0x20,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_EasternKingdoms_01:35:35|t|cff00ccff东部王国",							TPMENU+0x30,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Kalimdor_01:35:35|t|cffff6060卡利姆多",							TPMENU+0x40,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Outland_01:35:35|t|cFF7FFF00外域地图",								TPMENU+0x50,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Northrend_01:35:35|t|cFF00008B诺森德地图",							TPMENU+0x60,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t风景传送",							TPMENU+0xc0,	GOSSIP_ICON_BATTLE},
	},

	[TPMENU+0x10]={--主要城市
	    {TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城",			0,		-8832.833,	633.1505,	94.2408,	1.70201,	TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡",			0,		-4926.76,	-949.64,	501.559,	2.24414,	TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯",		1,		9869.91,	2493.58,	1315.88,	2.78897,	TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达",			530,	-3864.92,	-11643.7,	-137.644,	5.50862,	TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛",		1,		1601.08,	-4378.69,	9.9846,		2.14362,	TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城",			0,		1633.75,	240.167,	-43.1034,	6.26128,	TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖",			1,		-1274.45,	71.8601,	128.159,	2.80623,	TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城",			530,	9738.28,	-7454.19,	13.5605,	0.043914,	TEAM_HORDE},
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t|cff00ff00沙塔斯城",	530,	-1887.62,	5359.09,	-12.4279,	4.40435,	TEAM_NONE,	60,	50000},--增加显示此菜单等级，传送使用金币
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t|cff00ff00达拉然",	571,	5809.55,	503.975,	657.526,	2.38338,	TEAM_NONE,	70,	100000},
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t|cFF9932CC藏宝海湾",	0,		-14281.9,	552.564,	8.90422,	0.860144,	TEAM_NONE,	35,	20000},
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t棘齿城",	1,		-955.219,	-3678.92,	8.29946,	0,			TEAM_NONE,	10,	20000},
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t加基森",	1,		-7122.8,	-3704.82,	14.0526,	0,			TEAM_NONE,	30,	20000},
	    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t永望镇",	1,		6724.58,	-4609.16,	720.597,	4.87852,	TEAM_NONE,	55,	20000},--永望镇这么重要也不加一个？

	},

	[TPMENU+0x20]={--各种族出生地
	    {TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t人类出生地",		0,		-8949.95,	-132.493,	83.5312,	0,			TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t矮人出生地",		0,		-6240.32,	331.033,	382.758,	6.1,		TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t侏儒出生地",		0,		-6240,		331,		383,		0,			TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t暗夜精灵出生地",	1,		10311.3,	832.463,	1326.41,	5.6,		TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t德莱尼出生地",	530,	-3961.64,	-13931.2,	100.615,	2,			TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t兽人出生地",		1,		-618.518,	-4251.67,	38.718,		0,			TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t巨魔出生地",		1,		-618.518,	-4251.67,	38.7,		4.747,		TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t牛头人出生地",	1,		-2917.58,	-257.98,	52.9968,	0,			TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t亡灵出生地",		0,		1676.71,	1678.31,	121.67,		2.70526,	TEAM_HORDE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t血精灵出生地",	530,	10349.6,	-6357.29,	33.4026,	5.31605,	TEAM_HORDE},
		{TP, "|cFF006400[中立]|r|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t死亡骑士出生地",	609,	2355.84,	-5664.77,	426.028,	3.65997,	TEAM_NONE,	55,	0},
	},

	[TPMENU+0x30]={--东部王国
	    {TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林",		0,		-9449.06,	64.8392,	56.3581,	3.0704,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林",		530,	9024.37,	-6682.55,	16.8973,	3.1413,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗",			0,		-5603.76,	-482.704,	396.98,		5.2349,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地",	0,		2274.95,	323.918,	34.1137,	4.2436,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹",		0,		-5405.85,	-2894.15,	341.972,	5.4823,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地",		530,	7595.73,	-6819.6,	84.3718,	2.5656,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野",		0,		-10684.9,	1033.63,	32.5389,	6.0738,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林",		0,		505.126,	1504.63,	124.808,	1.7798,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山",			0,		-9447.8,	-2270.85,	71.8224,	0.28385,	TEAM_NONE,	15,	20000},--官服坐飞机都是2G起，所以并不贵
	    {TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林",		0,		-10531.7,	-1281.91,	38.8647,	1.5695,		TEAM_NONE,	18,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地",			0,		-3517.75,	-913.401,	8.86625,	2.607,		TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵",	0,		-385.805,	-787.954,	54.6655,	1.0392,		TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t奥特兰克山脉",	0,		275.049,	-652.044,	130.296,	0.50203,	TEAM_NONE,	25,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地",		0,		-1581.45,	-2704.06,	35.4168,	0.490373,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷",			0,		-11921.7,	-59.544,	39.7262,	3.7357,		TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地",		0,		-6782.56,	-3128.14,	240.48,		5.6591,		TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽",		0,		-10368.6,	-2731.3,	21.6537,	5.2923,		TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰",			0,		112.406,	-3929.74,	136.358,	0.981903,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷",		0,		-6686.33,	-1198.55,	240.027,	0.91688,	TEAM_NONE,	43,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地",		0,		-11184.7,	-3019.31,	7.29238,	3.20542,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原",		0,		-7979.78,	-2105.72,	127.919,	5.10148,	TEAM_NONE,	50,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地",		0,		1743.69,	-1723.86,	59.6648,	5.23722,	TEAM_NONE,	51,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地",		0,		2280.64,	-5275.05,	82.0166,	4.747,		TEAM_NONE,	53,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛",	530,	12806.5,	-6911.11,	41.1156,	2.2293,		TEAM_NONE,	68,	50000},
	},

	[TPMENU+0x40]={--卡利姆多
	    {TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛",			530,	-4192.62,	-12576.7,	36.7598,	1.62813,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛",			530,	-2095.7,	-11841.1,	51.1557,	6.19288,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔",		1,		9889.03,	915.869,	1307.43,	1.9336,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔",		1,		228.978,	-4741.87,	10.1027,	0.416883,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷",			1,		-2473.87,	-501.225,	-9.42465,	0.6525,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸",			1,		6463.25,	683.986,	8.92792,	4.33534,	TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地",		1,		-1028.95,	-2462.17,	91.6679,	5.83412,	TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉",		1,		1574.89,	1031.57,	137.442,	3.8013,		TEAM_NONE,	15,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷",		1,		1919.77,	-2169.68,	94.6729,	6.14177,	TEAM_NONE,	18,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林",		1,		-5375.53,	-2509.2,	-40.432,	2.41885,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地",		1,		-656.056,	1510.12,	88.3746,	3.29553,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽",		1,		-3350.12,	-3064.85,	33.0364,	5.12666,	TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯",			1,		-4808.31,	1040.51,	103.769,	2.90655,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯",	1,		-6940.91,	-3725.7,	48.9381,	3.11174,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉",			1,		3117.12,	-4387.97,	91.9059,	5.49897,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林",		1,		3898.8,		-1283.33,	220.519,	6.24307,	TEAM_NONE,	48,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山",	1,		-6291.55,	-1158.62,	-258.138,	0.457099,	TEAM_NONE,	48,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯",		1,		-6815.25,	730.015,	40.9483,	2.39066,	TEAM_NONE,	50,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷",			1,		6658.57,	-4553.48,	718.019,	5.18088,	TEAM_NONE,	55,	20000},
	},

	[TPMENU+0x50]={--外域
	    {TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛",		530,	-207.335,	2035.92,	96.464,		1.59676,	TEAM_NONE,	60,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽",		530,	-220.297,	5378.58,	23.3223,	1.61718,	TEAM_NONE,	62,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林",		530,	-2266.23,	4244.73,	1.47728,	3.68426,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰",			530,	-1610.85,	7733.62,	-17.2773,	1.33522,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山",			530,	2029.75,	6232.07,	133.495,	1.30395,	TEAM_NONE,	66,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴",		530,	3271.2,		3811.61,	143.153,	3.44101,	TEAM_NONE,	68,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷",			530,	-3681.01,	2350.76,	76.587,		4.25995,	TEAM_NONE,	68,	50000},
	},

	[TPMENU+0x60]={--诺森德
	    {TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原",		571,	2954.24,	5379.13,	60.4538,	2.55544,	TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾",		571,	682.848,	-3978.3,	230.161,	1.54207,	TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野",		571,	2678.17,	891.826,	4.37494,	0.101121,	TEAM_NONE,	71,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵",		571,	4017.35,	-3403.85,	290,		5.35431,	TEAM_NONE,	73,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克",			571,	5560.23,	-3211.66,	371.709,	5.55055,	TEAM_NONE,	74,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地",		571,	5614.67,	5818.86,	-69.722,	3.60807,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶格森林",	571,	5411.17,	-966.37,	167.082,	1.57167,	TEAM_NONE,	74,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁",		571,	6120.46,	-1013.89,	408.39,		5.12322,	TEAM_NONE,	76,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川",		571,	8323.28,	2763.5,		655.093,	2.87223,	TEAM_NONE,	77,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖",			571,	4522.23,	2828.01,	389.975,	0.215009,	TEAM_NONE,	77,	100000},
	},

	[TPMENU+0x70]={--经典旧世界地下城★
	    {TP, "|TInterface/ICONS/Spell_Shadow_DestructiveSoul:35:35|t怒焰裂谷",		1,		1811.78,	-4410.5,	-18.4704,	5.20165,	TEAM_NONE,	8,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Boss_Bazil_Thredd:35:35|t死亡矿井",		0,		-11209.6,	1666.54,	24.6974,	1.42053,	TEAM_NONE,	10,	1000},
	    {TP, "|TInterface/ICONS/Ability_Warlock_ChaosBolt.:35:35|t哀号洞穴",		1,		-731.607,	-2218.39,	17.0281,	2.78486,	TEAM_NONE,	10,	20000},
	    {TP, "|TInterface/ICONS/INV_Misc_Head_Gnoll_01:35:35|t影牙城堡",		0,		-234.675,	1561.63,	76.8921,	1.24031,	TEAM_NONE,	10,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Boss_EdwinVancleef:35:35|t暴风监狱",		0,		-8799.15,	832.718,	97.6348,	6.04085,	TEAM_NONE,	15,	20000},
	    {TP, "|TInterface/ICONS/INV_SpiritShard_01:35:35|t剃刀沼泽",		1,		-4470.28,	-1677.77,	81.3925,	1.16302,	TEAM_NONE,	17,	20000},
	    {TP, "|TInterface/ICONS/Spell_Frost_FireResistanceTotem:35:35|t黑暗深渊",		1,		4249.99,	740.102,	-25.671,	1.34062,	TEAM_NONE,	19,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Character_Gnome_Male:35:35|t诺莫瑞根",		0,		-5163.54,	925.423,	257.181,	1.57423,	TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/INV_Misc_Idol_01:35:35|t血色修道院",		0,		2873.15,	-764.523,	160.332,	5.10447,	TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/Spell_Nature_EyeOfTheStorm:35:35|t剃刀高地",		1,		-4657.3,	-2519.35,	81.0529,	4.54808,	TEAM_NONE,	25,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t奥达曼",			0,		-6071.37,	-2955.16,	209.782,	0.015708,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/INV_Misc_ClothScrap_05:35:35|t玛拉顿",			1,		-1421.42,	2907.83,	137.415,	1.70718,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Spell_Frost_ChillingBlast:35:35|t祖尔法拉克",		1,		-6801.19,	-2893.02,	9.00388,	0.158639,	TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/INV_Misc_Statue_08:35:35|t沉没的神庙",		0,		-10177.9,	-3994.9,	-111.239,	6.01885,	TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Spell_Frost_FireResistanceTotem:35:35|t黑石深渊",		0,		-7179.34,	-921.212,	165.821,	5.09599,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Spell_Nature_UnleashedRage:35:35|t黑石塔",			0,		-7527.05,	-1226.77,	285.732,	5.29626,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/INV_Jewelcrafting_EmeraldCrab:35:35|t厄运之槌",		1,		-3520.14,	1119.38,	161.025,	4.70454,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Spell_DeathKnight_ArmyOfTheDead:35:35|t通灵学院",		0,		1269.64,	-2556.21,	93.6088,	0.620623,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Ability_Mount_Undeadhorse:35:35|t斯坦索姆",		0,		3352.92,	-3379.03,	144.782,	6.25978,	TEAM_NONE,	45,	20000},
	},

	[TPMENU+0x80]={--燃烧的远征地下城★
	    {TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火城墙",	530,	-360.671,	3071.90,	-15.1,		1.883,		TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/ABILITY_MAGE_INVISIBILITY:35:35|t盘牙水库",		530,	797.855,	6865.77,	-65.4165,	0.005938,	TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/INV_1H_Auchindoun_01:35:35|t奥金顿",		530,	-3362.165,	4826.771,	-101.396,	4.73,		TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t时光之穴",	        	1,		-8756.39,	-4440.68,	-199.489,	4.66289,		TEAM_NONE,	66,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴",		        530,	3281.65,	1408.55,	502.413,	5.22,		TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t魔导师平台",				530,	12884.6,	-7317.69,	65.5023,	4.799,		TEAM_NONE,	68,	100000},
	},

	[TPMENU+0x90]={--巫妖王之怒地下城★
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_UtgardeKeep_Heroic:35:35|t乌特加德堡",	571,	1203.41,	-4868.59,	41.2486,	0.283237,	TEAM_NONE,	65,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_Nexus70_Heroic:35:35|t魔枢",			571,	3782.89,	6965.23,	105.088,	6.14194,	TEAM_NONE,	66,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_AzjolLowercity_Heroic:35:35|t艾卓-尼鲁布",		571,	3707.86,	2150.23,	36.76,		3.22,		TEAM_NONE,	67,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t达克萨隆要塞",	571,	4765.59,	-2038.24,	229.363,	0.887627,	TEAM_NONE,	69,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_TheVioletHold_Heroic:35:35|t紫罗兰监狱",		571,	5693.08,	502.588,	652.672,	4.0229,		TEAM_NONE,	70,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_Gundrak_Heroic:35:35|t古达克",			571,	6722.44,	-4640.67,	450.632,	3.91123,	TEAM_NONE,	71,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_11:35:35|t岩石大厅",		571,	8922.12,	-1009.16,	1039.56,	1.57044,	TEAM_NONE,	72,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_CoTStratholme_Heroic:35:35|t净化斯坦索姆",	1,		-8756.39,	-4440.68,	-199.489,	4.66289,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_12:35:35|t闪电大厅",		571,	9136.52,	-1311.81,	1066.29,	5.19113,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_UtgardePinnacle_Heroic:35:35|t乌特加德之巅",	571,	1267.24,	-4857.3,	215.764,	3.22768,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_01:35:35|t映像大厅",        571, 5643.16, 2028.81, 798.274, 4.60242,  TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Reputation_ArgentChampion:35:35|t冠军试炼",		571,	8590.95,	791.792,	558.235,	3.13127,	TEAM_NONE,	80,	100000},
	},

	[TPMENU+0xa0]={--团队地下城★
	    {TP, "|TInterface/ICONS/Inv_Helm_Mask_ZulGurub_D_01:35:35|t祖尔格拉布",		0,		-11916.7,	-1215.72,	92.289,		4.72454,	TEAM_NONE,	50,	100000},
	    {TP, "|TInterface/ICONS/INV_Weapon_Halberd_AhnQiraj:35:35|t安其拉废墟",		1,		-8409.82,	1499.06,	27.7179,	2.51868,	TEAM_NONE,	50,	100000},
	    {TP, "|TInterface/ICONS/Ability_Druid_ChallangingRoar:35:35|t熔火之心",		230,	1126.64,	-459.94,	-102.535,	3.46095,	TEAM_NONE,	50,	100000},
	    {TP, "|TInterface/ICONS/INV_Axe_37:35:35|t安其拉神殿",		1,		-8240.09,	1991.32,	129.072,	0.941603,	TEAM_NONE,	50,	100000},
	    {TP, "|TInterface/ICONS/Ability_Warlock_Backdraft:35:35|t黑翼之巢",		229,	152.451,	-474.881,	116.84,		0.001073,	TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/Spell_Misc_EmotionAngry:35:35|t戈鲁尔之巢",	530,	3530.06,	5104.08,	3.50861,	5.51117,	TEAM_NONE,	65,	100000},
		{TP, "|TInterface/ICONS/Achievement_Boss_Magtheridon:35:35|t玛瑟里顿的巢穴",	530,	-336.411,	3130.46,	-102.928,	5.20322,	TEAM_NONE,	65,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Boss_PrinceMalchezaar_02:35:35|t卡拉赞",			0,		-11105.9,	-2000.33,	49.4819,	0.649895,	TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/INV_Offhand_ZulAman_D_02:35:35|t祖阿曼",			530,	6851.78,	-7972.57,	179.242,	4.64691,	TEAM_NONE,	68,	100000},
		{TP, "|TInterface/ICONS/Achievement_Boss_CThun:35:35|t黑暗神殿",		530,	-3649.92,	317.469,	35.2827,	2.94285,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/INV_Offhand_Hyjal_D_01:35:35|t海加尔山",	1,		-8177.89,	-4181.23,	-167.552,	0.913338,	TEAM_NONE,	70,	100000},
	    {TP, "|TInterface/ICONS/Ability_Hunter_SerpentSwiftness:35:35|t毒蛇神殿",		530,	797.855,	6865.77,	-65.4165,	0.005938,	TEAM_NONE,	70,	100000},
	    {TP, "|TInterface/ICONS/ACHIEVEMENT_BOSS_KILJAEDAN:35:35|t太阳井高地",	530,	12574.1,	-6774.81,	15.0904,	3.13788,	TEAM_NONE,	70,	100000},
	    {TP, "|TInterface/ICONS/INV_Misc_Eye_04:35:35|t风暴要塞",		530,	3088.49,	1381.57,	184.863,	4.61973,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/INV_Shield_72:35:35|t十字军试炼",                           571,	8515.61,	714.153,	558.248,	1.57753,	TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_Icecrown_IcecrownEntrance:35:35|t冰冠堡垒",	571,	5855.22,	2102.03,	635.991,	3.57899,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/Achievement_Boss_Onyxia:35:35|t奥妮克希亚的巢穴",              1,	-4708.27,	-3727.64,	54.5589,	3.72786,	TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_Naxxramas_Heroic:35:35|t纳克萨玛斯",	571,	3668.72,	-1262.46,	243.622,	4.785,		TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/INV_Misc_Eye_03:35:35|t永恒之眼",	                        571,	3784.17,	7028.84,	161.258,	5.79993,	TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_UlduarRaid_Misc_03:35:35|t奥杜尔",		571,	9222.88,	-1113.59,	1216.12,	6.27549,	TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Reputation_WyrmrestTemple:35:35|t黑曜石圣殿",	571,	3472.43,	264.923,	-120.146,	3.27923,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/INV_EssenceOfWintergrasp:35:35|t阿尔卡冯的宝库",            571,	5453.72,	2840.79,	421.28,		0.01,		TEAM_NONE,	80,	100000},
	},


	[TPMENU+0xb0]={--特色任务传送
	    {TP, "|cFF006400[中立]|r|TInterface/ICONS/Ability_DualWieldSpecialization:35:35|t|cFF9932CC古拉巴什竞技场",	      0,		-13181.8, 		339.356, 		42.9805, 	1.18013},
		{TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t奥特兰战场",		      0,		5.599396,		-308.73822,		132.26651,	0,	TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希战场",		          0,		-1229.860352,	-2545.07959,	21.180079,	0,	TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t战歌峡谷", 		       1,		1442.388428,		-1857.655884,		132.370789,	0,	TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t奥特兰战场",		          0,		396.471863,		-1006.229126,	111.719086,	0,	TEAM_HORDE},
		{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希战场",		               0,		-847.953491,	-3519.764893,	72.607727,	0,	TEAM_HORDE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t战歌峡谷",  		                  1,		1036.794800,	-2106.138672,	122.94553,	0,	TEAM_HORDE},
	},

	[TPMENU+0xc0]={--风景传送
		{TP, "|TInterface/ICONS/Mail_GMIcon:35:35|tGM之岛",		                        	1, 16222.1,		16252.1,	12.5872,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t时光之穴",		          1,-8173.93018,	-4737.46387,33.77735,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t双塔山",			      1,-3331.35327,	2225.72827,	30.9877,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t梦境之树",		           1,-2914.7561,	1902.19934,	34.74103,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t恐怖之岛",		  1, 4603.94678,	-3879.25097,944.18347,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_09:35:35|t天涯海滩",		      1,-9851.61719,	-3608.47412,8.93973,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山",	  1,-8562.09668,	-2106.05664,8.85254,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t石堡瀑布",		0,-9481.49316,	-3326.91528,8.86435,	0},
		{TP, "|TInterface/ICONS/INV_Misc_Toy_10:35:35|t暴雪建设公司路障",          1, 5478.06006,	-3730.8501,	1593.44,	0},
	},

	[TPMENU+0xd0]={--野外BOSS传送
		{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林",                 	0,-10526.16895,-434.996796,50.8948,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰",	                 0,759.605713,-3893.341309,116.4753,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷",		                1,3120.289307,-3439.444336,139.5663,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉",	                    1,2622.219971,-5977.930176,100.5629,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯",	                 1,-2741.290039,2009.481323,31.8773,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地",          	               0,-12234,-2474,-3,   0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t水晶谷",	              1,-6292.463379,1578.029053,0.1553,	0},
	},

	[MMENU+0x20]={--联盟职业技能训练师
		{FUNC, "|cff0000ff联盟战士训练师", 	ST.SummonNPC_1zs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟圣骑训练师", 	ST.SummonNPC_1qs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟死骑训练师", 	ST.SummonNPC_1dk,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟萨满训练师", 	ST.SummonNPC_1sm,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟猎人训练师", 	ST.SummonNPC_1lr,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟小德训练师", 	ST.SummonNPC_1xd,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟盗贼训练师",    ST.SummonNPC_1dz,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟法师训练师", 	ST.SummonNPC_1fs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟术士训练师", 	ST.SummonNPC_1ss,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cff0000ff联盟牧师训练师", 	ST.SummonNPC_1ms,  GOSSIP_ICON_TRAINER},
		--{TP, "战士训练师", 		0,	-8682.700195, 	322.091125, 	109.437958,	0,TEAM_ALLIANCE},
		--{TP, "圣骑训练师", 	0,	-8573.793945, 	877.343018, 	106.519310,	0,TEAM_ALLIANCE},
		--{TP, "死骑训练师", 	0,	2365.21, 		-5658.35, 		426.06,		0,TEAM_ALLIANCE},
		--{TP, "萨满训练师", 		0,	-9032.573242, 	545.842590, 	72.160950,	0,TEAM_ALLIANCE},
		--{TP, "猎人训练师", 		0,	-8422.097656, 	550.078674, 	95.448730,	0,TEAM_ALLIANCE},
		--{TP, "小德训练师",	1,	7870.23, 		-2586.97, 		486.95,		0,TEAM_ALLIANCE},
		--{TP, "盗贼训练师", 		0,	-8751.876953, 	381.321930, 	101.056236,	0,TEAM_ALLIANCE},
		--{TP, "法师训练师",		0,	-9009.386719, 	875.746765, 	29.621387,	0,TEAM_ALLIANCE},
		--{TP, "术士训练师", 		0,	-8972.834961, 	1027.723511, 	101.40416,	0,TEAM_ALLIANCE},
		--{TP, "牧师训练师", 		0,	-8517.649414, 	858.083801, 	109.81385, 	0,TEAM_ALLIANCE},
		
		---部落职业技能训练师
		{FUNC, "|cffff0000部落战士训练师", 	ST.SummonNPC_2zs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落圣骑训练师", 	ST.SummonNPC_2qs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落死骑训练师", 	ST.SummonNPC_2dk,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落萨满训练师", 	ST.SummonNPC_2sm,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落猎人训练师", 	ST.SummonNPC_2lr,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落小德训练师", 	ST.SummonNPC_2xd,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落盗贼训练师",  ST.SummonNPC_2dz,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落法师训练师", 	ST.SummonNPC_2fs,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落术士训练师", 	ST.SummonNPC_2ss,  GOSSIP_ICON_TRAINER},
		{FUNC, "|cffff0000部落牧师训练师", 	ST.SummonNPC_2ms,  GOSSIP_ICON_TRAINER},
		--{TP, "战士训练师",		1,	1971.24, 		-4805.08, 		56.99,		0,TEAM_HORDE},
		--{TP, "圣骑训练师",	1,	1936.14, 		-4138.31, 		41.03,		0,TEAM_HORDE},
		--{TP, "死骑训练师",	0,	2365.21, 		-5658.35, 		426.06,		0,TEAM_HORDE},
		--{TP, "萨满训练师",		1,	1928.482, 		-4228.17, 		42.3219,	0,TEAM_HORDE},
		--{TP, "猎人训练师",		1,	2135.33, 		-4610.78, 		54.3865,	0,TEAM_HORDE},
		--{TP, "小德训练师",	1,	7870.23, 		-2586.97, 		486.95,		0,TEAM_HORDE},
		--{TP, "盗贼训练师",		1,	1776.47, 		-4285.65, 		7.44,		0,TEAM_HORDE},
		--{TP, "法师训练师",		1,	1468.58, 		-4221.86, 		59.22,		0,TEAM_HORDE},
		--{TP, "术士训练师",		1,	1838.19, 		-4355.78, 		-14.71,		0,TEAM_HORDE},
		--{TP, "牧师训练师",		1,	1454.71, 		-4179.42, 		61.56, 		0,TEAM_HORDE},
        --联盟特殊技能训练师
		{TP, "武器训练师", 	0,		-8793.120117, 	613.002991, 	96.856400,	0,TEAM_ALLIANCE},
		{TP, "骑术训练师", 	0,		-9443.556641, 	-1388.178345, 	46.9881,	0,TEAM_ALLIANCE},
		{TP, "飞行训练师", 	530,	-676.925598, 	2730.669434, 	93.9085,	0,TEAM_ALLIANCE},
		--部落特殊技能训练师
		{TP, "武器训练师",	1, 		2093.829346, 	-4821.349609, 	24.382,		0,TEAM_HORDE},
		{TP, "骑术训练师",	530, 	9268.768555, 	-7508.026367, 	38.09,		0,TEAM_HORDE},
		{TP, "飞行训练师", 	530,	48.719337, 		2741.370850, 	85.255180,	0,TEAM_HORDE},
	},
	
	[MMENU+0x30]={--专业技能训练师
		{FUNC, "召唤炼金训练师", 	ST.SummonNPCAlchemy,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤锻造训练师", 	ST.SummonNPCBlacksmithing,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤附魔训练师", 	ST.SummonNPCEnchanting,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤工程训练师", 	ST.SummonNPCEngineering,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤草药训练师", 	ST.SummonNPCHerbalism,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤铭文训练师", 	ST.SummonNPCInscription,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤珠宝训练师",ST.SummonNPCJewelcrafting,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤皮甲训练师", 	ST.SummonNPCLeatherworking,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤采矿训练师", 	ST.SummonNPCMining,	    GOSSIP_ICON_TRAINER},
		{FUNC, "召唤剥皮训练师", 	ST.SummonNPCSkinning,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤裁缝训练师", 	ST.SummonNPCTailoring,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤烹饪训练师", 	ST.SummonNPCCooking,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤急救训练师", 	ST.SummonNPCFirstAid,	GOSSIP_ICON_TRAINER},
		{FUNC, "召唤钓鱼训练师", 	ST.SummonNPCFishing,	GOSSIP_ICON_TRAINER},
	},
	
	[BUYMENU+0x10]={-- 材料商
        {FUNC, "召唤传家宝商人", 	ST.SummonNPC_4001001,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤盗贼雕文商人", 	ST.SummonNPC_4001002,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤小德雕文商人", 	ST.SummonNPC_4001003,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤法师雕文商人", 	ST.SummonNPC_4001004,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤猎人雕文商人", 	ST.SummonNPC_4001005,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤牧师雕文商人", 	ST.SummonNPC_4001006,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤圣骑雕文商人", 	ST.SummonNPC_4001007,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤萨满雕文商人", 	ST.SummonNPC_4001008,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤术士雕文商人", 	ST.SummonNPC_4001009,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤死骑雕文商人", 	ST.SummonNPC_4001010,	GOSSIP_ICON_TRAINER},
        {FUNC, "召唤战士雕文商人", 	ST.SummonNPC_4001011,	GOSSIP_ICON_TRAINER},
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
		teamStr	="[|cFF0070d0联盟|r]"
	elseif(team==TEAM_HORDE)then
		teamStr	="[|cFFF000A0部落|r]"
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
			local mteam,level,money=(v[8] or TEAM_NONE),(v[9] or 0),(v[10] or 0)
			if (player:GetLevel() >= level) then
				if(mteam==Pteam)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, teamStr..text, money, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",money)
				elseif(mteam == TEAM_NONE or mteam == null)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, text, money, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",money)
				end
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
		if(player:GetGMRank()>=4)then--是GM
			player:GossipMenuAddItem(GOSSIP_ICON_TRAINER,"|TInterface/ICONS/Trade_Engraving:35:35|t双重附魔", 0, ENCMENU*0x100)
        end
		if(player:GetGMRank()>=4)then--是GM
			player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"|TInterface/ICONS/Mail_GMIcon:35:35|tGM※专用", 0, GMMENU*0x100)
		end

		player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "|TInterface/ICONS/Temp:35:35|t在线总时间：|cFF000080"..Stone.GetTimeASString(player).."|r", 0, MMENU*0x100)
	end

	player:GossipSendMenu(1, item)--发送菜单
end

function Stone.ShowGossip(event, player, item)
	if (player:IsInCombat()) then
		return false
	end
	Stone.AddGossip(player, item, MMENU)
	return false
end

function Stone.SelectGossip(event, player, item, sender, intid, code, menu_id)
	local menuid=math.modf(intid/0x100)	--菜单组
	local rowid	=intid-menuid*0x100		--第几项

	if(rowid== 0)then
		Stone.AddGossip(player, item, menuid)
	else
		player:GossipComplete()	--关闭菜单
		local v=Menu[menuid] and Menu[menuid][rowid]
		if(v)then						--如果找到菜单项
			local mtype=v[1] or MENU
			if(mtype==MENU)then
				Stone.AddGossip(player, item, (v[3] or MMENU))
			elseif(mtype==FUNC)then					--功能
				local f=v[3]
				if(f)then
					player:ModifyMoney(-sender)		--扣费
					f(player, code)
				end
			elseif(mtype==ENC)then
				local spellId,equipId=v[3],v[4]
				Enchanting(player, spellId, equipId, 0)
				Stone.AddGossip(player, item, menuid)
			elseif(mtype==TP)then					--传送
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
			end
		end
	end
end


RegisterItemGossipEvent(itemEntry, 1, Stone.ShowGossip)
RegisterItemGossipEvent(itemEntry, 2, Stone.SelectGossip)
print("TeleportStone loaded.")
