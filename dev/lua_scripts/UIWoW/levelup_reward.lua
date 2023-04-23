function levelup_reward(event, player, oldLevel)    --升级奖励1金
player:ModifyMoney(10000)
player:SendBroadcastMessage("You owned 1 Gold for your levelup.")
--player:SendBroadcastMessage("升级奖励1金")
end  
RegisterPlayerEvent(13, levelup_reward)
