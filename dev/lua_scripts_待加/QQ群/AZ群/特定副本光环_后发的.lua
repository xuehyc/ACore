print(">>Script: InstanceAura loading...OK")

local aura = {
24425,
27650,
25176,
17625,
58820
}

local function CheckAura(Instance,Player)
	if Instance > 0 then
		if Instance == 1 then
			Player:AddAura(24425, Player)
		elseif Instance == 2 then
			Player:AddAura(27650, Player)
		end
	else
		for k,v in pairs (aura) do
			if Player:HasAura(v) then
				Player:RemoveAura(v)			
				break
			end
		end
	end
end

local function PlayerChangeMap(event,Player)
			if Player:GetMapId() == 70 then
				CheckAura(1,Player)
				Player:SendAreaTriggerMessage("当前位于奥达曼，获得赞达拉之魂")
			elseif Player:GetMapId() == 1 then
				CheckAura(2,Player)
				Player:SendAreaTriggerMessage("当前位于卡利姆多，获得复仇")
			else
				CheckAura(0,Player)
				Player:SendAreaTriggerMessage("离开卡利姆多，buff消失")
			end
end

RegisterPlayerEvent(27,PlayerChangeMap)