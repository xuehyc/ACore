--[[
--BOSS击杀公告lua
]]--

print("PolarisCore LUA>>Kill_Whole.lua Loaded")

--需要通报的BOSS集合
local boss = {  16152,15687,15688,15689,15690,15691,16457,
                16524,17225,17521,17533,17534,18168,17888,
                17767,17808,17842,17968,21216,21217,21215,
                21214,21213,21212,17257,18831,19044,18805,
                19514,19516,19622,24892,24882,25038,25166,
                25165,25840,25315,22841,22887,22948,22342,
                22950,22949,23418,22951,22947,22898,22871,
                22952,22917,23419,23574,23577,23578,23576,
                24239,23863,
};

local T = {}

local Ktime = 0

local ClassName = {
    [1] =   "[|cffC79C6E%s|r]",    --战士
    [2] =   "[|cffF58CBA%s|r]",    --骑士
    [3] =   "[|cffABD473%s|r]",    --猎人
    [4] =   "[|cffFFF569%s|r]",    --盗贼
    [5] =   "[|cffFFFFFF%s|r]",    --牧师
    [6] =   "[|cffC41F3B%s|r]",    --死骑
    [7] =   "[|cff2459FF%s|r]",    --萨满
    [8] =   "[|cff69CCF0%s|r]",    --法师
    [9] =   "[|cff9482C9%s|r]",    --术士
    [11]=   "[|cffFF7D0A%s|r]",    --小德
}

--时间换算并格式化
function StrFromTime(time)
    if (type(time) ~= "number") then return end

    time = math.floor(time)

    if (time < 60) then
        return string.format("%d 秒", time)
    elseif (time % 60 == 0) then
        return string.format("%d 分", time/60)
    else
        return string.format("%d 分 %d 秒", time/60, time % 60)
    end
end

--从进入战斗开始
function EnterCombat(event, player, enemy)
    local pguid, cguid = player:GetGUIDLow(), enemy:GetGUIDLow()

    if (not T[pguid]) then
        T[pguid] = {}
    elseif(T[pguid][cguid]) then
        return
    end

    T[pguid][cguid] = os.time()
end

--到离开战斗结束
function LeaveCombat(event, player)
    local pguid = player:GetGUIDLow()
    if (T[pguid]) then
        T[pguid] = nil
    end
end

--击杀结果
function KilledCreature(event, killer, killed)
    local pguid, cguid = killer:GetGUIDLow(), killed:GetGUIDLow()
    if (T[pguid] and T[pguid][cguid]) then
        Ktime = os.time() - T[pguid][cguid]
        T[pguid][cguid] = nil
    end

    local KName = killer:GetName()

    local ClassColor = ClassName[killer:GetClass()]

    local TgMsg = ""

    if (killer:IsInGroup()) then
        local Gp = killer:GetGroup()
        local KCount = Gp:GetMembersCount()
        TgMsg = "<团队> 合计: |cffcc0000"..KCount.."|r 人"
    else
        TgMsg = "<独自>"
    end
    for k,v in pairs (boss) do
        if (killed:GetEntry() == v) then
            local MSG = ""

            if (Ktime == 0) then
                MSG = string.format("|cffcc0000[击杀公告]|r |Hplayer:%s|h"..ClassColor.."|h %s 秒杀 [|cFFF000A0%s|r]",KName,KName,TgMsg,killed:GetName())
            else
                MSG = string.format("|cffcc0000[击杀公告]|r |Hplayer:%s|h"..ClassColor.."|h %s (使用: |cffcc0000%s|r) 击杀了 [|cFFF000A0%s|r]",KName,KName,TgMsg,StrFromTime(Ktime),killed:GetName())
            end

            SendWorldMessage(MSG)
        end
    end
end

RegisterPlayerEvent(33, EnterCombat)
RegisterPlayerEvent(34, LeaveCombat)
RegisterPlayerEvent(7, KilledCreature)

