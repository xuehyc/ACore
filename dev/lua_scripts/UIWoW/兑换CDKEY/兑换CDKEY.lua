local function cdKey_gossip(event, player, object)
        player:GossipClearMenu()
        player:GossipMenuAddItem(30,"",1,0,true)
        player:GossipSendMenu(1,object)        
end

local function cdKey(event, player, object, sender, intid, code, menu_id)
        local query = WorldDBQuery("select * from cdKey where cdKey='"..code.."';")
        if (query) then
                local item = query:GetInt32(1)
                local count = query:GetInt32(2)
                player:AddItem(item,count)
                WorldDBExecute("DELETE FROM cdkey WHERE cdKey='"..code.."';")
        else
                player:SendBroadcastMessage("无效的cdkey~")
        end
        player:GossipComplete()
end

RegisterCreatureGossipEvent(50029,1,cdKey_gossip)
RegisterCreatureGossipEvent(50029,2,cdKey)

print('Exchange CDKEY module loaded.')
print('Exchange CDKEY module loaded.')
print('Exchange CDKEY module loaded.')
print('Exchange CDKEY module loaded.')
