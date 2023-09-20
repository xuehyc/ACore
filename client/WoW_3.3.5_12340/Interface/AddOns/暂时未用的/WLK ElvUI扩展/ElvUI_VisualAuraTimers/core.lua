local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local addon = E:GetModule("VisualAuraTimers");
local A = E:GetModule("Auras");

local EP = LibStub("LibElvUIPlugin-1.0")
local LSM = LibStub("LibSharedMedia-3.0")
local addonName, ns = ...

--Cache global variables
--Lua functions
local unpack, select = unpack, select
local format = string.format
--WoW API / Variables
local CreateFrame = CreateFrame
local GetTime = GetTime
local hooksecurefunc = hooksecurefunc
local DebuffTypeColor = DebuffTypeColor

local inversePoints = {
	TOP = "BOTTOM",
	BOTTOM = "TOP",
	LEFT = "RIGHT",
	RIGHT = "LEFT",
}

-- Timer format: value, indicator
addon.TimeFormats = {
	[0] = {"%d", "d"}, -- days
	[1] = {"%d", "h"}, -- hours
	[2] = {"%d", "m"}, -- minutes
	[3] = {"%d", "s"}, -- seconds
	[4] = {"%.1f", "s"},  -- seconds below decimal threshold
}

-- Text color for value text: days, hours, minutes, seconds, seconds below decimal threshold
addon.TimeColors = {
	[0] = "|cffeeeeee",
	[1] = "|cffeeeeee",
	[2] = "|cffeeeeee",
	[3] = "|cffeeeeee",
	[4] = "|cfffe0000",
}

-- Text color for indicators: d (days), h (hours), m (minutes), s (seconds), s (seconds, below decimal threshold)
addon.IndicatorColors = {
	[0] = "|cff00b3ff",
	[1] = "|cff00b3ff",
	[2] = "|cff00b3ff",
	[3] = "|cff00b3ff",
	[4] = "|cff00b3ff",
}

function addon:CreateBar(button)
	local statusBar = CreateFrame("StatusBar", "$parentStatusBar", button)
	statusBar:SetStatusBarTexture(LSM:Fetch("statusbar", E.db.VAT.statusBarTexture))
	statusBar:CreateBackdrop("Default")
	button.StatusBar = statusBar
end

function addon:ConfigureAuras(header, auraTable, weaponPosition)
	local filter = header.filter

	for i = 1, #auraTable do
		local button = _G[header:GetName().."AuraButton"..i]
		if not button then break end

		local buffInfo = auraTable[i]
		if buffInfo.duration > 0 and buffInfo.expires then
			button.StatusBar:SetMinMaxValues(0, buffInfo.duration)

			local timeLeft = buffInfo.expires - GetTime()
			if not button.timeLeft_ then
				button.timeLeft_ = timeLeft
				button:SetScript("OnUpdate", addon.UpdateTime)
			else
				button.timeLeft_ = timeLeft
			end

			button.duration = buffInfo.duration
			button.nextUpdate = -1
			addon.UpdateTime(button, 0)
		else
			button.timeLeft_ = nil
			button.time:SetText("")
			button:SetScript("OnUpdate", nil)

			if E.db.VAT.enable and E.db.VAT.noDuration then
				button.StatusBar:Show()

				local _, max = button.StatusBar:GetMinMaxValues()
				button.StatusBar:SetValue(max)
			elseif button.StatusBar:IsShown() then
				button.StatusBar:Hide()
			end
		end

		if not E.db.VAT.statusBarColorByValue then
			local color = E.db.VAT.statusBarColor
			local r, g, b = addon:GetStatusBarColor(color.r, color.g, color.b)
			button.StatusBar:SetStatusBarColor(r, g, b)
		else
			button.StatusBar:SetStatusBarColor(0, 0.8, 0)
		end

		if filter == "HARMFUL" then
			local color = DebuffTypeColor[buffInfo.dispelType or ""]
			button.StatusBar.backdrop:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			button.StatusBar.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
		end
	end

	if weaponPosition then
		for weapon = 2, 1, -1 do
			local button = _G["ElvUIPlayerBuffsTempEnchant"..weapon]
			if A.EnchanData[weapon] then
				if button then
					local expirationTime = A.EnchanData[weapon].expiration
					if expirationTime then
						local duration
						local timeLeft = expirationTime / 1e3
						-- Here we try to figure out the maximum duration of the weapon enchant
						-- If less than 1 hour and higher than 30 minutes set max duration to 1 hour
						if timeLeft <= 3600.5 and timeLeft > 1800.5 then
							duration = 3600
						-- if less than 30 minutes and higher than 10 minutes set max duration to 30 minutes
						elseif timeLeft <= 1800.5 and timeLeft > 600.5 then
							duration = 1800
						else
							duration = 600
						end

						button.StatusBar:SetMinMaxValues(0, duration)

						if not button.timeLeft_ then
							button.timeLeft_ = timeLeft
							button:SetScript("OnUpdate", addon.UpdateTime)
						else
							button.timeLeft_ = timeLeft
						end

						button.duration = duration
						button.nextUpdate = -1
						addon.UpdateTime(button, 0)
					else
						button.timeLeft_ = nil
						button:SetScript("OnUpdate", nil)
						button.time:SetText("")

						if E.db.VAT.enable and E.db.VAT.noDuration then
							button.StatusBar:Show()

							local _, max = button.StatusBar:GetMinMaxValues()
							button.StatusBar:SetValue(max)
						elseif button.StatusBar:IsShown() then
							button.StatusBar:Hide()
						end
					end

					if not E.db.VAT.statusBarColorByValue then
						local color = E.db.VAT.statusBarColor
						local r, g, b = addon:GetStatusBarColor(color.r, color.g, color.b)
						button.StatusBar:SetStatusBarColor(r, g, b)
					else
						button.StatusBar:SetStatusBarColor(0, 0.8, 0)
					end
				end
			end
		end
	end
end

function addon:UpdateHeader(header)
	local db = A.db.debuffs
	if header.filter == "HELPFUL" then
		db = A.db.buffs
	end

	local pos = E.db.VAT.position
	local spacing = E.db.VAT.spacing
	local isOnTop = pos == "TOP" and true or false
	local isOnBottom = pos == "BOTTOM" and true or false
	local isOnLeft = pos == "LEFT" and true or false
	local isOnRight = pos == "RIGHT" and true or false

	local index = 1
	local child = select(index, header:GetChildren())
	while child do
		if child.StatusBar then
			child.StatusBar:Width((isOnTop or isOnBottom) and (db.size - (E.PixelMode and 2 or 4)) or E.db.VAT.barWidth)
			child.StatusBar:Height((isOnLeft or isOnRight) and (db.size - (E.PixelMode and 2 or 4)) or E.db.VAT.barHeight)
			child.StatusBar:ClearAllPoints()
			child.StatusBar:Point(inversePoints[pos], child, pos, (isOnTop or isOnBottom) and 0 or ((isOnLeft and -((E.PixelMode and 2 or 5) + spacing))or ((E.PixelMode and 2 or 5) + spacing)), (isOnLeft or isOnRight) and 0 or ((isOnTop and ((E.PixelMode and 2 or 5) + spacing) or -((E.PixelMode and 2 or 5) + spacing))))

			child.StatusBar:SetStatusBarTexture(LSM:Fetch("statusbar", E.db.VAT.statusBarTexture))
			if isOnLeft or isOnRight then
				child.StatusBar:SetOrientation("VERTICAL")
			else
				child.StatusBar:SetOrientation("HORIZONTAL")
			end
		end

		index = index + 1
		child = select(index, header:GetChildren())
	end
end

function addon:UpdateTime(elapsed)
	if self.IsWeapon then
		local expiration = A.EnchanData[self:GetID()].expiration
		if expiration then
			self.timeLeft = expiration / 1e3
		else
			self.timeLeft = 0
		end
	else
		self.timeLeft = self.timeLeft - elapsed
	end

	if E.db.VAT.enable then
		self.StatusBar:Show()

		if E.db.VAT.showText then
			self.time:Show()
		else
			self.time:Hide()

			if E.db.VAT.tenable then
				if E.db.VAT.threshold.buffs and self.timeLeft <= E.db.VAT.threshold.buffsvalue and self:GetParent().filter == "HELPFUL" then
					self.StatusBar:Hide()
					self.time:Show()
				elseif E.db.VAT.threshold.debuffs and self.timeLeft <= E.db.VAT.threshold.debuffsvalue and self:GetParent().filter ~= "HELPFUL" then
					self.StatusBar:Hide()
					self.time:Show()
				elseif self.time:IsShown() then
					self.StatusBar:Show()
					self.time:Hide()
				end
			end
		end

		self.StatusBar:SetValue(self.timeLeft)
		if E.db.VAT.statusBarColorByValue then
			local r, g, b = E:ColorGradient(self.timeLeft / (self.duration or 600), 0.8,0,0,0.8,0.8,0,0,0.8,0)
			self.StatusBar:SetStatusBarColor(r, g, b)
		end
	elseif self.StatusBar:IsShown() then
		self.StatusBar:Hide()
		self.time:Show()
	end

	if self.nextUpdate > 0 then
		self.nextUpdate = self.nextUpdate - elapsed
		return
	end

	local timerValue, formatID
	timerValue, formatID, self.nextUpdate = E:GetTimeInfo(self.timeLeft, E.db.VAT.decimalThreshold)
	self.time:SetFormattedText(("%s%s|r%s%s|r"):format(addon.TimeColors[formatID], addon.TimeFormats[formatID][1], addon.IndicatorColors[formatID], addon.TimeFormats[formatID][2]), timerValue)

	if self.timeLeft > E.db.auras.fadeThreshold then
		E:StopFlash(self)
	else
		E:Flash(self, 1)
	end
end

function addon:GetStatusBarColor(r, g, b)
	if E:CheckClassColor(r, g, b) then
		local classColor = E.myclass == "PRIEST" and E.PriestColors or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])
		E.db.VAT.staticColor.r = classColor.r
		E.db.VAT.staticColor.g = classColor.g
		E.db.VAT.staticColor.b = classColor.b
		return classColor.r, classColor.g, classColor.b
	end

	return r, g, b
end

function addon:UpdateTimerColors()
	local c, c2

	-- colors for timers that are soon to expire
	c, c2 = E.db.VAT.colors.expire, E.db.VAT.colors.expireIndicator
	self.TimeColors[4] = E:RGBToHex(c.r, c.g, c.b)
	self.IndicatorColors[4] = E:RGBToHex(c2.r, c2.g, c2.b)

	-- colors for timers that have seconds remaining
	c, c2 = E.db.VAT.colors.seconds, E.db.VAT.colors.secondsIndicator
	self.TimeColors[3] = E:RGBToHex(c.r, c.g, c.b)
	self.IndicatorColors[3] = E:RGBToHex(c2.r, c2.g, c2.b)

	-- colors for timers that have minutes remaining
	c, c2 = E.db.VAT.colors.minutes, E.db.VAT.colors.minutesIndicator
	self.TimeColors[2] = E:RGBToHex(c.r, c.g, c.b)
	self.IndicatorColors[2] = E:RGBToHex(c2.r, c2.g, c2.b)

	-- color for timers that have hours remaining
	c, c2 = E.db.VAT.colors.hours, E.db.VAT.colors.hoursIndicator
	self.TimeColors[1] = E:RGBToHex(c.r, c.g, c.b)
	self.IndicatorColors[1] = E:RGBToHex(c2.r, c2.g, c2.b)

	-- color for timers that have days remaining
	c, c2 = E.db.VAT.colors.days, E.db.VAT.colors.daysIndicator
	self.TimeColors[0] = E:RGBToHex(c.r, c.g, c.b)
	self.IndicatorColors[0] = E:RGBToHex(c2.r, c2.g, c2.b)
end

function addon:Initialize()
	-- Register callback with LibElvUIPlugin
	EP:RegisterPlugin(addonName, self.InsertOptions)

	--ElvUI Auras are not enabled, stop right here!
	if E.private.auras.enable ~= true then return; end

	self:UpdateTimerColors()
end

if E.private.auras.enable ~= true then return; end

hooksecurefunc(A, "UpdateTime", addon.UpdateTime)
hooksecurefunc(A, "CreateIcon", addon.CreateBar)
hooksecurefunc(A, "ConfigureAuras", addon.ConfigureAuras)
hooksecurefunc(A, "UpdateHeader", addon.UpdateHeader)