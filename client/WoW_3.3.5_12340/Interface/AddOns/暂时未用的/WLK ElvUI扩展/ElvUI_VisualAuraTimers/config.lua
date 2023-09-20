local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local addon = E:NewModule("VisualAuraTimers");
local A = E:GetModule("Auras");

P.VAT = {
	enable = true,
	noDuration = true,

	position = "BOTTOM",
	spacing = 0,
	["barWidth"] = 6,
	["barHeight"] = 5,

	statusBarTexture = "ElvUI Norm",
	statusBarColor = {r = 0, g = 179/255, b = 1},
	statusBarColorByValue = true,

	["showText"] = false,

	["tenable"] = true,
	["decimalThreshold"] = 4,

	["threshold"] = {
		["buffs"] = false,
		["buffsvalue"] = 5,
		["debuffs"] = true,
		["debuffsvalue"] = 10,
		["tempenchants"] = false,
		["tempenchantsvalue"] = 60
	},
	["colors"] = {
		["expire"] = {r = 1, g = 0, b = 0},
		["expireIndicator"] = {r = 0, g = 179/255, b = 1},
		["seconds"] = {r = 0.93, g = 0.93, b = 0.93},
		["secondsIndicator"] = {r = 0, g = 179/255, b = 1},
		["minutes"] = {r = 0.93, g = 0.93, b = 0.93},
		["minutesIndicator"] = {r = 0, g = 179/255, b = 1},
		["hours"] = {r = 0.93, g = 0.93, b = 0.93},
		["hoursIndicator"] = {r = 0, g = 179/255, b = 1},
		["days"] = {r = 0.93, g = 0.93, b = 0.93},
		["daysIndicator"] = {r = 0, g = 179/255, b = 1}
	}
}

function addon:InsertOptions()
	E.Options.args.visualAuraTimers = {
		order = 50,
		type = "group",
		name = "|cff69ccf0Visual Aura Timers|r",
		childGroups = "tab",
		disabled = function() return not E.private.auras.enable end,
		args = {
			statusbar = {
				order = 1,
				type = "group",
				name = L["StatusBar Options"],
				get = function(info) return E.db.VAT[ info[#info] ] end,
				set = function(info, value) E.db.VAT[ info[#info] ] = value; A:UpdateHeader(ElvUIPlayerBuffs); A:UpdateHeader(ElvUIPlayerDebuffs) end,
				args = {
					info1 = {
						order = 1,
						type = "header",
						name = L["StatusBar Options"]
					},
					general = {
						order = 2,
						type = "group",
						name = L["General Options"],
						guiInline = true,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								desc = L["Show timers as bars instead of text."]
							},
							noDuration = {
								type = "toggle",
								order = 2,
								name = L["No Duration"],
								desc = L["Show bars for auras without a duration."],
								disabled = function() return not E.db.VAT.enable end
							}
						}
					},
					posAndSize = {
						type = "group",
						order = 3,
						name = L["Size and Positions"],
						guiInline = true,
						args = {
							position = {
								order = 1,
								type = "select",
								name = L["Position"],
								disabled = function() return not E.db.VAT.enable end,
								values = {
									["TOP"] = L["Above Icons"],
									["BOTTOM"] = L["Below Icons"],
									["LEFT"] = L["Left Side of Icons"],
									["RIGHT"] = L["Right Side of Icons"]
								}
							},
							spacing = {
								order = 2,
								type = "range",
								name = L["Spacing"],
								min = -20, max = 20, step = 1,
								disabled = function() return not E.db.VAT.enable end
							},
							spacer1 = {
								type = "description",
								order = 3,
								name = ""
							},
							barHeight = {
								type = "range",
								order = 4,
								name = L["Height"],
								min = 3, max = 20, step = 1,
								disabled = function() return not E.db.VAT.enable or (E.db.VAT.position == "LEFT") or (E.db.VAT.position == "RIGHT") end
							},
							barWidth = {
								type = "range",
								order = 5,
								name = L["Width"],
								min = 3, max = 20, step = 1,
								disabled = function() return not E.db.VAT.enable or (E.db.VAT.position == "BOTTOM") or (E.db.VAT.position == "TOP") end
							}
						}
					},
					textures = {
						type = "group",
						order = 4,
						name = L["Textures"],
						guiInline = true,
						args = {
							statusBarTexture = {
								type = "select",
								dialogControl = "LSM30_Statusbar",
								order = 1,
								name = L["StatusBar Texture"],
								disabled = function() return not E.db.VAT.enable end,
								values = AceGUIWidgetLSMlists.statusbar
							}
						}
					},
					colors = {
						type = "group",
						order = 5,
						name = L["Colors"],
						guiInline = true,
						args = {
							statusBarColorByValue = {
								type = "toggle",
								order = 1,
								name = L["StatusBar By Value"],
								desc = L["Color statusbar by amount remaining."],
								disabled = function() return not E.db.VAT.enable end,
							},
							statusBarColor = {
								type = "color",
								order = 2,
								name = L["StatusBar Color"],
								hasAlpha = false,
								disabled = function() return (E.db.VAT.statusBarColorByValue or not E.db.VAT.enable) end,
								get = function(info)
									local t = E.db.VAT.statusBarColor
									local d = P.VAT.statusBarColor
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									E.db.VAT.statusBarColor = {}
									local t = E.db.VAT.statusBarColor
									t.r, t.g, t.b = r, g, b
									A:UpdateHeader(ElvUIPlayerBuffs); A:UpdateHeader(ElvUIPlayerDebuffs)
								end
							}
						}
					}
				}
			},
			timer = {
				type = "group",
				order = 2,
				name = L["Text Options"],
				get = function(info) return E.db.VAT[ info[#info] ] end,
				set = function(info, value) E.db.VAT[ info[#info] ] = value; end,
				args = {
					info2 = {
						order = 1,
						type = "header",
						name = L["Text Options"],
					},
					showText = {
						type = "toggle",
						order = 2,
						name = L["Always Show Text"],
						desc = L["Show text in addition to statusbars. (You might need to move the text by changing the offset in the Buffs and Debuffs section)"],
						disabled = function() return not E.db.VAT.enable end,
					},
					tenable = {
						type = "toggle",
						order = 3,
						name = L["Text Threshold"],
						desc = L["Switch to text based timers when duration goes below threshold"],
						disabled = function() return (E.db.VAT.showText or not E.db.VAT.enable) end,
					},
					decimalThreshold = {
						type = "range",
						order = 4,
						name = L["Decimal Threshold"],
						desc = L["Threshold before the timer changes color and goes into decimal form. Set to -1 to disable."],
						min = -1, max = 30, step = 1,
					},
					spacer3 = {
						type = "description",
						order = 5,
						name = "",
					},
					threshold = {
						type = "group",
						name = L["Text Threshold"],
						order = 6,
						guiInline = true,
						get = function(info) return E.db.VAT.threshold[ info[#info] ] end,
						set = function(info, value) E.db.VAT.threshold[ info[#info] ] = value end,
						disabled = function() return (not E.db.VAT.tenable or not E.db.VAT.enable) end,
						args = {
							buffs = {
								type = "toggle",
								order = 1,
								name = L["Buffs"],
								desc = L["If enabled, the timers on your buffs will switch to text when duration goes below set threshold."],
								disabled = function() return (E.db.VAT.showText or not E.db.VAT.tenable or not E.db.VAT.enable) end,
							},
							debuffs = {
								type = "toggle",
								order = 2,
								name = L["Debuffs"],
								desc = L["If enabled, the timers on your debuffs will switch to text when duration goes below set threshold."],
								disabled = function() return (E.db.VAT.showText or not E.db.VAT.tenable or not E.db.VAT.enable) end,
							},
							spacer4 = {
								type = "description",
								order = 3,
								name = "",
							},
							buffsvalue = {
								type = "range",
								order = 4,
								name = L["Buffs Threshold"],
								desc = L["Threshold in seconds before status bar based timers turn to text."],
								disabled = function() return (E.db.VAT.showText or not E.db.VAT.threshold.buffs or not E.db.VAT.tenable or not E.db.VAT.enable) end,
								min = 0, max = 180, step = 1,
							},
							debuffsvalue = {
								type = "range",
								order = 5,
								name = L["Debuffs Threshold"],
								desc = L["Threshold in seconds before status bar based timers turn to text."],
								disabled = function() return (E.db.VAT.showText or not E.db.VAT.threshold.debuffs or not E.db.VAT.tenable or not E.db.VAT.enable) end,
								min = 0, max = 60, step = 1,
							},
						},
					},
					colors = {
						order = 7,
						type = "group",
						name = L["Colors"],
						guiInline = true,
						args = {
							numbers = {
								order = 1,
								type = "group",
								guiInline = true,
								name = L["Numbers"],
								get = function(info)
									local t = E.db.VAT.colors[ info[#info] ]
									local d = P.VAT.colors[ info[#info] ]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									E.db.VAT.colors[ info[#info] ] = {}
									local t = E.db.VAT.colors[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									addon:UpdateTimerColors()
									A:UpdateHeader(ElvUIPlayerBuffs); A:UpdateHeader(ElvUIPlayerDebuffs)
								end,
								args = {
									expire = {
										order = 1,
										type = "color",
										name = L["Expiring"],
										desc = L["Color when the text is about to expire"],
									},
									seconds = {
										order = 2,
										type = "color",
										name = L["Seconds"],
										desc = L["Color when the text is in the seconds format."],
									},
									minutes = {
										order = 3,
										type = "color",
										name = L["Minutes"],
										desc = L["Color when the text is in the minutes format."]
									},
									hours = {
										order = 4,
										type = "color",
										name = L["Hours"],
										desc = L["Color when the text is in the hours format."]
									},
									days = {
										order = 5,
										type = "color",
										name = L["Days"],
										desc = L["Color when the text is in the days format."]
									}
								}
							},
							dateIndicator = {
								order = 2,
								type = "group",
								guiInline = true,
								name = L["Indicator (s, m, h, d)"],
								get = function(info)
									local t = E.db.VAT.colors[ info[#info] ]
									local d = P.VAT.colors[ info[#info] ]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									E.db.VAT.colors[ info[#info] ] = {}
									local t = E.db.VAT.colors[ info[#info] ]
									t.r, t.g, t.b = r, g, b
									addon:UpdateTimerColors()
									A:UpdateHeader(ElvUIPlayerBuffs); A:UpdateHeader(ElvUIPlayerDebuffs)
								end,
								args = {
									expireIndicator = {
										order = 1,
										type = "color",
										name = L["Expiring"],
										desc = L["Color when the text is about to expire"]
									},
									secondsIndicator = {
										order = 2,
										type = "color",
										name = L["Seconds"],
										desc = L["Color when the text is in the seconds format."]
									},
									minutesIndicator = {
										order = 3,
										type = "color",
										name = L["Minutes"],
										desc = L["Color when the text is in the minutes format."]
									},
									hoursIndicator = {
										order = 4,
										type = "color",
										name = L["Hours"],
										desc = L["Color when the text is in the hours format."]
									},
									daysIndicator = {
										order = 5,
										type = "color",
										name = L["Days"],
										desc = L["Color when the text is in the days format."]
									}
								}
							}
						}
					}
				}
			}
		}
	}
end

local function InitializeCallback()
	addon:Initialize()
end

E:RegisterModule(addon:GetName(), InitializeCallback)