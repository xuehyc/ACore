print(">>Script: InstanceAura loading...OK")

local aura = {
--联盟光环 5%,10%,15%,20%,25%,30%
73762,
73824,
73825,
73826,
73827,
73828,
--部落光环 5%,10%,15%,20%,25%,30%
73816,
73818,
73819,
73820,
73821,
73822
}

local function CheckAura(Instance,Player)
	if Player:IsAlliance() then
		if Instance > 0 then
			Player:AddAura(73828, Player)
		else
			for k,v in pairs (aura) do
				if Player:HasAura(v) then
					Player:RemoveAura(v)			
					break
				end
			end
		end
	else
		if Instance > 0 then
			Player:AddAura(73822, Player)
		else
			for k,v in pairs (aura) do
				if Player:HasAura(v) then
					Player:RemoveAura(v)			
					break
				end
			end
		end
	end
end

local function PlayerChangeMap(event,Player)
			if Player:GetMap():IsDungeon() then
				CheckAura(1,Player)
			elseif Player:GetMap():IsHeroic() then
				CheckAura(2,Player)
			elseif Player:GetMap():IsRaid() then
				CheckAura(3,Player)
			else
				CheckAura(0,Player)
			end
end

RegisterPlayerEvent(27,PlayerChangeMap)