--[[
之前用源码的方式编译综合训练师，遇到了各种问题，
也不太会改，就自己写了个lua版本的。在az端里面测试过了没有问题。
默认的npc是190016，可以自行修改。

SQL如下
1.	INSERT INTO `acore_world`.`creature_template`(`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (190016, 0, 0, 0, 0, 0, 31833, 0, 0, 0, '综合训练师', '星邃', 'Speak', 61032, 80, 80, 0, 35, 51, 1, 1.14286, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 2, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 2, '', 0);
2.	



]]
print(">>Script: synthesize trainer  loading...OK")
--local npcid = 24411
--触发物品ID--
local NPCID = 190016
local GOSSIP_ICON_CHAT = 0            
local GOSSIP_ICON_VENDOR = 1            
local TEAM_ALLIANCE=0
local TEAM_HORDE=1
local TEAM_BOTH=2


local GOODS={--货物id号
[0]={--主菜单
{TEAM_BOTH,"|TInterface/ICONS/inv_glyph_majormage:35:35|t|cff3F636C 职业技能训练",1,GOSSIP_ICON_MONEY_BAG},
{TEAM_BOTH,"|TInterface/ICONS/ability_mount_nightmarehorse:35:35|t|cff3F636C 专业技能训练",2,GOSSIP_ICON_MONEY_BAG},
{TEAM_BOTH,"|TInterface/ICONS/inv_misc_gem_variety_01:35:35|t|cff3F636C 武器技能训练",3,GOSSIP_ICON_MONEY_BAG},
{TEAM_BOTH,"|TInterface/ICONS/inv_potion_03:35:35|t|cff3F636C 坐骑技能训练",4,GOSSIP_ICON_MONEY_BAG},

},
[1]={--职业技能训练
{TEAM_HORDE,"战士训练师",3042},
{TEAM_HORDE,"骑士训练师",16679},
{TEAM_HORDE,"猎人训练师",3352},
{TEAM_HORDE,"盗贼训练师",3328},
{TEAM_HORDE,"牧师训练师",6014},
{TEAM_HORDE,"死骑训练师",28472},
{TEAM_HORDE,"萨满训练师",3344},
{TEAM_HORDE,"法师训练师",16652},
{TEAM_HORDE,"术士训练师",988},
{TEAM_HORDE,"德鲁伊训练师",3036},
{TEAM_ALLIANCE,"战士训练师",5479},
{TEAM_ALLIANCE,"骑士训练师",928},
{TEAM_ALLIANCE,"猎人训练师",5515},
{TEAM_ALLIANCE,"盗贼训练师",918},
{TEAM_ALLIANCE,"牧师训练师",5489},
{TEAM_ALLIANCE,"死骑训练师",28472},
{TEAM_ALLIANCE,"萨满训练师",20407},
{TEAM_ALLIANCE,"法师训练师",5497},
{TEAM_ALLIANCE,"术士训练师",5495},
{TEAM_ALLIANCE,"德鲁伊训练师",12042},
},


	[2]={--专业技能训练
	{TEAM_BOTH,"采矿训练师",28698},
	{TEAM_BOTH,"草药训练师",28704},
	{TEAM_BOTH,"炼金训练师",33608},
	{TEAM_BOTH,"附魔训练师",33610},
	{TEAM_BOTH,"锻造训练师",28694},
	{TEAM_BOTH,"裁缝训练师",28699},
	{TEAM_BOTH,"工程训练师",28697},
	{TEAM_BOTH,"珠宝训练师",28701},
	{TEAM_BOTH,"制皮训练师",28700},
	{TEAM_BOTH,"剥皮训练师",28696},
	{TEAM_BOTH,"铭文训练师",28702},
	{TEAM_BOTH,"烹饪训练师",33619},
	{TEAM_BOTH,"钓鱼训练师",28742},
	{TEAM_BOTH,"急救训练师",28706},
},
[3]={--武器技能训练
{TEAM_HORDE,"武器训练师",11869},
{TEAM_ALLIANCE,"武器训练师",11867},
},
[4]={--坐骑技能训练
{TEAM_BOTH,"骑术训练师",31238},
},
}





function GOODS.AddMenu(player, unit, id)
    player:GossipClearMenu()--清除菜单
    local menus=GOODS[id]
	local faction=player:GetTeam()
	local class=player:GetClass()
	if id==1 then
		for k ,v in pairs(menus)do
			if v[1]==faction or v[1]==TEAM_BOTH then
				if k==class or k==class +10 then
			player:GossipMenuAddItem(v[4] or GOSSIP_ICON_VENDOR, v[2] or "???", 0, (v[3] or k))
				end
			end
		end
	else
    for k ,v in pairs(menus)do
		if v[1]==faction or v[1]==TEAM_BOTH then
        player:GossipMenuAddItem(v[4] or GOSSIP_ICON_VENDOR, v[2] or "???", 0, (v[3] or k))
		end
    end
end
    player:GossipSendMenu(1, unit)--发送菜单
end

function GOODS.Book(event, player, unit)--显示菜单
    GOODS.AddMenu(player, unit, 0)
end

math.randomseed(os.time())

function GOODS.Select(event, player, unit, sender, intid, code, menu_id)

    if(intid<0x10)then
        GOODS.AddMenu(player, unit, intid)
	else
		unit:UpdateEntry( intid )
        player:SendTrainerList(unit)
		unit:UpdateEntry( NPCID )
    end
end


RegisterCreatureGossipEvent(NPCID, 1, GOODS.Book)
RegisterCreatureGossipEvent(NPCID, 2, GOODS.Select)
