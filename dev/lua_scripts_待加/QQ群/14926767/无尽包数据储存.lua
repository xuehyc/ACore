

local BigBag = {}
BigBag.InPutSpellId = 90015        --����Ʒ����ֿ�
BigBag.OutPutSpellId = 90016    --����Ʒ����ֿ�
BigBag.NextPage = 10
BigBag.UpdateTime = 300000


BigBag.DB = {}

function BigBag.loadDB()
    CharDBExecute([[
        CREATE TABLE IF NOT EXISTS `character_bigbag` (
        `Pguid` int(10) NOT NULL,
        `class` tinyint(10) NOT NULL,
        `itementry` int(10) NOT NULL,
        `Count` int(10) NOT NULL,
        PRIMARY KEY (`Pguid`,`itementry`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�޾������ݴ���';
        ]])
    CharDBExecute("DELETE FROM character_bigbag WHERE count=0")

    local query = WorldDBQuery("SELECT entry,bonding FROM item_template")
    if query then
        repeat
            BigBag.DB[query:GetUInt32(0)] = query:GetUInt32(1)
        until not query:NextRow()
    end
end

BigBag.loadDB()
function BigBag.Start(_,p,sp,_)
    local pGuid = p:GetGUIDLow()
    if sp:GetEntry() == BigBag.InPutSpellId then
        if p:IsInCombat()==false then 
            BigBag.InPutGossip(p)
        else
            p:SendAreaTriggerMessage("|cFFFF0000ս���в�����ʹ��~|R")
            p:SendBroadcastMessage("|cFFFF0000ս���в�����ʹ��~|R")
            return false
        end
    elseif sp:GetEntry() == BigBag.OutPutSpellId then
        if p:IsInCombat()==false then 
            BigBag.pSelectGossip[pGuid] = {["Class"] = -1,["page"] = 0,["OutputCount"] = 1}
            BigBag.OutPutGossip(p)
        else
            p:SendAreaTriggerMessage("|cFFFF0000ս���в�����ʹ��~|R")
            p:SendBroadcastMessage("|cFFFF0000ս���в�����ʹ��~|R")
            return false
        end
    end
end

BigBag.ClassName = {
        [0] = "����Ʒ",[1] = "����",[2] = "����",
        [3] = "�鱦",[4] = "����",[5] = "����",
        [6] = "��ҩ",[7] = "��Ʒ",[9] = "�䷽",
        [11] = "����",[12] = "����",[13] = "Կ��",
        [14] = "����",[15] = "����",[16] = "����",}

function BigBag.OutPutGossip(p)
    local pGuid = p:GetGUIDLow()
    if BigBag.pData[pGuid] == nil then
        BigBag.pLoadData(p)
    end
    p:GossipClearMenu()
    if BigBag.pSelectGossip[pGuid].Class == -1 then
        for init,v in pairs (BigBag.ClassName) do
            num = 0
            for _,_ in pairs (BigBag.pData[pGuid][init]) do num = num + 1 end
            p:GossipMenuAddItem(10,v.."  (|cFFFF0000 "..num.."|r )",0,init)
        end
    else
        local gossipNum = 0
        local page = BigBag.pSelectGossip[pGuid].page
        for _,_ in pairs(BigBag.pData[pGuid][BigBag.pSelectGossip[pGuid].Class]) do
            gossipNum = gossipNum + 1
        end
        p:GossipMenuAddItem(10,"�������ÿ��ȡ��������: "..BigBag.pSelectGossip[pGuid].OutputCount,1,17,true)
        local visible = 0
        for id,count in pairs(BigBag.pData[pGuid][BigBag.pSelectGossip[pGuid].Class]) do
            if visible >= page * BigBag.NextPage and visible < BigBag.NextPage * (page + 1) then
                if count > 0 then
                    p:GossipMenuAddItem(10,
                    --[[GetIcon(id,35,35,-15)..]]--
                    GetItemLink(id).." x "..count,0,id
                    --,true
                    )
                else
                    BigBag.pData[pGuid][BigBag.pSelectGossip[pGuid].Class][id] = nil
                end
            end
            visible = visible + 1
        end
        if gossipNum > 0 and gossipNum - page * BigBag.NextPage > BigBag.NextPage then
            p:GossipMenuAddItem(10,"��һҳ",1,19)
        end
        if page>0 then
            p:GossipMenuAddItem(10,"��һҳ",1,18)
        end
        if gossipNum == 0 then
            p:GossipMenuAddItem(10,"����Ʒ",0,20)
        end
        p:GossipMenuAddItem(10,"����",0,20)
    end
    p:GossipSendMenu(1,p,50024)
end

BigBag.pSelectGossip = {}
--local file = io.open("logs/bigbag.log", "a")

function BigBag.pGossipSelect_OutPutGossip(_,p,_,_,ItemOrIntid,Count,_)
    local pGuid = p:GetGUIDLow()
    if ItemOrIntid==20 then
        BigBag.pSelectGossip[pGuid].Class = -1
        BigBag.pSelectGossip[pGuid].page = 0
        BigBag.OutPutGossip(p)
    elseif ItemOrIntid == 19 then
        BigBag.pSelectGossip[pGuid].page = BigBag.pSelectGossip[pGuid].page + 1
        BigBag.OutPutGossip(p)
    elseif ItemOrIntid == 18 then
        BigBag.pSelectGossip[pGuid].page = BigBag.pSelectGossip[pGuid].page - 1
        BigBag.OutPutGossip(p)
    elseif ItemOrIntid == 17 then
        if string.find(Count,"%d+") then
            Count = tonumber(Count)
            if Count > 0 then
                BigBag.pSelectGossip[pGuid].OutputCount = Count
            end
        end
        BigBag.OutPutGossip(p)
    else
        if ItemOrIntid<20 then
            BigBag.pSelectGossip[pGuid].Class = ItemOrIntid
            BigBag.OutPutGossip(p)
        else
            local class = BigBag.pSelectGossip[pGuid].Class
            local itemId = ItemOrIntid
            local itemCount = BigBag.pData[pGuid][class][itemId]
        --[[if string.find(Count,"%d+") then
                Count = tonumber(Count)
                if Count < 0 then
                    p:SendAreaTriggerMessage("|cFFFF0000�쳣��Ϊ������"..Count * -1 .."G���Ѿ��ǵ�С�����ˣ����������˰ɡ�|R")
                    p:SendBroadcastMessage("|cFFFF0000�쳣��Ϊ������"..Count * -1 .."G���Ѿ��ǵ�С�����ˣ����������˰ɡ�|R")
                    p:ModifyMoney(Count*10000)
                    file:write(os.date().."\t".. p:GetGUIDLow().."\t"..itemId.."\t"..Count.."\n")
                    file:flush()
                    return false
                end
        ]]--
                if itemCount>=BigBag.pSelectGossip[pGuid].OutputCount then
                    BigBag.pData[pGuid][class][itemId] = BigBag.pData[pGuid][class][itemId] - BigBag.pSelectGossip[pGuid].OutputCount
                    CharDBExecute(string.format("update character_bigbag set Count = %s where pGuid = %s and Class = %s and ItemEntry = %s",BigBag.pData[pGuid][class][itemId],pGuid,class,itemId))
                    p:AddItem(itemId,BigBag.pSelectGossip[pGuid].OutputCount)
                    p:SaveToDB()
                else
                    p:SendAreaTriggerMessage("|cFFFF0000ȡ��������������ѡ����Ʒ�ĵ���������|R")
                    p:SendBroadcastMessage("|cFFFF0000ȡ��������������ѡ����Ʒ�ĵ���������|R")
                end
        --[[else
                p:SendAreaTriggerMessage("|cFFFF0000��������ֵ��|R")
                p:SendBroadcastMessage("|cFFFF0000��������ֵ��|R")
            end
        ]]--
            --p:GossipComplete()
            return BigBag.OutPutGossip(p)
        end    
    end
end

function BigBag.InPutGossip(p)
    local item = p:GetItemByPos(255,23)
    if item == nil then return false end
    local Count = item:GetCount()
    local pGuid = p:GetGUIDLow()
    local itemClass = item:GetClass()
    local itemEntry = item:GetEntry()
    if BigBag.pData[pGuid] == nil then
        BigBag.pLoadData(p)
    end
    if item ~= nil then
        local canInput = true
        if item:CanBeTraded()==false and BigBag.DB[item:GetEntry()]==2 then
            canInput = false
        end
        if canInput then
            if BigBag.pData[pGuid][itemClass][itemEntry]==nil then
                BigBag.pData[pGuid][itemClass][itemEntry] = 0
            end
            p:SendBroadcastMessage("|cFFFF0000�ɹ�������Ʒ|r"..GetItemLink(itemEntry).."|cFFFF0000x"..Count.."���޾������С�|R")
            BigBag.pData[pGuid][itemClass][itemEntry] = BigBag.pData[pGuid][itemClass][itemEntry] + Count
            CharDBExecute(string.format("REPLACE INTO character_bigbag (pGuid,Class,ItemEntry,Count) VALUES (%s,%s,%s,%s)",pGuid,itemClass,itemEntry,BigBag.pData[pGuid][itemClass][itemEntry]))
            p:RemoveItem(item,Count)
            p:SaveToDB()
        else
            p:SendAreaTriggerMessage("|cFFFF0000װ���󶨵���Ʒ�Ѿ�װ�������ܴ����޾�������|R")
            p:SendBroadcastMessage("|cFFFF0000װ���󶨵���Ʒ�Ѿ�װ�������ܴ����޾�������|R")
        end
    end
end

BigBag.pData = {}
function BigBag.pLoadData(p)
    local pGuid = p:GetGUIDLow()
    BigBag.pData[pGuid] = {
        [0] = {},[1] = {},[2] = {},[3] = {},[4] = {},[5] = {},
        [6] = {},[7] = {},[9] = {},[11] = {},[12] = {},[13] = {},
        [14] = {},[15] = {},[16] = {}}
    local query = CharDBQuery("SELECT pGuid,Class,ItemEntry,Count FROM character_bigbag WHERE pGuid="..pGuid)
    if query then
        repeat
            BigBag.pData[pGuid][query:GetUInt8(1)][query:GetUInt32(2)] = query:GetInt32(3)
        until not query:NextRow()
    end
end

function BigBag.UpdateDB()
    for pGuid,v in pairs (BigBag.pData) do
        for class,item in pairs (v) do
            for entry,count in pairs (item) do
                CharDBExecute(string.format("REPLACE INTO character_bigbag (pGuid,Class,ItemEntry,Count) VALUES (%s,%s,%s,%s)",pGuid,class,entry,count))
            end
        end
        BigBag.pData[pGuid] = nil
    end
    CharDBExecute("DELETE FROM character_bigbag WHERE count=0")
end


RegisterPlayerEvent(5,BigBag.Start)
RegisterPlayerGossipEvent(50024,2,BigBag.pGossipSelect_OutPutGossip)
--CreateLuaEvent(BigBag.UpdateDB,BigBag.UpdateTime, 0)