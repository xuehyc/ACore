local E, L, V, P, G = unpack(ElvUI)
local ESC = E:GetModule("EverySecondCounts")
local LSM = LibStub("LibSharedMedia-3.0")
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, ns = ...
local threshhold
local mmSSthreshold

local format = string.format
local floor = math.floor
local ceil = math.ceil

-- Timer Colors for Cooldown
local TimeColors = {
	[0] = "|cffeeeeee",
	[1] = "|cffeeeeee",
	[2] = "|cffeeeeee",
	[3] = "|cffeeeeee",
	[4] = "|cfffe0000",
	[5] = "|cffeeeeee",
}

-- Timer Formats for Cooldown
local TimeFormats = {
	[0] = { "%dd", "%dd" },
	[1] = { "%dh", "%dh" },
	[2] = { "%dm", "%dm" },
	[3] = { "%ds", "%d" },
	[4] = { "%.1fs", "%.1f" },
	[5] = { "%d:%02d", "%d:%02d" },
}

-- Copied from ElvUI
local DAY, HOUR, MINUTE = 86400, 3600, 60 --used for calculating aura time text
local DAYISH, HOURISH, MINUTEISH = HOUR * 23.5, MINUTE * 59.5, 59.5 --used for caclculating aura time at transition points
local HALFDAYISH, HALFHOURISH, HALFMINUTEISH = DAY/2 + 0.5, HOUR/2 + 0.5, MINUTE/2 + 0.5 --used for calculating next update times
local FONT_SIZE = 18 --the base font size to use at a scale of 1
local ICON_SIZE = 36 --the normal size for an icon (don"t change this)
local MIN_SCALE = 0.2 --the minimum scale we want to show cooldown counts at, anything below this will be hidden

-- Copied from ElvUI and modified to return a 2nd display value
-- Returns display value, formatter ID, next update, 2nd display value (in case of MM:SS formats)
function ESC:GetTimeInfo(s, threshhold, mmSSthreshold)
	if s < MINUTE then
		if s >= threshhold then
			return floor(s), 3, 0.51
		else
			return s, 4, 0.051
		end
	elseif s < HOUR then
		if mmSSthreshold and s < mmSSthreshold then
			return s/MINUTE, 5, 0.51, s%MINUTE
		else
			local minutes = floor((s/MINUTE)+.5)
			return ceil(s / MINUTE), 2, minutes > 1 and (s - (minutes*MINUTE - HALFMINUTEISH)) or (s - MINUTEISH)
		end
	elseif s < DAY then
		local hours = floor((s/HOUR)+.5)
		return ceil(s / HOUR), 1, hours > 1 and (s - (hours*HOUR - HALFHOURISH)) or (s - HOURISH)
	else
		local days = floor((s/DAY)+.5)
		return ceil(s / DAY), 0,  days > 1 and (s - (days*DAY - HALFDAYISH)) or (s - DAYISH)
	end
end

-- Copied from ElvUI and modified to include mmSSthreshold
local function Cooldown_OnUpdate(cd, elapsed)
	if cd.nextUpdate > 0 then
		cd.nextUpdate = cd.nextUpdate - elapsed
		return
	end

	local remain = cd.duration - (GetTime() - cd.start)
	if remain > 0.05 then
		if (cd.fontScale * cd:GetEffectiveScale() / UIParent:GetScale()) < MIN_SCALE then
			cd.text:SetText("")
			cd.nextUpdate = 500
		else
			local timervalue, timervalue2, formatid
			timervalue, formatid, cd.nextUpdate, timervalue2 = ESC:GetTimeInfo(remain, threshold, mmSSthreshold)
			cd.text:SetFormattedText(("%s%s|r"):format(TimeColors[formatid], TimeFormats[formatid][2]), timervalue, timervalue2)

			-- If next update is below mmSSthreshold then update when we reach the threshold
			if (remain - cd.nextUpdate) < mmSSthreshold then
				cd.nextUpdate = remain - mmSSthreshold
			end
		end
	else
		E:Cooldown_StopTimer(cd)
	end
end

-- Copied from ElvUI, modified to set a modified OnUpdate function
function E:CreateCooldownTimer(parent)
	local scaler = CreateFrame("Frame", nil, parent)
	scaler:SetAllPoints()

	local timer = CreateFrame("Frame", nil, scaler) timer:Hide()
	timer:SetAllPoints()
	timer:SetScript("OnUpdate", Cooldown_OnUpdate)

	local text = timer:CreateFontString(nil, "OVERLAY")
	text:SetPoint(E.db.ESC.textPosition, E.db.ESC.textOffsetX, E.db.ESC.textOffsetY)
	text:SetJustifyH("CENTER")
	timer.text = text

	self:Cooldown_OnSizeChanged(timer, parent:GetSize())
	parent:SetScript("OnSizeChanged", function(_, ...) self:Cooldown_OnSizeChanged(timer, ...) end)

	parent.timer = timer
	return timer
end

-- Copied from ElvUI, modified to allow for customizable font size
function E:Cooldown_OnSizeChanged(cd, width, height)
	local fontScale = floor(width +.5) / ICON_SIZE
	local override = cd:GetParent():GetParent().SizeOverride
	if override then
		fontScale = override / FONT_SIZE
	end

	if fontScale == cd.fontScale then
		return
	end

	cd.fontScale = fontScale
	if fontScale < MIN_SCALE and not override then
		cd:Hide()
	else
		cd:Show()
		cd.text:FontTemplate(LSM:Fetch("font", E.db.ESC.font), fontScale * E.db.ESC.fontSize, E.db.ESC.fontOutline)
		if cd.enabled then
			self:Cooldown_ForceUpdate(cd)
		end
	end
end

function ESC:UpdateCooldownSettings()
	threshold = E.db.cooldown.threshold
	mmSSthreshold = E.db.ESC.mmSSthreshold

	local color = E.db.ESC.mmSScolor
	TimeColors[5] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that are in the MM:SS format

	color = E.db.cooldown.expiringColor
	TimeColors[4] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that are soon to expire

	color = E.db.cooldown.secondsColor
	TimeColors[3] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that have seconds remaining

	color = E.db.cooldown.minutesColor
	TimeColors[2] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that have minutes remaining

	color = E.db.cooldown.hoursColor
	TimeColors[1] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that have hours remaining

	color = E.db.cooldown.daysColor
	TimeColors[0] = E:RGBToHex(color.r, color.g, color.b) -- color for timers that have days remaining
end

function ESC:Initialize()
	self:UpdateCooldownSettings()
end

function ESC:OnInitialize()
	-- Register callback with LibElvUIPlugin
	EP:RegisterPlugin(addon, ESC.InsertOptions)

	-- ElvUI ActionBars are not enabled or the Cooldown module is not enabled, stop right here
	if E.private.actionbar.enable ~= true or E.private.cooldown.enable ~= true then return end

	hooksecurefunc(E, "UpdateCooldownSettings", ESC.UpdateCooldownSettings)
end