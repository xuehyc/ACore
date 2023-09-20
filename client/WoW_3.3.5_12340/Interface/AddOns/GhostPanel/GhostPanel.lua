SLASH_LEGACY_PANEL1, SLASH_LEGACY_PANEL2 = "/gc", "/ghostpanel";
local function CmdHandler(msg, editbox)
	if (msg == "") then
		GhostPanel_Toggle();
	end
end

SlashCmdList["LEGACY_PANEL"] = CmdHandler;

function LegacyPanel_Show(frame)
	frame:SetFrameStrata("HIGH");
	frame:Show();
end

function LegacyPanel_Hide(frame)
	frame:Hide();
end

function LegacyPanel_ShowMainFrame()
	LegacyPanel_Show(Legacy.UI.MainFrame);
	LegacyPanel_Show(Legacy.UI.UIFrame);
end

function LegacyPanel_HideMainFrame()
	LegacyPanel_Hide(Legacy.UI.MainFrame);
	LegacyPanel_Hide(Legacy.UI.UIFrame);
end

function GhostPanel_Toggle(self, button)
    if (Ghost.UI.MainFrame:IsShown()) then
        Ghost.UI.MainFrame:Hide();
		Ghost.UI.UIFrame:Hide();
    else
        if (FRESH_RUN) then -- do initial queries here
            --LegacyPanel_DoInitialQueries();
            FRESH_RUN = false;
        end
        Ghost.UI.MainFrame:Show();
		Ghost.UI.UIFrame:Show();
    end
end
