-- English localization file for enUS and enGB.
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "enUS", true);

if not L then return end
L["Above Icons"] = true
L["Always Show Text"] = true
L["Below Icons"] = true
L["Buffs Threshold"] = true
L["Color statusbar by amount remaining."] = true
L["Debuffs Threshold"] = true
L["If enabled, the timers on your buffs will switch to text when duration goes below set threshold."] = true
L["If enabled, the timers on your debuffs will switch to text when duration goes below set threshold."] = true
L["Indicator (s, m, h, d)"] = true
L["Left Side of Icons"] = true
L["No Duration"] = true
L["Numbers"] = true
L["Right Side of Icons"] = true
L["Show text in addition to statusbars. (You might need to move the text by changing the offset in the Buffs and Debuffs section)"] = true
L["StatusBar By Value"] = true
L["StatusBar Color"] = true
L["StatusBar Options"] = true
L["Switch to text based timers when duration goes below threshold"] = true
L["Text Options"] = true
L["Threshold before the timer changes color and goes into decimal form. Set to -1 to disable."] = true
L["Threshold in seconds before status bar based timers turn to text."] = true

--We don't need the rest if we're on enUS or enGB locale, so stop here.
if GetLocale() == "enUS" then return end

--German Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "deDE")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Spanish (Spain) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "esES")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Spanish (Mexico) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "esMX")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--French Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "frFR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Italian Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "itIT")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Korean Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "koKR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Portuguese Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "ptBR")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Russian Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "ruRU")
if L then
	L["Above Icons"] = true
	L["Always Show Text"] = true
	L["Below Icons"] = true
	L["Buffs Threshold"] = true
	L["Color statusbar by amount remaining."] = true
	L["Debuffs Threshold"] = true
	L["If enabled, the timers on your buffs will switch to text when duration goes below set threshold."] = true
	L["If enabled, the timers on your debuffs will switch to text when duration goes below set threshold."] = true
	L["Indicator (s, m, h, d)"] = true
	L["Left Side of Icons"] = true
	L["No Duration"] = true
	L["Numbers"] = true
	L["Right Side of Icons"] = true
	L["Show text in addition to statusbars. (You might need to move the text by changing the offset in the Buffs and Debuffs section)"] = true
	L["StatusBar By Value"] = "Полоса состояния по значению"
	L["StatusBar Color"] = "Цвет полосы состояния"
	L["StatusBar Options"] = "Настройки полос состояния"
	L["Switch to text based timers when duration goes below threshold"] = true
	L["Text Options"] = "Настройки текста"
	L["Threshold before the timer changes color and goes into decimal form. Set to -1 to disable."] = true
	L["Threshold in seconds before status bar based timers turn to text."] = true
end

--Chinese (China, simplified) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "zhCN")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end

--Chinese (Taiwan, traditional) Localizations
local L = LibStub("AceLocale-3.0"):NewLocale("ElvUI", "zhTW")
if L then
	--Add translations here, eg.
	-- L[' Alert'] = ' Alert',
end