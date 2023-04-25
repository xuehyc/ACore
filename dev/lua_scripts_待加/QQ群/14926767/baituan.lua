--百团大战?
--古拉巴什竞技场大乱斗
local SMSG_INIT_WORLD_STATES = 0x2C2 --3.3.5
local SMSG_UPDATE_WORLD_STATE = 0x2C3 --3.3.5

-- SMSG_INIT_WORLD_STATES = 0x4C15 --4.3.4
-- SMSG_UPDATE_WORLD_STATE = 0x4816 --4.3.4
 
function Player:InitializeWorldState(Map, Zone, StateID, Value)
        local data = CreatePacket(SMSG_INIT_WORLD_STATES, 18);
        data:WriteULong(Map);
        data:WriteULong(Zone);
        data:WriteULong(0);  
        data:WriteUShort(1);
        data:WriteULong(StateID);
        data:WriteULong(Value);
        self:SendPacket(data)
end
 
function Player:UpdateWorldState(StateID, Value)
        local data = CreatePacket(SMSG_UPDATE_WORLD_STATE, 8);
        data:WriteULong(StateID);
        data:WriteULong(Value);
        self:SendPacket(data)
end
 
--[[ Example:
        player:InitializeWorldState(Map, Zone, StateID, Value)
        player:UpdateWorldState(StateID, Value)
]] 
local ZoneBattles = {
		["BattleZone"] = {"古拉巴什竞技场", 0, 33, 2177}, -- 大乱斗战场名字, 所在地图ID, 所在 ZoneID
        ["Rewards"] = {100, 100, 0, 0}, -- 胜利方奖励的竞技场点, 荣誉值, 道具ID, 道具数量
        ["LostRewards"] = {10, 20,0, 0}, -- 失败方奖励的竞技场点, 荣誉值, 道具ID, 道具数量
        ["MaxScore"] = 10, -- 要杀多少人才赢
        ["Cooldown"] = 120, -- 每多少分钟举行一次大乱斗
        ["AlertCooldown"] = 120, -- 每多少分钟给在线全体玩家弹一次框
        [0] = 0, -- 初始给联盟多少分
        [1] = 0, -- 初始给部落多少分
        InitPlayerScore = 0, --玩家初始积分
        pData={},
		["location"] = {
					[0] = {-13203,274,22,1.06}, -- 联盟出生位置 x,y,z,o
					[1] = {-13203,274,22,1.06}; -- 部落出生位置 x,y,z,o
			};
};
 
local function TeamAsString(team)
    if (team == 0) then
        return "联盟"
    else
        return "部落"
    end
end
 
local function HandleReward(player,won)
    local Rewards = "Rewards"
    if(won == 0) then Rewards = "LostRewards" end
    local ArenaPointsReward = ZoneBattles[Rewards][1];
    local HonorReward = ZoneBattles[Rewards][2];
    local ItemReward, ItemRewardCount = ZoneBattles[Rewards][3], ZoneBattles[Rewards][4];

    for k, _ in pairs(ZoneBattles["BattleContribution"]) do
        if (player:GetGUIDLow() == k) then
            if (ArenaPointsReward > 0) then -- Handle ArenaPoints Reward
                player:ModifyArenaPoints(ArenaPointsReward)
            end
            if (HonorReward > 0) then -- Handle Honor Reward
                player:ModifyHonorPoints(HonorReward)
            end
            if (ItemReward > 0) and (ItemRewardCount > 0) then -- Handle Item/Token Reward
                player:AddItem(ItemReward, ItemRewardCount)
            end
        end
    end
end
 
function ZoneBattles.ResetBattleCounter()
    -- Reset battle variables
    ZoneBattles["BattleContribution"] = {};
    ZoneBattles[0] = 0;
    ZoneBattles[1] = 0;
    ZoneBattles.pData= {}
    ZoneBattles["BattleInProgress"] = true;
    
    SendWorldMessage(" 大乱斗 "..ZoneBattles["BattleZone"][1].." 已经开始！该功能为测试阶段，先击杀10人的玩家获胜！")
    SummonAlert()

    for _, v in pairs(GetPlayersInWorld()) do
        --if (v:GetAreaId() == ZoneBattles["BattleZone"][4]) then
            ZoneBattles.pData[v:GetGUIDLow()] = ZoneBattles.InitPlayerScore
            --v:UpdateWorldState(2313, ZoneBattles[0]) -- Reset Alliance score when battle resets
            --v:UpdateWorldState(2314, ZoneBattles[1]) -- Reset Horde score when battle resets
        --end
    end
end

function GetPlayersInMap(Mapid)
    local map = GetMapById(Mapid)
    if (map) then
        return map:GetPlayers()
    end
    return nill
end

function SummonAlert()
    if(ZoneBattles["BattleInProgress"] == false) then return end
    local players = GetPlayersInWorld()
    if(players) then
        for k, player in ipairs(players) do
            player:GossipComplete()
            player:GossipClearMenu()
            player:GossipMenuAddItem(30, "大乱斗已经开始", 0, 1, false, "|TInterface/FlavorImages/BloodElfLogo-small:64:64:0:-30|t\n \n \n \n \n \n大乱斗现在已经开始！\n\n按[接受]直接传送进古拉巴什竞技场。\n\n或稍后通过炉石传送古拉巴什竞技场。")
            player:GossipSendMenu(100, player, 1999)
        end
    end
    CreateLuaEvent(SummonAlert, ZoneBattles["AlertCooldown"]*60*1000, 1)
end

function SummonAlertConfirm(event, player, object, sender, intid, code)
    if(ZoneBattles["BattleInProgress"] == true) then
        local teamId = player:GetTeam()
        local mapId = ZoneBattles["BattleZone"][2]
        local x = ZoneBattles["location"][teamId][1]
        local y = ZoneBattles["location"][teamId][2]
        local z = ZoneBattles["location"][teamId][3]
        local o = ZoneBattles["location"][teamId][4]
        local x_add_path=math.random(-19,19)
        local y_add_path=math.random(-19,19)
        local x_add_path=x + x_add_path
        local y_add_path=y + y_add_path
        player:RemoveFromGroup()
        player:Teleport(mapId, x_add_path, y_add_path, z, o)
        player:AddAura( 47883, player )
    else
        player:SendNotification("已经结束，请等待下一次开始。")
    end
end

function ZoneBattles.OnEnterArea(event, player, newZone, newArea)
    if (player:GetMapId() == ZoneBattles["BattleZone"][2]) and (player:GetZoneId() == ZoneBattles["BattleZone"][3]) and (player:GetAreaId() == ZoneBattles["BattleZone"][4]) then
        player:InitializeWorldState(1377, 1, 0, 1) -- Initialize world state, score 0/0
        player:UpdateWorldState(2317, ZoneBattles["MaxScore"]) -- 设置最大杀敌
        player:UpdateWorldState(2313, ZoneBattles.InitPlayerScore) -- 用来记录玩家本人杀敌
        player:UpdateWorldState(2314, ZoneBattles.GetPlayerMaxScore()) -- 用来记录当前战场击杀数最大的玩家的击杀数
    end
end

function ZoneBattles.GetPlayerMaxScore()
    local count = 0
    for _, v in pairs(GetPlayersInMap(ZoneBattles["BattleZone"][2])) do
        if (ZoneBattles.pData[v:GetGUIDLow()] > count) then
            count = ZoneBattles.pData[v:GetGUIDLow()]
        end
    end
    return count
end
 
function ZoneBattles.OnPvPKill(event, killer, killed)
    if ((killer:GetMapId() and killed:GetMapId()) == ZoneBattles["BattleZone"][2]) and ((killer:GetZoneId() and killed:GetZoneId()) == ZoneBattles["BattleZone"][3]) and ((killer:GetAreaId() and killed:GetAreaId()) == ZoneBattles["BattleZone"][4]) then
        --local Team = killer:GetTeam()
            local pGuid = killer:GetGUIDLow()

        if ZoneBattles.GetPlayerMaxScore() < ZoneBattles["MaxScore"] then
            if not ZoneBattles["BattleContribution"][killer:GetGUIDLow()] then
                ZoneBattles["BattleContribution"][killer:GetGUIDLow()] = true; -- Make sure player has contributed to the battle.
            end

            ZoneBattles.pData[pGuid] = ZoneBattles.pData[pGuid] + 1;

            for _, v in pairs(GetPlayersInMap(ZoneBattles["BattleZone"][2])) do
                if v:GetAreaId() == ZoneBattles["BattleZone"][4] then
                    v:UpdateWorldState(2313, ZoneBattles.pData[pGuid])
                    v:UpdateWorldState(2314, ZoneBattles.GetPlayerMaxScore())
                end
            end
        end
        if ZoneBattles["BattleInProgress"] == true and ZoneBattles.pData[pGuid] == ZoneBattles["MaxScore"] then
            ZoneBattles["BattleInProgress"] = false;
                        
            HandleReward(killer,1)
            --for _, v in pairs(GetPlayersInMap(ZoneBattles["BattleZone"][2])) do
               --if v:GetAreaId() == ZoneBattles["BattleZone"][4] and v:GetGUIDLow()~=killer:GetGUIDLow() then
                    --HandleReward(v,0)
                --end
            --end
            SendWorldMessage(""..killer:GetName().." 获得了"..ZoneBattles["BattleZone"][1].."战斗胜利！ 下一次大乱斗将在 "..ZoneBattles["Cooldown"].." 分钟后开始！")
            print(killer:GetName(),'获得了胜利!')
            CreateLuaEvent(ZoneBattles.ResetBattleCounter, ZoneBattles["Cooldown"]*60*1000, 1)
        end
    end
end

ZoneBattles.ResetBattleCounter()
RegisterPlayerEvent(27, ZoneBattles.OnEnterArea)
RegisterPlayerEvent(6, ZoneBattles.OnPvPKill)
RegisterPlayerGossipEvent(1999, 2, SummonAlertConfirm)
