﻿#include <Define.h>
#include <string>
#include <vector>


struct StringTemplate
{
    uint32 types;
    std::string text;
};

enum CORE_STR_TYPES
{
    STR_NONE,

    STR_WORLD_CHAT,
    STR_LOGIN,
    STR_LOGIN_A,
    STR_LOGIN_H,
    STR_LOGOUT,

    STR_NO_EFFECT,
    STR_GEM_REMOVE,
    STR_ITEM_UNBIND,
    STR_ITEM_EXCHANGE,
    STR_ITEM_UPGRADE,
    STR_ITEM_ENCHANT,
    STR_WEAPON_PERM,
    STR_IDENTIFY,
    STR_ASTROLOGY,

    STR_STAT_PANEL,
    STR_SPELL_PANEL,
    STR_EXTRA_EUIP_PANEL,
    STR_DISPLAY_PANEL,

    STR_ACTIVE_SPELLS,
    STR_PASSIVE_SPELLS,
    STR_LEARN_SPELL,
    STR_SPELL_DES,
    STR_SPELL_CHANGE,

    STR_BOT_STAT_CURR_0,
    STR_BOT_STAT_CURR_1,
    STR_BOT_STAT_CURR_2,
    STR_BOT_STAT_CURR_3,
    STR_BOT_STAT_CURR_4,
    STR_BOT_STAT_MAX_0,
    STR_BOT_STAT_MAX_1,
    STR_BOT_STAT_MAX_2,
    STR_BOT_STAT_MAX_3,
    STR_BOT_STAT_MAX_4,

    STR_BOT_DISPLAY_CURR,
    STR_BOT_DISPLAY_MAINHAND,
    STR_BOT_DISPLAY_OFFHAND,
    STR_BOT_DISPLAY_RANGED,
    STR_BOT_DISPLAY_BUY,

    STR_ABTAIN_ITEM_NOTICE,

    STR_VIP_UP,

    STR_END_KILL_STREAK_1,
    STR_END_KILL_STREAK_2,
    STR_END_KILL_STREAK_3,
    STR_END_KILL_STREAK_4,
    STR_END_KILL_STREAK_5,
    STR_END_KILL_STREAK_6,
    STR_END_KILL_STREAK_7,
    STR_END_KILL_STREAK_8,
    STR_END_KILL_STREAK_9,
    STR_END_KILL_STREAK_10,

    STR_KILL_STREAK_1,
    STR_KILL_STREAK_2,
    STR_KILL_STREAK_3,
    STR_KILL_STREAK_4,
    STR_KILL_STREAK_5,
    STR_KILL_STREAK_6,
    STR_KILL_STREAK_7,
    STR_KILL_STREAK_8,
    STR_KILL_STREAK_9,
    STR_KILL_STREAK_10,

    STR_KILL_CREATRE,
    STR_GROUP_KILL_CREATURE,

    STR_CHALLENGE_SUCCESS,
    STR_CHALLENGE_FAIL_REQ,
    STR_CHALLENGE_FAIL_INSTANCE,
    STR_CHALLENGE_NOT_LEADER,
    STR_CHALLENGE_NOT_5H,
    STR_CHALLENGE_CURR,


    //req notice
    STR_REQ_LEVEL,
    STR_REQ_INSTANCE,
    STR_REQ_ZONE,
    STR_REQ_XP,
    STR_REQ_GOLD,
    STR_REQ_VIP,
    STR_REQ_HR,
    STR_REQ_ACHIEVE,
    STR_REQ_TOKEN,
    STR_REQ_HONOR,
    STR_REQ_ARENA,
    STR_REQ_ITEM,
    STR_REQ_NOTICE,

    STR_DEADLINE_START,
    STR_DEADLINE_FAILED,
    STR_DEADLINE_SUCCESS,
    STR_DEADLINE_TIME_LEFT,

    STR_REICARNATION_CLICK,
    STR_REICARNATION_ANNOUNCE,
    STR_HONORRANK_UP,
    STR_KILL_STREAK_REW,

    STR_KILL_STREAK_TO_REW,
    STR_END_KILL_STREAK_REW,

    STR_FACTION_CHAT,

    STR_FFAPVP,

    STR_ITEM_DESCRIPTION_SPLIT,
    STR_REICARNATION_REQ,

    STR_TOKEN,
    STR_CUSTOM_FACTION_CHAT,
    TOP_STR_100 = 100,
    TOP_STR_101 = 101,
    TOP_STR_102 = 102,
    GVG_STR_1153 = 103,
    GVG_STR_1154 = 104,
    GVG_STR_1155 = 105,
    GVG_STR_1156 = 106,
    GVG_STR_1158 = 107,

    GVG_STR_21111 = 111,//系统：你完成任务获得额外 10 点自由分配属性点！分配点在随身宝石->修炼系统，使用！
    GVG_STR_21112 = 112,//系统：你完成成就获得额外 10 点自由分配属性点！分配点在随身宝石->修炼系统，使用！
    GVG_STR_21113 = 113,//重置分配点需求物品 %s X 1,你并没有!
    GVG_STR_21114 = 114,//每1点分配点可以提高1点力量，确定后在对话框内输入要增加力量数量.
    GVG_STR_21115 = 115,//每1点分配点可以提高1点敏捷，确定后在对话框内输入要增加敏捷数量.
    GVG_STR_21116 = 116,//每1点分配点可以提高1点智力，确定后在对话框内输入要增加智力数量.
    GVG_STR_21117 = 117,//每1点分配点可以提高1点精神，确定后在对话框内输入要增加精神数量.
    GVG_STR_21118 = 118,//每1点分配点可以提高1点耐力，确定后在对话框内输入要增加耐力数量.
    GVG_STR_21119 = 119,//每1点分配点可以提高1点法强，确定后在对话框内输入要增加法强数量.
    GVG_STR_21120 = 120,//每1点分配点可以提高1点攻强，确定后在对话框内输入要增加攻强数量.
    GVG_STR_21121 = 121,//每1点分配点可以提高1点暴击，确定后在对话框内输入要增加暴击数量.
    GVG_STR_21122 = 122,//每1点分配点可以提高1点急速，确定后在对话框内输入要增加急速数量.
};


class CoreString
{
public:
    static CoreString* instance()
    {
        static CoreString instance;
        return &instance;
    }

    void Load();

    const char* GetText(CORE_STR_TYPES type);

    const char* Format(const char* format, ...);

    void Replace(std::string& s1, const std::string& s2, const std::string& s3);

private:
    std::vector<StringTemplate> StringVec;
};

#define sString CoreString::instance()

