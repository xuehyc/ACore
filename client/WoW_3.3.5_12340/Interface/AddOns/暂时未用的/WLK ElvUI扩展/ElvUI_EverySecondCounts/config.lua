local E, L, V, P, G = unpack(ElvUI)
local ESC = E:NewModule("EverySecondCounts", "AceEvent-3.0")

-- Defaults
P["ESC"] = {
	["mmSSthreshold"] = 120,
	["mmSScolor"] = { r = 1, g = 1, b = 1 },
	["font"] = "Friz Quadrata TT",
	["fontOutline"] = "OUTLINE",
	["fontSize"] = 18,
	["textPosition"] = "CENTER",
	["textOffsetX"] = 1,
	["textOffsetY"] = 1,
}

function ESC:InsertOptions()
	E.Options.args.ESC = {
		order = 2000,
		type = "group",
		name = "|cff4beb2cEvery Second Counts|r",
		args = {
			cooldowns = {
				order = 1,
				type = "group",
				name = L["Cooldowns"],
				guiInline = true,
				disabled = function() return (not E.private.actionbar.enable or not E.private.cooldown.enable) end,
				args = {
					mmSScolor = {
						order = 1,
						type = "color",
						name = L["MM:SS Color"],
						desc = L["Color for timers in the MM:SS format"],
						get = function(info)
							local c = E.db.ESC.mmSScolor
							return c.r, c.g, c.b
						end,
						set = function(info, r, g, b)
							E.db.ESC.mmSScolor = {}
							local c = E.db.ESC.mmSScolor
							c.r, c.g, c.b = r, g, b
							ESC:UpdateCooldownSettings()
						end,
					},
					mmSSthreshold = {
						order = 2,
						type = "range",
						name = L["MM:SS Threshold"],
						desc = L["Threshold (in seconds) before text is shown in the MM:SS format. Set to -1 to never change to this format."],
						min = -1, max = 300, step = 1,
						get = function(info) return E.db.ESC.mmSSthreshold end,
						set = function(info, value) E.db.ESC.mmSSthreshold = value; ESC:UpdateCooldownSettings() end,
					},
					spacer = {
						order = 3,
						type = "description",
						name = "",
					},
					font = {
						order = 4,
						type = "select",
						name = L["Font"],
						dialogControl = "LSM30_Font",
						values = AceGUIWidgetLSMlists.font,
						get = function(info) return E.db.ESC.font end,
						set = function(info, value) E.db.ESC.font = value; E:StaticPopup_Show("CONFIG_RL") end,
					},
					fontOutline = {
						order = 5,
						type = "select",
						name = L["Font Outline"],
						get = function(info) return E.db.ESC.fontOutline end,
						set = function(info, value) E.db.ESC.fontOutline = value; E:StaticPopup_Show("CONFIG_RL") end,
						values = {
							["NONE"] = NONE,
							["OUTLINE"] = "OUTLINE",
							["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
							["THICKOUTLINE"] = "THICKOUTLINE",
						},
					},
					fontSize = {
						order = 6,
						type = "range",
						name = L["Font Size"],
						desc = L["Sets the size of the timers."],
						min = 10, max = 30, step = 1,
						get = function(info) return E.db.ESC.fontSize end,
						set = function(info, value) E.db.ESC.fontSize = value; E:StaticPopup_Show("CONFIG_RL") end,
					},
					spacer2 = {
						order = 7,
						type = "description",
						name = "",
					},
					textPosition = {
						order = 8,
						type = "select",
						name = L["Position"],
						get = function(info) return E.db.ESC.textPosition end,
						set = function(info, value) E.db.ESC.textPosition = value; E:StaticPopup_Show("CONFIG_RL") end,
						values = {
							["TOPLEFT"] = "TOPLEFT",
							["LEFT"] = "LEFT",
							["BOTTOMLEFT"] = "BOTTOMLEFT",
							["RIGHT"] = "RIGHT",
							["TOPRIGHT"] = "TOPRIGHT",
							["BOTTOMRIGHT"] = "BOTTOMRIGHT",
							["CENTER"] = "CENTER",
							["TOP"] = "TOP",
							["BOTTOM"] = "BOTTOM",
						},
					},
					textOffsetX = {
						order = 9,
						type = "range",
						name = L["X-Offset"],
						min = -10, max = 10, step = 1,
						get = function(info) return E.db.ESC.textOffsetX end,
						set = function(info, value) E.db.ESC.textOffsetX = value; E:StaticPopup_Show("CONFIG_RL") end,
					},
					textOffsetY = {
						order = 10,
						type = "range",
						name = L["Y-Offset"],
						min = -10, max = 10, step = 1,
						get = function(info) return E.db.ESC.textOffsetY end,
						set = function(info, value) E.db.ESC.textOffsetY = value; E:StaticPopup_Show("CONFIG_RL") end,
					},
				},
			},
		},
	}
end

E:RegisterModule(ESC:GetName())