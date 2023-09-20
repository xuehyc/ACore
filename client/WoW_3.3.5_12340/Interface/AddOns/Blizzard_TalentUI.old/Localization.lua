-- This file is executed at the end of addon load

-- Talent tabs
for i=1, (PlayerTalentFrame.numTabs or 0) do
	local tabName = "PlayerTalentFrameTab"..i;
	_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
end

-- Talent Frame header
TALENT_HEADER_DEFAULT_Y = -33;
TALENT_HEADER_CHOOSE_SPEC_Y = -24;