local E, L, V, P, G = unpack(ElvUI)
local ABM = E:NewModule("AuraBarMovers", "AceHook-3.0", "AceEvent-3.0")
local UF = E:GetModule("UnitFrames")
local EP = LibStub("LibElvUIPlugin-1.0")
local addon = ...

P["abm"] = {
	["player"] = false,
	["target"] = false,
	["focus"] = false,
	["playerw"] = E.db.unitframe.units.player.width,
	["targetw"] = E.db.unitframe.units.target.width,
	["focusw"] = E.db.unitframe.units.focus.width,
	["playerSpace"] = 0,
	["targetSpace"] = 0,
	["focusSpace"] = 0
}

function ABM:PlayerABmove()
	local auraBar = ElvUF_Player.AuraBars

	local holder = CreateFrame("Frame", nil, auraBar)
	holder:Point("BOTTOM", ElvUF_Player, "TOP", 0, 0)
	auraBar:Point("BOTTOM", holder, "TOP", 0, 0)
	auraBar.Holder = holder

	E:CreateMover(auraBar.Holder, "ElvUF_PlayerAuraMover", L["Player Aura Bars"], nil, nil, nil, "ALL,SOLO")
	UF:CreateAndUpdateUF("player")
end

function ABM:TargetABmove()
	local auraBar = ElvUF_Target.AuraBars

	local holder = CreateFrame("Frame", nil, auraBar)
	holder:Point("BOTTOM", ElvUF_Target, "TOP", 0, 0)
	auraBar:Point("BOTTOM", holder, "TOP", 0, 0)
	auraBar.Holder = holder

	E:CreateMover(auraBar.Holder, "ElvUF_TargetAuraMover", L["Target Aura Bars"], nil, nil, nil, "ALL,SOLO")
	UF:CreateAndUpdateUF("target")
end

function ABM:FocusABmove()
	local auraBar = ElvUF_Focus.AuraBars

	local holder = CreateFrame("Frame", nil, auraBar)
	holder:Point("BOTTOM", ElvUF_Focus, "TOP", 0, 0)
	auraBar:Point("BOTTOM", holder, "TOP", 0, 0)
	auraBar.Holder = holder

	E:CreateMover(auraBar.Holder, "ElvUF_FocusAuraMover", L["Focus Aura Bars"], nil, nil, nil, "ALL,SOLO")
	UF:CreateAndUpdateUF("focus")
end

function ABM:UpdatePlayer(frame, db)
	frame.db = db
	local POWERBAR_OFFSET = db.power.offset
	if not db.aurabar.enable then return end

	local auraBars = frame.AuraBars

	if frame and auraBars and auraBars.spacing then
		auraBars.spacing = (E.PixelMode and -1 or 1) + E.db.abm.playerSpace
	end

	local anchorPoint, anchorTo = "BOTTOM", "TOP"
	if db.aurabar.anchorPoint == "BELOW" then
		anchorPoint, anchorTo = "TOP", "BOTTOM"
	end

	auraBars.Holder:Width(E.db.abm.playerw)
	auraBars.Holder:Height(20)
	auraBars.Holder:GetScript("OnSizeChanged")(auraBars.Holder)

	auraBars:ClearAllPoints()

	if not E.db.abm.player then
		if db.aurabar.attachTo == "BUFFS" then
			attachTo = frame.Buffs
		elseif db.aurabar.attachTo == "DEBUFFS" then
			attachTo = frame.Debuffs
		end

		local yOffset = 0
		if E.PixelMode then
			if db.aurabar.anchorPoint == "BELOW" then
				yOffset = 1
			else
				yOffset = -1
			end
		end

		local BarWidth = E.db.abm.playerw - db.width
		local xCoord = attachTo == frame and POWERBAR_OFFSET * (anchorTo == "BOTTOM" and 0 or -1) or 0
		xCoord = xCoord + BarWidth

		auraBars:Point(anchorPoint.."LEFT", attachTo, anchorTo.."LEFT", (attachTo == frame and anchorTo == "BOTTOM") and POWERBAR_OFFSET or 0, E.PixelMode and anchorPoint ==  -1 or yOffset)
		auraBars:Point(anchorPoint.."RIGHT", attachTo, anchorTo.."RIGHT", xCoord, E.PixelMode and -1 or yOffset)

		E:DisableMover("ElvUF_PlayerAuraMover")
	else
		E:EnableMover("ElvUF_PlayerAuraMover")

		auraBars:Point(anchorPoint.."LEFT", auraBars.Holder, anchorTo.."LEFT")
		auraBars:Point(anchorPoint.."RIGHT", auraBars.Holder, anchorTo.."RIGHT", -POWERBAR_OFFSET, 0)
	end
	auraBars:SetAnchors()

	frame:UpdateAllElements("AurabarsMovers_UpdateAllElements")
	if auraBars.bars[1] and auraBars.bars[1]:GetWidth() ~= E.db.abm.playerw then auraBars.bars[1]:SetWidth(E.db.abm.playerw - auraBars.bars[1].statusBar.icon:GetWidth()) end
end

function ABM:UpdateTarget(frame, db)	
	frame.db = db
	local POWERBAR_OFFSET = db.power.offset
	if not db.aurabar.enable then return end

	local auraBars = frame.AuraBars

	if frame and auraBars and auraBars.spacing then
		auraBars.spacing = (E.PixelMode and -1 or 1) + E.db.abm.targetSpace
	end

	local anchorPoint, anchorTo = "BOTTOM", "TOP"
	if db.aurabar.anchorPoint == "BELOW" then
		anchorPoint, anchorTo = "TOP", "BOTTOM"
	end

	auraBars.Holder:Width(E.db.abm.targetw)
	auraBars.Holder:Height(20)
	auraBars.Holder:GetScript("OnSizeChanged")(auraBars.Holder)

	auraBars:ClearAllPoints()

	if not E.db.abm.target then
		local attachTo = frame

		if db.aurabar.attachTo == "BUFFS" then
			attachTo = frame.Buffs
		elseif db.aurabar.attachTo == "DEBUFFS" then
			attachTo = frame.Debuffs
		elseif db.aurabar.attachTo == "PLAYER_AURABARS" and ElvUF_Player then
			attachTo = ElvUF_Player.AuraBars
		end

		local yOffset = 0
		if E.PixelMode then
			if db.aurabar.anchorPoint == "BELOW" then
				yOffset = 1
			else
				yOffset = -1
			end
		end

		local BarWidth = E.db.abm.targetw - db.width
		local xCoord = attachTo == frame and POWERBAR_OFFSET * (anchorTo == "BOTTOM" and 0 or -1) or 0
		xCoord = xCoord + BarWidth

		auraBars:Point(anchorPoint.."LEFT", attachTo, anchorTo.."LEFT", (attachTo == frame and anchorTo == "BOTTOM") and POWERBAR_OFFSET or 0, E.PixelMode and anchorPoint ==  -1 or yOffset)
		auraBars:Point(anchorPoint.."RIGHT", attachTo, anchorTo.."RIGHT", xCoord, E.PixelMode and -1 or yOffset)

		E:DisableMover("ElvUF_TargetAuraMover")
	else
		E:EnableMover("ElvUF_TargetAuraMover")

		auraBars:Point(anchorPoint.."LEFT", auraBars.Holder, anchorTo.."LEFT")
		auraBars:Point(anchorPoint.."RIGHT", auraBars.Holder, anchorTo.."RIGHT", -POWERBAR_OFFSET, 0)
	end
	auraBars:SetAnchors()

	frame:UpdateAllElements("AurabarsMovers_UpdateAllElements")
end

function ABM:UpdateFocus(frame, db)	
	frame.db = db
	local POWERBAR_OFFSET = db.power.offset
	if not db.aurabar.enable then return end

	local auraBars = frame.AuraBars

	if frame and auraBars and auraBars.spacing then
		auraBars.spacing = (E.PixelMode and -1 or 1) + E.db.abm.focusSpace
	end

	local anchorPoint, anchorTo = "BOTTOM", "TOP"
	if db.aurabar.anchorPoint == "BELOW" then
		anchorPoint, anchorTo = "TOP", "BOTTOM"
	end

	auraBars.Holder:Width(E.db.abm.focusw)
	auraBars.Holder:Height(20)
	auraBars.Holder:GetScript("OnSizeChanged")(auraBars.Holder)

	auraBars:ClearAllPoints()

	if not E.db.abm.focus then
		if db.aurabar.attachTo == "BUFFS" then
			attachTo = frame.Buffs
		elseif db.aurabar.attachTo == "DEBUFFS" then
			attachTo = frame.Debuffs
		end

		local yOffset = 0
		if E.PixelMode then
			if db.aurabar.anchorPoint == "BELOW" then
				yOffset = 1
			else
				yOffset = -1
			end
		end

		local BarWidth = E.db.abm.focusw - db.width
		local xCoord = attachTo == frame and POWERBAR_OFFSET * (anchorTo == "BOTTOM" and 0 or -1) or 0
		xCoord = xCoord + BarWidth

		auraBars:Point(anchorPoint.."LEFT", attachTo, anchorTo.."LEFT", (attachTo == frame and anchorTo == "BOTTOM") and POWERBAR_OFFSET or 0, E.PixelMode and anchorPoint ==  -1 or yOffset)
		auraBars:Point(anchorPoint.."RIGHT", attachTo, anchorTo.."RIGHT", xCoord, E.PixelMode and -1 or yOffset)

		E:DisableMover("ElvUF_FocusAuraMover")
	else
		E:EnableMover("ElvUF_FocusAuraMover")

		auraBars:Point(anchorPoint.."LEFT", auraBars.Holder, anchorTo.."LEFT")
		auraBars:Point(anchorPoint.."RIGHT", auraBars.Holder, anchorTo.."RIGHT", -POWERBAR_OFFSET, 0)
	end
	auraBars:SetAnchors()

	frame:UpdateAllElements("AurabarsMovers_UpdateAllElements")
end

function ABM:ChangeTarget()
	UF:CreateAndUpdateUF("target")
	self:UnregisterEvent("PLAYER_TARGET_CHANGED")
end

function ABM:Initialize()
	EP:RegisterPlugin(addon, ABM.GetOptions)

	ABM:PlayerABmove()
	ABM:TargetABmove()
	ABM:FocusABmove()

	hooksecurefunc(UF, "Update_PlayerFrame", ABM.UpdatePlayer)
	hooksecurefunc(UF, "Update_TargetFrame", ABM.UpdateTarget)
	hooksecurefunc(UF, "Update_FocusFrame", ABM.UpdateFocus)

	self:RegisterEvent("PLAYER_TARGET_CHANGED", "ChangeTarget")
end

local function InitializeCallback()
	ABM:Initialize()
end

E:RegisterModule(ABM:GetName(), InitializeCallback)