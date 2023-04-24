print(">>Script: 70 loading...OK")
function PlayerFirstLogin(event, player)
    local lv = player:GetLevel()
    if lv < 70 then
        player:SetLevel(70)
    	player:ModifyMoney(1000000) --100G
        player:SaveToDB()
    end
end

RegisterPlayerEvent(30, PlayerFirstLogin)