GHOST_GS_COLOR = {

	[1] = "|cffffffff%s|r",
	[2] = "|cff66ccff%s|r",
	[3] = "|cff66ccff%s|r",
	[4] = "|cff993399%s|r",
	[5] = "|cffff3399%s|r",
	[6] = "|cffff6600%s|r",
	[7] = "|cffff0033%s|r",
};


function Ghost_FetchData_GSData(msg)
	local name,name1, gs = strsplit(" ",msg);
	Ghost.Data.GS.Target[name] = tonumber(gs);
	Ghost.Data.GS.Target[name1] = tonumber(gs);

	if name == UnitName("player") or name1 == UnitName("player") then
		local gs = Ghost.Data.GS.Target[UnitName("player")];
		local rank = Ghost_GetGSRank(gs);
		_G["CharacterGSText"]:SetText(string.format(GS_CHAR..GHOST_GS_COLOR[rank],gs));
	end
end

function Ghost_FetchData_GSSpellData(msg)
	local id, gs = strsplit(" ",msg);
	Ghost.Data.GS.Spells[tonumber(id)] = tonumber(gs);
end

function Ghost_GetGSRank(name)
	
	local gs = Ghost_GetGS(name);

	if gs > 55000 then
		return 7;
	elseif gs > 25000 then
		return 6;
	elseif gs > 8500 then
		return 5;
	elseif gs > 4000 then
		return 4;
	elseif gs > 1000 then
		return 3;
	elseif gs > 500 then
		return 2;
	else
		return 1;
	end
end

function Ghost_GetGS(name)
	if Ghost.Data.GS.Target[name] then
		return Ghost.Data.GS.Target[name];
	end

	return 0;
end

function Ghost_GS_ShowSkull(TargetName)
	if UnitName("player") == TargetName then
		return false;
	end

	if Ghost_GetGSRank(TargetName) - Ghost_GetGSRank(UnitName("player"))  > 3 then
		return true;
	end

	return false;
end

function Ghost_GS_SetPaperDollGS()
	local name = UnitName("player");
	local gs = Ghost_GetGS(name);
	local rank = Ghost_GetGSRank(name);
	_G["CharacterGSText"]:SetText(string.format(GS_TIPS, gs));
end

function Ghost_GS_SetInsepectGS(self)
	local name = UnitName(self.unit);
	local gs = Ghost_GetGS(name);
	local rank = Ghost_GetGSRank(name);

	if Ghost_GS_ShowSkull(name) then
		_G["InspectGSText"]:SetText(string.format(GS_TIPS,"???"));
	else
		_G["InspectGSText"]:SetText(string.format(GS_TIPS, gs));
	end
end

function GhostHookPlayerTooltip(self)
	self:HookScript("OnTooltipSetUnit", function(self, ...)
		local _, unit = self:GetUnit();	
		if unit ~= nil and UnitIsPlayer(unit) then
			local name = UnitName(unit);
			local gs = Ghost.Data.GS.Target[name];
			local rank = Ghost_GetGSRank(name);
			if Ghost.Data.GS.Target[name] then
				self:AddLine("");
--
				if Ghost_GS_ShowSkull(name) then
					self:AddDoubleLine(GS_MOUSE, string.format(GHOST_GS_COLOR[rank],"???"));
					self:AddTexture("Interface\\TARGETINGFRAME\\UI-TargetingFrame-Skull");
				else
					self:AddDoubleLine(GS_MOUSE, string.format(GHOST_GS_COLOR[rank], gs));
				end
			end  
		end
	end);
end


function Ghost_SetItemDes(tooltip, itemId)
    if  Ghost.Data.Item.Entry[itemId] then

        local heroText = Ghost.Data.Item.Entry[itemId]["heroText"];
        if heroText and heroText ~= "" then
            for i=1,tooltip:NumLines() do
                local s = _G[tooltip:GetName().."TextLeft"..i]:GetText()
                if s then s = string.gsub(s, "英雄级别", heroText) _G[tooltip:GetName().."TextLeft"..i]:SetText(s) end
            end
        end

        local gs = Ghost.Data.Item.Entry[itemId]["gs"];
        if gs and gs > 0 then
            local p = _G[tooltip:GetName().."TextRight1"]; 
            p:SetText(string.format(GS_TIPS, gs));
            p:Show();
        end
    end
end

function Ghost_GS_SetSpellGS(tooltip, spellId)
	local gs = Ghost.Data.GS.Spells[spellId];
    if gs and gs > 0 then
        local p = _G[tooltip:GetName().."TextRight1"]; 
        p:SetText(string.format(GS_TIPS, gs));
        p:Show();
    end
end