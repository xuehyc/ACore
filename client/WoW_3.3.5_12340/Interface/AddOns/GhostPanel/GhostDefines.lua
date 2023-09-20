Ghost = {
	Data ={
		HRTitles ={
		[0]     = "新兵",
   		[1]     = "列兵",
   		[2]     = "下士",
   		[3]     = "中士",
   		[4]     = "军士长",
   		[5]     = "士官长",
   		[6]     = "骑士",
   		[7]     = "骑士中尉",
   		[8]     = "骑士队长",
   		[9]     = "护卫骑士",
   		[10]    = "少校",
   		[11]    = "司令",
   		[12]    = "统帅",
   		[13]    = "元帅",
   		[14]    = "大元帅",
   		[15]    = "斥候",
   		[16]    = "步兵",
   		[17]    = "中士",
   		[18]    = "高阶军士",
   		[19]    = "一等军士长",
   		[20]    = "石头守卫",
   		[21]    = "血卫士",
   		[22]    = "军团士兵",
   		[23]    = "百夫长",
   		[24]    = "勇士",
   		[25]    = "中将",
   		[26]    = "将军",
   		[27]    = "督军",
   		[28]    = "高阶督军",
		},
		HR = {
			A = {},
			H = {},
		},
		VIP ={},
		FactionTitles ={},
		RankTitles ={},
		ReincarnationTitles ={},
		Req={},
		Rew={},
		Enchant = {},

		RuneCategory={},

		--其他
		LuckDrawReqData={
			[1] = 0,
			[2] = 0,
		},

		Item={
			Entry={},
			GUID={},
		},

		GS = {
			Target = {},
			Spells = {},
		},

		AddonBan ={},

		LFGTankRewId = 0,	-- 坦克
		LFGHealRewId = 0,	-- 治疗
		LFGDpsRewId = 0,	-- DPS
		BGDailyRewId = 0,	-- 每日战场
	},
	Char ={
		LEVEL 				= 80,
		VIP 				= 0,
		HR 					= 0,
		FACTION				= 0,
		RANK	 			= 0,
		REINCARNATION 		= 0,
		ACHIEVEMENTPOINTS 	= 0,
		GOLD 				= 0,
		TOKEN 				= 0,
		XP 					= 0,
		HONOR 				= 0,
		ARENA 				= 0,
		SPIRITPOWER 		= 0,
		RUNE				= 100,
		MAP					= 0,
		ZONE				= 0,
		AREA				= 0,
		TALISMAN			= 0,
		DayLimitItem		={},
	},
	UI = {
		MainFrame = nil,
		UIFrame = nil,
		Background = nil,
		CharName = nil,
		ReqPanel = nil,
		RewPanel = nil,
		ReqPopFrame = nil,
		Pages = {},
		NavButtons = {},
		SelectedPageId = 1,
		SelectedSubPageId = 1,
	},
	Rune ={
		PageFrames = {},
		NavButtons = {},
		PageButtons = {
			[1] = { Button={} },
			[2] = { Button={} },
			[3] = { Button={} },
			[4] = { Button={} },
			[5] = { Button={} },
			[6] = { Button={} },
			[7] = { Button={} },
			[8] = { Button={} },
			[9] = { Button={} },
			[10] = { Button={} },
		},
		SelectedPageId = 1,
	},

	TransMog ={
		PageFrames = {},
		NavButtons = {},
		PageButtons = {
			[1] = { Button={} },
			[2] = { Button={} },
			[3] = { Button={} },
			[4] = { Button={} },
			[5] = { Button={} },
			[6] = { Button={} },
			[7] = { Button={} },
			[8] = { Button={} },
			[9] = { Button={} },
			[10] = { Button={} },
			[11] = { Button={} },
			[12] = { Button={} },
			[13] = { Button={} },
			[14] = { Button={} },
		},
		SelectedPageId = 1,
	},

	BlackMarket={
		Button={},
	},

	Talent={
		Button={},
	},

	LuckDraw={
		Button={},
		RewButton={},
		ActionButton={},
	},

	VIP={
		Button={},
	},

	HR={
		Button={},
	},

	Rew ={
		GoldButton = nil,
		TokenButton = nil,
		XPButton = nil,
		HONORButton = nil,
		ArenaButton = nil,
		StatPointButton = nil,
		ItemButtons ={},
		SpellButtons ={},
		AuraButtons ={},
		CMDButtons = {},
	},

	Req ={
		LevelButton = nil,
    	VIPButton = nil,
    	HRButton = nil,
    	FactionButton = nil,
    	RankButton = nil,
    	ReincarnationButton = nil,
    	AchievementPointsButton = nil,
    	GoldButton = nil,
    	TokenButton = nil,
    	XPButton = nil,
    	HonorButton = nil,
    	ArenaButton = nil,
    	SpiritPowerButton = nil,
    	MapDataButton = nil,
    	QuestDataButton = nil,
    	AchievementDataButton = nil,
    	SpellDataButton = nil,
		ItemButtons ={},
		CMDButtons = {},
	},

	ReqRewPop ={
		ReqTitleFontString 		= nil;
		ReqMeetFontString 		= nil;
		ReqDestroyFontString 	= nil;
		ReqOtherFontString 	= nil;
		RewTitleFontString 		= nil;

		ReqTitleText 		= nil;
		RewTitleText 		= nil;

		ConfirmButton = nil,
		CancelButton = nil,

		ReqLevelButton = nil,
		ReqVIPButton = nil,
		ReqHRButton = nil,
		ReqFactionButton = nil,
		ReqRankButton = nil,
		ReqReincarnationButton = nil,
		ReqAchievementPointsButton = nil,
		ReqGoldButton = nil,
		ReqTokenButton = nil,
		ReqXPButton = nil,
		ReqHonorButton = nil,
		ReqArenaButton = nil,
		ReqSpiritPowerButton = nil,
		ReqMapDataButton = nil,
		ReqQuestDataButton = nil,
		ReqAchievementDataButton = nil,
		ReqSpellDataButton = nil,
		ReqItemButtons ={},
		ReqMapDataTip = "",
		ReqQuestDataTip = "",
		ReqAchievementDataTip = "",
		ReqCMDButtons = {},

		RewGoldButton = nil;
		RewTokenButton = nil,
		RewXPButton = nil,
		RewStatPointButton = nil,
		RewHonorButton = nil,
		RewArenaButton = nil,
		RewItemButtons = {},
		RewAuraButtons = {},
		RewSpellButtons = {},
		RewCMDButtons = {},
	},
};

GHOST_ICON = {
	["ARROW_UP"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\misc_arrowlup",
	["ARROW_DOWN"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\misc_arrowdown";
	["ARROW_LEFT"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\misc_arrowleft";
	["ARROW_RIGHT"] 				= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\misc_arrowright";
	["CONFIRM"] 					= "Interface\\BUTTONS\\UI-CheckBox-Check";
	["CANCEL"] 						= "Interface\\BUTTONS\\UI-GroupLoot-Pass-Up";

	["LEVEL"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_LEVEL",
	["VIP"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_VIP",
	["HR"] 							= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_HR",
	["FACTION"]						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_FACTION",
	["RANK"]	 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_RANK",
	["REINCARNATION"] 				= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_REINCARNATION",
	["ACHIEVEMENTPOINTS"] 			= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_ACHIEVEMENTPOINTS",
	["GOLD"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_GOLD",
	["TOKEN"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\Racial_Dwarf_FindTreasure",
	["XP"] 							= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_XP",
	["HONOR"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_HONOR",
	["ARENA"] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_ARENA",		
	["SPIRITPOWER"] 				= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_SPIRITPOWER",
	["MAP_DATA"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_MAPDATA",
	["QUEST_DATA"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_QUESTDATA",
	["ACHIEVEMENT_DATA"]			= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_ACHIEVEMENTPOINTS",
	["SPELL_DATA"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_SPELLDATA",
	["STATPOINT"] 					= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_SPELLDATA",

	["LUCKDRAW"]={
		[1] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_SPELLDATA",
		[2] 						= "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_SPELLDATA",
	},
};

GHOST_BUTTON_STATE = {
	["ACTIVE"] 		= 1,
	["DEACTIVE"] 	= 2,
	["JUST_ACTIVE"] = 3,
	["NEXT_ACTIVE"] = 4,
};

GHOST_BUTTON_TYPE = {

	["CONFIRM"] 				= 1,
	["CANCEL"] 					= 2,
	["ARROW_UP"] 				= 3,
	["ARROW_DOWN"] 				= 4,
	["ARROW_LEFT"] 				= 5,
	["ARROW_RIGHT"] 			= 6,

	["REQ_LEVEL"] 				= 7,
	["REQ_VIP"] 				= 8,
	["REQ_HR"] 					= 9,
	["REQ_FACTION"]				= 10,
	["REQ_RANK"]	 			= 11,
	["REQ_REINCARNATION"] 		= 12,
	["REQ_ACHIEVEMENTPOINTS"] 	= 13,
	["REQ_GOLD"] 				= 14,
	["REQ_TOKEN"] 				= 15,
	["REQ_XP"] 					= 16,
	["REQ_HONOR"] 				= 17,
	["REQ_ARENA"] 				= 18,		
	["REQ_SPIRITPOWER"] 		= 19,
	["REQ_MAP_DATA"] 			= 20,
	["REQ_QUEST_DATA"] 			= 21,
	["REQ_ACHIEVEMENT_DATA"]	= 22,
	["REQ_SPELL_DATA"] 			= 23,
	["REQ_ITEM"] 				= 24,
	["REQ_CMD"] 				= 25,

	["REW_GOLD"] 				= 26,
	["REW_TOKEN"] 				= 27,
	["REW_XP"] 					= 28,
	["REW_STATPOINT"] 			= 29,
	["REW_HONOR"] 				= 30,
	["REW_ARENA"] 				= 31,
	["REW_ITEM"] 				= 32,
	["REW_AURA"] 				= 33,
	["REW_SPELL"] 				= 34,
	["REW_CMD"] 				= 35,

	["POP_REQ_LEVEL"] 				= 36,
	["POP_REQ_VIP"] 				= 37,
	["POP_REQ_HR"] 					= 38,
	["POP_REQ_FACTION"]				= 39,
	["POP_REQ_RANK"]	 			= 40,
	["POP_REQ_REINCARNATION"] 		= 41,
	["POP_REQ_ACHIEVEMENTPOINTS"] 	= 42,
	["POP_REQ_GOLD"] 				= 43,
	["POP_REQ_TOKEN"] 				= 44,
	["POP_REQ_XP"] 					= 45,
	["POP_REQ_HONOR"] 				= 46,
	["POP_REQ_ARENA"] 				= 47,		
	["POP_REQ_SPIRITPOWER"] 		= 48,
	["POP_REQ_MAP_DATA"] 			= 49,
	["POP_REQ_QUEST_DATA"] 			= 50,
	["POP_REQ_ACHIEVEMENT_DATA"]	= 51,
	["POP_REQ_SPELL_DATA"] 			= 52,
	["POP_REQ_ITEM"] 				= 53,
	["POP_REQ_CMD"] 				= 54,
	["POP_REW_GOLD"] 				= 55,
	["POP_REW_TOKEN"] 				= 56,
	["POP_REW_XP"] 					= 57,
	["POP_REW_STATPOINT"] 			= 58,
	["POP_REW_HONOR"] 				= 59,
	["POP_REW_ARENA"] 				= 60,
	["POP_REW_ITEM"] 				= 61,
	["POP_REW_AURA"] 				= 62,
	["POP_REW_SPELL"] 				= 63,
	["POP_REW_CMD"] 				= 64,
	["POP_CONFIRM"] 				= 65,
	["POP_CANCEL"] 					= 66,

	["RUNE"] 					= 67,

	["BLACKMARKET"] 			= 68,

	["TRANSMOG"] 				= 69,

	["LUCKDRAW"] 				= 70,
	["LUCKDRAW_REW"]			= 71,
	["LUCKDRAW_ACTION"]			= 72,

	["VIP"] 					= 73,
	["HR"] 						= 74,

	["TALENT"] 					= 75,
};

GHOST_MAX_PAGES = 10;

GHOST_BUTTON_DATA = 
{
    [1] = { MTEXT = "符文", TIP = "|cff00ff00打开符文面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\INV_MageMount_fire" },
	[2] = { MTEXT = "黑市", TIP = "|cff00ff00打开黑市面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\WoW_Token01" },
	[3] = { MTEXT = "幻化", TIP = "|cff00ff00打开幻化面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\INV_Legendary_Sword" },
    [4] = { MTEXT = "抽奖", TIP = "|cff00ff00打开抽奖面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\Ability_Skyreach_Empowered" },
	[5] = { MTEXT = "会员", TIP = "|cff00ff00打开会员面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_VIP" },
	[6] = { MTEXT = "军衔", TIP = "|cff00ff00打开军衔面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_HR" },
	[7] = { MTEXT = "灵甲", TIP = "|cff00ff00打开灵甲面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_REINCARNATION" },
	[8] = { MTEXT = "回收", TIP = "|cff00ff00打开回收面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_RANK" },
	[9] = { MTEXT = "门派", TIP = "|cff00ff00打开门派面板|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\GC_FACTION" },
	[10] = {

		[1] = {	MTEXT = "升级", TIP = "|cff00ff00升级你的装备|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\Ability_Warlock_Backdraft"},
		[2] = { MTEXT = "强化", TIP = "|cff00ff00强化你的装备|r", 			ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\spell_06" },
		[3] = { MTEXT = "移除宝石", TIP = "|cff00ff00移除装备上的宝石|r", 	ICON = "Interface\\AddOns\\GhostPanel\\Asset\\ICONS\\INV_Jewelcrafting_CrimsonSpinel_02" },	 
	},
};

GHOST_MAX_RUNE_PAGES = 10;
GHOST_MAX_RUNE_BUNTTON = 37;

GHOST_MAX_TRANSMOG_PAGES = 14;
GHOST_MAX_TRANSMOG_BUNTTON = 37;

GHOST_MAX_BLACKMARKET_BUNTTON = 37;
GHOST_MAX_TALENT_BUNTTON = 37;

GHOST_MAX_LUCKDRAW_BUNTTON = 37;
GHOST_MAX_LUCKDRAW_REW_BUNTTON = 10;
GHOST_MAX_LUCKDRAW_ID	= 1;


GHOST_STR_CONFIRM = "确认";
GHOST_STR_CANCEL = "取消";

GHOST_STR_FETCH 		= "|cff00ff00获取|r ";
GHOST_STR_BUY_CLICK		= "|cff00ff00点击购买|r";
GHOST_STR_GAME_CONTENT 	= "|cff00ff00游戏内容|r";

GHOST_STR_BLACKMARKET_ENABLE	= "|cff00ff00开放售卖|r";
GHOST_STR_BLACKMARKET_DISABLE	= "|cffcccccc已经售出|r";

GHOST_STR_RUNE_POSSESSED 		= "|cff00ff00已获取|r";
GHOST_STR_RUNE_NOT_POSSESSED 	= "|cffcccccc未获取|r";

GHOST_STR_LUCKDRAW_REW 			= "|cff00ff00抽奖奖励";
GHOST_STR_LUCKDRAW				= "|cff00ff00奖池物品";

GHOST_STR_REQ_MEET 				= "|cff00ff00达到要求|r";
GHOST_STR_REQ_MEET_ICON 		= "Interface\\BUTTONS\\UI-CheckBox-Check";
GHOST_STR_REQ_NOT_MEET 			= "|cffcccccc未达到要求|r";
GHOST_STR_REQ_NOT_MEET_ICON 	= "Interface\\BUTTONS\\UI-GroupLoot-Pass-Up";

GHOST_ITEM_REQ_EXCHANGE_TITLE 	= "升级装备";
GHOST_ITEM_REQ_EXCHANGE_1 		= "|cff00ff00当前物品|r";
GHOST_ITEM_REQ_EXCHANGE_2 		= "|cff00ff00升级后物品|r";
GHOST_ITEM_REQ_REQ_ENOUGH 		= "|cff00ff00拥有足够材料|r";
GHOST_ITEM_REQ_REQ_LACK 		= "|cffff0000缺少 %s 个|r";


function  TESTTTT( ... )
	
	GameTooltip_ShowStatusBar(GameTooltip, 0, 100, 30, "ESE");
	GameTooltip:Show();
end

GHOST_CLASS_COLOR = {
    ["DEATHKNIGHT"] = { r = 0.77, b = 0.12, b = 0.23 },
    ["DRUID"] = { r = 1.00, g = 0.49, b = 0.04 },
    ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45 },
    ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94 },
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 },
    ["PRIEST"] = { r = 1, g = 1, b = 1 },
    ["ROGUE"] = { r = 1, g = 0.96, b = 0.41 },
    ["SHAMAN"] = { r = 0, g = 0.44, b = 0.87 },
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 },
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 }
};