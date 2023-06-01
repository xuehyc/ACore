print(">>Script: InstanceAura loading...OK")

local aura = {
24425
}

local function CheckAura(Instance,Player)
	if Instance > 0 then
		Player:AddAura(24425, Player)
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
			if Player:GetMap():1 then
				CheckAura(1,Player)
			else
				CheckAura(0,Player)
			end
end

RegisterPlayerEvent(27,PlayerChangeMap)