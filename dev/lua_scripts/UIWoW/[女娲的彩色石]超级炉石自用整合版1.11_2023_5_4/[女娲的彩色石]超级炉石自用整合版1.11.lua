--https://uiwow.com/thread-17445-1-1.html?_dsign=380b398c
--[[信息：
	[女娲的彩色石]超级炉石  （Teleport stone）
	修改日期：2023-04-30
	功能：除了传送，还有召唤NPC，其他更多功能
	=============
	2023-04-30
	更新10：
			1.特别喜欢牛头这个桩子银行，一直想把这个公会银行随身携带。最近研究了一下用SummonGameObject()接口实现了这个功能。
			2.召唤gobject和召唤NPC同步判定存在时间。
			3.同理利用这个接口添加了若干商业技能所需设施。
	=============
	2023-04-28
	更新9：	 1.完全重排了双重附魔功能，原本该功能排序混乱，描述太少，基本是个摆设。
			2.主手和副手武器因为考虑到幻化预览，所以分页列出了所有武器附魔。常用的80级武器附魔放在第一页，各职业临时/永久附魔技能在第二页，旧武器附魔在3-5页。其他部位仅列出80级用高级附魔。(这一条逻辑上和原来是差不多的，但原来不全且混乱。)
			3.副手补全了80级用的盾牌附魔，在第一页。
			4.头、肩、胸、手、腿、脚、护腕、披风、戒指，这些部位都是游戏原可用附魔列表。
			5.远程武器因为游戏原可用附魔适用范围较小，添加了几条近战武器附魔，并注明(额外)以示非游戏原机制。
			6.腰带因为游戏原可用附魔适用范围较小，添加了几条胸甲附魔，并注明(额外)以示非游戏原机制。
			7.饰品、项链、衬衣、战袍，这几个栏位原游戏没有附魔，添加了几条胸甲附魔，并注明(额外)以示非游戏原机制。
			8.上面4个非主流栏位移动到栏位选择页面底端。
			9.附魔条目写全附魔技能名/道具名与效果数值，并采用相关技能或物品图标。
			10.条目的方括号是原本附魔条目的限制，有些限制没达到附魔不会生效，比如商业技能等级相关要求。
	=============
	2023-04-26
	更新8：	 1.团队副本传送合并到各自版本的5人本页面顶部，并稍微做了文本区分。实践中体验原结构很不科学，经常点错。
			2.上个版本忘记注释掉一些自制内容了，这个别人缺补丁没法用。
	=============
	2023-04-24
	更新7：	 1.因为最近调试修改YssBossLoot插件以及修改世界地图材质的原因，需要频繁在固定几个点来回移动，所以顺便研究了一下如何把定点传送2-5号点坐标也记录进数据库。
			2.这样reload eluna或者重启服务器后这个功能的5个坐标都不会消失了。
			3.理论上定点程序可以无限复制，你可以自行复制更多的记录和传送入口，如果需要。
			4.菜单里传送和记录选项各自放在了一起，原来按数字顺序分开排列似乎有一些令人困惑。
			5.丰富了这个功能的各种提示，原来的过于简略也让人困惑。
			6.另外现在第一次使用这个功能，已经不再需要.sql文件单独建立数据表了，判断并建立acore_characters.tp表的程序已经写入lua脚本里。（这一条参考了别的大佬的脚本）。
	=============
	2023-04-19
	更新6：	 1.取消超级炉石战斗中不可用。
			2.回复满血改为回复满血满蓝。
			3.风景点添加了若干官方半开发地图，比如旧铁炉堡，翡翠梦境，积雪平原等。
			4.大量传送点修改到更优美位置、大量修改朝向（Orientation）。举例：
				--传送索拉查盆地位置改到地图中央谷地彩虹下。
				--传送晶歌森林位置改到地图中央草地和水晶化地面分界线。
				--传送灰熊丘陵位置改到琥珀松木下稀有怪“大角星”阿克图瑞斯前面。
				--传送风暴峭壁位置改到创世者的图书馆。
				--传送冰冠冰川位置改到阿尔萨斯唤醒辛达苟萨之处。
				……
			5.城市达拉然传送位置改回飞行平台，因为城中默认设置不能上鸟。
			6.所有带有多个入口的副本分开传送点。（借鉴easyTeleport插件的思路和部分传送点）
			7.补全战场入口。（借鉴easyTeleport插件的思路和部分传送点）
	=============
	2023-04-08
	更新5：	 1.修正剥皮专业不正确的图标
			2.雕文商人图标改为各职业大雕文图标
			3.修正传送中立坐标提示框方括号颜色不正常
	=============
	2023-04-05
	更新4：	 1.超级炉石所有和职业有关的文本都赋予职业主题颜色。（因为和对话框黄页底色对比度的缘故，部分职业颜色进行了加深） 
			2.完全重排了职业训练菜单，借用论坛easyTeleport插件已有的坐标补充了各主城所有的职业训练师。因为数目太多按各职业增加了一级菜单。
			3.修正烹饪和铭文训练师不正确的专业图标。
			4.修正了海加尔山副本阿克蒙德头像图标引用，不再借用奥金尼地穴boss图标。查明原因是原始游戏设计师在给图标文件命名时尾部多打了一个空格。
			5.烹饪训练师由达拉然联盟训练师更换为冰冠冰川中立训练师。
			6.重新调配统一了联盟和部落的阵营主题配色。
			7.添加了两处风景点。
			8.修正了个别不统一的字符。
	=============
	2023-04-04
	更新3：	 1.重写了幻化NPC主菜单。因为根据一般使用习惯，幻化流程是-隐藏全身-幻化武器-头胸-然后结束，其他部位不太常用，原lua脚本自然循环生成的菜单顺序不方便，由此重排了一下。
			2.每个部位隐藏和移除项也同主菜单一样移至各自顶部，并添加颜色提醒，既要好看，又要好用。
			3.一定对应的，双重附魔页面各部位移除项也同幻化一样移至各自顶部，并为了视觉统一缩小图标。
			4.少量文本修改，更符合约定俗成习惯。
	=============
	2023-04-03
	更新2：	 1.紧急修正一处武器训练师坐标错误
	=============
	2023-03-30
	更新1：	 1.修整了外域和副本内不能召唤NPC的问题。
			2.技能训练页添加了训练假人选项。
			3.城市传送页改了排序，两个中立城市列在顶部更常用一点。添加了斯通纳德和塞拉摩，补全了法师传送门点位。
			4.炉石功能页重新排序，更符合使用习惯。
			5.地图传送增加了绅士分支。
			6.修改了若干条目的图标和配色，以期更符合项目主题。
	==============
	2023-03-23
	--原炉石lua用成就图标对应传送点的思路非常好，成就图标一般对应性非常强。
	--修改的目标是1美观醒目、2相关性高，最好一见到图标就知道这个选项是干什么的。

	--原炉石lua [超级炉石,适合天蓝AZ端]https://uiwow.com/thread-16746-1-1.html。召唤NPC所需数据sql请到原贴下载。
	--添加了炉石定点传送坐标表记录。.reload eluna后（第一个坐标）不会消失。需要导入acore_characters.tp.sql，否则使用记录1号点功能worldserver.exe会崩溃。
	--方法来自[ELUA传送炉石定点写表]https://uiwow.com/thread-11258-1-1.html

	--本炉石通用于编译了eluna功能的AZ端

	--更新内容
	----修正了所有的错误菜单跳转。
	----重新梳理了菜单结构，所有和训练和技能有关的选项放入同一级菜单了。
	----各职业天赋训练师还是用回传送。如果你喜欢也可以用召唤NPC的方式，改下注释就好了。
	----召唤出来的NPC存在时间从1分钟改到3分钟。
	----注释掉了2条引起AZ端worldserver.exe崩溃的“保存”选项。
	----补全了各种族武器训练师，官服状态下学全武器得去几个种族。
	----补全了所有功能的图标，包括翻页选项。（附魔选项缩小了，菜单太长翻页不方便）
	----菜单文字图标对齐。
	----城市传送图标统一采用法师“传送”类技能图标。
	----地图传送补全了两张图：月光林地和逆风小径，和探索成就完全对应。（虽然没什么用，但是一家人就是要整整齐齐）
	----风景传送修正了一处错误坐标，另添加了几处风景点。
	----大量坐标修改为更合理的目的地点。
	----5人本、团本按开放时间排了序。图标大体按照副本成就图片对应。个别成就图标辨识度低的用的更相关的图标，几个原lua好看的建筑图标也留下了。
	----修改了很多错别字和与通行简中翻译对不上的地图、副本名。

	--已知问题
	----一个位置附魔如太多无法都放在一页里，数目太多会导致worldserver.exe崩溃。
	----无法引用阿克蒙德图标achievement_boss_archimonde。
	----没有实现职业训练师、职业雕文商人按职业判定，略显臃肿。

]]
print(">>Script: TeleportStone loading...OK")

--菜单入口 --默认炉石itemID 6948
local itemEntry	=6948      --6948,炉石           --  -1
--热血江湖模块相关定义

local douqizhiCount_level =1    --每升一级获得气功点数的数量,根据热血江湖系统,35级前获得1点,之后获得两点

local xiaofeicount  =1          --加点消费的气功点数量,原先为5000

local guaiwu        ={1488, };  --气功点怪物ID--自己设置,目前未设置
local czitem        =65501      --重置需要的物品
local czitemcount   =5          --重置需要的物品数量,根据热血江湖的设置可以使用长白山参来洗点,小长白山参一次只能洗1点 小长白丹(100元宝)大长白丹(400元宝)都可以洗气功点
local douqizhiCount =1000       --每杀一只怪获得气功点数量


local shuxingcount  =1000       --每次加点增加的属性值（请注意..这儿的值跟DBC是相关联的）

local spell_liliang     =99901  --力量
local spell_liliangup   =99902
local spell_minjie      =99903  --敏捷
local spell_minjieup    =99904
local spell_naili       =99905  --耐力
local spell_nailiup     =99906
local spell_zhili       =99907  --智力
local spell_zhiliup     =99908
local spell_jingshen    =99909  --精神
local spell_jingshenup  =99910
local spell_gongqiang   =98001  --攻强
local spell_gongqiangup =98003
local spell_faqiang     =98002  --法强
local spell_faqiangup   =98004

local douqizhi=nil
--定点传送功能数据库建立acore_characters.tp表
CharDBQuery([[
	create table IF NOT EXISTS `tp` (
		`guid` int NULL DEFAULT NULL,
		`positionid` int NULL DEFAULT NULL,
		`position_x` double NULL DEFAULT NULL,
		`position_y` double NULL DEFAULT NULL,
		`position_z` double NULL DEFAULT NULL,
		`position_o` double NULL DEFAULT NULL,
		`map` int NULL DEFAULT NULL
	)
	COLLATE='utf8mb4_general_ci'
	ENGINE=InnoDB;
	]])

--阵营
local TEAM_ALLIANCE=0
local TEAM_HORDE=1

--职业  --没实现，鸽了
local CLASS_WARRIOR = "WARRIOR"				-- 战士
local CLASS_PALADIN = "PALADIN"				-- 圣骑士
local CLASS_HUNTER = "HUNTER"				-- 猎人
local CLASS_ROGUE = "ROGUE"					-- 盗贼
local CLASS_PRIEST = "PRIEST"				-- 牧师
local CLASS_DEATHKNIGHT = "DEATHKNIGHT"		-- 死亡骑士
local CLASS_SHAMAN = "SHAMAN"				-- 萨满
local CLASS_MAGE = "MAGE"					-- 法师
local CLASS_WARLOCK = "WARLOCK"				-- 术士
local CLASS_DRUID = "DRUID"					-- 德鲁伊	

--菜单号
local MMENU=1		--主菜单
local TPMENU=2		--传送菜单
local GMMENU=3		--GM菜单
local ENCMENU=4		--附魔菜单
local TBMENU=5		--炉石菜单
local SYMENU=6		--商业技能满级菜单
local BUYMENU=7		--雕文商人菜单
local TPDRMENU=8	--副本传送菜单
local SKLMENU=9		--技能训练传送菜单

--菜单类型
local FUNC=1
local MENU=2
local TP=3
local ENC=4

--GOSSIP_ICON 菜单图标
local GOSSIP_ICON_CHAT            = 0                    -- 对话，空泡泡
local GOSSIP_ICON_VENDOR          = 1                    -- 货物，袋子
local GOSSIP_ICON_TAXI            = 2                    -- 传送，翅膀
local GOSSIP_ICON_TRAINER         = 3                    -- 训练，书
local GOSSIP_ICON_INTERACT_1      = 4                    -- 复活，齿轮
local GOSSIP_ICON_INTERACT_2      = 5                    -- 设为我的家，齿轮
local GOSSIP_ICON_MONEY_BAG   	  = 6                    -- 钱袋，包和金币
local GOSSIP_ICON_TALK            = 7                    -- 申请，说话泡泡+黑色点
local GOSSIP_ICON_TABARD          = 8                    -- 工会，战袍
local GOSSIP_ICON_BATTLE          = 9                    -- 加入战场，双剑交叉
local GOSSIP_ICON_DOT             = 10                   -- 加入战场，战袍

--装备位置
local EQUIPMENT_SLOT_HEAD         = 0--头部
local EQUIPMENT_SLOT_NECK         = 1--颈部
local EQUIPMENT_SLOT_SHOULDERS    = 2--肩部
local EQUIPMENT_SLOT_BODY         = 3--衬衣
local EQUIPMENT_SLOT_CHEST        = 4--胸甲
local EQUIPMENT_SLOT_WAIST        = 5--腰部
local EQUIPMENT_SLOT_LEGS         = 6--腿部
local EQUIPMENT_SLOT_FEET         = 7--脚部
local EQUIPMENT_SLOT_WRISTS       = 8--手腕
local EQUIPMENT_SLOT_HANDS        = 9--手套
local EQUIPMENT_SLOT_FINGER1      = 10--手指1
local EQUIPMENT_SLOT_FINGER2      = 11--手指2
local EQUIPMENT_SLOT_TRINKET1     = 12--饰品1
local EQUIPMENT_SLOT_TRINKET2     = 13--饰品2
local EQUIPMENT_SLOT_BACK         = 14--背部
local EQUIPMENT_SLOT_MAINHAND     = 15--主手
local EQUIPMENT_SLOT_OFFHAND      = 16--副手
local EQUIPMENT_SLOT_RANGED       = 17--远程
local EQUIPMENT_SLOT_TABARD       = 18--战袍

local playerTeleportPoints = {}



local Instances={--副本表
		{249,0},{249,1},{269,1},{309,0},
		{409,0},{469,0},
		{509,0},{531,0},{532,0},{533,0},{533,1},
		{534,0},{540,1},{542,1},{543,1},{544,0},{545,1},{546,1},{547,1},{548,0},
		{550,0},{552,1},{553,1},{554,1},{555,1},{556,1},{557,1},{558,1},
		{560,1},{564,0},{565,0},{568,0},
		{574,1},{575,1},{576,1},{578,1},
		{580,0},{585,1},{595,1},{598,1},{599,1},
		{600,1},{601,1},{602,1},{603,0},{603,1},{604,1},{608,1},
		{615,0},{615,1},{616,0},{616,1},{619,1},{624,0},{624,1},
		{631,0},{631,1},{631,2},{631,3},{632,1},
		{649,0},{649,1},{649,2},{649,3},--十字军的试炼
		{650,1},{658,1},{668,1},
		{724,0},{724,1},{724,2},{724,3},
}
--随身NPC
local ST={
	TIME=300, --召唤时间。改为5分钟，原60秒太短了，幻化有时会站很长时间。
	NPCID501=28703,--商业技能训练师
	NPCID501A=33630,--商业技能训练师
	NPCID502=28694,--商业技能训练师
	NPCID503=28693,--商业技能训练师
	NPCID503A=33633,--商业技能训练师
	NPCID504=28697,--商业技能训练师
	NPCID505=28704,--商业技能训练师
	NPCID506=28702,--商业技能训练师
	NPCID507=28701,--商业技能训练师
	NPCID508=28700,--商业技能训练师
	NPCID509=28698,--商业技能训练师
	NPCID510=28696,--商业技能训练师
	NPCID511=28699,--商业技能训练师
	NPCID512=33587,--商业技能训练师--更换为中立烹饪训练师
	NPCID513=28706,--商业技能训练师
	NPCID514=28742,--商业技能训练师
	--结束商业技能
    --{guid,npc,time},
	NPCID601=35364, --部落锁定经验
	NPCID601A=35365,--联盟锁定经验
	NPCID602=90003, --幻化大师
}



--热血江湖功能模块
local function LevelDQ(event, player, oldLevel)   --此处是我尝试添加的热血江湖式升级给气功点的模块
    local douqizhi=CharDBQuery("SELECT * FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")	--查询气功点数	
	    if (douqizhi==nil) then --气功点数为空
		    CharDBExecute("INSERT INTO characters_douqi VALUES ("..player:GetGUIDLow()..", 0, 0, 0, 0, 0, 0, 0, 0);")
			player:SaveToDB()
			player:SendBroadcastMessage("已初始化热血江湖气功系统.")
		
            else
                if(oldLevel>34) then
                    douqizhiCount_level = 2 --超过35级给2个气功点
                end
        end

		CharDBExecute("UPDATE characters_douqi SET douqizhi=douqizhi+"..douqizhiCount_level.." WHERE guid="..player:GetGUIDLow()..";")
		player:SaveToDB()
		player:SendBroadcastMessage("恭喜你升级了,获得"..douqizhiCount_level.."点可分配气功点数,请打开气功点数界面分配气功点.")   
end



--主界面   --完工后这里将无用

--斗气原版
    --douqizhi=CharDBQuery("SELECT * FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")
	--if (douqizhi==nil) then
	    --player:SendBroadcastMessage("对不起.你无法使用.因为你目前没有可分配的气功点数")
		--player:SendAreaTriggerMessage("|CFF00FFFF对不起.你无法使用.因为你目前没有没有可分配的气功点数|r")    --此处是显示在屏幕中间,浅蓝色比较好看的提示
	--else
	    --player:GossipClearMenu()
	    --player:SaveToDB()
	    --player:GossipMenuAddItem(8,"|CFF00FFFF热血江湖气功点数系统-当前角色可分配气功点数|r：\n（|CFFFF0000"..math.modf(douqizhi:GetUInt32(2)*5+douqizhi:GetUInt32(3)*5+douqizhi:GetUInt32(4)*5+douqizhi:GetUInt32(5)*5+douqizhi:GetUInt32(6)*5+douqizhi:GetUInt32(7)*5+douqizhi:GetUInt32(8)*5).."/"..douqizhi:GetUInt32(1).."|r）\n(已分配点数/共剩余点数)\n消耗|CFFFF0000"..xiaofeicount.."|r点斗气值.提升|CFFFF00001000|r点属性|r\n|cff0000ff点击下列对应菜单可提升角色的属性",1,0)
	    --player:GossipMenuAddItem(5,"当前-|cFF009933力量:|r [|CFFFF0000"..douqizhi:GetUInt32(2).."|r] ---|cff0000ff确认|r",1,1)		
	    --player:GossipMenuAddItem(5,"当前-|cFF009933敏捷:|r [|CFFFF0000"..douqizhi:GetUInt32(3).."|r] ---|cff0000ff确认|r",1,2)	
	    --player:GossipMenuAddItem(5,"当前-|cFF009933耐力:|r [|CFFFF0000"..douqizhi:GetUInt32(4).."|r] ---|cff0000ff确认|r",1,3)	
	    --player:GossipMenuAddItem(5,"当前-|cFF009933智力:|r [|CFFFF0000"..douqizhi:GetUInt32(5).."|r] ---|cff0000ff确认|r",1,4)	
	    --player:GossipMenuAddItem(5,"当前-|cFF009933精神:|r [|CFFFF0000"..douqizhi:GetUInt32(6).."|r] ---|cff0000ff确认|r",1,5)
	    --player:GossipMenuAddItem(5,"当前-|cFF009933攻强:|r [|CFFFF0000"..douqizhi:GetUInt32(7).."|r] ---|cff0000ff确认|r",1,6)	
	    --player:GossipMenuAddItem(5,"当前-|cFF009933法强:|r [|CFFFF0000"..douqizhi:GetUInt32(8).."|r] ---|cff0000ff确认|r",1,7)
        --player:GossipMenuAddItem(0,"|cff0000ff每种属性可分配62500次\n62500 * "..shuxingcount.." = "..math.modf(62500*shuxingcount).."|r",1,8)	
	    --player:GossipMenuAddItem(0,"|cFFA50000重置斗气值|r",1,9,false,"确定重置吗？\n需要消耗："..GetItemLink(czitem).." x "..czitemcount.."")
	    --player:GossipSendMenu(1, item)

local function Douqi_AddGoss(event, player, item, target,intid)
	douqizhi=CharDBQuery("SELECT * FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")
	if (douqizhi==nil) then
	    player:SendBroadcastMessage("对不起.你无法使用.因为你目前没有可分配的气功点数")
		player:SendAreaTriggerMessage("|CFF00FFFF对不起.你无法使用.因为你目前没有没有可分配的气功点数|r")    --此处是显示在屏幕中间,浅蓝色比较好看的提示
	else
	    player:GossipClearMenu()
	    player:SaveToDB()
	    player:GossipMenuAddItem(8,"|CFF00FFFF热血江湖气功点数系统-当前角色可分配气功点数|r：\n（|CFFFF0000"..math.modf(douqizhi:GetUInt32(2)*5+douqizhi:GetUInt32(3)*5+douqizhi:GetUInt32(4)*5+douqizhi:GetUInt32(5)*5+douqizhi:GetUInt32(6)*5+douqizhi:GetUInt32(7)*5+douqizhi:GetUInt32(8)*5).."/"..douqizhi:GetUInt32(1).."|r）\n(已分配点数/共剩余点数)\n消耗|CFFFF0000"..xiaofeicount.."|r点斗气值.提升|CFFFF00001000|r点属性|r\n|cff0000ff点击下列对应菜单可提升角色的属性",1,0)
	    player:GossipMenuAddItem(5,"当前-|cFF009933力量:|r [|CFFFF0000"..douqizhi:GetUInt32(2).."|r] ---|cff0000ff确认|r",1,1)		
	    player:GossipMenuAddItem(5,"当前-|cFF009933敏捷:|r [|CFFFF0000"..douqizhi:GetUInt32(3).."|r] ---|cff0000ff确认|r",1,2)	
	    player:GossipMenuAddItem(5,"当前-|cFF009933耐力:|r [|CFFFF0000"..douqizhi:GetUInt32(4).."|r] ---|cff0000ff确认|r",1,3)	
	    player:GossipMenuAddItem(5,"当前-|cFF009933智力:|r [|CFFFF0000"..douqizhi:GetUInt32(5).."|r] ---|cff0000ff确认|r",1,4)	
	    player:GossipMenuAddItem(5,"当前-|cFF009933精神:|r [|CFFFF0000"..douqizhi:GetUInt32(6).."|r] ---|cff0000ff确认|r",1,5)
	    player:GossipMenuAddItem(5,"当前-|cFF009933攻强:|r [|CFFFF0000"..douqizhi:GetUInt32(7).."|r] ---|cff0000ff确认|r",1,6)	
	    player:GossipMenuAddItem(5,"当前-|cFF009933法强:|r [|CFFFF0000"..douqizhi:GetUInt32(8).."|r] ---|cff0000ff确认|r",1,7)
        player:GossipMenuAddItem(0,"|cff0000ff每种属性可分配62500次\n62500 * "..shuxingcount.." = "..math.modf(62500*shuxingcount).."|r",1,8)	
	    player:GossipMenuAddItem(0,"|cFFA50000重置斗气值|r",1,9,false,"确定重置吗？\n需要消耗："..GetItemLink(czitem).." x "..czitemcount.."")
	    player:GossipSendMenu(1, item)
	end
end

local function QG_Check()
douqizhi=CharDBQuery("SELECT * FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")
	if (douqizhi==nil) then
	    player:SendBroadcastMessage("对不起.你无法使用.因为你目前没有可分配的气功点数")
		player:SendAreaTriggerMessage("|CFF00FFFF对不起.你无法使用.因为你目前没有没有可分配的气功点数|r")    --此处是显示在屏幕中间,浅蓝色比较好看的提示
        return false
	end
    return true
end

local function QG_hit_the_target_at_every_shot()--正在修改为百步穿杨功能模块
    if(QG_Check()) then--尝试将公共模块单独化
    --此处需要完成的功能给玩家加命中

    --测试语句
        print("进入百步穿杨计算功能模块")
	    
	end
end

--重置与加属性界面
local function Douqi_seleGoss(event,player,item,target,intid)
    local douqizhi=CharDBQuery("SELECT * FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")
    if intid==0 then
		Douqi_AddGoss(event, player, item, target,intid)
	end
    if intid==8 then
		Douqi_AddGoss(event, player, item, target,intid)
    elseif 	intid==9 then
        if (player:HasItem(czitem,czitemcount)) then
            CharDBExecute("DELETE FROM characters_douqi WHERE guid="..player:GetGUIDLow()..";")
			CharDBExecute("insert into characters_douqi VALUES ("..player:GetGUIDLow()..", "..math.modf(douqizhi:GetUInt32(2)*5+douqizhi:GetUInt32(3)*5+douqizhi:GetUInt32(4)*5+douqizhi:GetUInt32(5)*5+douqizhi:GetUInt32(6)*5+douqizhi:GetUInt32(7)*5+douqizhi:GetUInt32(8)*5)+douqizhi:GetUInt32(1)..", 0, 0, 0, 0, 0, 0, 0);")		
		    player:RemoveItem(czitem,czitemcount)
			player:RemoveAura(spell_liliang)
			player:RemoveAura(spell_minjie)
			player:RemoveAura(spell_naili)
			player:RemoveAura(spell_zhili)
			player:RemoveAura(spell_jingshen)
			player:RemoveAura(spell_gongqiang)
			player:RemoveAura(spell_faqiang)
			player:SendBroadcastMessage("|CFFFF0080【系统提示】|r 重置成功！！请重新打开菜单分配点数.")
			player:GossipComplete()
		else
		    player:SendBroadcastMessage("|CFFFF0080【系统提示】|r 重置失败.缺少"..GetItemLink(czitem).." x "..czitemcount.."")
			player:GossipComplete()
		end
    end
   	
	if (douqizhi:GetUInt32(1)) < 1 then --气功点为0
	    player:SendBroadcastMessage("|CFFFF0080【系统提示】|r 可分配的气功点数不足.请重新点开菜单.如果是重置请无视此提示..")
		player:GossipComplete()
	else
	
	    if intid==1 then
		    CharDBExecute("update characters_douqi set liliang=liliang+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
			CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_liliang_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_liliang.." and guid="..player:GetGUIDLow()..";")
			if (spell_liliang_1==nil) then
                player:AddAura(spell_liliang, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_liliang_1:GetUInt32(0)<250) then
                    player:AddAura(spell_liliang, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
				    player:RemoveAura(spell_liliang)
					player:AddAura(spell_liliang, player)
					player:AddAura(spell_liliangup, player)
					Douqi_AddGoss(event, player, item, target,intid)
				end
			end
		elseif intid==2 then
		        CharDBExecute("update characters_douqi set minjie=minjie+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_minjie_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_minjie.." and guid="..player:GetGUIDLow()..";")
			if (spell_minjie_1==nil) then
                player:AddAura(spell_minjie, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_minjie_1:GetUInt32(0)<250) then
                    player:AddAura(spell_minjie, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
				    player:RemoveAura(spell_minjie)
					player:AddAura(spell_minjie, player)
					player:AddAura(spell_minjieup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		elseif intid==3 then
		        CharDBExecute("update characters_douqi set naili=naili+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_naili_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_naili.." and guid="..player:GetGUIDLow()..";")
			if (spell_naili_1==nil) then
                player:AddAura(spell_naili, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_naili_1:GetUInt32(0)<250) then
                    player:AddAura(spell_naili, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
					player:RemoveAura(spell_naili)
					player:AddAura(spell_naili, player)
					player:AddAura(spell_nailiup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		elseif intid==4 then
		        CharDBExecute("update characters_douqi set zhili=zhili+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_zhili_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_zhili.." and guid="..player:GetGUIDLow()..";")
			if (spell_zhili_1==nil) then
                player:AddAura(spell_zhili, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_zhili_1:GetUInt32(0)<250) then
                    player:AddAura(spell_zhili, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
					player:RemoveAura(spell_zhili)
					player:AddAura(spell_zhili, player)
					player:AddAura(spell_zhiliup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		elseif intid==5 then
		        CharDBExecute("update characters_douqi set jingshen=jingshen+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_jingshen_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_jingshen.." and guid="..player:GetGUIDLow()..";")
			if (spell_jingshen_1==nil) then
                player:AddAura(spell_jingshen, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_jingshen_1:GetUInt32(0)<250) then
                    player:AddAura(spell_jingshen, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
					player:RemoveAura(spell_jingshen)
					player:AddAura(spell_jingshen, player)
					player:AddAura(spell_jingshenup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		elseif intid==6 then
		        CharDBExecute("update characters_douqi set gongqiang=gongqiang+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_gongqiang_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_gongqiang.." and guid="..player:GetGUIDLow()..";")
			if (spell_gongqiang_1==nil) then
                player:AddAura(spell_gongqiang, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_gongqiang_1:GetUInt32(0)<250) then
                    player:AddAura(spell_gongqiang, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
					player:RemoveAura(spell_gongqiang)
					player:AddAura(spell_gongqiang, player)
					player:AddAura(spell_gongqiangup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		elseif intid==7 then
		        CharDBExecute("update characters_douqi set faqiang=faqiang+"..shuxingcount.." where guid="..player:GetGUIDLow()..";")
				CharDBExecute("update characters_douqi set douqizhi=douqizhi-"..xiaofeicount.." where guid="..player:GetGUIDLow()..";")
			local spell_faqiang_1=CharDBQuery("SELECT stackcount FROM character_aura WHERE spell="..spell_faqiang.." and guid="..player:GetGUIDLow()..";")
			if (spell_faqiang_1==nil) then
                player:AddAura(spell_faqiang, player)
				Douqi_AddGoss(event, player, item, target,intid)
			else
			    if (spell_faqiang_1:GetUInt32(0)<250) then
                    player:AddAura(spell_faqiang, player)
				    Douqi_AddGoss(event, player, item, target,intid)
				else
					player:RemoveAura(spell_faqiang)
					player:AddAura(spell_faqiang, player)
					player:AddAura(spell_faqiangup, player)
					Douqi_AddGoss(event, player, item, target,intid)	
				end
			end
		end
	end		
end

--定点传送写表和读表程序
	local function SetTPPosition1(player)
		local guid = player:GetGUIDLow()
		local positionid = 1
		local x,y,z,o=player:GetX(),player:GetY(),player:GetZ(),player:GetO()	--补充了朝向o，这个在做副本门口传送点时候有点用
		local map=player:GetMapId()
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			CharDBQuery("UPDATE `TP` SET position_x = "..x..", position_y = "..y..", position_z = "..z..", position_o = "..o..", map = "..map.." WHERE guid = "..guid.." and positionid = "..positionid.."" )
		else
			CharDBQuery("INSERT INTO `TP`(`guid`,`positionid`,`position_x`,`position_y`,`position_z`,`position_o`,`map`) VALUES ("..guid..", "..positionid..", "..x..", "..y..", "..z..","..o..", "..map..");")
		end
				--CharDBQuery("insert into custom_models (Owner, ModelID1, ModelID2, ModelID3, ModelID4, ModelID5, Scale, NowMode) VALUES ("..pGuid..", 0, 0, 0, 0, 0, 1.0, 0);")
	end
	local function GoPosition1(player)
		local guid = player:GetGUIDLow()
		local positionid = 1
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			--print("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.."  LIMIT 1")
			local pos = CharDBQuery("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.." and `positionid` = 1 LIMIT 1")
			if pos then
				repeat
				local x = pos:GetFloat(0)
				local y = pos:GetFloat(1)
				local z = pos:GetFloat(2)
				local o = pos:GetFloat(3)
				local map = pos:GetInt16(4)
				player:Teleport(map,x,y,z,o)
				until not pos:NextRow()
			else
					SendWorldMessage("数据库异常，请通知GM")
					return nil
			end
			player:SendBroadcastMessage("传送成功(定点传送1号点)。")
			else
			player:SendBroadcastMessage("你还有没记录1号点坐标。")
			player:ModifyMoney(10000)--返还
			return
		end
	end

	local function SetTPPosition2(player)
		local guid = player:GetGUIDLow()
		local positionid = 2
		local x,y,z,o=player:GetX(),player:GetY(),player:GetZ(),player:GetO()	--补充了朝向o，这个在做副本门口传送点时候有点用
		local map=player:GetMapId()
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			CharDBQuery("UPDATE `TP` SET position_x = "..x..", position_y = "..y..", position_z = "..z..", position_o = "..o..", map = "..map.." WHERE guid = "..guid.." and positionid = "..positionid.."" )
		else
			CharDBQuery("INSERT INTO `TP`(`guid`,`positionid`,`position_x`,`position_y`,`position_z`,`position_o`,`map`) VALUES ("..guid..", "..positionid..", "..x..", "..y..", "..z..","..o..", "..map..");")
		end
	end
	local function GoPosition2(player)
		local guid = player:GetGUIDLow()
		local positionid = 2
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			--print("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.."  LIMIT 1")
			local pos = CharDBQuery("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.." and `positionid` = 2 LIMIT 1")
			if pos then
				repeat
				local x = pos:GetFloat(0)
				local y = pos:GetFloat(1)
				local z = pos:GetFloat(2)
				local o = pos:GetFloat(3)
				local map = pos:GetInt16(4)
				player:Teleport(map,x,y,z,o)
				until not pos:NextRow()
			else
					SendWorldMessage("数据库异常，请通知GM")
					return nil
			end
			player:SendBroadcastMessage("传送成功(定点传送2号点)。")
			else
			player:SendBroadcastMessage("你还有没记录2号点坐标。")
			player:ModifyMoney(20000)--返还
			return
		end
	end

	local function SetTPPosition3(player)
		local guid = player:GetGUIDLow()
		local positionid = 3
		local x,y,z,o=player:GetX(),player:GetY(),player:GetZ(),player:GetO()	--补充了朝向o，这个在做副本门口传送点时候有点用
		local map=player:GetMapId()
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			CharDBQuery("UPDATE `TP` SET position_x = "..x..", position_y = "..y..", position_z = "..z..", position_o = "..o..", map = "..map.." WHERE guid = "..guid.." and positionid = "..positionid.."" )
		else
			CharDBQuery("INSERT INTO `TP`(`guid`,`positionid`,`position_x`,`position_y`,`position_z`,`position_o`,`map`) VALUES ("..guid..", "..positionid..", "..x..", "..y..", "..z..","..o..", "..map..");")
		end
	end
	local function GoPosition3(player)
		local guid = player:GetGUIDLow()
		local positionid = 3
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			--print("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.."  LIMIT 1")
			local pos = CharDBQuery("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.." and `positionid` = 3 LIMIT 1")
			if pos then
				repeat
				local x = pos:GetFloat(0)
				local y = pos:GetFloat(1)
				local z = pos:GetFloat(2)
				local o = pos:GetFloat(3)
				local map = pos:GetInt16(4)
				player:Teleport(map,x,y,z,o)
				until not pos:NextRow()
			else
					SendWorldMessage("数据库异常，请通知GM")
					return nil
			end
			player:SendBroadcastMessage("传送成功(定点传送3号点)。")
			else
			player:SendBroadcastMessage("你还有没记录3号点坐标。")
			player:ModifyMoney(30000)--返还
			return
		end
	end

	local function SetTPPosition4(player)
		local guid = player:GetGUIDLow()
		local positionid = 4
		local x,y,z,o=player:GetX(),player:GetY(),player:GetZ(),player:GetO()	--补充了朝向o，这个在做副本门口传送点时候有点用
		local map=player:GetMapId()
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			CharDBQuery("UPDATE `TP` SET position_x = "..x..", position_y = "..y..", position_z = "..z..", position_o = "..o..", map = "..map.." WHERE guid = "..guid.." and positionid = "..positionid.."" )
		else
			CharDBQuery("INSERT INTO `TP`(`guid`,`positionid`,`position_x`,`position_y`,`position_z`,`position_o`,`map`) VALUES ("..guid..", "..positionid..", "..x..", "..y..", "..z..","..o..", "..map..");")
		end
	end
	local function GoPosition4(player)
		local guid = player:GetGUIDLow()
		local positionid = 4
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			--print("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.."  LIMIT 1")
			local pos = CharDBQuery("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.." and `positionid` = 4 LIMIT 1")
			if pos then
				repeat
				local x = pos:GetFloat(0)
				local y = pos:GetFloat(1)
				local z = pos:GetFloat(2)
				local o = pos:GetFloat(3)
				local map = pos:GetInt16(4)
				player:Teleport(map,x,y,z,o)
				until not pos:NextRow()
			else
					SendWorldMessage("数据库异常，请通知GM")
					return nil
			end
			player:SendBroadcastMessage("传送成功(定点传送4号点)。")
			else
			player:SendBroadcastMessage("你还有没记录4号点坐标。")
			player:ModifyMoney(40000)--返还
			return
		end
	end

	local function SetTPPosition5(player)
		local guid = player:GetGUIDLow()
		local positionid = 5
		local x,y,z,o=player:GetX(),player:GetY(),player:GetZ(),player:GetO()	--补充了朝向o，这个在做副本门口传送点时候有点用
		local map=player:GetMapId()
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			CharDBQuery("UPDATE `TP` SET position_x = "..x..", position_y = "..y..", position_z = "..z..", position_o = "..o..", map = "..map.." WHERE guid = "..guid.." and positionid = "..positionid.."" )
		else
			CharDBQuery("INSERT INTO `TP`(`guid`,`positionid`,`position_x`,`position_y`,`position_z`,`position_o`,`map`) VALUES ("..guid..", "..positionid..", "..x..", "..y..", "..z..","..o..", "..map..");")
		end
	end
	local function GoPosition5(player)
		local guid = player:GetGUIDLow()
		local positionid = 5
		local Q = CharDBQuery("SELECT position_x FROM TP WHERE `guid` = "..guid.." LIMIT 1")
		local Q2 = CharDBQuery("SELECT position_y FROM TP WHERE `positionid` = "..positionid.." LIMIT 1")
		if Q and Q2 then
			--print("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.."  LIMIT 1")
			local pos = CharDBQuery("SELECT position_x, position_y, position_z,position_o, map FROM TP WHERE `guid` = "..guid.." and `positionid` = 5 LIMIT 1")
			if pos then
				repeat
				local x = pos:GetFloat(0)
				local y = pos:GetFloat(1)
				local z = pos:GetFloat(2)
				local o = pos:GetFloat(3)
				local map = pos:GetInt16(4)
				player:Teleport(map,x,y,z,o)
				until not pos:NextRow()
			else
					SendWorldMessage("数据库异常，请通知GM")
					return nil
			end
			player:SendBroadcastMessage("传送成功(定点传送5号点)。")
			else
			player:SendBroadcastMessage("你还有没记录5号点坐标。")
			player:ModifyMoney(50000)--返还
			return
		end
	end

	--召唤NPC入口
	function ST.SummonNPCblsd(player)--经验锁定NPC
		ST.SummonNPC(player, ST.NPCID601)
	end
	function ST.SummonNPClmsd(player)--经验锁定NPC
		ST.SummonNPC(player, ST.NPCID601A)
	end
	function ST.SummonNPCds(player)--幻化大师
		ST.SummonNPC(player, ST.NPCID602)
	end
	function ST.SummonNPC(player, entry)
		local guid=player:GetGUIDLow()
		local lastTime,nowTime=(ST[guid] or 0),os.time()

		if(player:IsInCombat())then
			player:SendAreaTriggerMessage("不能在战斗中召唤NPC。")
		else
			if(nowTime>lastTime)then
				local map=player:GetMap()
				if(map)then
					player:SendAreaTriggerMessage("你位于："..map:GetName())
					local x,y,z,o=player:GetX()+1,player:GetY(),player:GetZ(),player:GetO()+3.14
						--local nz=map:GetHeight(x,y)        --解决外域和副本不能召唤的问题
						--if(nz>z and nz<(z+5))then
						--	z=nz
						--end
					local NPC=player:SpawnCreature(entry,x,y,z,o,3,ST.TIME*1000)
					if(NPC)then
						player:SendAreaTriggerMessage("召唤NPC成功。")
						NPC:SetFacingToObject(player)
						NPC:SendUnitSay(string.format("%s,我响应你的召唤，从远方来到你的身边。请问你需要什么？",player:GetName()),0)
						lastTime=os.time()+ST.TIME
					else
						player:SendAreaTriggerMessage("召唤NPC失败。")
					end
				end
			else
				player:SendAreaTriggerMessage("召唤NPC不能太频繁。")
			end
		end
		ST[guid]=lastTime
	end
	--召唤object入口
	function ST.SummonGameObject(player, entry)
		local guid=player:GetGUIDLow()
		local lastTime,nowTime=(ST[guid] or 0),os.time()

		if(player:IsInCombat())then
			player:SendAreaTriggerMessage("不能在战斗中召唤公会银行。")
		else
			if(nowTime>lastTime)then
				local map=player:GetMap()
				if(map)then
					player:SendAreaTriggerMessage("你位于："..map:GetName())
					local x,y,z,o=player:GetX()+2,player:GetY()+2,player:GetZ(),player:GetO()+3.14
					local GameObject=player:SummonGameObject(entry,x,y,z,o,ST.TIME)--召唤
					if(GameObject)then
						player:SendAreaTriggerMessage("召唤移动公会银行成功。")
						player:SendBroadcastMessage("欢迎访问移动公会银行，"..player:GetName().."。")
						lastTime=os.time()+ST.TIME
					else
						player:SendAreaTriggerMessage("召唤移动公会银行失败。")
					end
				end
			else
				player:SendAreaTriggerMessage("召唤公会银行不能太频繁。")
			end
		end
		ST[guid]=lastTime
	end
	--召唤商业设施object入口
	function ST.SummonTradeObject(player, entry)
		local guid=player:GetGUIDLow()
		local lastTime,nowTime=(ST[guid] or 0),os.time()

		if(player:IsInCombat())then
			player:SendAreaTriggerMessage("不能在战斗中召唤商业设施。")
		else
			if(nowTime>lastTime)then
				local map=player:GetMap()
				if(map)then
					player:SendAreaTriggerMessage("你位于："..map:GetName())
					local x,y,z,o=player:GetX()+2,player:GetY()+2,player:GetZ(),player:GetO()+3.14
					local GameObject=player:SummonGameObject(entry,x,y,z,o,ST.TIME)--召唤
					if(GameObject)then
						player:SendAreaTriggerMessage("召唤商业设施成功。")
						player:SendBroadcastMessage("欢迎访问商业设施，"..player:GetName().."。")
						lastTime=os.time()+ST.TIME
					else
						player:SendAreaTriggerMessage("召唤商业设施失败。")
					end
				end
			else
				player:SendAreaTriggerMessage("召唤设施不能太频繁。")
			end
		end
		ST[guid]=lastTime
	end
		--召唤公会银行设施
		--牛头风格公会银行
		function ST.SummonGameObject_GuildBank(player)
			ST.SummonGameObject(player, 187295)
		end
		--召唤商业技能设施
		--烹饪营火
		function ST.SummonTradeObject_Campfire(player)
			ST.SummonTradeObject(player, 31511)
		end
		--炼金台
		function ST.SummonTradeObject_AlchemyTable(player)
			ST.SummonTradeObject(player, 183848)
		end
		--铁砧
		function ST.SummonTradeObject_Anvil(player)
			ST.SummonTradeObject(player, 173094)
		end
		--熔炉
		function ST.SummonTradeObject_Furnace(player)
			ST.SummonTradeObject(player, 173095)
		end
		--黑铁砧
		function ST.SummonTradeObject_BlackAnvil(player)
			ST.SummonTradeObject(player, 172911)
		end
		--黑熔炉
		function ST.SummonTradeObject_BlackFurnace(player)
			ST.SummonTradeObject(player, 174045)
		end
		--魔法织布机
		function ST.SummonTradeObject_MagicLoom(player)
			ST.SummonTradeObject(player, 185000)
		end
		--月亮井
		function ST.SummonTradeObject_MoonWell(player)
			ST.SummonTradeObject(player, 177272)
		end

				--[[
				{FUNC, "召唤传家宝商人", 	ST.SummonNPCcj,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤战士雕文商人", 	ST.SummonNPCwor,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤小德雕文商人", 	ST.SummonNPChun,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤萨满雕文商人", 	ST.SummonNPCsha,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤骑士雕文商人", 	ST.SummonNPCkni,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤牧师雕文商人", 	ST.SummonNPCpri,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤圣骑雕文商人", 	ST.SummonNPCwar,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤盗贼雕文商人", 	ST.SummonNPCrog,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤法师雕文商人", 	ST.SummonNPCmag,	    GOSSIP_ICON_VENDOR},
				{FUNC, "召唤小德雕文商人", 	ST.SummonNPCdru,	GOSSIP_ICON_VENDOR},
				{FUNC, "召唤死骑雕文商人", 	ST.SummonNPCdk,	GOSSIP_ICON_VENDOR},
				]]
		--自制播音员，外发时注释掉
		--[[
		function ST.SummonNPC_sound(player)
			ST.SummonNPC(player, 110002)
		end
		function ST.SummonNPC_Ysera(player)
			ST.SummonNPC(player, 94021)
		end
		]]
		function ST.SummonNPC_4001001(player)
			ST.SummonNPC(player, 190001)
		end
        function ST.SummonVendor(player)--售卖商人
			ST.SummonNPC(player, 15898)
		end

        --原神变身系列开始


        function ST.Morph_45600(player)
            player:SetDisplayId("45602") 
		end



         function ST.Morph_45601(player)
            player:SetDisplayId("45601") 
		end

         function ST.Morph_45602(player)
            player:SetDisplayId("45602") 
		end

         function ST.Morph_45603(player)
            player:SetDisplayId("45603") 
		end

         function ST.Morph_45604(player)
            player:SetDisplayId("45604") 
		end

         function ST.Morph_45605(player)
            player:SetDisplayId("45605") 
		end

         function ST.Morph_45606(player)
            player:SetDisplayId("45606") 
		end

         function ST.Morph_45607(player)
            player:SetDisplayId("45607") 
		end

         function ST.Morph_45608(player)
            player:SetDisplayId("45608") 
		end
         function ST.Morph_45609(player)
            player:SetDisplayId("45609") 
		end
         function ST.Morph_45610(player)
            player:SetDisplayId("45610") 
		end
        function ST.Morph_45611(player)--变身45611 --原神系列(蓝衣红袜)
			--Unit:DeMorph()
            --player::SetDisplayId(45611)
            player:SetDisplayId("45611") --成功啦!哈哈!
            --RunCommand(".morph target 45611")
            --RunCommand("additem 123456")
            --Global:RunCommand('.gm fly on')
            --player:Yell("哈哈",0)--成功
		end

         --原神变身系列结束

        --我叫MT系列开始

       function ST.Morph_45612(player)
        player:SetDisplayId("45612") 
	   end

       function ST.Morph_45613(player)
            player:SetDisplayId("45613") 
	   end

        function ST.Morph_45614(player)
            player:SetDisplayId("45614") 
	    end
        function ST.Morph_45615(player)
            player:SetDisplayId("45615") 
	    end
        function ST.Morph_45616(player)
            player:SetDisplayId("45616") 
	    end

        function ST.Morph_45617(player)
            player:SetDisplayId("45617") 
		end

        function ST.Morph_45618(player)
            player:SetDisplayId("45618") 
		end

        function ST.Morph_45619(player)
            player:SetDisplayId("45619") 
		end

        function ST.Morph_45620(player)
            player:SetDisplayId("45620") 
		end

        function ST.Morph_45621(player)
            player:SetDisplayId("45621") 
		end


        function ST.Morph_45622(player)
            player:SetDisplayId("45622") 
		end

        function ST.Morph_45623(player)
            player:SetDisplayId("45623") 
		end
        function ST.Morph_45624(player)
            player:SetDisplayId("45624") 
		end
        function ST.Morph_45625(player)
            player:SetDisplayId("45625") 
		end
        function ST.Morph_45626(player)
            player:SetDisplayId("45626") 
		end
        function ST.Morph_45627(player)
            player:SetDisplayId("45627") 
		end
        function ST.Morph_45628(player)
            player:SetDisplayId("45628") 
		end
        function ST.Morph_45629(player)
            player:SetDisplayId("45629") 
		end
        function ST.Morph_45630(player)
            player:SetDisplayId("45630") 
		end
        function ST.Morph_45631(player)
            player:SetDisplayId("45631") 
		end
        function ST.Morph_45632(player)
            player:SetDisplayId("45632") 
		end
        function ST.Morph_45633(player)
            player:SetDisplayId("45633") 
		end
        function ST.Morph_45634(player)
            player:SetDisplayId("45634") 
		end
        function ST.Morph_45635(player)
            player:SetDisplayId("45635") 
	    end

        function ST.Morph_45636(player)
            player:SetDisplayId("45636") 
	    end
        function ST.Morph_45637(player)
            player:SetDisplayId("45637") 
	    end
        function ST.Morph_45638(player)
            player:SetDisplayId("45638") 
	    end
        function ST.Morph_45639(player)
            player:SetDisplayId("45639") 
	    end
        function ST.Morph_45640(player)
            player:SetDisplayId("45640") 
	    end
        function ST.Morph_45641(player)
            player:SetDisplayId("45641") 
	    end
        function ST.Morph_45642(player)
            player:SetDisplayId("45642") 
	    end
        function ST.Morph_45643(player)
            player:SetDisplayId("45643") 
	    end
        function ST.Morph_45644(player)
            player:SetDisplayId("45644") 
	    end
        function ST.Morph_45645(player)
            player:SetDisplayId("45645") 
	    end
        function ST.Morph_45646(player)
            player:SetDisplayId("45646") 
	    end
        function ST.Morph_45647(player)
            player:SetDisplayId("45647") 
	    end
        function ST.Morph_45648(player)
            player:SetDisplayId("45648") 
	    end
        function ST.Morph_45649(player)
            player:SetDisplayId("45649") 
	    end
        function ST.Morph_45650(player)
            player:SetDisplayId("45650") 
	    end
        function ST.Morph_45651(player)
            player:SetDisplayId("45651") 
	    end
        function ST.Morph_45652(player)
            player:SetDisplayId("45652") 
	    end
        function ST.Morph_45653(player)
            player:SetDisplayId("45653") 
	    end
        function ST.Morph_45654(player)
            player:SetDisplayId("45654") 
	    end
        function ST.Morph_45655(player)
            player:SetDisplayId("45655") 
	    end
        function ST.Morph_45656(player)
            player:SetDisplayId("45656") 
	    end
        function ST.Morph_45657(player)
            player:SetDisplayId("45657") 
	    end
        function ST.Morph_45658(player)
            player:SetDisplayId("45658") 
	    end
        function ST.Morph_45659(player)
            player:SetDisplayId("45659") 
	    end
        function ST.Morph_45660(player)
            player:SetDisplayId("45660") 
	    end
        function ST.Morph_45661(player)
            player:SetDisplayId("45661") 
	    end

        --我叫MT系列开始

        --function ST.Morph_45662(player)
          --  player:SetDisplayId("45662") 
	    --end
--        function ST.Morph_45654(player)
  --          player:SetDisplayId("45654") 
	--    end
      ----  function ST.Morph_45654(player)
          --  player:SetDisplayId("45654") 
	    --end
        --function ST.Morph_45654(player)
    --        player:SetDisplayId("45654") 
	--    end
   --     function ST.Morph_45654(player)
    --        player:SetDisplayId("45654") 
	  --  end
  --      function ST.Morph_45654(player)
    --        player:SetDisplayId("45654") 
	--    end
     --   function ST.Morph_45654(player)
    --        player:SetDisplayId("45654") 
	 --   end












        function ST.DeMorph(player)--清除变身
			--Unit:DeMorph()    --这个不行
            player:DeMorph()    --这个可以
		end

        function ST.PlayMovie(player)--播放影片
			Player:SendMovieStart("0")
            player:Yell("哈哈",0)
		end
        

		function ST.SummonNPC_4001002(player)
			ST.SummonNPC(player, 190002)
		end
		function ST.SummonNPC_4001003(player)
			ST.SummonNPC(player, 190003)
		end
		function ST.SummonNPC_4001004(player)
			ST.SummonNPC(player, 190004)
		end
		function ST.SummonNPC_4001005(player)
			ST.SummonNPC(player, 190005)
		end
		function ST.SummonNPC_4001006(player)
			ST.SummonNPC(player, 190006)
		end
		function ST.SummonNPC_4001007(player)
			ST.SummonNPC(player, 190007)
		end
		function ST.SummonNPC_4001008(player)
			ST.SummonNPC(player, 190008)
		end
		function ST.SummonNPC_4001009(player)
			ST.SummonNPC(player, 190009)
		end
		function ST.SummonNPC_4001010(player)
			ST.SummonNPC(player, 190010)
		end
		function ST.SummonNPC_4001011(player)
			ST.SummonNPC(player, 190011)
		end

		--联盟技能训练师
		function ST.SummonNPC_1zs(player)
			ST.SummonNPC(player, 5479)
		end
		function ST.SummonNPC_1qs(player)
			ST.SummonNPC(player, 928)
		end
		function ST.SummonNPC_1dk(player)
			ST.SummonNPC(player, 29194)
		end
		function ST.SummonNPC_1sm(player)
			ST.SummonNPC(player, 20407)
		end
		function ST.SummonNPC_1lr(player)
			ST.SummonNPC(player, 5515)
		end
		function ST.SummonNPC_1xd(player)
			ST.SummonNPC(player, 12042)
		end
		function ST.SummonNPC_1dz(player)
			ST.SummonNPC(player, 918)
		end
		function ST.SummonNPC_1fs(player)
			ST.SummonNPC(player, 5498)
		end
		function ST.SummonNPC_1ss(player)
			ST.SummonNPC(player, 5495)
		end
		function ST.SummonNPC_1ms(player)
			ST.SummonNPC(player, 376)
		end

		--部落技能训练师
		function ST.SummonNPC_2zs(player)
			ST.SummonNPC(player, 3354)
		end
		function ST.SummonNPC_2qs(player)
			ST.SummonNPC(player, 23128)
		end
		function ST.SummonNPC_2dk(player)
			ST.SummonNPC(player, 29194)
		end
		function ST.SummonNPC_2sm(player)
			ST.SummonNPC(player, 13417)
		end
		function ST.SummonNPC_2lr(player)
			ST.SummonNPC(player, 3352)
		end
		function ST.SummonNPC_2xd(player)
			ST.SummonNPC(player, 12042)
		end
		function ST.SummonNPC_2dz(player)
			ST.SummonNPC(player, 3401)
		end
		function ST.SummonNPC_2fs(player)
			ST.SummonNPC(player, 5882)
		end
		function ST.SummonNPC_2ss(player)
			ST.SummonNPC(player, 3324)
		end
		function ST.SummonNPC_2ms(player)
			ST.SummonNPC(player, 5994)
		end

		--商业技能师
		function ST.SummonNPCAlchemy(player)
			ST.SummonNPC(player, ST.NPCID501)
			ST.SummonNPC(player, ST.NPCID501A)
		end

		function ST.SummonNPCBlacksmithing(player)
			ST.SummonNPC(player, ST.NPCID502)
		end

		function ST.SummonNPCEnchanting(player)
			ST.SummonNPC(player, ST.NPCID503)
			ST.SummonNPC(player, ST.NPCID503A)
		end

		function ST.SummonNPCEngineering(player)
			ST.SummonNPC(player, ST.NPCID504)
		end

		function ST.SummonNPCHerbalism(player)
			ST.SummonNPC(player, ST.NPCID505)
		end

		function ST.SummonNPCInscription(player)
			ST.SummonNPC(player, ST.NPCID506)
		end

		function ST.SummonNPCJewelcrafting(player)
			ST.SummonNPC(player, ST.NPCID507)
		end

		function ST.SummonNPCLeatherworking(player)
			ST.SummonNPC(player, ST.NPCID508)
		end

		function ST.SummonNPCMining(player)
			ST.SummonNPC(player, ST.NPCID509)
		end

		function ST.SummonNPCSkinning(player)
			ST.SummonNPC(player, ST.NPCID510)
		end

		function ST.SummonNPCTailoring(player)
			ST.SummonNPC(player, ST.NPCID511)
		end

		function ST.SummonNPCCooking(player)
			ST.SummonNPC(player, ST.NPCID512)
		end

		function ST.SummonNPCFirstAid(player)
			ST.SummonNPC(player, ST.NPCID513)
		end

		function ST.SummonNPCFishing(player)
			ST.SummonNPC(player, ST.NPCID514)
		end
				-- {FUNC, "召唤炼金训练师", 	ST.SummonNPCAlchemy,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤锻造训练师", 	ST.SummonNPCBlacksmithing,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤附魔训练师", 	ST.SummonNPCEnchanting,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤工程训练师", 	ST.SummonNPCEngineering,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤草药训练师", 	ST.SummonNPCHerbalism,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤铭文训练师", 	ST.SummonNPCInscription,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤珠宝训练师", 	ST.SummonNPCJewelcrafting,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤皮甲训练师", 	ST.SummonNPCLeatherworking,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤采矿训练师", 	ST.SummonNPCMining,	    GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤剥皮训练师", 	ST.SummonNPCSkinning,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤裁缝训练师", 	ST.SummonNPCTailoring,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤烹饪训练师", 	ST.SummonNPCCooking,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤急救训练师", 	ST.SummonNPCFirstAid,	GOSSIP_ICON_TRAINER},
				-- {FUNC, "召唤钓鱼训练师", 	ST.SummonNPCFishing,	GOSSIP_ICON_TRAINER},
		local function ResetPlayer(player, flag, text)
			player:SetAtLoginFlag(flag)
			player:SendAreaTriggerMessage("你现在返回角色选择或者重新登录角色，即可进行修改"..text.."。")
			--player:SendAreaTriggerMessage("正在返回选择角色菜单")
		end

local Stone={--炉石主程序
	GetTimeASString=function(player)
		local inGameTime=player:GetTotalPlayedTime()
		local days=math.modf(inGameTime/(24*3600))
		local hours=math.modf((inGameTime-(days*24*3600))/3600)
		local mins=math.modf((inGameTime-(days*24*3600+hours*3600))/60)
		return days.."天"..hours.."时"..mins.."分"
	end,
	GoHome=function(player)--穿越回去
		player:CastSpell(player,8690,true)
		player:ResetSpellCooldown(8690, true)
		player:SendBroadcastMessage("你已经穿越回来了。")
	end,
	GoSelectPlayer=function(player)--传送到所选队友那里
        local target=player:GetSelection()
        if(target)then
            local x,y,z,mapId,areaId=target:GetX(),target:GetY(),target:GetZ(),target:GetMapId(),player:GetAreaId()
            player:SendBroadcastMessage("马上瞬移到 "..target:GetName().." 身边去.")
            if(player:Teleport(mapId,x,y,z,0,TELE_TO_GM_MODE))then--传送
                player:SendBroadcastMessage("你瞬移到了"..target:GetName().."身边。")
            else
                print(">>Eluna Error: Teleport Stone : Teleport To "..mapId..","..x..","..y..","..z)
            end
        else
            player:SendBroadcastMessage("请选中一个目标玩家或NPC。")
        end
    end,
	SetHome=function(player)--记录当前位置
		local x,y,z,mapId,areaId=player:GetX(),player:GetY(),player:GetZ(),player:GetMapId(),player:GetAreaId()
		player:SetBindPoint(x,y,z,mapId,areaId)
		player:SendBroadcastMessage("已经记录当前位置为炉石点。")
	end,

	OpenBank=function(player)--打开银行
		player:SendShowBank(player)
		player:SendBroadcastMessage("已经打开银行")
	end,
	OpenMailBox=function(player)--打开邮箱
		player:SendShowMailBox(player:GetGUID())
		player:SendBroadcastMessage("已经打开邮箱")
	end,
	OpenAuction=function(player)--打开邮箱
		player:SendAuctionMenu(player)		
		player:SendBroadcastMessage("已经打开拍卖行")
	end,
	WeakOut=function(player)--移除复活虚弱
		if(player:HasAura(15007))then
			player:RemoveAura(15007)	--移除复活虚弱
			player:SetHealth(player:GetMaxHealth())
			player:SetPower(player:GetMaxPower())
			--self:RemoveAllAuras()	--移除所有状态
			player:SendBroadcastMessage("你的身上的复活虚弱状态已经被移除。")
		else
			player:SendBroadcastMessage("你的身上没有复活虚弱状态。")
			player:ModifyMoney(20000)--返还
		end
	end,

	OutCombat=function(player)--脱离战斗
		if(player:IsInCombat())then
			player:ClearInCombat()
			player:SendAreaTriggerMessage("你已经脱离战斗")
			player:SendBroadcastMessage("你已经脱离战斗")
		else
			player:SendAreaTriggerMessage("你并没有在战斗。")
			player:SendBroadcastMessage("你并没有在战斗。")
		end
	end,

	WSkillsToMax=function(player)--武器熟练度
		player:AdvanceSkillsToMax()
		player:SendBroadcastMessage("当前武器熟练度已经达到最大值")
	end,

	MaxHealth=function(player)	--回满血蓝
		player:SetHealth(player:GetMaxHealth())
		player:SetPower(player:GetMaxPower())
		player:SendBroadcastMessage("生命值与法力值已经回满")
	end,

	ResetTalents = function(player)--重置天赋
		player:ResetTalents(true)--免费
		player:SendBroadcastMessage("已经重置天赋")
	end,

	ResetPetTalents=function(player)--重置宠物天赋
		player:ResetPetTalents()
		player:SendBroadcastMessage("已经重置宠物天赋")
	end,

	ResetAllCD=function(player)--刷新冷却
		player:ResetAllCooldowns()
		player:SendBroadcastMessage("已经重置物品和技能冷却")
	end,

	RepairAll=function(player)--修理装备
		player:DurabilityRepairAll(true,1,false)
		player:SendBroadcastMessage("修理完所有装备")
	end,

	SaveToDB=function(player)--保存数据
		player:SaveToDB()
		player:SendAreaTriggerMessage("保存数据完成")
	end,

	Logout=function(player)--返回选择角色
		player:SendAreaTriggerMessage("正在返回选择角色菜单")
		player:LogoutPlayer(true)
	end,

	LogoutNosave=function(player)--不保存数据,返回选择角色
		player:SendAreaTriggerMessage("正在返回选择角色菜单")
		player:LogoutPlayer(false)
	end,
	

	UnBind=function(player)	--副本解绑
		local nowmap=player:GetMapId()
		for k, v in pairs(Instances) do
			local mapid=v[1]
			if(mapid~=nowmap)then
				player:UnbindInstance(v[1],v[2])
			else
				player:SendBroadcastMessage("你所在的当前副本无法解除绑定。")
			end
		end
		player:SendAreaTriggerMessage("已经解除所有副本的绑定")
		player:SendBroadcastMessage("已经解除所有副本的绑定。")
	end,

--[[	GmOnMod=function(player)--
		player:SendBroadcastMessage("GM模式开启")
		RunCommand(".gm on")
	end,
]]--eluna对GM命令支持很差
--付费功能	
	--[[登录标志
	AT_LOGIN_RENAME            = 0x01,
    AT_LOGIN_RESET_SPELLS      = 0x02,
    AT_LOGIN_RESET_TALENTS     = 0x04,
    AT_LOGIN_CUSTOMIZE         = 0x08,
    AT_LOGIN_RESET_PET_TALENTS = 0x10,
    AT_LOGIN_FIRST             = 0x20,
    AT_LOGIN_CHANGE_FACTION    = 0x40,
    AT_LOGIN_CHANGE_RACE       = 0x80
	]]--
	ResetName=function(player,code)--修改名字
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(target, 0x1, "名字")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end
	end,
	ResetFace=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x8, "容貌")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetRace=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x80, "种族")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetFaction=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x40, "阵营")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end

	end,
	ResetSpell=function(player)
		local target=player:GetSelection()
		if(target and (target:GetTypeId()==player:GetTypeId()))then
			ResetPlayer(player, 0x2, "所有法术")
		else
			player:SendAreaTriggerMessage("请选中一个玩家。")
		end
	end,

--定点传送记录与传送入口
	--定点传送功能记录1号坐标
	TBPoint1=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点。")
			return
		end
		SetTPPosition1(player)
		player:SendBroadcastMessage("定点传送1号坐标已成功写入acore_characters.tp数据库。")
	end,

	--定点传送功能传送1号坐标	
	TTPoint1=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点传送。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点传送。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点传送。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点传送。")
			return
		end
		GoPosition1(player)
	end,

	--定点传送功能记录2号坐标
	TBPoint2=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点。")
			return
		end
		SetTPPosition2(player)
		player:SendBroadcastMessage("定点传送2号坐标已成功写入acore_characters.tp数据库。")
	end,
	--定点传送功能传送2号坐标	
	TTPoint2=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点传送。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点传送。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点传送。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点传送。")
			return
		end
		GoPosition2(player)
	end,

	--定点传送功能记录3号坐标
	TBPoint3=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点。")
			return
		end
		SetTPPosition3(player)
		player:SendBroadcastMessage("定点传送3号坐标已成功写入acore_characters.tp数据库。")
	end,
	--定点传送功能传送3号坐标	
	TTPoint3=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点传送。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点传送。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点传送。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点传送。")
			return
		end
		GoPosition3(player)
	end,

	--定点传送功能记录4号坐标
	TBPoint4=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点。")
			return
		end
		SetTPPosition4(player)
		player:SendBroadcastMessage("定点传送4号坐标已成功写入acore_characters.tp数据库。")
	end,
	--定点传送功能传送4号坐标	
	TTPoint4=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点传送。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点传送。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点传送。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点传送。")
			return
		end
		GoPosition4(player)
	end,

	--定点传送功能记录5号坐标
	TBPoint5=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点。")
			return
		end
		SetTPPosition5(player)
		player:SendBroadcastMessage("定点传送5号坐标已成功写入acore_characters.tp数据库。")
	end,
	--定点传送功能传送5号坐标	
	TTPoint5=function(player)
		if(player:GetMapId() == 533) then
			player:SendBroadcastMessage("该地图禁止定点传送。")
			return
		end
		if(player:GetMapId() == 489) then
			player:SendBroadcastMessage("战歌峡谷禁止定点传送。")
			return
		end
		if(player:GetMapId() == 529) then
			player:SendBroadcastMessage("阿拉希盆地禁止定点传送。")
			return
		end
		if(player:GetMapId() == 30) then
			player:SendBroadcastMessage("奥特兰克山谷禁止定点传送。")
			return
		end
		GoPosition5(player)
	end,


--[[--原版定点传送功能，eluna重载和服务器重启后记录的坐标会消失
	TBPoint2=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][2] = playerTeleportPoints[pGuid][2] or {}
		playerTeleportPoints[pGuid][2] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定2号坐标。")
	end,

	TTPoint2=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][2]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(20000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功.")
	end,

	TBPoint3=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][3] = playerTeleportPoints[pGuid][3] or {}
		playerTeleportPoints[pGuid][3] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定3号坐标。")
	end,

	TTPoint3=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][3]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(30000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功.")
	end,

	TBPoint4=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][4] = playerTeleportPoints[pGuid][4] or {}
		playerTeleportPoints[pGuid][4] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定4号坐标。")
	end,

	TTPoint4=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][4]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(40000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功.")
	end,

	TBPoint5=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		playerTeleportPoints[pGuid][5] = playerTeleportPoints[pGuid][5] or {}
		playerTeleportPoints[pGuid][5] = {player:GetMapId(),player:GetX(),player:GetY(),player:GetZ(),player:GetO()}
		player:SendBroadcastMessage("成功绑定5号坐标。")
	end,

	TTPoint5=function(player)
		local pGuid = player:GetGUIDLow()
		playerTeleportPoints[pGuid] = playerTeleportPoints[pGuid] or {}
		local data = playerTeleportPoints[pGuid][5]
		if not data then
			 player:SendBroadcastMessage("还没有绑定坐标。")
			 player:ModifyMoney(50000)--返还
			 return
		end
		player:Teleport(data[1],data[2],data[3],data[4],data[5])
        player:SendBroadcastMessage("传送成功.")
	end,
]]
--商业技能程序
	SY01=function(player)--商业技能熟练度
		if player:HasSpell( 50310 ) then
			player:SendBroadcastMessage("你的采矿专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2575)
			player:LearnSpell(2576)
			player:LearnSpell(3564)
			player:LearnSpell(10248)
			player:LearnSpell(29354)
			player:LearnSpell(50310)
			player:AdvanceSkill(186, 450)--1
    end,

	SY02=function(player)--商业技能熟练度
        if player:HasSpell( 50300 ) then
			player:SendBroadcastMessage("你的草药学专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2366)
			player:LearnSpell(2368)
			player:LearnSpell(3570)
			player:LearnSpell(11993)
			player:LearnSpell(28695)
			player:LearnSpell(50300)
			player:AdvanceSkill(182, 450)--2
    end,

	SY03=function(player)--商业技能熟练度
        if player:HasSpell( 50305 ) then
			player:SendBroadcastMessage("你的剥皮专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(8613)
			player:LearnSpell(8617)
			player:LearnSpell(8618)
			player:LearnSpell(10768)
			player:LearnSpell(32678)
			player:LearnSpell(50305)
			player:AdvanceSkill(393, 450)--3
    end,

	SY04=function(player)--商业技能熟练度
        if player:HasSpell( 51306 ) then
			player:SendBroadcastMessage("你的工程学专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(4036)
			player:LearnSpell(4037)
			player:LearnSpell(4038)
			player:LearnSpell(12656)
			player:LearnSpell(30350)
			player:LearnSpell(51306)
			player:AdvanceSkill(202, 450)--4
    end,

	SY05=function(player)--商业技能熟练度
        if player:HasSpell( 51304 ) then
			player:SendBroadcastMessage("你的炼金专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2259)
			player:LearnSpell(3101)
			player:LearnSpell(3464)
			player:LearnSpell(11611)
			player:LearnSpell(28596)
			player:LearnSpell(51304)
			player:AdvanceSkill(171, 450)--5
    end,

	SY06=function(player)--商业技能熟练度
        if player:HasSpell( 51302 ) then
			player:SendBroadcastMessage("你的制皮专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2108)
			player:LearnSpell(3104)
			player:LearnSpell(3811)
			player:LearnSpell(10662)
			player:LearnSpell(32549)
			player:LearnSpell(51302)
			player:AdvanceSkill(165, 450)--6
    end,

	SY07=function(player)--商业技能熟练度
        if player:HasSpell( 51309 ) then
			player:SendBroadcastMessage("你的裁缝专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(3908)
			player:LearnSpell(3909)
			player:LearnSpell(3910)
			player:LearnSpell(12180)
			player:LearnSpell(26790)
			player:LearnSpell(51309)
			player:AdvanceSkill(197, 450)--7
    end,

	SY08=function(player)--商业技能熟练度
        if player:HasSpell( 51300 ) then
			player:SendBroadcastMessage("你的锻造专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2018)
			player:LearnSpell(3100)
			player:LearnSpell(3538)
			player:LearnSpell(9785)
			player:LearnSpell(29844)
			player:LearnSpell(51300)
			player:AdvanceSkill(164, 450)--8
    end,

	SY09=function(player)--商业技能熟练度
        if player:HasSpell( 51313 ) then
			player:SendBroadcastMessage("你的附魔专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(7411)
			player:LearnSpell(7412)
			player:LearnSpell(7413)
			player:LearnSpell(13920)
			player:LearnSpell(28029)
			player:LearnSpell(51313)
			player:AdvanceSkill(333, 450)--9
    end,

	SY10=function(player)--商业技能熟练度
       if player:HasSpell( 51311 ) then
			player:SendBroadcastMessage("你的珠宝专业已满。")
			player:ModifyMoney(3000000)--返还
		return
	end
			player:LearnSpell(25229)
			player:LearnSpell(25230)
			player:LearnSpell(28894)
			player:LearnSpell(28895)
			player:LearnSpell(28897)
			player:LearnSpell(51311)
			player:AdvanceSkill(755, 450)--10
    end,

	SY11=function(player)--商业技能熟练度
        if player:HasSpell( 45363 ) then
			player:SendBroadcastMessage("你的铭文专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(45357)
			player:LearnSpell(45358)
			player:LearnSpell(45359)
			player:LearnSpell(45360)
			player:LearnSpell(45361)
			player:LearnSpell(45363)
			player:AdvanceSkill(773, 450)--11
    end,

	SY12=function(player)--商业技能熟练度
        if player:HasSpell( 51296 ) then
			player:SendBroadcastMessage("你的烹饪专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(2550)
			player:LearnSpell(3102)
			player:LearnSpell(3413)
			player:LearnSpell(18260)
			player:LearnSpell(33359)
			player:LearnSpell(51296)
			player:AdvanceSkill(185, 450)--12
    end,

	SY13=function(player)--商业技能熟练度
        if player:HasSpell( 45542 ) then
			player:SendBroadcastMessage("你的急救专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(3273)
			player:LearnSpell(3274)
			player:LearnSpell(7924)
			player:LearnSpell(10846)
			player:LearnSpell(27028)
			player:LearnSpell(45542)
			player:AdvanceSkill(129, 450)--13
    end,

	SY14=function(player)--商业技能熟练度
		if player:HasSpell( 51294 ) then
			player:SendBroadcastMessage("你的钓鱼专业已满。")
			player:ModifyMoney(3000000)--返还
			return
		end
			player:LearnSpell(7620)
			player:LearnSpell(7731)
			player:LearnSpell(7732)
			player:LearnSpell(18248)
			player:LearnSpell(33095)
			player:LearnSpell(51294)
			player:AdvanceSkill(356, 450)--14
    end,
}

local Menu={--菜单页面
	[MMENU]={--主菜单
        {MENU, "|TInterface/ICONS/rxjh_app_ico_32_32:32:32|t|c00722FFF热血江湖",            MMENU+0x30,		GOSSIP_ICON_TALK},--热血江湖程序图标
        {MENU, "|TInterface/ICONS/popkart_app_ico:32:32|t|c00722FFF跑跑卡丁车",	            MMENU+0x30,		GOSSIP_ICON_TALK},--跑跑卡丁车
        {MENU, "|TInterface/ICONS/cs_1_6_app_ico:32:32|t|c00722FFF反恐精英",	            MMENU+0x30,		GOSSIP_ICON_TALK},--反恐精英
        {MENU, "|TInterface/ICONS/Journey_to_the_East_app_ico:32:32|t|c00722FFF东游记",	    MMENU+0x30,		GOSSIP_ICON_TALK},--东游记
        --{MENU, "|TInterface/ICONS/bbl:32:32|t|c00722FFF芭芭拉",	                        MMENU+0x40,		GOSSIP_ICON_TALK},--芭芭拉    --cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别   //尝试调用朱元璋的icon --芭芭拉  //此条需朱元璋客户端
        {MENU, "|TInterface/ICONS/ys_app:32:32|t|c00722FFF原神",	                        MMENU+0x50,		GOSSIP_ICON_TALK},--原神    
        {MENU, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t|c00722FFF我叫MT",	            MMENU+0x90,		GOSSIP_ICON_TALK},--原神
        {MENU, "|TInterface/ICONS/Temp:32:32|t|c00722FFF魔兽世界",	                        MMENU+0x40,		GOSSIP_ICON_TALK},--魔兽世界    --cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别
        --需要补充的:守望先锋,大菠萝,
        --{FUNC, "|TInterface/ICONS/ys_app:32:32|t播放影片", 	                    ST.PlayMovie,	GOSSIP_ICON_TRAINER},--失败
        --待修复
	},

    --次菜单
	[MMENU+0x10]={--便捷功能
		--{FUNC, "|TInterface/ICONS/achievement_leader_tyrande_whisperwind:32:32|t|cff3F636C召唤歌剧院管理员|r", 	ST.SummonNPC_sound,	GOSSIP_ICON_TAXI},--自制播音员，外发时注释掉
		--{FUNC, "|TInterface/ICONS/Ysera_mortal:32:32|t|cff3F636C召唤伊瑟拉|r", 	ST.SummonNPC_Ysera,	GOSSIP_ICON_TAXI},--自制NPC，外发时注释掉
		--{FUNC, "|TInterface/ICONS/inv_misc_coin_01:32:32|t|cff3F636CGM模式", 		Stone.GmOnMod,	GOSSIP_ICON_VENDOR},--eluna不能支持GM命令
        {FUNC, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t召唤售卖商人", 	ST.SummonVendor,	GOSSIP_ICON_TRAINER},
        {FUNC, "|TInterface/ICONS/inv_misc_coin_01:32:32|t|cff3F636C在线银行", 		Stone.OpenBank,	GOSSIP_ICON_VENDOR},
        {FUNC, "|TInterface/ICONS/INV_Letter_06:32:32|t|cff3F636C空中邮箱", 		Stone.OpenMailBox,	GOSSIP_ICON_VENDOR},
		--{FUNC, "|TInterface/ICONS/inv_misc_coin_06:32:32|t|cff3F636C移动拍卖行", 		Stone.OpenAuction,	GOSSIP_ICON_VENDOR},--无法脱离NPC实现
		{FUNC, "|TInterface/ICONS/inv_misc_coin_02:32:32|t|cff3F636C移动公会银行", 		ST.SummonGameObject_GuildBank,	GOSSIP_ICON_VENDOR},
        {FUNC, "|TInterface/ICONS/trade_blacksmithing:32:32|t|cff3F636C修理装备",	    Stone.RepairAll,	GOSSIP_ICON_MONEY_BAG,	false,"需要花费金币修理装备 ？"},
        {MENU, "|TInterface/ICONS/inv_misc_runedorb_01:32:32|t|cff3F636C商业技能设施",		MMENU+0x110,		GOSSIP_ICON_TALK},
		{FUNC, "|TInterface/ICONS/inv_box_02:32:32|t|cff3F636C保存角色", 		Stone.SaveToDB,			GOSSIP_ICON_INTERACT_1},
		{FUNC, "|TInterface/ICONS/Spell_Holy_BorrowedTime:32:32|t|cff3F636C重置角色所有冷却",	Stone.ResetAllCD,		GOSSIP_ICON_INTERACT_1,	false,"确认重置所有冷却 ？"},
		{FUNC, "|TInterface/ICONS/inv_potion_47:32:32|t|cff3F636C立刻回满血蓝",	Stone.MaxHealth,	GOSSIP_ICON_BATTLE,	false,"确认回复生命与法力？"},
		{FUNC, "|TInterface/ICONS/ability_vanish:32:32|t|cff3F636C强制脱离战斗", 	Stone.OutCombat,GOSSIP_ICON_BATTLE},
		
		{FUNC, "|TInterface/ICONS/Spell_Shadow_DeathScream:32:32|t|cff3F636C解除虚弱", 		Stone.WeakOut,		GOSSIP_ICON_INTERACT_1, false,"是否解除虚弱，并回复生命和法力 ？",20000},
		{FUNC, "|TInterface/ICONS/inv_sigil_thorim:32:32|t|cff3F636C重置副本",	Stone.UnBind,	GOSSIP_ICON_INTERACT_2,	false,"确认重置副本？"},
		{TP, " |TInterface/ICONS/achievement_pvp_A_04:32:32|t【|cff0070d0联盟锁经验|r】",0,-8416.410156,283.307831,120.886093,3.280629,	TEAM_ALLIANCE,1,10000},
	    {TP, " |TInterface/ICONS/achievement_pvp_H_04:32:32|t【|cFFB22222部落锁经验|r】", 1,2000.801025,-4790.464355,56.992043,0.314139,TEAM_HORDE,1,	10000},
	},

	[MMENU+0x20]={--幻化功能
		{FUNC, "|TInterface/ICONS/Achievement_Boss_Nexus_Prince_Shaffar:32:32|t|cFF32CD99召唤幻化大师|r", 	ST.SummonNPCds,	GOSSIP_ICON_TAXI},
	},

    [MMENU+0x30]={--热血江湖气功加点主界面
        {MENU, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t加点", 	    SKLMENU+0x80,	GOSSIP_ICON_TRAINER},   --进入主界面
        
        {FUNC, "|TInterface/ICONS/inv_misc_coin_01:32:32|t|cff3F636C重置", 		Douqi_seleGoss,	GOSSIP_ICON_VENDOR},    --重置与加属性界面
	},

    [MMENU+0x40]={--魔兽世界主界面
		{MENU, "|TInterface/ICONS/inv_misc_food_15:32:32|t|c00722FFF便捷功能",		                        MMENU+0x10,		GOSSIP_ICON_TALK},--cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别 
        {MENU, "|TInterface/ICONS/achievement_zone_icecrown_01:32:32|t|cffe60000副本传送", 	                TPDRMENU,		GOSSIP_ICON_TAXI},
        
        {MENU, "|TInterface/ICONS/inv_misc_map02:32:32|t|cff8B4513地图传送", 	                            TPMENU,			GOSSIP_ICON_TAXI},
		
		{MENU, "|TInterface/ICONS/INV_Misc_Rune_01:32:32|t|cff0070d0炉石功能", 	                            TBMENU,	        GOSSIP_ICON_TAXI,},
		{MENU, "|TInterface/ICONS/inv_misc_ogrepinata:32:32|t|cFF9932CC技能训练|r", 	                    SKLMENU,	    GOSSIP_ICON_TRAINER},
		{MENU, "|TInterface/ICONS/Achievement_Boss_Nexus_Prince_Shaffar:32:32|t|cFF32CD99幻化功能|r",		MMENU+0x20,		GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/Trade_Engraving:32:32|t|cFFB22222双重附魔|r",		                        ENCMENU,		GOSSIP_ICON_TABARD},
		
        
        {MENU, "|TInterface/ICONS/inv_misc_celebrationcake_01:32:32|t|cFF548B54付费功能|r",	                GMMENU,		    GOSSIP_ICON_MONEY_BAG},
		{TP,   "|TInterface/ICONS/inv_misc_coin_02:32:32|t|cffe60000城市广场|r (|cff0070d0商业中心|r)", 1, -8545.5, 2005.471, 100.349, 1,	TEAM_NONE,	GOSSIP_ICON_TAXI},
        },

    [MMENU+0x50]={--原神主界面
		{MENU, "|TInterface/ICONS/ys_app:32:32|t|c00722FFF变身(芭芭拉的衣橱)",		                        MMENU+0x60,		GOSSIP_ICON_TALK},--cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别 
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t清除变身", 	                                                ST.DeMorph,	    GOSSIP_ICON_TRAINER},
	},

    [MMENU+0x60]={--原神_变身_芭芭拉的衣橱
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣短筒蓝袜",            ST.Morph_45600,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣长筒红袜", 	        ST.Morph_45601,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣长筒红袜", 	        ST.Morph_45602,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣长筒白袜", 	        ST.Morph_45603,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾黑衣无袜", 	            ST.Morph_45604,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾黑衣蒙眼黑色毛袜", 	    ST.Morph_45605,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾黑衣长筒毛袜", 	        ST.Morph_45606,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣红裙摆长筒白袜", 	    ST.Morph_45607,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾白衣黑裙摆长筒彩虹袜", 	ST.Morph_45608,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾彩虹上衣黑裙摆长筒黑袜",  ST.Morph_45609,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾彩虹上衣黑裙摆无袜", 	    ST.Morph_45610,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t双马尾彩虹上衣黑裙摆彩虹袜", 	ST.Morph_45611,	GOSSIP_ICON_TRAINER},--成功
	},

    [MMENU+0x70]={--我叫MT_变身_第1页
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t长白发清凉女",       ST.Morph_45612,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t暗夜男", 	        ST.Morph_45613,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t古装血小贱", 	    ST.Morph_45614,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t吸血鬼血小贱", 	    ST.Morph_45615,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t尖角帽血小贱", 	    ST.Morph_45616,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/rxjh_app_ico_32_32:32:32|t暴毙烤迪克", 	    ST.Morph_45617,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t严实板甲男", 	    ST.Morph_45618,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t大小姐", 	        ST.Morph_45619,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t呆贼", 	            ST.Morph_45620,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t术士大妈", 	        ST.Morph_45621,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t羽装大小姐", 	    ST.Morph_45622,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金装大小姐", 	    ST.Morph_45623,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t神棍德", 	        ST.Morph_45624,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t地中海", 	        ST.Morph_45625,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t女德", 	            ST.Morph_45626,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金装方砖叔", 	    ST.Morph_45627,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t暗黑装方砖叔", 	    ST.Morph_45628,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t牧尸", 	            ST.Morph_45629,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t尖角装会长", 	    ST.Morph_45630,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t板甲会长", 	        ST.Morph_45631,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t狩猎装会长", 	    ST.Morph_45632,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t吉安娜", 	        ST.Morph_45633,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金装劣人", 	        ST.Morph_45634,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t蓝装劣人", 	        ST.Morph_45635,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t暗装劣人", 	        ST.Morph_45636,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t阴谋者", 	        ST.Morph_45637,	GOSSIP_ICON_TRAINER},--成功
        {MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页",          MMENU+0x80,GOSSIP_ICON_BATTLE},
    },

    [MMENU+0x80]={--我叫MT_变身_第2页
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t红装美铝", 	            ST.Morph_45638,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金装美铝", 	            ST.Morph_45639,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t亮装美铝", 	            ST.Morph_45640,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|tMT", 	                ST.Morph_45641,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t白装牧尸", 	            ST.Morph_45642,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t红装双马尾血精灵",       ST.Morph_45643,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t暗装双马尾血精灵",       ST.Morph_45644,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t绿装尖角女德", 	        ST.Morph_45645,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t蓝黄装开花尖角女德",     ST.Morph_45646,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t野兽装女德", 	        ST.Morph_45647,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t红装女贼", 	            ST.Morph_45648,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t暗红装女贼", 	        ST.Morph_45649,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t骷髅蓝装女贼", 	        ST.Morph_45650,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t粉红清凉仙女", 	ST.Morph_45651,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t麒麟臂男", 	    ST.Morph_45652,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t蓝金法师装女", 	        ST.Morph_45653,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t傻馒", 	                ST.Morph_45654,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t飞虎", 	                ST.Morph_45655,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t丝袜长袍血精灵法师", 	ST.Morph_45656,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金色尖角短袍血精灵法师", ST.Morph_45657,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t绿装血精灵法师", 	    ST.Morph_45658,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t白装野德新之助", 	    ST.Morph_45659,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t金装长披风野德新之助",   ST.Morph_45660,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t马驹", 	        ST.Morph_45661,	GOSSIP_ICON_TRAINER},--成功
        {MENU, "|TInterface/ICONS/achievement_pvp_h_11:32:32|t上一页",              MMENU+0x70,GOSSIP_ICON_BATTLE},
        --45662 初音未来
        --45663 鱼人宝宝车队
        --45664 邪能战蝎
        --45665 装甲虎
        --45666 邪能马
        --667 星光龙
        --668 黑色翔龙
        --669 绿色翔龙
        --670 发光闪电绿色翔龙
        --671 发光白色翔龙
        --672 地精三轮车
        --673 红色跑车
        --674 联盟争霸赛奖励摩托车
        --675 部落争霸赛奖励摩托车
        --676 浓烟飞艇
        --677 星际争霸鱼人宝宝
        --678 红色机器人
        --679 熔岩裂犬
        --680 CTM萨尔
        --681 暗色战蝎
        --682 烈酒虎
        --683 黑色邪能鱼人
        --684 暗色兽人
        --685 亮色苏拉玛女法师
        --686 暗色苏拉玛女法师
        --687 邪能古尔丹
        --688 烈焰巫妖王
        --689 邪能宠物豹
        --690 亮色苏拉玛男法师
        --691 暗色苏拉玛男法师
        --692 宾利
        --693 家用型跑车
        --694 黄色超跑
        --695 魔法黄色飞猫
        --696 烈焰宠物犬
        --697 坦克
        --698 2b女
        --699 不知火舞
        --700 吕布
        --701 布加迪
        --702 白色布加迪(云加鹰)
        --703 车轮滚滚
    },

    [MMENU+0x90]={--我叫MT主界面
	    {MENU, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t|c00722FFF变身",		                            MMENU+0x70,		GOSSIP_ICON_TALK},--cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别 
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t清除变身", 	                                    ST.DeMorph,	    GOSSIP_ICON_TRAINER},
    },

	[MMENU+0x110]={--召唤商业技能设施
		{FUNC, "|TInterface/ICONS/spell_fire_fire:32:32|t|cff3F636C烹饪营火", 		ST.SummonTradeObject_Campfire,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/trade_alchemy:32:32|t|cff3F636C炼金实验室", 		ST.SummonTradeObject_AlchemyTable,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/trade_blacksmithing:32:32|t|cff3F636C铁砧", 		ST.SummonTradeObject_Anvil,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/inv_sword_09:32:32|t|cff3F636C熔炉", 		ST.SummonTradeObject_Furnace,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/spell_nature_earthquake:32:32|t|cff3F636C黑铁砧", 		ST.SummonTradeObject_BlackAnvil,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/spell_fire_selfdestruct:32:32|t|cff3F636C黑熔炉", 		ST.SummonTradeObject_BlackFurnace,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/inv_fabric_soulcloth_bolt:32:32|t|cff3F636C魔法织布机", 		ST.SummonTradeObject_MagicLoom,	GOSSIP_ICON_MONEY_BAG},
		{FUNC, "|TInterface/ICONS/inv_fabric_moonrag_01:32:32|t|cff3F636C月亮井", 		ST.SummonTradeObject_MoonWell,	GOSSIP_ICON_MONEY_BAG},
	},
			--[[
					--GOSSIP_ICON 菜单图标
					local GOSSIP_ICON_CHAT            = 0                    -- 对话，空泡泡
					local GOSSIP_ICON_VENDOR          = 1                    -- 货物，袋子
					local GOSSIP_ICON_TAXI            = 2                    -- 传送，翅膀
					local GOSSIP_ICON_TRAINER         = 3                    -- 训练，书
					local GOSSIP_ICON_INTERACT_1      = 4                    -- 复活，齿轮
					local GOSSIP_ICON_INTERACT_2      = 5                    -- 设为我的家，齿轮
					local GOSSIP_ICON_MONEY_BAG   	  = 6                    -- 钱袋，包和金币
					local GOSSIP_ICON_TALK            = 7                    -- 申请，说话泡泡+黑色点
					local GOSSIP_ICON_TABARD          = 8                    -- 工会，战袍
					local GOSSIP_ICON_BATTLE          = 9                    -- 加入战场，双剑交叉
					local GOSSIP_ICON_DOT             = 10                   -- 加入战场，战袍
			]]


    [TBMENU]={--炉石功能
		{FUNC, "|TInterface/ICONS/INV_Misc_Rune_01:32:32|t|cFFB22222炉石传回", 	Stone.GoHome,	GOSSIP_ICON_TAXI,		  false,"是否穿越回|cFFF0F000记录位置|r ？"},
		{FUNC, "|TInterface/ICONS/inv_misc_rune_08:32:32|t|cFFB22222记录炉石", 	Stone.SetHome,	GOSSIP_ICON_TAXI,         false,"是否记录|cFFF0F000当前位置|r为炉石点 ？"},
		{MENU, "|TInterface/ICONS/INV_Misc_Rune_06:32:32|t|cffe60000定点传送|r", 	 TBMENU+0x10,			GOSSIP_ICON_TAXI},
		{FUNC, "|TInterface/ICONS/spell_arcane_blink:32:32|t|cff2F4F4F目标瞬移",   Stone.GoSelectPlayer,	GOSSIP_ICON_TAXI,          false,"是否瞬移到目标身边 ？"},
	},	

	[TBMENU+0x10]={--定点传送
		{FUNC, "|TInterface/ICONS/Spell_Arcane_TeleportStormWind:32:32|t传送到1号点 1金/次",	    Stone.TTPoint1,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ？",10000},
		{FUNC, "|TInterface/ICONS/spell_arcane_teleportexodar:32:32|t传送到2号点 2金/次",	    Stone.TTPoint2,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ？",20000},
		{FUNC, "|TInterface/ICONS/spell_arcane_teleportshattrath:32:32|t传送到3号点 3金/次",	    Stone.TTPoint3,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ？",30000},
		{FUNC, "|TInterface/ICONS/spell_arcane_teleportstonard:32:32|t传送到4号点 4金/次",	    Stone.TTPoint4,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ？",40000},
		{FUNC, "|TInterface/ICONS/spell_arcane_teleportsilvermoon:32:32|t传送到5号点 5金/次",	    Stone.TTPoint5,	GOSSIP_ICON_TAXI,	false,"是否穿越回|cFFF0F000记录位置|r ？",50000},	--增加收费金额参数,默认情况下失败也会扣金币，因此在失败时返还金币，在游戏里也不会出现减钱再加钱
		{FUNC, "|TInterface/ICONS/inv_scroll_12:32:32|t|cff8B4513记录1号点",		Stone.TBPoint1,	GOSSIP_ICON_INTERACT_1,	false,"是否记录当前|cFFF0F000位置|r为1号点，传回1金1次？"},
		{FUNC, "|TInterface/ICONS/inv_scroll_13:32:32|t|cff8B4513记录2号点",		Stone.TBPoint2,	GOSSIP_ICON_INTERACT_1,	false,"是否记录当前|cFFF0F000位置|r为2号点，传回2金1次？"},
		{FUNC, "|TInterface/ICONS/inv_scroll_14:32:32|t|cff8B4513记录3号点",		Stone.TBPoint3,	GOSSIP_ICON_INTERACT_1,	false,"是否记录当前|cFFF0F000位置|r为3号点，传回3金1次？"},
		{FUNC, "|TInterface/ICONS/inv_scroll_15:32:32|t|cff8B4513记录4号点",		Stone.TBPoint4,	GOSSIP_ICON_INTERACT_1,	false,"是否记录当前|cFFF0F000位置|r为4号点，传回4金1次？"},
		{FUNC, "|TInterface/ICONS/inv_scroll_16:32:32|t|cff8B4513记录5号点",		Stone.TBPoint5,	GOSSIP_ICON_INTERACT_1,	false,"是否记录当前|cFFF0F000位置|r为5号点，传回5金1次？"},
	},

	[SKLMENU]={--技能训练主菜单
        {MENU, "|TInterface/ICONS/inv_glyph_majormage.jpg:32:32|t【|cFFB22222召唤:随身雕文商人|r】", 	SKLMENU+0x30,	GOSSIP_ICON_VENDOR},
		{MENU,  "|TInterface/ICONS/inv_crate_05:32:32|t【|cff2E8B57传送:训练假人|r】",	 SKLMENU+0x60,	GOSSIP_ICON_BATTLE},
		{MENU, "|TInterface/ICONS/inv_misc_book_09:32:32|t【|cFF9932CC传送:职业训练师|r】",    				SKLMENU+0x10,		GOSSIP_ICON_TAXI},
		{MENU, "|TInterface/ICONS/inv_sword_05:32:32|t【|cFF9932CC传送:武器训练师|r】", 	SKLMENU+0x20,	GOSSIP_ICON_TAXI},
		{MENU, "|TInterface/ICONS/spell_nature_swiftness:32:32|t【|cFF9932CC传送:骑术训练师|r】", 	SKLMENU+0x70,	GOSSIP_ICON_TAXI},
		{FUNC, "|TInterface/ICONS/Spell_Deathknight_ClassIcon:32:32|t【|cFFB22222提升武器熟练度|r】",	Stone.WSkillsToMax,	GOSSIP_ICON_TRAINER,	false,"确认提升武器熟练度？"},
		{FUNC, "|TInterface/ICONS/ability_marksmanship:32:32|t【|cffC71585重置天赋|r】",	Stone.ResetTalents,	GOSSIP_ICON_TRAINER,	false,"确认重置天赋？"},
		{FUNC, "|TInterface/ICONS/ability_hunter_beastcall:32:32|t【|cffC71585重置宠物天赋|r】",	Stone.ResetPetTalents,	GOSSIP_ICON_TRAINER,	false,"确认重置宠物天赋？"},
		{MENU, "|TInterface/ICONS/inv_tradeskillitem_02:32:32|t【|cFFFF6600召唤:商业训练师|r】",    				SKLMENU+0x40,		GOSSIP_ICON_TAXI},
		{MENU, "|TInterface/ICONS/ability_repair:32:32|t【|cFFFF6600提升商业技能等级|r】", 	SKLMENU+0x50,	GOSSIP_ICON_TRAINER},	
	},

		[SKLMENU+0x10]={ --训练师职业选择菜单
				{MENU, "|TInterface/ICONS/inv_sword_27:32:32|t|cff8B4513战士训练师", SKLMENU+0x110  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/ability_thunderbolt:32:32|t|cffC71585圣骑训练师", SKLMENU+0x210  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/spell_deathknight_classicon:32:32|t|cffC41E3B死骑训练师", SKLMENU+0x310  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/spell_nature_bloodlust:32:32|t|cff2359FF萨满训练师",  SKLMENU+0x410  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/inv_weapon_bow_07:32:32|t|cFF548B54猎人训练师",  SKLMENU+0x510  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/ability_druid_maul:32:32|t|cFFFF6600小德训练师", SKLMENU+0x610  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/inv_throwingknife_04:32:32|t|cffFFFF00盗贼训练师",  SKLMENU+0x710  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/inv_staff_13:32:32|t|cff68CCEF法师训练师", SKLMENU+0x810  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/spell_nature_drowsy:32:32|t|cff9382C9术士训练师", SKLMENU+0x910  , GOSSIP_ICON_TAXI},
				{MENU, "|TInterface/ICONS/inv_staff_30:32:32|t|cffFFFFFF牧师训练师",  SKLMENU+0xa10  , GOSSIP_ICON_TAXI},
			--[[--联盟职业技能训练师
				--{FUNC, "|cff0070d0联盟战士训练师", 	ST.SummonNPC_1zs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟圣骑训练师", 	ST.SummonNPC_1qs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟死骑训练师", 	ST.SummonNPC_1dk,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟萨满训练师", 	ST.SummonNPC_1sm,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟猎人训练师", 	ST.SummonNPC_1lr,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟小德训练师", 	ST.SummonNPC_1xd,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟盗贼训练师",    ST.SummonNPC_1dz,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟法师训练师", 	ST.SummonNPC_1fs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟术士训练师", 	ST.SummonNPC_1ss,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cff0070d0联盟牧师训练师", 	ST.SummonNPC_1ms,  GOSSIP_ICON_TRAINER},
				---部落职业技能训练师
				--{FUNC, "|cffe60000部落战士训练师", 	ST.SummonNPC_2zs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落圣骑训练师", 	ST.SummonNPC_2qs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落死骑训练师", 	ST.SummonNPC_2dk,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落萨满训练师", 	ST.SummonNPC_2sm,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落猎人训练师", 	ST.SummonNPC_2lr,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落小德训练师", 	ST.SummonNPC_2xd,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落盗贼训练师",	ST.SummonNPC_2dz,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落法师训练师", 	ST.SummonNPC_2fs,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落术士训练师", 	ST.SummonNPC_2ss,  GOSSIP_ICON_TRAINER},
				--{FUNC, "|cffe60000部落牧师训练师", 	ST.SummonNPC_2ms,  GOSSIP_ICON_TRAINER},
			]]
		},

		[SKLMENU+0x110]={	--战士训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cff8B4513战士训练师",0,  -8696.33, 326.41, 109.438, 6.0759, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cff8B4513战士训练师",0,   -5037.14, -1243.90, 507.7560, 3.0351, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cff8B4513战士训练师",1,  9985.02, 2321.94, 1330.789, 5.3431, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cff8B4513战士训练师",530, -4192.12, -11645.23, -99.6639, 4.3313, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cff8B4513战士训练师",1,  1969.98, -4799.73, 56.9910, 5.3289, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城 |cff8B4513战士训练师",0,  1772.09, 424.28, -57.1975, 5.0729, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000雷霆崖 |cff8B4513战士训练师",1,  -1452.75, -90.08, 159.0187, 2.1716, TEAM_HORDE}, --原来80级血精灵还不能建立战士,时间很久都忘记了.去找卫兵问了下银月还真没有战士训练师...但是幽暗城有圣骑士训练师就很奇怪,他不瘆得慌嘛,逻辑是经不起细细盘
		},

		[SKLMENU+0x210]={	--圣骑训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城|cffC71585 圣骑士训练师",0,  -8572.67, 876.67, 106.519, 2.2855, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡|cffC71585 圣骑士训练师",0,  -4604.03, -907.98, 502.9357, 0.7134, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯|cffC71585 圣骑士训练师",1,  9672.96, 2528.40, 1360.0020, 2.9115, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达|cffC71585 圣骑士训练师",530, -4191.48, -11477.85, -131.4584, 3.1673, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛|cffC71585 圣骑士训练师",1,  1937.94, -4143.32, 40.9919, 1.3892, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城|cffC71585 圣骑士训练师",0,  1303.39, 319.72, -60.0829, 3.6742, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城|cffC71585 圣骑士训练师",530,  9859.49, -7513.54, 19.6821, 2.6750, TEAM_HORDE},

		},

		[SKLMENU+0x310]={	--死骑训练师
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/achievement_zone_easternplaguelands:32:32|t 黑锋要塞 |cffC41E3B死亡骑士训练师",0,  2526.98, -5558.98, 377.0655, 1.42590, TEAM_NONE},
		},

		[SKLMENU+0x410]={	--萨满训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cff2359FF萨满训练师",0,  -9037.42, -548.88, 73.471, 0.1822, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cff2359FF萨满训练师",0,  -4723.94, -1152.27, 502.4484, 0.3459, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cff2359FF萨满训练师",530, -3813.46, -11394.84, -104.3509, 6.0631, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cff2359FF萨满训练师",1,  1929.89, -4227.68, 42.3221, 1.1599, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000雷霆崖 |cff2359FF萨满训练师",1,  -989.39, 272.81, 137.5903, 1.0037, TEAM_HORDE},
		},

		[SKLMENU+0x510]={	--猎人训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cFF548B54猎人训练师",0,  -8417.78, 546.41, 95.450 , 0.6189, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cFF548B54猎人训练师",0,  -5014.14, -1270.00, 507.756 , 5.46115, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cFF548B54猎人训练师",1,  10178.10, 2496.28, 1357.1656 , 5.2465, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cFF548B54猎人训练师",530, -4239.95, -11558.63, -126.2070 , 6.1440, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cFF548B54猎人训练师",1,  2096.31, -4620.13, 58.7442, 0.2223, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000雷霆崖 |cFF548B54猎人训练师",1,  -1452.75, -90.08, 159.0187, 3.4047, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cFF548B54猎人训练师",530, 9929.85, -7411.32, 12.3589, 5.1804, TEAM_HORDE},
		},

		[SKLMENU+0x610]={	--小德训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cFFFF6600德鲁伊训练师",0,  -8737.72, 1086.40, 92.5190,	1, 2.0256, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cFFFF6600德鲁伊训练师",1,  10173.88, 2571.16, 1326.6436, 0.8420, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cFFFF6600德鲁伊训练师",530, -4267.57, -11491.58, 9.2659, 3.6095, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000奥格瑞玛 |cFFFF6600德鲁伊训练师",1,  -1052.00, -282.32, 159.0310, 5.5025, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cFFFF6600德鲁伊训练师",530,  9696.30, -7265.21, 14.7292, 0.3573, TEAM_HORDE},
			--中立
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/spell_arcane_teleportmoonglade:32:32|t |cff9932CC永夜港 |cFFFF6600德鲁伊训练师",1,  7870.30, -2588.44, 486.9400, 4.1720, TEAM_NONE},
		},

		[SKLMENU+0x710]={	--盗贼训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cffFFFF00盗贼训练师",0,  -8801.17, 328.90, 103.0870, 6.1780, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cffFFFF00盗贼训练师",0,  -4653.58, -1116.37, 504.9386, 4.9758, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cffFFFF00盗贼训练师",1,  10082.57, 2532.10, 1285.7800, 1.3368, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cffFFFF00盗贼训练师",1,  1785.35, -4290.62, 6.2996, 1.7875, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城 |cffFFFF00盗贼训练师",0,  1423.89, 58.94, -62.2792, 2.8495, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cffFFFF00盗贼训练师",530, 9743.51, -7355.84, 24.3317, 4.9644, TEAM_HORDE},
			--中立
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_HillsbradFoothills:32:32|t |cff9932CC拉文霍德庄园 |cffFFFF00盗贼训练师",0,  0.55, -1594.11, 203.9186, 1.5520, TEAM_NONE},
		},

		[SKLMENU+0x810]={	--法师训练师	--法爷管家每个城都有,亲儿子本儿无疑了,因为必须要让法爷去学开门= =
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cff68CCEF法师训练师",0,  -9001.49, 866.43, 29.6209, 2.2358, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cff68CCEF法师训练师",0,  -4615.09, -921.48, 501.0623, 5.5711, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cff68CCEF法师训练师",1,  9672.96, 2528.40, 1360.0020, 2.9115, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cff68CCEF法师训练师",530, -4043.14, -11564.45, -138.4200, 2.9105, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cff68CCEF法师训练师",1,  1478.20, -4222.50, 43.1861, 2.9243, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000雷霆崖 |cff68CCEF法师训练师",1,  -990.00, 254.73, 101.7428, 3.7746, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城 |cff68CCEF法师训练师",0,  1780.90, 52.11, -61.4903, 0.3661, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cff68CCEF法师训练师",530,  9992.19, -7098.80, 47.7057, 5.4883, TEAM_HORDE},
			
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/achievement_character_draenei_male:32:32|t |cff32CD32沙塔斯 |cff68CCEF法师训练师",	530,-1882.661377,5370.286621,-12.427878,4.010172,	TEAM_NONE},--增加显示此菜单等级，传送使用金币
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/achievement_reputation_kirintor:32:32|t |cff9932CC达拉然 |cff68CCEF法师训练师",571,5811.350586,592.949463,652.390747,1.736634, TEAM_NONE},
		},
		
		[SKLMENU+0x910]={	--术士训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cff9382C9术士训练师",0,  -8986.58, 1031.36, 101.4043, 0.3110, TEAM_ALLIANCE},
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cff9382C9术士训练师",0,  -4603.37, -1112.82, 504.9385, 5.4313, TEAM_ALLIANCE},

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cff9382C9术士训练师",1,  1830.08, -4354.29, -14.5563, 5.9776, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城 |cff9382C9术士训练师",0,  1780.90, 52.11, -61.4903, 4.1321, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cff9382C9术士训练师",530,  9788.95, -7297.88, 13.3876, 2.2383, TEAM_HORDE},
			--中立
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Barrens_01:32:32|t |cff8B4513棘齿城 |cff9382C9术士训练师",1,  -787.50, -3705.68, 40.2885, 0.2183, TEAM_NONE},

		},

		[SKLMENU+0xa10]={	--牧师训练师 --牧师管家也每个城都有,奶妈人人爱
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t|cff0070d0 暴风城 |cffFFFFFF牧师训练师",0,  -8521.65, 854.16, 107.6440, 0.8530, TEAM_ALLIANCE},		
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t|cff0070d0 铁炉堡 |cffFFFFFF牧师训练师",0,  -4617.48, -913.75, 501.0623, 1.6873, TEAM_ALLIANCE},		
			{TP, " |TInterface/ICONS/achievement_character_nightelf_female:32:32|t|cff0070d0 达纳苏斯 |cffFFFFFF牧师训练师",1,  9672.96, 2528.40, 1360.0020, 2.9115, TEAM_ALLIANCE},		
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t|cff0070d0 埃索达 |cffFFFFFF牧师训练师",530, -3973.66, -11485.17, -135.3056, 0.9329, TEAM_ALLIANCE},		

			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cffe60000奥格瑞玛 |cffFFFFFF牧师训练师",1,  1452.82, -4176.15, 61.5609, 5.1784, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_tauren_male:32:32|t |cffe60000雷霆崖 |cffFFFFFF牧师训练师",1,  -990.00, 254.73, 101.7428, 3.7746, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_undead_female:32:32|t|cffe60000 幽暗城 |cffFFFFFF牧师训练师",0,  1760.88, 397.33, -57.2137, 0.8357, TEAM_HORDE},
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t|cffe60000 银月城 |cffFFFFFF牧师训练师",530,  9938.19, -7064.98, 47.7163, 2.5124, TEAM_HORDE},
		},

	[SKLMENU+0x20]={ --武器训练师
			--联盟武器训练师
			{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t |cff3F636C人类武器训练师", 	0,		-8793.120117, 	613.002991, 	96.856400,	0,TEAM_ALLIANCE}, --人类-匕首，弩，法杖，长柄，单手剑，双手剑，拳套 --80法系默认出生会魔杖
			{TP, " |TInterface/ICONS/achievement_character_dwarf_male:32:32|t |cff3F636C矮人武器训练师", 	0,-5041.520996,-1201.565186,508.901428,1.525715,TEAM_ALLIANCE}, --矮人-单手斧，双手斧，拳套，枪，单手锤，双手锤
			{TP, " |TInterface/ICONS/achievement_character_gnome_male:32:32|t |cff3F636C侏儒武器训练师", 	0,-5041.520996,-1201.565186,508.901428,4.525715,TEAM_ALLIANCE},	--侏儒-匕首，投掷，弩
			{TP, " |TInterface/ICONS/achievement_character_nightelf_male:32:32|t |cff3F636C暗夜精灵武器训练师", 	1,9911.4,2326.4,1330.8,2.42,TEAM_ALLIANCE}, --暗夜精灵-匕首，拳套，投掷，弓，法杖，弩
			{TP, " |TInterface/ICONS/achievement_character_draenei_female:32:32|t |cff3F636C德莱尼武器训练师", 	530,-4209.7,-11632.96,-98.86,2.53,TEAM_ALLIANCE}, --德莱尼-单手锤，双手锤，单手剑，双手剑，弩
			--部落武器训练师
			{TP, " |TInterface/ICONS/achievement_character_orc_male:32:32|t |cff3F636C兽人武器训练师",	1, 		2093.829346, 	-4821.349609, 	24.382,		0,TEAM_HORDE},	--兽人-匕首，弓，拳套，投掷，单手斧，双手斧
			{TP, " |TInterface/ICONS/achievement_character_troll_male:32:32|t |cff3F636C巨魔武器训练师",	1, 		2093.829346, 	-4821.349609, 	24.382,		0,TEAM_HORDE},	--巨魔-弓，投掷，法杖，单手斧，双手斧
			{TP, " |TInterface/ICONS/achievement_character_undead_male:32:32|t |cff3F636C亡灵武器训练师",	0, 		1672.4, 	324.4, 	-62.2,		3.3,TEAM_HORDE},	--亡灵-匕首，弩，长柄，单手剑，双手剑
			{TP, " |TInterface/ICONS/achievement_character_tauren_female:32:32|t |cff3F636C牛头人武器训练师",	1, 		-1282.3, 	91.4, 	129.4,		3.6,TEAM_HORDE},	--牛头-枪，法杖，单手锤，双手锤
			{TP, " |TInterface/ICONS/achievement_character_bloodelf_female:32:32|t |cff3F636C血精灵武器训练师",	530, 		9841, 	-7502.5, 	14.9,		4.64,TEAM_HORDE},	--血精灵-匕首，弓，长柄，投掷，长柄，单手剑，双手剑
			--联盟骑术
	},

	[SKLMENU+0x30]={-- 召唤雕文商人
			{FUNC, "|TInterface/ICONS/inv_jewelry_talisman_12:32:32|t召唤传家宝商人", 	ST.SummonNPC_4001001,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorwarrior:32:32|t|cff8B4513召唤战士雕文商人", 	ST.SummonNPC_4001011,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorpaladin:32:32|t|cffC71585召唤圣骑雕文商人", 	ST.SummonNPC_4001007,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majordeathknight:32:32|t|cffC41E3B召唤死骑雕文商人", 	ST.SummonNPC_4001010,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorshaman:32:32|t|cff2359FF召唤萨满雕文商人", 	ST.SummonNPC_4001008,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorhunter:32:32|t|cFF548B54召唤猎人雕文商人", 	ST.SummonNPC_4001005,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majordruid:32:32|t|cFFFF6600召唤小德雕文商人", 	ST.SummonNPC_4001003,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorrogue:32:32|t|cffFFFF00召唤盗贼雕文商人", 	ST.SummonNPC_4001002,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majormage:32:32|t|cff68CCEF召唤法师雕文商人", 	ST.SummonNPC_4001004,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorwarlock:32:32|t|cff9382C9召唤术士雕文商人", 	ST.SummonNPC_4001009,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_glyph_majorpriest:32:32|t|cffFFFFFF召唤牧师雕文商人", 	ST.SummonNPC_4001006,	GOSSIP_ICON_TRAINER},
	},

	[SKLMENU+0x40]={--商业技能训练师
			{FUNC, "|TInterface/ICONS/Trade_Mining:32:32|t|cFFB22222召唤采矿训练师", 	ST.SummonNPCMining,	    GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Herbalism:32:32|t|cFFB22222召唤草药训练师", 	ST.SummonNPCHerbalism,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_misc_pelt_wolf_01:32:32|t|cFFB22222召唤剥皮训练师", 	ST.SummonNPCSkinning,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Engineering:32:32|t|cFFB22222召唤工程训练师", 	ST.SummonNPCEngineering,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Alchemy:32:32|t|cFFB22222召唤炼金训练师", 	ST.SummonNPCAlchemy,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Tailoring:32:32|t|cFFB22222召唤裁缝训练师", 	ST.SummonNPCTailoring,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_BlackSmithing:32:32|t|cFFB22222召唤锻造训练师", 	ST.SummonNPCBlacksmithing,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_LeatherWorking:32:32|t|cFFB22222召唤制皮训练师", 	ST.SummonNPCLeatherworking,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Engraving:32:32|t|cFFB22222召唤附魔训练师", 	ST.SummonNPCEnchanting,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/INV_Misc_Gem_02:32:32|t|cFFB22222召唤珠宝训练师",	ST.SummonNPCJewelcrafting,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_inscription_tradeskill01:32:32|t|cFFB22222召唤铭文训练师", 	ST.SummonNPCInscription,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Trade_Fishing:32:32|t|cff2359FF召唤钓鱼训练师", 	ST.SummonNPCFishing,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/inv_misc_food_15:32:32|t|cff2359FF召唤烹饪训练师", 	ST.SummonNPCCooking,	GOSSIP_ICON_TRAINER},
			{FUNC, "|TInterface/ICONS/Spell_Holy_SealOfSacrifice:32:32|t|cff2359FF召唤急救训练师", 	ST.SummonNPCFirstAid,	GOSSIP_ICON_TRAINER},
	},
		
	[SKLMENU+0x50]={--商业技能提升
			{FUNC, "|TInterface/ICONS/Trade_Mining:32:32|t|cFFB22222提升采矿450级",		Stone.SY01,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00采矿|r技能？",3000000},--增加收费金额参数,默认情况下失败也会扣金币，因此在失败时返还金币，在游戏里也不会出现减钱再加钱
			{FUNC, "|TInterface/ICONS/Trade_Herbalism:32:32|t|cFFB22222提升草药450级",		Stone.SY02,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00草药|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/inv_misc_pelt_wolf_01:32:32|t|cFFB22222提升剥皮450级",		Stone.SY03,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00剥皮|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_Engineering:32:32|t|cFFB22222提升工程450级",		Stone.SY04,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00工程|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_Alchemy:32:32|t|cFFB22222提升炼金450级",		Stone.SY05,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00炼金|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_Tailoring:32:32|t|cFFB22222提升裁缝450级",		Stone.SY07,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00裁缝|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_LeatherWorking:32:32|t|cFFB22222提升制皮450级",		Stone.SY06,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00制皮|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_BlackSmithing:32:32|t|cFFB22222提升锻造450级",		Stone.SY08,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00锻造|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_Engraving:32:32|t|cFFB22222提升附魔450级",		Stone.SY09,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00附魔|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/INV_Misc_Gem_02:32:32|t|cFFB22222提升珠宝450级",		Stone.SY10,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00珠宝|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/inv_inscription_tradeskill01:32:32|t|cFFB22222提升铭文450级",		Stone.SY11,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00铭文|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Trade_Fishing:32:32|t|cff2359FF提升钓鱼450级",		Stone.SY14,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00钓鱼|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/inv_misc_food_15:32:32|t|cff2359FF提升烹饪450级",		Stone.SY12,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00烹饪|r技能？",3000000},
			{FUNC, "|TInterface/ICONS/Spell_Holy_SealOfSacrifice:32:32|t|cff2359FF提升急救450级",		Stone.SY13,	GOSSIP_ICON_TRAINER,		false,"是否提升|cFFFFFF00急救|r技能？",3000000},
	},

	[SKLMENU+0x60]={--训练假人
			{TP," |TInterface/ICONS/INV_BannerPVP_01.blp:32:32|t |cff0070d0联盟假人",		1,		 9982.015625, 2246.066162, 1332.009521,0.640893,	TEAM_ALLIANCE,	1,	10000},
			{TP," |TInterface/ICONS/INV_BannerPVP_02.blp:32:32|t |cffe60000部落假人",			530,	9842.786133, -7401.789062, 13.631996,1.473351,	TEAM_HORDE,	1,	10000},
	},

	[SKLMENU+0x70]={ --骑术训练师
			--联盟骑术
			{TP, " |TInterface/ICONS/ability_mount_ridinghorse:32:32|t|cff0070d0 马 骑术训练师",  0,-9454.53, -1376.67, 46.742, 4.72182, TEAM_ALLIANCE,20,	10000},
			{TP, " |TInterface/ICONS/ability_mount_mountainram:32:32|t|cff0070d0 山羊 骑术训练师", 0,-5545.70, -1319.17, 398.621,  5.63036, TEAM_ALLIANCE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_mechastrider:32:32|t|cff0070d0 机械陆行鸟 骑术训练师", 0, -5450.67, -624.46, 394.036, 2.02144, TEAM_ALLIANCE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_whitetiger:32:32|t|cff0070d0 豹 骑术训练师", 1, 10122.08, 2535.65, 1322.017, 5.77897, TEAM_ALLIANCE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_ridingelekk:32:32|t|cff0070d0 雷象 骑术训练师", 530,-3977.81, -11935.44, -0.775,  1.19339, TEAM_ALLIANCE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_gyrocoptorelite:32:32|t|cFF32CD32 飞行骑术训练师", 	530,	-676.925598, 	2730.669434, 	93.9085,	0,TEAM_ALLIANCE,20,10000},
			--部落骑术
			{TP, " |TInterface/ICONS/ability_mount_kodo_03:32:32|t|cffe60000 科多兽 骑术训练师", 1, -2267.61, -393.90, -9.424, 3.17773, TEAM_HORDE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_undeadhorse:32:32|t|cffe60000 骷髅马 骑术训练师", 0, 2264.96, 317.29, 34.326, 2.54897, TEAM_HORDE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_whitedirewolf:32:32|t|cffe60000 狼 骑术训练师", 1, 2142.86, -4647.43, 50.806, 5.90459, TEAM_HORDE,20,10000}, 
			{TP, " |TInterface/ICONS/ability_mount_raptor:32:32|t|cffe60000 迅猛龙 骑术训练师",  1,-852.27, -4869.51, 20.081, 4.59064, TEAM_HORDE,20,10000}, 
			{TP, " |TInterface/ICONS/ability_mount_cockatricemount:32:32|t|cffe60000 陆行鸟 骑术训练师",530, 9245.47, -7485.41, 37.012,  4.60134, TEAM_HORDE,20,10000},
			{TP, " |TInterface/ICONS/ability_mount_gyrocoptorelite:32:32|t|cFF32CD32 飞行骑术训练师", 	530,	48.719337, 		2741.370850, 	85.255180,	0,TEAM_HORDE,20,10000},
			--中立骑术
			{TP, "[|cFF006400中立|r] |TInterface/ICONS/spell_frost_arcticwinds:32:32|t|cff9932CC 寒冷天气飞行训练师", 	571,	5821, 		475, 	658.77,	3.5,TEAM_NONE,20,10000},
	},

    [SKLMENU+0x80]={-- 热血江湖
        {FUNC, "|TInterface/ICONS/hit_the_target_at_every_shot:32:32|t百步穿杨", 	                            QG_hit_the_target_at_every_shot,	GOSSIP_ICON_TRAINER},--提高命中率           --基本气功开始 --基本气功指的是出生(1级)就有的
		{FUNC, "|TInterface/ICONS/Eye_of_the_Falcon:32:32|t|cff8B4513猎鹰之眼", 	                            ST.SummonNPC_4001011,	            GOSSIP_ICON_TRAINER},--增加有效射程
		{FUNC, "|TInterface/ICONS/Concentrate_and_gather_qi:32:32|t|cffC71585凝神聚气", 	                    ST.SummonNPC_4001007,	            GOSSIP_ICON_TRAINER},--提高最小攻击力
		{FUNC, "|TInterface/ICONS/Original_Peiyuan:32:32|t|cffC41E3B正本培源", 	                                ST.SummonNPC_4001010,	            GOSSIP_ICON_TRAINER},--提高生命值
		{FUNC, "|TInterface/ICONS/The_fierce_wind_breaks_through_all_directions:32:32|t|cff2359FF狂风万破", 	ST.SummonNPC_4001008,	            GOSSIP_ICON_TRAINER},--延长愤怒攻击的时间    --基本气功结束
		{FUNC, "|TInterface/ICONS/inv_glyph_majorhunter:32:32|t|cFF548B54锐利之箭", 	                        ST.SummonNPC_4001005,	            GOSSIP_ICON_TRAINER},--10   --1转
		{FUNC, "|TInterface/ICONS/inv_glyph_majordruid:32:32|t|cFFFF6600气沉丹田", 	                            ST.SummonNPC_4001003,	            GOSSIP_ICON_TRAINER},--10   --1转
		{FUNC, "|TInterface/ICONS/inv_glyph_majorrogue:32:32|t|cffFFFF00心神凝聚", 	                            ST.SummonNPC_4001002,	            GOSSIP_ICON_TRAINER},
    },


	[GMMENU]={--GM菜单 --付费功能
		{FUNC, "|TInterface/ICONS/inv_scroll_11:32:32|t|cff3F636C修改名字",		Stone.ResetName,	GOSSIP_ICON_CHAT,		false,"是否修改名字？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/Ability_Rogue_Disguise:32:32|t|cff3F636C改变容貌",		Stone.ResetFace,	GOSSIP_ICON_CHAT,		false,"是否重置容貌？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/achievement_worldevent_brewmaster:32:32|t|cff3F636C变更种族",		Stone.ResetRace,	GOSSIP_ICON_CHAT,		false,"是否变更种族？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		{FUNC, "|TInterface/ICONS/spell_nature_mirrorimage:32:32|t|cff3F636C叛变阵营",		Stone.ResetFaction,	GOSSIP_ICON_CHAT,		false,"是否改变阵营？\n|cFFFFFF00需要返回角色选择或者重新登录才能修改。|r"},
		--AZ原端用该项目worldserver.exe会报错跳出--{FUNC, "|TInterface/ICONS/Ability_Ambush:32:32|t返回选择角色", 	Stone.Logout,			GOSSIP_ICON_INTERACT_1,	false,"返回选择角色界面 ？"},
		--AZ原端用该项目worldserver.exe会报错跳出--{FUNC, "|TInterface/ICONS/Ability_Ambush:32:32|t|cFF800000不保存角色|r",Stone.LogoutNosave,GOSSIP_ICON_INTERACT_1,false,"|cFFe60000不保存角色，并返回选择角色界面 ？|r"},
	},

	[TPMENU]={--传送主菜单
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:32:32|t|cff9932CC城市传送",							TPMENU+0x10,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Northrend_01:32:32|t|ce600008B诺森德地图",							TPMENU+0x60,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Outland_01:32:32|t|cFF32CD32外域地图",								TPMENU+0x50,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Kalimdor_01:32:32|t|cffe60000卡利姆多",							    TPMENU+0x40,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_EasternKingdoms_01:32:32|t|cff00ccff东部王国",						TPMENU+0x30,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/INV_Misc_Map04:32:32|t|cFFFF6600初始之地",						                    TPMENU+0x20,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/Achievement_Zone_Mulgore_01:32:32|t|cFFcc6633风景传送",							    TPMENU+0x70,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/inv_valentinescandy:32:32|t|cFFFF70B8“女士们”",							        TPMENU+0x80,	GOSSIP_ICON_BATTLE},

		--需要添加地图补丁，外发时注释掉
		--{MENU,  "|TInterface/ICONS/expansionicon_mistsofpandaria:32:32|t|cff00FF96自制地图",							TPMENU+0x90,	GOSSIP_ICON_BATTLE}, 
	},

	[TPMENU+0x10]={--主要城市
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/Spell_Arcane_TeleportDalaran:32:32|t |cff9932CC达拉然|r",	571,5832.168457,502.379883,657.36,1.601425,	TEAM_NONE,	70,	100000},
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/Spell_Arcane_TeleportShattrath:32:32|t |cff32CD32沙塔斯城",	530,-1990.516,5366.223,-10.701,3.535,	TEAM_NONE,	60,	50000},--增加显示此菜单等级，传送使用金币
		{TP, " |TInterface/ICONS/Spell_Arcane_teleportstormwind:32:32|t |cff0070d0暴风城",			0,		-8832.833,	633.1505,	94.2408,	1.70201,	TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/spell_arcane_teleportironforge:32:32|t |cff0070d0铁炉堡",			0,		-4926.76,	-949.64,	501.559,	2.24414,	TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/spell_arcane_teleportDarnassus:32:32|t |cff0070d0达纳苏斯",		1,		9869.91,	2493.58,	1315.88,	2.78897,	TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/Spell_Arcane_TeleportExodar:32:32|t |cff0070d0埃索达",			530,	-3864.92,	-11643.7,	-137.644,	5.50862,	TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/spell_arcane_teleportorgrimmar:32:32|t |cffe60000奥格瑞玛",		1,		1601.08,	-4378.69,	9.9846,		2.14362,	TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Spell_Arcane_teleportUndercity:32:32|t |cffe60000幽暗城",			0,		1633.75,	240.167,	-43.1034,	3.16,	TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Spell_Arcane_teleportThunderBluff:32:32|t |cffe60000雷霆崖",			1,-1267.968628,63.332981,127.053596,1.180459,	TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:32:32|t |cffe60000银月城",			530,9591.267578,-7137.720215,14.274673,3.044123,	TEAM_HORDE},
	    {TP, " |TInterface/ICONS/spell_arcane_teleporttheramore:32:32|t |cff0070d0塞拉摩",	1,-3678.406250, -4386.532227, 10.457949, 0.412340,	TEAM_ALLIANCE,	60,	50000},
		{TP, " |TInterface/ICONS/spell_arcane_teleportstonard:32:32|t |cffe60000斯通纳德",		0,	-10457.980469, -3315.739746, 20.96423,3.984616,	TEAM_HORDE,	60,	50000},
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Stranglethorn_01:32:32|t |cff8B4513藏宝海湾",	0,		-14420.7, 525.9, 5,	1.23,	TEAM_NONE,	35,	20000},
	    {TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Barrens_01:32:32|t |cff8B4513棘齿城",	1,		-955.219,	-3678.92,	8.29946,	4.35,			TEAM_NONE,	10,	20000},
	    {TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Tanaris_01:32:32|t |cff8B4513加基森",	1,	-7190.655762,-3789.037109,8.728640,5.434953,			TEAM_NONE,	30,	20000},
	    {TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Winterspring:32:32|t |cff8B4513永望镇",	1,		6724.58,	-4609.16,	720.597,	4.87852,	TEAM_NONE,	55,	20000},--永望镇这么重要也不加一个？
	},
	
	[TPMENU+0x20]={--各种族出生地
	    {TP, " |TInterface/ICONS/Achievement_Zone_ElwynnForest:32:32|t |cff3F636C人类出生地(北郡山谷)",		0,		-8949.95,	-132.493,	83.5312,	0,			TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_DunMorogh:32:32|t |cff3F636C矮人出生地(寒脊山谷)",		0,		-6240.32,	331.033,	382.758,	6.1,		TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_DunMorogh:32:32|t |cff3F636C侏儒出生地(寒脊山谷)",		0,		-6240,		331,		383,		0,			TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:32:32|t |cff3F636C暗夜精灵出生地(幽影谷)",1,		10311.3,	832.463,	1326.41,	5.6,		TEAM_ALLIANCE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:32:32|t |cff3F636C德莱尼出生地(埃门谷)",	530,	-3961.64,	-13931.2,	100.615,	2,			TEAM_ALLIANCE},

		{TP, " |TInterface/ICONS/Achievement_Zone_Durotar:32:32|t |cff3F636C兽人出生地(试炼谷)",		1,		-618.518,	-4251.67,	38.718,		0,			TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_Barrens_01:32:32|t |cff3F636C巨魔出生地(试炼谷)",		1,		-618.518,	-4251.67,	38.7,		4.747,		TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_Mulgore_01:32:32|t |cff3F636C牛头人出生地(纳拉其营地)",	1,		-2917.58,	-257.98,	52.9968,	0,			TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:32:32|t |cff3F636C亡灵出生地(灰影墓穴)",		0,		1676.71,	1678.31,	121.67,		2.70526,	TEAM_HORDE},
	    {TP, " |TInterface/ICONS/Achievement_Zone_Ghostlands:32:32|t |cff3F636C血精灵出生地(逐日岛)",	530,	10349.6,	-6357.29,	33.4026,	5.31605,	TEAM_HORDE},

		{TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_EasternPlaguelands:32:32|t |cff3F636C死亡骑士出生地(黑锋要塞)",	609,	2355.84,	-5664.77,	426.028,	3.65997,	TEAM_NONE,	55,	0},
	},

	[TPMENU+0x30]={--东部王国
	    {TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:32:32|t艾尔文森林",		0,		-9449.06,	64.8392,	56.3581,	3.0704,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:32:32|t永歌森林",		530,	9024.37,	-6682.55,	16.8973,	3.1413,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:32:32|t丹莫罗",			0,		-5603.76,	-482.704,	396.98,		5.2349,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:32:32|t提瑞斯法林地",	0,		2274.95,	323.918,	34.1137,	4.2436,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:32:32|t洛克莫丹",		0,		-5405.85,	-2894.15,	341.972,	5.4823,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:32:32|t幽魂之地",		530,	7595.73,	-6819.6,	84.3718,	2.5656,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:32:32|t西部荒野",		0,		-10684.9,	1033.63,	32.5389,	6.0738,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:32:32|t银松森林",		0,		505.126,	1504.63,	124.808,	1.7798,		TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:32:32|t赤脊山",			0,		-9447.8,	-2270.85,	71.8224,	0.28385,	TEAM_NONE,	15,	20000},--官服坐飞机都是2G起，所以并不贵 --前面这条谁备注的，笑死……
	    {TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:32:32|t暮色森林",		0,		-10531.7,	-1281.91,	38.8647,	1.5695,		TEAM_NONE,	18,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:32:32|t湿地",			0,		-3517.75,	-913.401,	8.86625,	2.607,		TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:32:32|t希尔斯布莱德丘陵",	0,		-385.805,	-787.954,	54.6655,	1.0392,		TEAM_NONE,	20,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:32:32|t奥特兰克山脉",	0,		275.049,	-652.044,	130.296,	0.50203,	TEAM_NONE,	25,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:32:32|t阿拉希高地",		0,		-1581.45,	-2704.06,	35.4168,	0.490373,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:32:32|t荆棘谷",			0,		-11921.7,	-59.544,	39.7262,	3.7357,		TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:32:32|t荒芜之地",		0,		-6782.56,	-3128.14,	240.48,		5.6591,		TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:32:32|t辛特兰",			0,		112.406,	-3929.74,	136.358,	0.981903,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:32:32|t悲伤沼泽",		0,		-10368.6,	-2731.3,	21.6537,	5.2923,		TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:32:32|t诅咒之地",		0,		-11184.7,	-3019.31,	7.29238,	3.20542,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:32:32|t灼热峡谷",		0,		-6686.33,	-1198.55,	240.027,	0.91688,	TEAM_NONE,	43,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:32:32|t燃烧平原",		0,		-7979.78,	-2105.72,	127.919,	5.10148,	TEAM_NONE,	50,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:32:32|t西瘟疫之地",		0,		1743.69,	-1723.86,	59.6648,	5.23722,	TEAM_NONE,	51,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:32:32|t东瘟疫之地",		0,		2280.64,	-5275.05,	82.0166,	4.747,		TEAM_NONE,	53,	20000},
	    {TP, "|TInterface/ICONS/achievement_zone_deadwindpass:32:32|t逆风小径",	0,-10910.5, -1999.72, 113.15, 3.18,		TEAM_NONE,	50,	50000},
		{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:32:32|t奎尔丹纳斯岛",	530,	12929.56, -6969.06, 18.93,	4.26,		TEAM_NONE,	1,	50000},
	},

	[TPMENU+0x40]={--卡利姆多
	    {TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:32:32|t秘蓝岛",			530,	-4192.62,	-12576.7,	36.7598,	1.62813,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:32:32|t秘血岛",			530,	-2095.7,	-11841.1,	51.1557,	6.19288,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:32:32|t泰达希尔",		1,		9889.03,	915.869,	1307.43,	1.9336,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Durotar:32:32|t杜隆塔尔",		1,		228.978,	-4741.87,	10.1027,	0.416883,	TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:32:32|t莫高雷",			1,		-2473.87,	-501.225,	-9.42465,	0.6525,		TEAM_NONE,	1,	1000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:32:32|t黑海岸",			1,		6463.25,	683.986,	8.92792,	4.33534,	TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:32:32|t贫瘠之地",		1,		-1028.95,	-2462.17,	91.6679,	5.83412,	TEAM_NONE,	10,	2000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:32:32|t石爪山脉",		1,		1574.89,	1031.57,	137.442,	3.8013,		TEAM_NONE,	15,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:32:32|t灰谷",		1,		1919.77,	-2169.68,	94.6729,	6.14177,	TEAM_NONE,	18,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:32:32|t千针石林",		1,		-5375.53,	-2509.2,	-40.432,	2.41885,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Desolace:32:32|t凄凉之地",		1,		-656.056,	1510.12,	88.3746,	3.29553,	TEAM_NONE,	30,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:32:32|t尘泥沼泽",		1,		-3350.12,	-3064.85,	33.0364,	5.12666,	TEAM_NONE,	35,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Feralas:32:32|t菲拉斯",			1,		-4808.31,	1040.51,	103.769,	2.90655,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:32:32|t塔纳利斯",	1,		-6940.91,	-3725.7,	48.9381,	3.11174,	TEAM_NONE,	40,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:32:32|t艾萨拉",			1,		3117.12,	-4387.97,	91.9059,	5.49897,	TEAM_NONE,	45,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Felwood:32:32|t费伍德森林",		1,		3898.8,		-1283.33,	220.519,	6.24307,	TEAM_NONE,	48,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:32:32|t安戈洛环形山",	1,		-6291.55,	-1158.62,	-258.138,	0.457099,	TEAM_NONE,	48,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:32:32|t希利苏斯",		1,		-6815.25,	730.015,	40.9483,	2.39066,	TEAM_NONE,	50,	20000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:32:32|t冬泉谷",			1,		6658.57,	-4553.48,	718.019,	5.18088,	TEAM_NONE,	55,	20000},
	    {TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:32:32|t月光林地",			1,		7926.85, -2633.90, 492.54,	3.6,	TEAM_NONE,	10,	20000},
	},

	[TPMENU+0x50]={--外域
	    {TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:32:32|t地狱火半岛",		530,	-207.335,	2035.92,	96.464,		1.59676,	TEAM_NONE,	60,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:32:32|t赞加沼泽",		530,	-220.297,	5378.58,	23.3223,	1.61718,	TEAM_NONE,	62,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:32:32|t泰罗卡森林",		530,	-2266.23,	4244.73,	1.47728,	3.68426,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:32:32|t纳格兰",			530,	-1610.85,	7733.62,	-17.2773,	1.33522,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:32:32|t刀锋山",			530,	2029.75,	6232.07,	133.495,	1.30395,	TEAM_NONE,	66,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:32:32|t虚空风暴",		530,	3271.2,		3811.61,	143.153,	3.44101,	TEAM_NONE,	68,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:32:32|t影月谷",			530,	-3681.01,	2350.76,	76.587,		4.25995,	TEAM_NONE,	68,	50000},
	},

	[TPMENU+0x60]={--诺森德
	    {TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:32:32|t北风苔原",		571,	3266.50, 5286.52,39.182, 5.32,	TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:32:32|t嚎风峡湾",		571,	682.848,	-3978.3,	230.161,	1.54207,	TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:32:32|t龙骨荒野",		571,	2678.17,	891.826,	4.37494,	0.101121,	TEAM_NONE,	71,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:32:32|t灰熊丘陵",		571,3577.669678,-2761.529053,159.252731,2.012440,	TEAM_NONE,	73,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:32:32|t祖达克",			571,	5560.23,	-3211.66,	371.709,	5.55055,	TEAM_NONE,	74,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:32:32|t索拉查盆地",		571,5509.554688,4918.125977,-195.934525,4.487655,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:32:32|t晶歌森林",	571,5528.989258,-112.712402,148.346039,4.018178,	TEAM_NONE,	74,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:32:32|t风暴峭壁",		571,8082.27, -848.27, 971.7175, 6.0422,	TEAM_NONE,	76,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:32:32|t冰冠冰川",		571,	7742.655273,1257.571533,446.897003,1.823712,	TEAM_NONE,	77,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:32:32|t冬拥湖",			571,	5027.98, 2848.29, 391.812,6.21543,	TEAM_NONE,	77,	100000},
	},
	
	[TPMENU+0x70]={--风景传送
		{TP, "|TInterface/ICONS/Mail_GMIcon:32:32|t|cff3F636CGM之岛",		                        	1, 16222.1,		16252.1,	12.5872,	1.42},
		{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:32:32|t|cff3F636C时光之穴",		          1,-8173.93018,	-4737.46387,33.77735,4.904815},
		{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:32:32|t|cff3F636C世界之树",			      1,5377.86, -3374.48, 1655.67,	4.96},
		{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:32:32|t|cff3F636C梦境之树",		           1,-2914.7561,	1902.19934,	34.74103,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:32:32|t|cff3F636C恐怖之岛",		  1, -5975.3,	3260.3,	41.7,	4.65},
		{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_09:32:32|t|cff3F636C天涯海滩",		      1,-9851.61719,	-3608.47412,8.93973,	2.25},
		{TP, "|TInterface/ICONS/achievement_zone_darkshore_01:32:32|t|cff3F636C南海岛礁",		      1,-11839, -4759, 6.2,	4.4},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:32:32|t|cff3F636C安戈洛环形山",	  1,-8562.09668,	-2106.05664,8.85254,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:32:32|t|cff3F636C石堡瀑布",		0,-9481.49316,	-3326.91528,8.86435,	0.95},
		{TP, "|TInterface/ICONS/achievement_zone_wetlands_01:32:32|t|cff3F636C格瑞姆巴托",		0,-4053.99, -3450.62, 283.383,	0},
		{TP, "|TInterface/ICONS/INV_Misc_Toy_10:32:32|t|cff3F636C暴雪建设公司路障",          1, 5478.06006,	-3730.8501,	1593.44,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:32:32|t|cff3F636C达拉然楼顶露台",  		571,5854.834961,829.670593,846.338196,3.768488},
		{TP, "|TInterface/ICONS/inv_helmet_52:32:32|t|cff3F636C血色图书馆",         189, 162.5, -429, 18.5, 3.12},
		{TP, "|TInterface/ICONS/ability_mage_brainfreeze:32:32|t|cff3F636C埃雷萨拉斯图书馆",       429, 125.31, 459.14, -48.46, 3.16},
		{TP, "|TInterface/ICONS/Trade_alchemy:32:32|t|cff3F636C通灵学院炼金台",          289,  38.85, 159.04, 83.55, 1.4},
		{TP, "|TInterface/ICONS/trade_blacksmithing:32:32|t|cff3F636C暗炉城黑铁砧",           230,891.8, -270.1, -71.9, 5.46},
		{TP, "|TInterface/ICONS/spell_fire_flameblades:32:32|t|cff3F636C熔火之心门外黑熔炉",           230,1206.083130,-432.294861,-100.043015,5.092973},
		{TP, "|TInterface/ICONS/inv_drink_03:32:32|t|cff3F636C黑铁酒吧",          230, 884.9, -179.6, -44, 1.51},
		{TP, "|TInterface/ICONS/inv_drink_05:32:32|t|cff3F636C旧南海镇酒馆",           560,1815.23, 1034.54, 11.07, 5.32},
		{TP, "|TInterface/ICONS/achievement_boss_bazil_akumai:32:32|t|cff3F636C地铁水怪",   369,-74.528526,1245.836914,-123.909348,3.161240},
		{TP, "|TInterface/ICONS/achievement_zone_duskwood:32:32|t|cff3F636C翡翠梦境",  169,2737.508057,-3318.57959,101.88282,3.07},
		{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:32:32|t|cff3F636C积雪平原",  37,323,173,235,1.03},
		{TP, "|TInterface/ICONS/achievement_zone_hellfirepeninsula_01:32:32|t|cff3F636C旧外域",   0,-14903, 12898, 10,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:32:32|t|cff3F636C纳格兰雏形",   36,-1594, 480, 1,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:32:32|t|cff3F636C吉尔尼斯",   0,-987.449,1585.69,53.4298,0},
		{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:32:32|t|cff3F636C卡拉赞墓穴",   0,-11087.746094,-1780.355103,52.609112,1.794595},
		{TP, "|TInterface/ICONS/achievement_leader_king_magni_bronzebeard:32:32|t|cff3F636C旧铁炉堡",0,-4823.773438,-978.103943,464.708923,3.864171   },
	},
	
	[TPMENU+0x80]={--女士们
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/inv_jewelry_talisman_03:32:32|t |cFFFF70B8莉尼亚·阿比迪斯",	0,1571.3,-5603.5,113.3,4.2,	TEAM_NONE},
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/inv_misc_cape_18:32:32|t |cFFFF70B8布里姬特·阿比迪斯",	 571,2676.934570,-358.560913,141.216827,3.212797,	TEAM_NONE},
		{TP, "[|cFF006400中立|r] |TInterface/ICONS/inv_helmet_52:32:32|t |cFFFF70B8丽莎·怀特迈恩", 189, 1193.011475,1398.452881,29.000000,0.121748,	TEAM_NONE},
		
		{TP, " |TInterface/ICONS/achievement_character_human_female:32:32|t |cFFFF70B8吉安娜·普罗德摩尔",1,-3748.13, -4450.86, 64.95,1.16,TEAM_ALLIANCE},
		{TP, " |TInterface/ICONS/achievement_leader_tyrande_whisperwind:32:32|t |cFFFF70B8泰兰德·语风",1,9666.19, 2524.1, 1360,3.11,TEAM_ALLIANCE},

		{TP, " |TInterface/ICONS/achievement_leader_sylvanas:32:32|t |cFFFF70B8希尔瓦娜斯·风行者",0,1290.9, 318.7, -57.3,4.54,TEAM_HORDE},
	},
	--[[
	[TPMENU+0x90]={--自制地图传送 外发时注释掉
		{TP, "|TInterface/ICONS/achievement_zone_valleyoffourwinds:32:32|t|cff00FF96深风峡谷",1105,-717.290222,1276.799438,138.108231,0,	TEAM_NONE}, --自制地图坐标
		{TP, "|TInterface/ICONS/achievement_zone_valeofeternalblossoms:32:32|t|cff00FF96永春台",1000,-1050.044,-3081.2029,13.02,0,	TEAM_NONE}, --自制地图坐标
	},
	]]
	[TPDRMENU]={--副本传送主菜单
		{MENU,	"|TInterface/ICONS/achievement_boss_generaldrakkisath:32:32|t|cFFCC0033经典旧世地下城和团队副本",	TPDRMENU+0x10,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_Illidan:32:32|t|cFF32CD32燃烧的远征地下城和团队副本",	TPDRMENU+0x20,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Boss_LichKing:32:32|t|ce600008B巫妖王之怒地下城和团队副本",	TPDRMENU+0x30,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/achievement_boss_shadeoferanikus:32:32|t|cFFFF6600野外BOSS传送",						TPDRMENU+0x40,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/Achievement_Arena_2v2_7:32:32|t|cFF9932CC战场传送",						TPDRMENU+0x50,	GOSSIP_ICON_BATTLE},
	},

	[TPDRMENU+0x10]={--经典旧世界副本
        {TP, "|TInterface/ICONS/achievement_boss_hakkar:32:32|t[|cFFFF6600团队|r]|cFFCC0033祖尔格拉布",		0,		-11916.7,	-1215.72,	92.289,		4.72454,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_ragnaros:32:32|t[|cFFFF6600团队|r]|cFFCC0033熔火之心",		230,	1126.64,	-459.94,	-102.535,	3.46095,	TEAM_NONE,	50,	100000},--倒数第2个参数,为进入等级
		{TP, "|TInterface/ICONS/achievement_boss_nefarion:32:32|t[|cFFFF6600团队|r]|cFFCC0033黑翼之巢",		229,	152.451,	-474.881,	116.84,		0.001073,	TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_ossiriantheunscarred:32:32|t[|cFFFF6600团队|r]|cFFCC0033安其拉废墟",		1,		-8409.82,	1499.06,	27.7179,	2.51868,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_cthun:32:32|t[|cFFFF6600团队|r]|cFFCC0033安其拉神殿",		1,		-8240.09,	1991.32,	129.072,	0.941603,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_emperordagranthaurissan:32:32|t黑石深渊",		0,		-7179.34,	-921.212,	165.821,	5.09599,	TEAM_NONE,	40,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_generaldrakkisath:32:32|t黑石塔(上下层)",			0,		-7527.05,	-1226.77,	285.732,	5.29626,	TEAM_NONE,	45,	20000},
		{TP, "|TInterface/ICONS/spell_holy_senseundead:32:32|t通灵学院",		0,		1269.64,	-2556.21,	93.6088,	0.620623,	TEAM_NONE,	45,	20000},
		{TP, "|TInterface/ICONS/spell_deathknight_armyofthedead:32:32|t斯坦索姆：十字军广场(正门)",0,3352.92,-3379.03,	144.782,6.25978,TEAM_NONE,45,20000},
		{TP, "|TInterface/ICONS/INV_Misc_Key_13:32:32|t斯坦索姆：街巷(后门)",0,3228.249023,-4038.350342,108.422821,5.167325,TEAM_NONE,45,20000},
		{TP, "|TInterface/ICONS/inv_misc_herb_06:32:32|t厄运之槌：扭木广场(东区)",		1,-3784.76, 938.231, 161.026, 6.2292,	TEAM_NONE,	45,	20000},
		{TP, "|TInterface/ICONS/achievement_leader_tyrande_whisperwind:32:32|t厄运之槌：中心花园(西区)",		1,-3756.799805,1249.621460,160.267349,6.150632,	TEAM_NONE,	45,	20000},
		{TP, "|TInterface/ICONS/achievement_reputation_ogre:32:32|t厄运之槌：戈多克议会(北区)",		1,-3520.181152,1087.36621,161.082703,4.626010,	TEAM_NONE,	45,	20000},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", TPDRMENU+0x110,GOSSIP_ICON_BATTLE},
	},
	[TPDRMENU+0x110]={--经典旧世界副本第二页
		{TP, "|TInterface/ICONS/spell_shadow_summonfelguard:32:32|t怒焰裂谷",		1,		1811.78,	-4410.5,	-18.4704,	5.20165,	TEAM_NONE,	8,	1000},
		{TP, "|TInterface/ICONS/Achievement_Boss_EdwinVancleef:32:32|t死亡矿井",		0,		-11209.6,	1666.54,	24.6974,	1.42053,	TEAM_NONE,	10,	1000},
		{TP, "|TInterface/ICONS/achievement_boss_mutanus_the_devourer:32:32|t哀嚎洞穴",		1,		-731.607,	-2218.39,	17.0281,	2.78486,	TEAM_NONE,	10,	20000},
		{TP, "|TInterface/ICONS/INV_Misc_Head_Gnoll_01:32:32|t影牙城堡",		0,		-234.675,	1561.63,	76.8921,	1.24031,	TEAM_NONE,	10,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_bazil_akumai:32:32|t黑暗深渊",		1,		4249.99,	740.102,	-25.671,	1.34062,	TEAM_NONE,	19,	20000},
		{TP, "|TInterface/ICONS/Achievement_Boss_Bazil_Thredd:32:32|t暴风城监狱",		0,		-8799.15,	832.718,	97.6348,	6.04085,	TEAM_NONE,	15,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_charlgarazorflank:32:32|t剃刀沼泽",		1,		-4470.28,	-1677.77,	81.3925,	1.16302,	TEAM_NONE,	17,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_amnennar_the_coldbringer:32:32|t剃刀高地",		1,		-4657.3,	-2519.35,	81.0529,	4.54808,	TEAM_NONE,	25,	20000},
		{TP, "|TInterface/ICONS/Achievement_Character_Gnome_Male:32:32|t诺莫瑞根(正门)",		0,		-5163.54,	925.423,	257.181,	1.57423,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/INV_Misc_Key_06:32:32|t诺莫瑞根(后门)",		0,-4859.007812,760.886719,244.730545,1.456430,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/spell_shadow_deadofnight:32:32|t血色修道院：墓园",		0,2910.20, -803.78, 160.333, 0.29059,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/inv_misc_book_10:32:32|t血色修道院：图书馆",		0,2874.82, -818.57, 160.333, 3.51068,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/inv_weapon_halberd_05:32:32|t血色修道院：军械库",		0,2889.985596,-834.621277,160.326828,3.384961,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/inv_helmet_52:32:32|t血色修道院：大教堂",		0, 2913.767578,-824.216858,160.326904,0.427634,	TEAM_NONE,	20,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_archaedas:32:32|t奥达曼(正门)",			0,		-6071.37,	-2955.16,	209.782,	0.015708,	TEAM_NONE,	30,	20000},
		{TP, "|TInterface/ICONS/inv_misc_platnumdisks:32:32|t奥达曼(后门)",			0,-6623.926758,-3765.689453,266.304230,0.111818,	TEAM_NONE,	30,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_chiefukorzsandscalp:32:32|t祖尔法拉克",		1,		-6801.19,	-2893.02,	9.00388,	0.158639,	TEAM_NONE,	35,	20000},
		{TP, "|TInterface/ICONS/inv_jewelcrafting_nightseye_02:32:32|t玛拉顿(紫门)",			1,	-1189.31, 2884.44, 85.894,  4.99691,	TEAM_NONE,	30,	20000},
		{TP, "|TInterface/ICONS/inv_jewelcrafting_nobletopaz_02:32:32|t玛拉顿(橙门)",			1,-1457.13, 2616.56, 76.426, 3.14898,	TEAM_NONE,	30,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_princesstheradras:32:32|t玛拉顿(瀑布)",			1,-1370.99, 2908.43, 73.604,  2.38576,	TEAM_NONE,	30,	20000},
		{TP, "|TInterface/ICONS/achievement_boss_shadeoferanikus:32:32|t沉没的神庙",		0,		-10177.9,	-3994.9,	-111.239,	6.01885,	TEAM_NONE,	35,	20000},
	},
	[TPDRMENU+0x20]={--燃烧的远征地下城★
		{TP, "|TInterface/ICONS/inv_misc_key_07:32:32|t[|cFFFF6600团队|r]|cFF32CD32卡拉赞(后门)",			0,-11035.567383,-2002.803467,92.971786,2.166898,	TEAM_NONE,	68,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_gruulthedragonkiller:32:32|t[|cFFFF6600团队|r]|cFF32CD32戈鲁尔的巢穴",	530,	3530.06,	5104.08,	3.50861,	5.51117,	TEAM_NONE,	65,	100000},
		{TP, "|TInterface/ICONS/Achievement_Boss_Magtheridon:32:32|t[|cFFFF6600团队|r]|cFF32CD32玛瑟里顿的巢穴",	530,	-336.411,	3130.46,	-102.928,	5.20322,	TEAM_NONE,	65,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_zuljin:32:32|t[|cFFFF6600团队|r]|cFF32CD32祖阿曼",			530,	6851.78,	-7972.57,	179.242,	4.64691,	TEAM_NONE,	68,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_ladyvashj:32:32|t[|cFFFF6600团队|r]|cFF32CD32毒蛇神殿",		530,	797.855,	6865.77,	-65.4165,	0.005938,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/achievement_character_bloodelf_male:32:32|t[|cFFFF6600团队|r]|cFF32CD32风暴要塞",		530,	3088.49,	1381.57,	184.863,	4.61973,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_archimonde :32:32|t[|cFFFF6600团队|r]|cFF32CD32海加尔山",	1,		-8177.89,	-4181.23,	-167.552,	0.913338,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_illidan:32:32|t[|cFFFF6600团队|r]|cFF32CD32黑暗神殿",		530,	-3649.92,	317.469,	35.2827,	2.94285,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/ACHIEVEMENT_BOSS_KILJAEDAN:32:32|t[|cFFFF6600团队|r]|cFF32CD32太阳之井高地",	530,	12574.1,	-6774.81,	15.0904,	3.13788,	TEAM_NONE,	70,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:32:32|t地狱火堡垒：地狱火城墙",	530,	-360.671,	3071.90,	-15.1,		1.883,		TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_kelidanthebreaker:32:32|t地狱火堡垒：鲜血熔炉",	530,	-296.487,	3154.6098,	31.617,		2.24,		TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_kargathbladefist_01:32:32|t地狱火堡垒：破碎大厅",	530,	-308.05,	3066.98,	-3.018,		1.76,		TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_talonkingikiss:32:32|t奥金顿：塞泰克大厅",		530,	-3362.165,	4826.771,	-101.396,	4.73,		TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_nexus_prince_shaffar:32:32|t奥金顿：法力陵墓",		530,	-3243.83,	4942.69,	-101.364,	0,			TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_exarch_maladaar:32:32|t奥金顿：奥金尼地穴",		530,	-3362.06,	5059.393,	-101.396,	1.573,		TEAM_NONE,	61,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_murmur:32:32|t奥金顿：暗影迷宫",		530,	-3494.912,	4943.865,	-101.393,	3.125,		TEAM_NONE,	65,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_theblackstalker:32:32|t时光之穴：黑色沼泽",		1,		-8742.04,	-4217.996,	-209.5,		2.1,		TEAM_NONE,	66,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_epochhunter:32:32|t时光之穴：逃离郭霍尔德",	1,		-8391.215,	-4064.293,	-208.585,	0.199,		TEAM_NONE,	66,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_quagmirran:32:32|t盘牙水库：奴隶围栏",		530,	727.828,	7011.997,	-71.861,	0.245473,	TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_theblackstalker:32:32|t盘牙水库：幽暗沼泽",		530,	777.089,	6763.45,	-72.066,	5.03985,	TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_warlord_kalithresh:32:32|t盘牙水库：蒸汽地窟",		530,	817.459,	6934.923,	-80.624,	1.51974,	TEAM_NONE,	60,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_harbinger_skyriss:32:32|t风暴要塞：禁魔监狱",		530,	3281.65,	1408.55,	502.413,	5.22,		TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_warpsplinter:32:32|t风暴要塞：生态船",		530,	3351.35,	1530.116,	179.69,		5.63,		TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_pathaleonthecalculator:32:32|t风暴要塞：能源舰",		530,	2926.8,		1603.597,	249,		3.91,		TEAM_NONE,	68,	100000},
	    {TP, "|TInterface/ICONS/achievement_boss_kael'thassunstrider_01:32:32|t魔导师平台",				530,	12884.6,	-7317.69,	65.5023,	4.799,		TEAM_NONE,	68,	100000},
	},

	[TPDRMENU+0x30]={--巫妖王之怒地下城★
		{TP, "|TInterface/ICONS/Achievement_Reputation_WyrmrestTemple:32:32|t[|cFFFF6600团队|r]|ce600008B黑曜石圣殿",	571,	3472.43,	264.923,	-120.146,	3.27923,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/achievement_dungeon_nexusraid_heroic:32:32|t[|cFFFF6600团队|r]|ce600008B永恒之眼",	                        571,	3784.17,	7028.84,	161.258,	5.79993,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/achievement_boss_amnennar_the_coldbringer:32:32|t[|cFFFF6600团队|r]|ce600008B纳克萨玛斯",	571,	3668.72,	-1262.46,	243.622,	4.785,		TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/INV_EssenceOfWintergrasp:32:32|t[|cFFFF6600团队|r]|ce600008B阿尔卡冯的宝库",            571,	5453.72,	2840.79,	421.28,		0.01,		TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/Achievement_Dungeon_UlduarRaid_Misc_03:32:32|t[|cFFFF6600团队|r]|ce600008B奥杜尔",		571,	9222.88,	-1113.59,	1216.12,	6.27549,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/Achievement_Boss_Onyxia:32:32|t[|cFFFF6600团队|r]|ce600008B奥妮克希亚的巢穴",              1,	-4708.27,	-3727.64,	54.5589,	3.72786,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/INV_Shield_72:32:32|t[|cFFFF6600团队|r]|ce600008B十字军的试炼",                           571,	8515.61,	714.153,	558.248,	1.57753,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/Achievement_Dungeon_Icecrown_IcecrownEntrance:32:32|t[|cFFFF6600团队|r]|ce600008B冰冠堡垒",	571,	5855.22,	2102.03,	635.991,	3.57899,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/spell_shadow_twilight:32:32|t[|cFFFF6600团队|r]|ce600008B红玉圣殿",	571,	3590.09,	210.77,		-120.05,	5.38,	TEAM_NONE,	80,	100000},
		{TP, "|TInterface/ICONS/achievement_dungeon_utgardekeep_heroic:32:32|t乌特加德城堡",	571,	1203.41,	-4868.59,	41.2486,	0.283237,	TEAM_NONE,	65,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_utgardepinnacle_heroic:32:32|t乌特加德之巅",	571,	1267.24,	-4857.3,	215.764,	3.22768,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_nexus80_heroic:32:32|t魔环",			571,	3782.89,	6965.23,	105.088,	6.14194,	TEAM_NONE,	66,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_nexus70_heroic:32:32|t魔枢",			571,	3892.97,	6985.27,	69.49,	0,	TEAM_NONE,	66,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_azjoluppercity_heroic:32:32|t艾卓-尼鲁布",		571,	3707.86,	2150.23,	36.76,		3.22,		TEAM_NONE,	67,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_azjollowercity_heroic:32:32|t安卡赫特：古代王国",		571,	3649.38,	2050.54,	1.79,		4.27,		TEAM_NONE,	67,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_TheVioletHold_Heroic:32:32|t紫罗兰监狱",		571,	5693.08,	502.588,	652.672,	4.0229,		TEAM_NONE,	70,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_Gundrak_Heroic:32:32|t古达克",			571,	6722.44,	-4640.67,	450.632,	3.91123,	TEAM_NONE,	71,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_drak'tharon_heroic:32:32|t达克萨隆要塞",	571,	4765.59,	-2038.24,	229.363,	0.887627,	TEAM_NONE,	69,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_11:32:32|t岩石大厅",		571,	8922.12,	-1009.16,	1039.56,	1.57044,	TEAM_NONE,	72,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_12:32:32|t闪电大厅",		571,	9136.52,	-1311.81,	1066.29,	5.19113,	TEAM_NONE,	75,	100000},
	    {TP, "|TInterface/ICONS/Achievement_Dungeon_CoTStratholme_Heroic:32:32|t时光之穴：净化斯坦索姆",	1,		-8756.39,	-4440.68,	-199.489,	4.66289,	TEAM_NONE,	75,	100000},
		{TP, "|TInterface/ICONS/Achievement_Reputation_ArgentChampion:32:32|t冠军的试炼",		571,	8590.95,	791.792,	558.235,	3.13127,	TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_icecrown_forgeofsouls:32:32|t冰封大殿：灵魂洪炉",        571,5664.647949,2011.475830,798.041565,5.360321,  TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_icecrown_pitofsaron:32:32|t冰封大殿：萨隆矿坑",        571,5601.859863,2018.421387,798.041382,3.777744,  TEAM_NONE,	80,	100000},
	    {TP, "|TInterface/ICONS/achievement_dungeon_icecrown_hallsofreflection:32:32|t冰封大殿：映像大厅",        571,5630.525391,1989.808960,799.252686,4.629903,  TEAM_NONE,	80,	100000},
	},
	
	[TPDRMENU+0x40]={--野外BOSS传送
		{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:32:32|t暮色森林：四绿龙",                 	0,-10526.16895,-434.996796,50.8948,	0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:32:32|t辛特兰：四绿龙",	                 0,759.605713,-3893.341309,116.4753,	0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:32:32|t灰谷：四绿龙",		                1,3120.289307,-3439.444336,139.5663,0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:32:32|t菲拉斯：四绿龙",	                 1,-2741.290039,2009.481323,31.8773,	0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:32:32|t艾萨拉：蓝龙艾索雷葛斯",	                    1,2622.219971,-5977.930176,100.5629,0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:32:32|t诅咒之地：卡扎克",          	               0,-12234,-2474,-3,   0,	TEAM_NONE,	50,	100000},
		{TP, "|TInterface/ICONS/achievement_zone_hellfirepeninsula_01:32:32|t地狱火半岛：卡扎克",          	               530,899,2269,307,   0,	TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:32:32|t影月谷：末日机甲",          	               530,-3577, 289, 41.5,  5.4,	TEAM_NONE,	60,	100000},
		{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:32:32|t水晶谷：逐风者桑德兰",	              1,-6292.463379,1578.029053,0.1553,	0,	TEAM_NONE,	50,	100000},
	},

	[TPDRMENU+0x50]={--战场地图传送
	    {TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Stranglethorn_01:32:32|t|cFF9932CC古拉巴什竞技场",	      0,		-13181.8, 		339.356, 		42.9805, 	1.18013,	TEAM_NONE,	10,	10000},
	    {TP, "[|cFF006400中立|r] |TInterface/ICONS/Achievement_Zone_Winterspring:32:32|t|cFF9932CC冬拥湖",	 571, 4522.23, 2828.01, 389.975, 0.215009,	TEAM_NONE,	10,	10000},
		
		{TP, " |TInterface/ICONS/Achievement_Zone_AlteracMountains_01:32:32|t奥特兰克战场",		      0,		5.599396,		-308.73822,		132.26651,	0,	TEAM_ALLIANCE,	10,	10000},
		{TP, " |TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:32:32|t阿拉希战场",		          0,		-1229.860352,	-2545.07959,	21.180079,	0,	TEAM_ALLIANCE,	10,	10000},
		{TP, " |TInterface/ICONS/Achievement_Zone_Ashenvale_01:32:32|t战歌峡谷", 		       1,		1442.388428,		-1857.655884,		132.370789,	0,	TEAM_ALLIANCE,	10,	10000},
		{TP, " |TInterface/ICONS/Ability_DualWieldSpecialization:32:32|t银色领地", 		      571,5676.03, 794.29, 653.699,  2.96379,	TEAM_ALLIANCE,	10,	10000},
		
		{TP, " |TInterface/ICONS/Achievement_Zone_AlteracMountains_01:32:32|t奥特兰克战场",		          0,		396.471863,		-1006.229126,	111.719086,	0,	TEAM_HORDE,	10,	10000},
		{TP, " |TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:32:32|t阿拉希战场",		               0,		-847.953491,	-3519.764893,	72.607727,	0,	TEAM_HORDE,	10,	10000},
		{TP, " |TInterface/ICONS/Achievement_Zone_Ashenvale_01:32:32|t战歌峡谷",  		                  1,		1036.794800,	-2106.138672,	122.94553,	0,	TEAM_HORDE,	10,	10000},
		{TP, " |TInterface/ICONS/Ability_DualWieldSpecialization:32:32|t夺日者圣殿", 	571,5936.53, 569.86, 660.491,  2.93709,	TEAM_HORDE,	10,	10000},
	},
	
	[ENCMENU]={-- Enchanter 附魔
        {MENU, "|TInterface/ICONS/inv_sword_39:32:32|t主手",     ENCMENU+0x10,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_misc_book_05:32:32|t副手",     ENCMENU+0x20,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_weapon_rifle_01:32:32|t远程",     ENCMENU+0x30,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_helmet_52:32:32|t头盔",     ENCMENU+0x40,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_shoulder_02:32:32|t肩甲",     ENCMENU+0x60,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_chest_cloth_23:32:32|t胸甲",     ENCMENU+0x80,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_bracer_02:32:32|t护腕",     ENCMENU+0xb0,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_gauntlets_16:32:32|t手套",     ENCMENU+0xc0,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_pants_08:32:32|t裤子",     ENCMENU+0xe0,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_boots_cloth_03:32:32|t鞋子",     ENCMENU+0x100,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_misc_cape_18:32:32|t披风",     ENCMENU+0x70,GOSSIP_ICON_TABARD},
        {MENU, "|TInterface/ICONS/inv_belt_17:32:32|t腰带",     ENCMENU+0xd0,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_jewelry_ring_26:32:32|t戒指",     ENCMENU+0x200,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_trinket_naxxramas01:32:32|t饰品",     ENCMENU+0x300,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_jewelry_amulet_05:32:32|t项链",     ENCMENU+0x50,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_shirt_01:32:32|t衬衣",     ENCMENU+0x90,GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/inv_shirt_guildtabard_01:32:32|t战袍",     ENCMENU+0xa0,GOSSIP_ICON_TABARD},
    },
	
    [ENCMENU+0x10] = {-- 主手1
		{ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除主手武器附魔!!",-1,EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t杀戮-攻强+110[双手武器]", 3827, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t狂暴-几率攻强+400"    ,  3789, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强潜能-攻强+65"    ,  3833, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t精确-命中+25,爆击+25", 3788, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t吸血-几率储存目标血浆[75级]",  3870, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t利刃防护-几率招架+200,反伤[75级]", 3869, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效法术能量-法强+81[法杖]", 3854, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t极效法术能量-法强+63", 3834, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t黑魔法-几率法术急速+250"  ,  3790, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t天灾斩除-亡灵目标攻强+140[双手武器]",  3247, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t斩杀-几率护甲穿透+120"    ,  3225, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_frost_chainsofice:15:15|t精金武器链-缴械时间-50%,招架+15", 3223, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_belt_18:15:15|t泰坦神铁武器链-缴械时间-50%,命中+28", 3731, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_fabric_mageweave_02:15:15|t高强度恒金渔线-钓鱼+5[鱼杆]", 846, EQUIPMENT_SLOT_MAINHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x110,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x110]={-- 主手2
		{ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除主手武器附魔!!",-1,EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_frost_frostarmor:15:15|t冰封符文[死亡骑士]",  3370, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_retributionaura:15:15|t堕落十字军符文[死亡骑士]",  3368, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_shadow_antimagicshell:15:15|t法术碎裂符文[死亡骑士]",  3367, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_shadow_antimagicshell:15:15|t法术阻断符文[死亡骑士]",  3595, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_shadow_chilltouch:15:15|t灰烬冰河符文[死亡骑士]",  3369, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/ability_parry:15:15|t裂刃符文[死亡骑士]",  3365, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/ability_parry:15:15|t破刃符文[死亡骑士]",  3594, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_sword_130:15:15|t石肤石像鬼符文[死亡骑士]",  3847, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/spell_holy_harmundeadaura:15:15|t巫妖斩除符文[死亡骑士]",  3366, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_sword_61:15:15|t蛛魔硬甲符文[死亡骑士]",  3883, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_deathknight_frozenruneweapon:15:15|t冰霜符文武器5[死亡骑士]",  3344, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/ability_poisons:15:15|t毒皮毒药[盗贼]",  1003, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/ability_poisons:15:15|t速效药膏9[盗贼]",  3769, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/ability_rogue_dualweild:15:15|t致命药膏9[盗贼]",  3771, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_herb_16:15:15|t致伤药膏7[盗贼]",  3773, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_nature_slowpoison:15:15|t麻醉药膏2[盗贼]",  3774, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_fire_flametounge:15:15|t火舌武器10[萨满]",  3781, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_frost_frostbrand:15:15|t冰封武器9[萨满]",  3784, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/spell_nature_cyclone:15:15|t风怒武器8[萨满]",  3787, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_gem_bloodstone_02:15:15|t完美火焰石-法伤+1%,法术暴击+49[术士]"  ,  3614, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_gem_sapphire_01:15:15|t完美法术石-法伤+1%,法术急速+60[术士]"  ,  3620, EQUIPMENT_SLOT_MAINHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x1110,GOSSIP_ICON_BATTLE},
    },		
    [ENCMENU+0x1110]={-- 主手3 
		{ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除主手武器附魔!!",-1,EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t猫鼬-几率敏捷+120,攻速"    ,  2673, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t魂霜-暗冰法伤+54",  2672, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t阳炎-奥火法伤+50",  2671, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t作战专家-几率命中加队友生命",  2675, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t魔法激荡-几率施法加队友法力",  2674, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t寒冬之力-冰霜法强+7",  2443, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t生命护卫-命中恢复生命",  3241, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t巨人杀手-目标减速",  3251, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t破冰武器-几率火伤",  3239, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t邪恶武器-暗影伤害,减少目标伤害",  1899, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t烈焰武器-灼热武器,几率火伤+40",   803, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t死亡霜冻-冰伤,减急速[73级以下目标]",  3273, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t冰寒-冰冷武器,降低目标移速和攻速",  1894, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t十字军-几率力量+100，恢复生命",  1900, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t生命偷取-吸取生命值",  1898, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t屠魔-几率击晕恶魔,增伤"    ,   912, EQUIPMENT_SLOT_MAINHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t次级元素杀手-元素目标伤害+6"    ,   854, EQUIPMENT_SLOT_MAINHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t次级屠兽-野兽目标伤害+6"    ,   853, EQUIPMENT_SLOT_MAINHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t初级屠兽-野兽目标伤害+2"    ,   249, EQUIPMENT_SLOT_MAINHAND},	
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t暗影之油", 25, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t冰霜之油", 26, EQUIPMENT_SLOT_MAINHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x11110,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x11110]={-- 主手4
		{ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除主手武器附魔!!",-1,EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效野蛮-攻强+85[双手武器]", 3828, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t野蛮-攻强+70[双手武器]", 2667, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效潜能-攻强+50"    ,  1606, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t法术能量,法强+69[法杖]", 3855, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异法术能量-法强+50", 3830, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效法术能量-法强+40", 2669, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效治疗-法强+40", 3846, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t法术能量-法强+30", 2504, EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t治疗能量-法强+29", 2505, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效敏捷-敏捷+35[双手武器]", 2670, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t敏捷-敏捷+25[双手武器]", 2646, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异敏捷-敏捷+26"    ,  1103, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效敏捷-敏捷+20"    ,  3222, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效敏捷-敏捷+15"    ,  2564, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异精神-精神+45"    ,  3844, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t极效精神-精神+20"    ,  2567, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效精神-精神+9[双手武器]", 1903, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t次级精神-精神+3[双手武器]", 255, EQUIPMENT_SLOT_MAINHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x111110,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x111110]={-- 主手5
		{ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除主手武器附魔!!",-1,EQUIPMENT_SLOT_MAINHAND},
        {ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效智力-智力+30"    ,  2666, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t极效智力-智力+22"    ,  2568, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效智力-智力+9[双手武器]", 1904, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级智力-智力+3[双手武器]", 723, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t潜能-力量+20"    ,  2668, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t力量-力量+15"    ,  2563, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效打击-武器伤害+7",  963, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t超强打击-武器伤害+5",  1897, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t强效打击-武器伤害+4",  805, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t打击-武器伤害+3",  943, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级打击-武器伤害+2",  241, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t初级打击-武器伤害+1",  250, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t超强冲击-武器伤害+9[双手武器]",  1896, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t强效冲击-武器伤害+7[双手武器]",  963, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t冲击-武器伤害+5[双手武器]",  1897, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级冲击-武器伤害+3[双手武器]",  943, EQUIPMENT_SLOT_MAINHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t初级冲击-武器伤害+2[双手武器]",  241, EQUIPMENT_SLOT_MAINHAND},
    },
    [ENCMENU+0x20]={-- 副手1
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除副手附魔!!",-1,EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t杀戮-攻强+110[双手武器]", 3827, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t狂暴-几率攻强+400"    ,  3789, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强潜能-攻强+65"    ,  3833, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t精确-命中+25,爆击+25", 3788, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t吸血-几率储存目标血浆[75级]",  3870, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t利刃防护-几率招架+200,反伤[75级]", 3869, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效法术能量-法强+81[法杖]", 3854, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t极效法术能量-法强+63", 3834, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t黑魔法-几率法术急速+250"  ,  3790, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t天灾斩除-亡灵目标攻强+140[双手武器]",  3247, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t斩杀-几率护甲穿透+120"    ,  3225, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_frost_chainsofice:15:15|t精金武器链-缴械时间-50%,招架+15", 3223, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_belt_18:15:15|t泰坦神铁武器链-缴械时间-50%,命中+28", 3731, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_fabric_mageweave_02:15:15|t高强度恒金渔线-钓鱼+5[鱼杆]", 846, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_shield_19:15:15|t泰坦神铁护板-格挡值+81,缴械-50%[盾牌]", 3849, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_titanium_shield_spike:15:15|t泰坦神铁盾刺-格挡反伤45-67[盾牌]", 3748, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_misc_rune_13:15:15|t强效护盾符文-吸收4000伤害[盾牌]",  2720 , EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t招架,格挡等级+15[盾牌]", 2655, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t韧性,韧性+12[盾牌]", 3229, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t躲闪,防御等级+20[盾牌]", 1952, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t特效耐力,耐力+18[盾牌]", 1071, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效智力,智力+25[盾牌]", 1128, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x120,GOSSIP_ICON_BATTLE},
    },	
    [ENCMENU+0x120]={-- 副手2
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除副手附魔!!",-1,EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_frost_frostarmor:15:15|t冰封符文[死亡骑士]",  3370, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_retributionaura:15:15|t堕落十字军符文[死亡骑士]",  3368, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_shadow_antimagicshell:15:15|t法术碎裂符文[死亡骑士]",  3367, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_shadow_antimagicshell:15:15|t法术阻断符文[死亡骑士]",  3595, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_shadow_chilltouch:15:15|t灰烬冰河符文[死亡骑士]",  3369, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/ability_parry:15:15|t裂刃符文[死亡骑士]",  3365, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/ability_parry:15:15|t破刃符文[死亡骑士]",  3594, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_sword_130:15:15|t石肤石像鬼符文[死亡骑士]",  3847, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_holy_harmundeadaura:15:15|t巫妖斩除符文[死亡骑士]",  3366, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_sword_61:15:15|t蛛魔硬甲符文[死亡骑士]",  3883, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_deathknight_frozenruneweapon:15:15|t冰霜符文武器5[死亡骑士]",  3344, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/ability_poisons:15:15|t毒皮毒药[盗贼]",  1003, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/ability_poisons:15:15|t速效药膏9[盗贼]",  3769, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/ability_rogue_dualweild:15:15|t致命药膏9[盗贼]",  3771, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_herb_16:15:15|t致伤药膏7[盗贼]",  3773, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_nature_slowpoison:15:15|t麻醉药膏2[盗贼]",  3774, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_fire_flametounge:15:15|t火舌武器10[萨满]",  3781, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_frost_frostbrand:15:15|t冰封武器9[萨满]",  3784, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/spell_nature_cyclone:15:15|t风怒武器8[萨满]",  3787, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_gem_bloodstone_02:15:15|t完美火焰石-法伤+1%,法术暴击+49[术士]"  ,  3614, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_gem_sapphire_01:15:15|t完美法术石-法伤+1%,法术急速+60[术士]"  ,  3620, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x1120,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x1120]={-- 副手3
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除副手附魔!!",-1,EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t猫鼬-几率敏捷+120,攻速"    ,  2673, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t魂霜-暗冰法伤+54",  2672, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t阳炎-奥火法伤+50",  2671, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t作战专家-几率命中加队友生命",  2675, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t魔法激荡-几率施法加队友法力",  2674, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t寒冬之力-冰霜法强+7",  2443, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t生命护卫-命中恢复生命",  3241, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t巨人杀手-目标减速",  3251, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t破冰武器-几率火伤",  3239, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t邪恶武器-暗影伤害,减少目标伤害",  1899, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t烈焰武器-灼热武器,几率火伤+40",   803, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t死亡霜冻-冰伤,减急速[73级以下目标]",  3273, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t冰寒-冰冷武器,降低目标移速和攻速",  1894, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t十字军-几率力量+100，恢复生命",  1900, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t生命偷取-吸取生命值",  1898, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t屠魔-几率击晕恶魔,增伤"    ,   912, EQUIPMENT_SLOT_OFFHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t次级元素杀手-元素目标伤害+6"    ,   854, EQUIPMENT_SLOT_OFFHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t次级屠兽-野兽目标伤害+6"    ,   853, EQUIPMENT_SLOT_OFFHAND},	
        {ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t初级屠兽-野兽目标伤害+2"    ,   249, EQUIPMENT_SLOT_OFFHAND},	
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t暗影之油", 25, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulasuperior_01:15:15|t冰霜之油", 26, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x11120,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x11120]={-- 副手4
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除副手附魔!!",-1,EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效野蛮-攻强+85[双手武器]", 3828, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t野蛮-攻强+70[双手武器]", 2667, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效潜能-攻强+50"    ,  1606, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t法术能量,法强+69[法杖]", 3855, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异法术能量-法强+50", 3830, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效法术能量-法强+40", 2669, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效治疗-法强+40", 3846, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t法术能量-法强+30", 2504, EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t治疗能量-法强+29", 2505, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效敏捷-敏捷+35[双手武器]", 2670, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t敏捷-敏捷+25[双手武器]", 2646, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异敏捷-敏捷+26"    ,  1103, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效敏捷-敏捷+20"    ,  3222, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t强效敏捷-敏捷+15"    ,  2564, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t优异精神-精神+45"    ,  3844, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t极效精神-精神+20"    ,  2567, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t特效精神-精神+9[双手武器]", 1903, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_enchant_formulagood_01:15:15|t次级精神-精神+3[双手武器]", 255, EQUIPMENT_SLOT_OFFHAND},
		{MENU, "|TInterface/ICONS/Achievement_PVP_A_01:32:32|t下一页", ENCMENU+0x111120,GOSSIP_ICON_BATTLE},
    },
    [ENCMENU+0x111120]={-- 副手5
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除副手附魔!!",-1,EQUIPMENT_SLOT_OFFHAND},
        {ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效智力-智力+30"    ,  2666, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t极效智力-智力+22"    ,  2568, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效智力-智力+9[双手武器]", 1904, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级智力-智力+3[双手武器]", 723, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t潜能-力量+20"    ,  2668, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t力量-力量+15"    ,  2563, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t特效打击-武器伤害+7",  963, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t超强打击-武器伤害+5",  1897, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t强效打击-武器伤害+4",  805, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t打击-武器伤害+3",  943, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级打击-武器伤害+2",  241, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t初级打击-武器伤害+1",  250, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t超强冲击-武器伤害+9[双手武器]",  1896, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t强效冲击-武器伤害+7[双手武器]",  963, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t冲击-武器伤害+5[双手武器]",  1897, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t次级冲击-武器伤害+3[双手武器]",  943, EQUIPMENT_SLOT_OFFHAND},
		{ENC, "|TInterface/ICONS/inv_misc_note_01:15:15|t初级冲击-武器伤害+2[双手武器]",  241, EQUIPMENT_SLOT_OFFHAND},
    },
    [ENCMENU+0x30]={-- 远程
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除远程武器附魔!!",-1,EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/inv_misc_spyglass_02:15:15|t觅心瞄准镜-远程爆击+40 [70级]", 3608, EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/Inv_misc_spyglass_03:15:15|t太阳瞄准镜-远程急速+40 [70级]", 3607, EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/ability_hunter_rapidregeneration:15:15|t钻石折射瞄准镜-远程伤害+15 [70级]", 3843, EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)杀戮-攻强+110[双手武器]", 3827, EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效法术能量-法强+81[法杖]", 3854, EQUIPMENT_SLOT_RANGED},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)精确-命中+25,爆击+25", 3788, EQUIPMENT_SLOT_RANGED},
	},
    [ENCMENU+0x40] = { -- 帽子
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除头盔附魔",-1,EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_warrior_rampage:15:15|t折磨秘药-攻强+50,爆击+20[80级]", 3817, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_warrior_shieldmastery:15:15|t凯旋秘药-攻强+50,韧性+20[80级]", 3795, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/spell_fire_masterofelements:15:15|t燃烧谜团秘药-法强+30,爆击+20[80级]", 3820, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/spell_arcane_arcaneresilience:15:15|t统御秘药-法强+29,韧性+20[80级]", 3797, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_warrior_shieldmastery:15:15|t祝福治愈秘药-法强+30,法力回复+10[80级]", 3819, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_warrior_swordandboard:15:15|t坚定防御者秘药-耐力+37,防御+20[80级]", 3818, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_warrior_shieldmastery:15:15|t凶残角斗士秘药-耐力+30,韧性+25[80级]", 3842, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/spell_frost_frozencore:15:15|t冰霜之魂秘药-耐力+30,冰抗+25[80级]", 3812, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_paladin_gaurdedbythelight:15:15|t消散之影秘药-耐力+30,暗抗+25[80级]", 3814, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/spell_fire_burnout:15:15|t烈焰之魂秘药-耐力+30,火抗+25[80级]", 3816, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/ability_druid_eclipse:15:15|t月食秘药-耐力+30,奥抗+25[80级]", 3815, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/trade_brewpoison:15:15|t防毒秘药-耐力+30,自然抗+25[80级]", 3813, EQUIPMENT_SLOT_HEAD},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_HEAD},
	},
    [ENCMENU+0x50] = { -- 项链
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除项链附魔",-1,EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_NECK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_NECK},
	},
    [ENCMENU+0x60] = { -- 肩部
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除肩甲附魔",-1,EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_axe_85:15:15|t强效利斧铭文-攻强+40,爆击+15[80级]", 3808, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/spell_holy_weaponmastery:15:15|t凯旋铭文-攻强+40,韧性+15[80级]", 3793, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/spell_nature_lightningoverload:15:15|t强效风暴铭文-法强+24,爆击+15[80级]", 3810, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/spell_holy_powerinfusion:15:15|t统御铭文-法强+23,韧性+15[80级]", 3794, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/spell_arcane_teleportorgrimmar:15:15|t强效峭壁铭文-法强+24,回蓝+8[80级]", 3809, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/spell_holy_divinepurpose:15:15|t强效巅峰铭文-躲闪+20,防御+15[80级]", 3811, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_shoulder_61:15:15|t强效角斗士铭文-耐力+30,韧性+15[80级]", 3852, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_inscription_tradeskill01:15:15|t大师的利斧铭文-攻强+120,爆击+15[铭文400]", 3835, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_inscription_tradeskill01:15:15|t大师的风暴铭文-法强+70 ,爆击+15[铭文400]", 3838, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_inscription_tradeskill01:15:15|t大师的峭壁铭文-法强+70 ,回蓝+8[铭文400]", 3836, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_inscription_tradeskill01:15:15|t大师的巅峰铭文-躲闪+60 ,防御+15[铭文400]", 3837, EQUIPMENT_SLOT_SHOULDERS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_SHOULDERS},
			},
    [ENCMENU+0x70] = { -- 背部
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除披风附魔",-1,EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t暗影护甲-强化潜行，敏捷+10", 3256, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t智慧-精神+10，威胁-2%", 3296, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强躲闪-防御+16", 1951, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效速度-急速+23", 3831, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t极效护甲-护甲+225", 3294, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t特效敏捷-敏捷+22", 1099, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t法术穿刺-法术穿透+35", 3243, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强冰霜抗性-冰抗+20", 3230, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强火焰抗性-火抗+20", 1354, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强奥术抗性-奥抗+20", 1262, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强暗影抗性-暗抗+20", 1446, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强自然抗性-毒抗+20", 1400, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/ability_rogue_throwingspecialization:15:15|t剑刃刺绣-几率攻强+400[裁缝400]", 3730, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/inv_misc_thread_01:15:15|t亮纹刺绣-几率法强+295[裁缝400]", 3722, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/spell_nature_giftofthewaterspirit:15:15|t黑光刺绣-几率回复400法力值[裁缝400]", 3728, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/inv_misc_cape_22:15:15|t高弹力衬垫-降落伞,敏捷+23[工程350]", 3605, EQUIPMENT_SLOT_BACK},
		{ENC, "|TInterface/ICONS/trade_engineering:15:15|t弹力蛛丝-降落伞,法强+27[工程350]", 3859, EQUIPMENT_SLOT_BACK},
	},
    [ENCMENU+0x80] = { -- 胸甲
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除胸甲附魔",-1,EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超级生命-生命+275", 3297, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t优异法力-法力+250", 3233, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/inv_misc_rune_10:15:15|t强效结界符文-25%几率命中恢复400生命值", 2791, EQUIPMENT_SLOT_CHEST},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_CHEST},
	},
    [ENCMENU+0x90] = { -- 衬衣
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除衬衣附魔",-1,EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_BODY},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_BODY},
	},
    [ENCMENU+0xa0] = { -- 战袍
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除战袍附魔",-1,EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_TABARD},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_TABARD},
	},
    [ENCMENU+0xb0] = { -- 护腕
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除护腕附魔",-1,EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t特效耐力-耐力+40", 3850, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强法术能量-法强+30", 2332, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效突袭-攻强+50", 3845, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t精准-精准等级+15", 3231, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效属性-全属性+6", 2661, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t特效精神-精神+18", 1147, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t优异智力-智力+16", 1119, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效躲闪-防御+12", 2648, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/inv_bracer_08:15:15|t毛皮衬垫攻击强度-攻强+130[制皮400]", 3756, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/trade_leatherworking:15:15|t毛皮衬垫法术强度-法强+76[制皮400]", 3758, EQUIPMENT_SLOT_WRISTS},
		{ENC, "|TInterface/ICONS/trade_leatherworking:15:15|t毛皮衬垫耐力-耐力+102[制皮400]", 3757, EQUIPMENT_SLOT_WRISTS},
	},
    [ENCMENU+0xc0] = { -- 手套
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除手套附魔",-1,EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效爆裂-爆击+16", 3249, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t士兵-威胁+2%,招架等级+10", 3253, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t碾压-攻强+44", 1603, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t优异法术能量-法强+28", 3246, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t特效敏捷-敏捷+20", 3222, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t精确-命中等级+20", 3234, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t精准-精准等级+15", 3231, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t采集-草药采矿剥皮+5", 3238, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t垂钓-钓鱼+5", 846, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/spell_shaman_elementaloath:15:15|t超级加速器-急速+340,12秒[工程400]", 3604, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/trade_engineering:15:15|t装甲护网-护甲+885[工程400]", 3860, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/inv_misc_enggizmos_01:15:15|t手部火箭发射器[工程400]", 3603, EQUIPMENT_SLOT_HANDS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_HANDS},
	},
    [ENCMENU+0xd0] = { -- 腰部
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除腰带附魔",-1,EQUIPMENT_SLOT_WAIST},
        {ENC, "|TInterface/ICONS/inv_misc_enggizmos_31:15:15|t炸弹带[工程350]", 3601, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/inv_misc_enggizmos_02:15:15|t电磁脉冲发生器[工程350]", 3599, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_WAIST},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t(额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_WAIST},
	},
    [ENCMENU+0xe0] = { -- 腿部
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除裤子附魔",-1,EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_32:15:15|t霜皮腿甲片-耐力+55,敏捷+22[80级]", 3327, EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_33:15:15|t冰鳞腿甲片-攻强+75,爆击+22[80级]", 3328, EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/spell_nature_astralrecalgroup:15:15|t辉煌魔线-法强+50,精神+20[80级]", 3872, EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/spell_nature_astralrecalgroup:15:15|t天蓝魔线-法强+50,耐力+30[80级]", 3873, EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_18:15:15|t土灵腿甲片-耐力+28,韧性+40[80级]", 3853, EQUIPMENT_SLOT_LEGS},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_LEGS},
	},     
    [ENCMENU+0x100] = { -- 脚部
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除靴子附魔",-1,EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效突袭-攻强+32", 1597, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t海象人的活力-耐力+15,移速+8%", 3232, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t超强敏捷-敏捷+16", 983, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效精神-精神+18", 1147, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t履冰-命中+12,爆击+12", 3826, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t强效坚韧-耐力+22", 1075, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/inv_gizmo_rocketbootextreme:15:15|t硝化甘油推进器-火箭靴,爆击+24[工程400]", 3606, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_17:15:15|t鞋垫-娱乐，没有实际效果", 2795, EQUIPMENT_SLOT_FEET},
		{ENC, "|TInterface/ICONS/inv_misc_armorkit_30:15:15|t厚北地护甲片-耐力+18[70级]", 3330, EQUIPMENT_SLOT_FEET},
	},
    [ENCMENU+0x200]={-- 戒指
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除戒指①附魔",-1,EQUIPMENT_SLOT_FINGER1},
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除戒指②附魔",-1,EQUIPMENT_SLOT_FINGER2},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① 法强+23[附魔400]", 3840, EQUIPMENT_SLOT_FINGER1},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① 攻强+40[附魔400]", 3839, EQUIPMENT_SLOT_FINGER1},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① 耐力+30[附魔400]", 3791, EQUIPMENT_SLOT_FINGER1},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① 全属性+4[附魔350]", 2931, EQUIPMENT_SLOT_FINGER1},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② 法强+23[附魔400]", 3840, EQUIPMENT_SLOT_FINGER2},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② 攻强+40[附魔400]", 3839, EQUIPMENT_SLOT_FINGER2},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② 耐力+30[附魔400]", 3791, EQUIPMENT_SLOT_FINGER2},
        {ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② 全属性+4[附魔350]", 2931, EQUIPMENT_SLOT_FINGER2},
    },
    [ENCMENU+0x300]={-- 饰品
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除饰品①附魔",-1,EQUIPMENT_SLOT_TRINKET1},
        {ENC, "|TInterface/ICONS/trade_engraving:15:15|t|cffe60000清除饰品②附魔",-1,EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t① (额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_TRINKET1},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)强力属性-所有属性+10", 3832, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)超级生命-生命+275", 3297, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)优异法力-法力+250", 3233, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)强效法力回复-法力回复+8", 2381, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)优异韧性-韧性+20", 3245, EQUIPMENT_SLOT_TRINKET2},
		{ENC, "|TInterface/ICONS/spell_holy_greaterheal:15:15|t② (额外)强效躲闪-防御+22", 1953, EQUIPMENT_SLOT_TRINKET2},
	},
}

local function Enchanting(player, EncSpell, Eid, money) --附魔 (玩家,附魔效果,附魔位置)
	local ID=Eid
	local Nowitem = player:GetEquippedItemBySlot(ID)--得到相应位置物品

	if (Nowitem and Eid )  then--存在物品
		--local WType = Nowitem:GetSubClass()--物品类型
		local WName = Nowitem:GetItemLink()--物品链接

		for solt=0,1 do
			local espellid=Nowitem:GetEnchantmentId(solt)
			if(espellid and espellid>0)then
				Nowitem:ClearEnchantment(solt)
				if(EncSpell<=0)then
					player:SendBroadcastMessage(WName.."已经清除附魔("..espellid..")")
				elseif(solt < 1 )then
					Nowitem:SetEnchantment(espellid, solt+1)
					break
				end
			end
		end

		if(EncSpell>0)then
			Nowitem:SetEnchantment(EncSpell, 0)
			player:CastSpell(player, 36937)
			player:SendBroadcastMessage(WName.."已经附魔。")
			player:SetHealth(player:GetMaxHealth())--回复生命
			return true
		end
	else
		player:SendNotification("你身上没有装备相应的物品")
	end
	return false
end

function Stone.AddGossip(player, item, id)
	player:GossipClearMenu()--清除菜单
	local Rows=Menu[id] or {}
	--阵营判定
	local Pteam=player:GetTeam()
	local teamStr,team="",player:GetTeam()
	if(team==TEAM_ALLIANCE)then
		teamStr	="[|cFF0070d0联盟|r]"
	elseif(team==TEAM_HORDE)then
		teamStr	="[|cffe60000部落|r]"
	end
	--职业判定 --没实现，鸽了
	--local Pclass=player:GetClass()
	--local classStr,class="",player:GetClass()

	for k, v in pairs(Rows) do
		local mtype,text,icon,intid=v[1],( v[2] or "???" ), (v[4] or GOSSIP_ICON_CHAT), (id*0x100+k)
		if(mtype==MENU)then
			player:GossipMenuAddItem(icon, text, 0, (v[3] or id )*0x100)
		elseif(mtype==FUNC or mtype==ENC)then
			local code,msg,money=v[5],(v[6]or ""), (v[7] or 0)
			if(mtype==ENC)then
				icon=GOSSIP_ICON_TABARD
			end
			if((code==true or code ==false))then
				player:GossipMenuAddItem(icon, text, money, intid, code, msg, money)
			else
				player:GossipMenuAddItem(icon, text, 0, intid)
			end
		elseif(mtype==TP)then
			local mteam,level,money=(v[8] or TEAM_NONE),(v[9] or 0),(v[10] or 0)
			if (player:GetLevel() >= level) then
				if(mteam==Pteam)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, teamStr..text, money, intid, false,"|cFFFFFF00是否传送到|r "..text.." ？",money)
				elseif(mteam == TEAM_NONE or mteam == null)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, text, money, intid, false,"|cFFFFFF00是否传送到|r "..text.." ？",money)
				end
			end
		else
			player:GossipMenuAddItem(icon, text, 0, intid)
		end
	end

	if(id > 0)then--添加返回上一页菜单
		local length=string.len(string.format("%x",id))
		if(length>1)then
			local temp=bit_and(id,2^((length-1)*4)-1)
			if(temp ~= MMENU)then
				player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"|TInterface/ICONS/achievement_pvp_h_11:32:32|t上一页", 0,temp*0x100)
			end
		end
	end

	if(id ~= MMENU)then--添加返回主菜单
		player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"|TInterface/ICONS/Mail_GMIcon:32:32|t返回主菜单......", 0, MMENU*0x100)
	else
		--[[--重复了，注释掉。保留语法。
		if(player:GetGMRank()>=4)then--是GM
			player:GossipMenuAddItem(GOSSIP_ICON_TRAINER,"|TInterface/ICONS/Trade_Engraving:32:32|t双重附魔", 0, ENCMENU*0x100)
        end
		if(player:GetGMRank()>=4)then--是GM
			player:GossipMenuAddItem(GOSSIP_ICON_CHAT,"|TInterface/ICONS/Mail_GMIcon:32:32|tGM※专用", 0, GMMENU*0x100)
		end
		]]	
		player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "|TInterface/ICONS/hourglass_64_64_yellow_background:32:32|t在线总时间 : |ce6000080"..Stone.GetTimeASString(player).."|r", 0, MMENU*0x100)
	end

	player:GossipSendMenu(1, item)--发送菜单
end

function Stone.ShowGossip(event, player, item)
	--[[--战斗中超级炉石不可用
	if (player:IsInCombat()) then
		return false
	end
	]]
	Stone.AddGossip(player, item, MMENU)
	return false
end

function Stone.SelectGossip(event, player, item, sender, intid, code, menu_id)
	local menuid=math.modf(intid/0x100)	--菜单组
	local rowid	=intid-menuid*0x100		--第几项

	if(rowid== 0)then
		Stone.AddGossip(player, item, menuid)
	else
		player:GossipComplete()	--关闭菜单
		local v=Menu[menuid] and Menu[menuid][rowid]
		if(v)then						--如果找到菜单项
			local mtype=v[1] or MENU
			if(mtype==MENU)then
				Stone.AddGossip(player, item, (v[3] or MMENU))
			elseif(mtype==FUNC)then					--功能
				local f=v[3]
				if(f)then
					player:ModifyMoney(-sender)		--扣费
					f(player, code)
				end
			elseif(mtype==ENC)then
				local spellId,equipId=v[3],v[4]
				Enchanting(player, spellId, equipId, 0)
				Stone.AddGossip(player, item, menuid)
			elseif(mtype==TP)then					--传送
				local map,mapid,x,y,z,o=v[2],v[3],v[4], v[5], v[6],v[7] or 0
				local pname=player:GetName()--得到玩家名
				if(player:Teleport(mapid,x,y,z,o,TELE_TO_GM_MODE))then--传送
					Nplayer=GetPlayerByName(pname)--根据玩家名得到玩家
					if(Nplayer)then
						Nplayer:SendBroadcastMessage("已经到达 "..map)
						Nplayer:ModifyMoney(-sender)--扣费
					end
				else
					print(">>Eluna Error: Teleport Stone : Teleport To "..mapid)
				end
			end
		end
	end
end

--RegisterPlayerEvent(7, guaiwuDQ)--暂时不想使用杀怪给气功点模块
RegisterPlayerEvent(13, LevelDQ)--升级给武功点

RegisterItemGossipEvent(itemEntry, 1, Stone.ShowGossip)
RegisterItemGossipEvent(itemEntry, 2, Stone.SelectGossip)
