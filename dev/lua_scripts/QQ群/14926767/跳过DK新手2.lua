print(">>Script: Skip dk newbie quest...OK")

function user_login_event(event, player)
    local cl = player:GetClass() --获取玩家的职业
    local lv = player:GetLevel() --获取玩家的等级
    if cl == 6 and lv < 80 then --如果是低于80级的DK
        player:AddItem(6948) --加个炉石
        local STARTER_QUESTS= { 12593, 12619, 12842, 12848, 12636, 12641, 12657, 12678, 12679, 12680, 12687, 12698, 12701, 12706, 12716, 12719, 12720, 12722, 12724, 12725, 12727, 12733, -1, 12751, 12754, 12755, 12756, 12757, 12779, 12801, 13165, 13166 };
        local specialSurpriseQuestId = -1
        local race = player:GetRace()
        local team = player:GetTeam()
        if race == 6 then
            specialSurpriseQuestId = 12739
        elseif race == 4 then
            specialSurpriseQuestId = 12743;
        elseif race == 3 then
            specialSurpriseQuestId = 12744;
        elseif race == 7 then
            specialSurpriseQuestId = 12745;
        elseif race == 11 then
            specialSurpriseQuestId = 12746;
        elseif race == 10 then
            specialSurpriseQuestId = 12747;
        elseif race == 2 then
            specialSurpriseQuestId = 12748;
        elseif race == 8 then
            specialSurpriseQuestId = 12749;
        elseif race == 5 then
            specialSurpriseQuestId = 12750;
        elseif race == 1 then
            specialSurpriseQuestId = 12742;
        end

        STARTER_QUESTS[23] = specialSurpriseQuestId;
        if team == 0 then
            STARTER_QUESTS[33] = 13188
        else
            STARTER_QUESTS[33] = 13189
        end
        --用一个for循环，依次对任务进行处理
        for k, v in ipairs(STARTER_QUESTS) do
            local quest_status = player:GetQuestStatus(v)
            if quest_status == 0 then
                --没这个任务，自动加这个任务，然后完成
                player:AddQuest(v)
                player:CompleteQuest(v)
                player:RewardQuest(v)
            end
        end
        player:AddItem(38664);
        player:AddItem(39322);
        player:AddItem(38632); 
        player:SetLevel(80) --设置到80级
        player:SaveToDB() --保存到DB

        --炉石绑定，参数自己定
        --player:SetBindPoint( x, y, z, mapId, areaId )
        --将玩家传到指定的位置，参数自己定
        --player:Teleport( mappId, xCoord, yCoord, zCoord, orientation )
    end
end
RegisterPlayerEvent(3, user_login_event, 0)