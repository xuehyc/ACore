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
--天蓝2023.5.24版 CreatureDisplayInfo.dbc 从45554开始,45717结束
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

function user_login_event(event, player)
local cl = player:GetClass() --获取玩家的职业
    local lv = player:GetLevel() --获取玩家的等级
    if cl == 6 and lv < 80 then --如果是低于80级的DK
        player:AddItem(6948) --加个炉石
        player:SaveToDB()
        end 
        end  
         RegisterPlayerEvent(3, user_login_event, 0)
         
local function PlayerFirstLogin(event, player) --玩家首次登录--给新建角色出生增加物品，职业代码： 1 ='战士', 2 = '圣骑士', 3 = '猎人',4 = '潜行者', 5 = '牧师',6 = '死亡骑士'7 ='萨满',8 ='法师',9 ='术士',11 = '德鲁伊';
    local cl = player:GetClass() --获取玩家的职业
    local lv = player:GetLevel() --获取玩家的等级
    if cl == 6 and lv < 80 then --如果是低于80级的DK
        player:AddItem(6948) --加个炉石
        player:SaveToDB()
        end   
    if cl == 1 and lv < 80 then
        player: AddItem(4540,5)--4540是物品代码，5是物品数量。
        player:SaveToDB()
        end
        if cl == 4 and lv < 80 then
        player: AddItem(4540,5)
        player:SaveToDB()
        end
        if cl == 2 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 3 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 5 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 7 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 8 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 9 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        end
        if cl == 10 and lv < 80 then
        player: AddItem(4540,5)
        player: AddItem(159,5) 
        player:SaveToDB()
        
  end 
  end
  RegisterPlayerEvent(30, PlayerFirstLogin,0)
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
local GMMENU=30		--GM菜单(付费功能)
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
        
        --理发椅
		function ST.SummonTradeObject_BarberChair(player)
			ST.SummonTradeObject(player, 191028)
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
]]--eluna对GM命令支持很差 --麻蛋,早看到这句话,我就不折腾了
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
DkQuest=function(player)
    local cl = player:GetClass() --获取玩家的职业
    local lv = player:GetLevel() --获取玩家的等级
    if cl == 6 and lv < 80 then --如果是低于80级的DK
        local STARTER_QUESTS= { 12593, 12619, 12842, 12848, 12636, 12641, 12657, 12678, 12679, 12680, 12687, 12698, 12701, 12706, 12716, 12719, 12720, 12722, 12724, 12725, 12727, 12733, -1, 12751, 12754, 12755, 12756, 12757, 12779, 12801, 13165, 13166 };
        local specialSurpriseQuestId = -1
        local race = player:GetRace()
        local team = player:GetTeam()
        if race == 6 then
            specialSurpriseQuestId = 12739
        elseif race == 4 then
            specialSurpriseQuestId = 12743;
        elseif race == 3 then
            specialSurpriseQuestId = 12744;
        elseif race == 7 then
            specialSurpriseQuestId = 12745;
        elseif race == 11 then
            specialSurpriseQuestId = 12746;
        elseif race == 10 then
            specialSurpriseQuestId = 12747;
        elseif race == 2 then
            specialSurpriseQuestId = 12748;
        elseif race == 8 then
            specialSurpriseQuestId = 12749;
        elseif race == 5 then
            specialSurpriseQuestId = 12750;
        elseif race == 1 then
            specialSurpriseQuestId = 12742;
        end

        STARTER_QUESTS[23] = specialSurpriseQuestId;
        if team == 0 then
            STARTER_QUESTS[33] = 13188
        else
            STARTER_QUESTS[33] = 13189
        end
        --用一个for循环，依次对任务进行处理
        for k, v in ipairs(STARTER_QUESTS) do
            local quest_status = player:GetQuestStatus(v)
            if quest_status == 0 then
                --没这个任务，自动加这个任务，然后完成
                player:AddQuest(v)
                player:CompleteQuest(v)
                player:RewardQuest(v)
            end
        end
        player:AddItem(38664);
        player:AddItem(39322);
        player:AddItem(38632);
        player:SetLevel(59) --设置到80级
        player:SaveToDB() --保存到DB
        player:SendBroadcastMessage("若DK老家空无一物，传送一次即可！");
		else
			player:SendBroadcastMessage("职业限定为死亡骑士！");

        --炉石绑定，参数自己定
        --player:SetBindPoint( x, y, z, mapId, areaId )
        --将玩家传到指定的位置，参数自己定
        --player:Teleport( mappId, xCoord, yCoord, zCoord, orientation )
    end
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
        --{MENU, "|TInterface/ICONS/inv_misc_map02:32:32|t|cff8B4513地图传送_原版", 	                        TPMENU+0x01,			GOSSIP_ICON_TAXI},        
        {MENU, "|TInterface/ICONS/inv_misc_map02:32:32|t|cff8B4513地图传送", 	                            TPMENU+0x3220,			GOSSIP_ICON_TAXI},--天蓝版(细致坐标与再分类)		
		{MENU, "|TInterface/ICONS/INV_Misc_Rune_01:32:32|t|cff0070d0炉石功能", 	                            TBMENU,	        GOSSIP_ICON_TAXI,},
		{MENU, "|TInterface/ICONS/inv_misc_ogrepinata:32:32|t|cFF9932CC技能训练|r", 	                    SKLMENU,	    GOSSIP_ICON_TRAINER},
		{MENU, "|TInterface/ICONS/Achievement_Boss_Nexus_Prince_Shaffar:32:32|t|cFF32CD99幻化功能|r",		MMENU+0x20,		GOSSIP_ICON_TABARD},
		{MENU, "|TInterface/ICONS/Trade_Engraving:32:32|t|cFFB22222双重附魔|r",		                        ENCMENU,		GOSSIP_ICON_TABARD},
		
        
        {MENU, "|TInterface/ICONS/inv_misc_celebrationcake_01:32:32|t|cFF548B54付费功能|r",	                GMMENU,		    GOSSIP_ICON_MONEY_BAG},
		{TP,   "|TInterface/ICONS/inv_misc_coin_02:32:32|t|cffe60000商业中心|r", 1, -8545.5, 2005.471, 100.349, 1,	TEAM_NONE,	GOSSIP_ICON_TAXI},--org --{TP,   "|TInterface/ICONS/inv_misc_coin_02:32:32|t|cffe60000城市广场|r (|cff0070d0商业中心|r)", 1, -8545.5, 2005.471, 100.349, 1,	TEAM_NONE,	GOSSIP_ICON_TAXI},
        },

    [MMENU+0x50]={--原神主界面
		{MENU, "|TInterface/ICONS/ys_app:32:32|t|c00722FFF变身(芭芭拉的衣橱)",		                        MMENU+0x60,		GOSSIP_ICON_TALK},--cFF7FFF00,原先颜色太不明显,cFF7FFFFF比绿色稍微浅一些,但是还不太容易看清楚,c007FFFFF和上一个颜色没啥区别 
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t清除变身", 	                                                ST.DeMorph,	    GOSSIP_ICON_TRAINER},
	},

    [MMENU+0x60]={--原神_变身_芭芭拉的衣橱    此角色应为芭芭拉_双马尾
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣短筒蓝袜",          ST.Morph_45600,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣长筒红袜", 	        ST.Morph_45601,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣长筒红袜", 	        ST.Morph_45602,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣长筒白袜", 	        ST.Morph_45603,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t黑衣无袜", 	            ST.Morph_45604,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t黑衣蒙眼黑色毛袜", 	    ST.Morph_45605,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t黑衣长筒毛袜", 	        ST.Morph_45606,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣红裙摆长筒白袜", 	ST.Morph_45607,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t白衣黑裙摆长筒彩虹袜", 	ST.Morph_45608,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t彩虹上衣黑裙摆长筒黑袜",ST.Morph_45609,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t彩虹上衣黑裙摆无袜", 	ST.Morph_45610,	GOSSIP_ICON_TRAINER},--成功
        {FUNC, "|TInterface/ICONS/ys_app:32:32|t彩虹上衣黑裙摆彩虹袜", 	ST.Morph_45611,	GOSSIP_ICON_TRAINER},--成功
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
        {FUNC, "|TInterface/ICONS/wjmt_logo_128_128:32:32|t法丝", 	            ST.Morph_45629,	GOSSIP_ICON_TRAINER},--成功
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

	[TPMENU+0x01]={--传送主菜单_原版
        {MENU,	"|TInterface/ICONS/INV_Misc_Map04:32:32|t|cFFFF6600初始之地(各种族出生地)",						        TPMENU+0x2120,	GOSSIP_ICON_BATTLE},    --原先为20,为了兼容天蓝端的脚本,暂时修改下    --注意TPMENU已在前面定义为数值,所以此处只能使用+0x**这样的方式,如果改为字母或重命名啥的会蹦错
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:32:32|t|cff9932CC城市传送",							TPMENU+0x2110,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Northrend_01:32:32|t|ce600008B诺森德地图",							TPMENU+0x2160,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Outland_01:32:32|t|cFF32CD32外域地图",								TPMENU+0x2150,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Kalimdor_01:32:32|t|cffe60000卡利姆多",							    TPMENU+0x2140,	GOSSIP_ICON_BATTLE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_EasternKingdoms_01:32:32|t|cff00ccff东部王国",						TPMENU+0x2130,	GOSSIP_ICON_BATTLE},
		
		{MENU,  "|TInterface/ICONS/Achievement_Zone_Mulgore_01:32:32|t|cFFcc6633风景传送",							    TPMENU+0x2170,	GOSSIP_ICON_BATTLE},
		{MENU,  "|TInterface/ICONS/inv_valentinescandy:32:32|t|cFFFF70B8“女士们”",							        TPMENU+0x2180,	GOSSIP_ICON_BATTLE},

		--需要添加地图补丁，外发时注释掉
		--{MENU,  "|TInterface/ICONS/expansionicon_mistsofpandaria:32:32|t|cff00FF96自制地图",							TPMENU+0x90,	GOSSIP_ICON_BATTLE}, 
	},

	[TPMENU+0x2110]={--主要城市
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
	
	[TPMENU+0x2120]={--各种族出生地 --原先为20,为了兼容天蓝端的脚本,暂时修改下
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

	[TPMENU+0x2130]={--东部王国
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

	[TPMENU+0x2140]={--卡利姆多
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

	[TPMENU+0x2150]={--外域
	    {TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:32:32|t地狱火半岛",		530,	-207.335,	2035.92,	96.464,		1.59676,	TEAM_NONE,	60,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:32:32|t赞加沼泽",		530,	-220.297,	5378.58,	23.3223,	1.61718,	TEAM_NONE,	62,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:32:32|t泰罗卡森林",		530,	-2266.23,	4244.73,	1.47728,	3.68426,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:32:32|t纳格兰",			530,	-1610.85,	7733.62,	-17.2773,	1.33522,	TEAM_NONE,	64,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:32:32|t刀锋山",			530,	2029.75,	6232.07,	133.495,	1.30395,	TEAM_NONE,	66,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:32:32|t虚空风暴",		530,	3271.2,		3811.61,	143.153,	3.44101,	TEAM_NONE,	68,	50000},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:32:32|t影月谷",			530,	-3681.01,	2350.76,	76.587,		4.25995,	TEAM_NONE,	68,	50000},
	},

	[TPMENU+0x2160]={--诺森德
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
	
	[TPMENU+0x2170]={--风景传送
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
	
	[TPMENU+0x2180]={--女士们
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



--原版传送菜单结束
--天蓝传送菜单开始(2023.5.24版)

[TPMENU+0x3220]={--传送主菜单_天蓝版
		{MENU,	"|TInterface/ICONS/INV_Misc_Map04:35:35|t|cFFFF6600各种族出生地",						TPMENU+0x20,	GOSSIP_ICON_TAXI},
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:35:35|t|cff9932CC主要城市",							TPMENU+0x520,	GOSSIP_ICON_TAXI,TEAM_ALLIANCE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_EasternKingdoms_01:35:35|t|cff2359FF东部王国",							TPMENU+0x220,	GOSSIP_ICON_TAXI,TEAM_NONE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Kalimdor_01:35:35|t|cffe60000卡利姆多",							TPMENU+0x3c0,	GOSSIP_ICON_TAXI,TEAM_NONEE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Outland_01:35:35|t|cFFB22222外域",								TPMENU+0x1a0,	GOSSIP_ICON_TAXI,TEAM_NONE},
		{MENU,	"|TInterface/ICONS/Achievement_Zone_Northrend_01:35:35|t|ce600008B诺森德",							TPMENU+0xf0,	GOSSIP_ICON_TAXI,TEAM_NONE},
		{MENU,  "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t|cFFcc6633风景传送",							TPMENU+0x510,	GOSSIP_ICON_TAXI,TEAM_NONE},
        {MENU,  "|TInterface/ICONS/inv_valentinescandy:32:32|t|cFFFF70B8“女士们”",							        TPMENU+0x2180,	GOSSIP_ICON_BATTLE},
		},

	[TPMENU+0x20]={--各种族出生地
			{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t人类出生地",		0,		-8949.95,	-132.493,	83.5312,	0,			TEAM_ALLIANCE},
			{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t矮人出生地",		0,		-6240.32,	331.033,	382.758,	6.1,		TEAM_ALLIANCE},
			{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t侏儒出生地",		0,		-6240,		331,		383,		0,			TEAM_ALLIANCE},
			{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t暗夜精灵出生地",	1,		10311.3,	832.463,	1326.41,	5.6,		TEAM_ALLIANCE},
			{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t德莱尼出生地",	530,	-3961.64,	-13931.2,	100.615,	2,			TEAM_ALLIANCE},
			{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t兽人出生地",		1,		-618.518,	-4251.67,	38.718,		0,			TEAM_HORDE},
			{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t巨魔出生地",		1,		-618.518,	-4251.67,	38.7,		4.747,		TEAM_HORDE},
			{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t牛头人出生地",	1,		-2917.58,	-257.98,	52.9968,	0,			TEAM_HORDE},
			{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t亡灵出生地",		0,		1676.71,	1678.31,	121.67,		2.70526,	TEAM_HORDE},
			{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t血精灵出生地",	530,	10349.6,	-6357.29,	33.4026,	5.31605,	TEAM_HORDE},
			{TP, "|cFF006400[中立]|r|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t死亡骑士出生地",	609,	2355.84,	-5664.77,	426.028,	3.65997,	TEAM_NONE,	55,	0},
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},
           
		[TPMENU+0x520]={--主要城市
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:35:35|t|cff9932CC联盟主城",							TPMENU+0x30,	GOSSIP_ICON_TAXI,TEAM_ALLIANCE},
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:35:35|t|cff9932CC部落主城",							TPMENU+0x80,	GOSSIP_ICON_TAXI, TEAM_HORDE},
		{MENU,	"|TInterface/ICONS/spell_arcane_teleportsilvermoon:35:35|t|cff9932CC中立主城",							TPMENU+0x10,	GOSSIP_ICON_TAXI ,TEAM_NONE},
		 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},
		
        [TPMENU+0x30]={--联盟主城
            {MENU, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城", 	TPMENU+0x40,	GOSSIP_ICON_TAXI,TEAM_ALLIANCE},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡",			TPMENU+0x50,	GOSSIP_ICON_TAXI,	TEAM_ALLIANCE},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯",		TPMENU+0x60,	GOSSIP_ICON_TAXI,	TEAM_ALLIANCE},
			{MENU, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达",			TPMENU+0x70,	GOSSIP_ICON_TAXI,	TEAM_ALLIANCE},
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
			},
            
        [TPMENU+0x40]={--暴风城
	    {TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--英雄谷",		0, -9040.9, 451.377, 93.0558, 0.585,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--贸易区",		0, -8828.98, 628.00, 94.051, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--旧城区",		 0, -8720.88, 406.1, 97.7448, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--暴风要塞",		 0, -8524.95, 437.385, 105.569, 5.356,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--指挥室",		 0, -8404.96, 288.072, 120.886, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--皇家画廊",		 0, -8344.79, 514.298, 122.274, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--矮人区",		 0, -8384.76, 630.869, 94.7629, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--割喉小巷",		  0, -8526.17, 595.037, 101.399, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--教堂广场",		  0, -8623.2, 774.277, 96.652, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--光明大教堂",		  0, -8556.61, 826.026, 106.526, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--花园",		  0, -8742.26, 1063.29, 89.7451, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--法师区",		 0, -8929.28, 960.158, 117.31, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--已宰的羔羊",		 0, -8960.11, 1007.08, 122.025, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--巫师圣殿",		 0, -9005.53, 867.86, 129.692, 0.585,  TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Spell_Arcane_Portalstormwind:35:35|t|cff0000ff暴风城--暴风城港口",		 0, -8473.2177, 1233.303, 5.2302, 1.5059,  TEAM_ALLIANCE},
		{MENU, "上一页", TPMENU+0x30,GOSSIP_ICON_TAXI},
	},
	    [TPMENU+0x50]={--铁炉堡
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--大煅炉",		0, -4791.691, -1117.180, 498.807, 2.2204,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--王座厅",		0, -4838.38, -1054.45, 502.188, 2.35,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--工匠区",		0, -4829.19, -1270.34, 501.868, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--荒弃洞穴",   0, -4629.71, -1090.67, 501.327, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--军事区",   0, -5023.17, -1253.83, 505.301, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--秘法区",   0, -4626.61, -926.346, 502.767, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--平民区",   0, -4912.78, -964.486, 501.479, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--探险者大厅",    0, -4676.86, -1250.33, 501.993, 1.564,   TEAM_ALLIANCE},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ironforge:35:35|t|cff0000ff铁炉堡--图书馆",     0, -4646.89, -1286.12, 503.38, 1.564,   TEAM_ALLIANCE},
		{MENU, "上一页", TPMENU+0x30,GOSSIP_ICON_TAXI},
	},

	    [TPMENU+0x60]={--达纳苏斯
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--工匠区",		1,10108.8, 2381.4, 1316.92,2.78897,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--贸易区",		1,9737.637, 2265.757, 1327.495,2.78897,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--塞纳里奥区",		1,10139.1, 2562.71, 1322.01,2.78897,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--神殿花园区",		1,9934.518, 2501.518, 1317.825,1.0924,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--月神殿",		1,9688.63, 2525.97, 1335.38,2.78897,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Achievement_Zone_Darnassus:35:35|t|cff0000ff达纳苏斯--战士区",		1,9950.94, 2279.22, 1341.39,2.78897,   TEAM_ALLIANCE},
	    {MENU, "上一页", TPMENU+0x30,GOSSIP_ICON_TAXI},
	},

	    [TPMENU+0x70]={--埃索达
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达--纳鲁之座",		530,-3948.63, -11648.9, -138.637,1.108,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达--水晶大厅",		530,-3782.84, -11417, -138.029,1.108,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达--圣光地窖",		530,-4077.37, -11422.1, -141.457,1.108,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达--贸易区",		530,-4233.98, -11708.623, -143.658,4.0453,   TEAM_ALLIANCE},
	    {TP, "|TInterface/ICONS/Spell_Arcane_TeleportExodar:35:35|t|cff0000ff埃索达--纳鲁王座下层",		530,-3890.48, -11646.6, -310.942,1.108,   TEAM_ALLIANCE},
	    {MENU, "上一页", TPMENU+0x30,GOSSIP_ICON_TAXI},
	},

	
		[TPMENU+0x80]={--部落主城
		    {MENU, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛",		TPMENU+0x90,	GOSSIP_ICON_TAXI,TEAM_HORDE},
			{MENU, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城",			TPMENU+0xa0,	GOSSIP_ICON_TAXI,TEAM_HORDE},
			{MENU, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖",			TPMENU+0xb0,	GOSSIP_ICON_TAXI,TEAM_HORDE},
			{MENU, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城",			TPMENU+0xc0,	GOSSIP_ICON_TAXI,TEAM_HORDE},
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
			},
        [TPMENU+0x90]={--奥格瑞玛
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--插旗圣地",		1,		1338.961, -4379.458, 26.195,	0.144,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--力量谷",		1,		1593.263, -4400.581,6.151,		0.0583,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--精神谷",		1,		1561.45, -4200.64, 43.1889,		2.14362,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--荣誉谷",		1,		1985.265, -4693.966, 24.620,	6.10,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--勇气之环竞技场",		1,		2138.1, -4738.94, 50.4951,		5.650,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--暗巷区",		1,		1836.607, -4528.587,21.47,	6.28,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--暗影裂口",		1,		1803.45, -4392.86, -18.1602,		2.14362,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--格罗玛什堡垒",		1,		1920.938, -4145.206, 40.629,		1.64,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalOrgrimmar:35:35|t|cffff0000奥格瑞玛--传说大厅",		1,		1659.058, -4205.261, 55.437,	1.079,	TEAM_HORDE},
	{MENU, "上一页", TPMENU+0x80,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0xa0]={--幽暗城
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--洛丹伦废墟",			0,		1835.05, 238.602, 60.3228, 	3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--贸易区",			0,		1560.72, 239.503, -43.1026, 	3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--魔法区",			0,		1677.01, 155.257, -62.1574, 	3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--炼金房",			0,		1409.99, 355.178, -66.021,      3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--军事区",			0,		1728.36, 367.256, -60.4844,     3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--皇家区",			0,		1302.38, 359.112, -67.2968,     3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--盗贼区",			0,		 1501.65, 147.634, -60.0877,    3.08,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalUndercity:35:35|t|cffff0000幽暗城--下水道",			0,		 1671, 734.324, 79.9641,     3.08,	TEAM_HORDE},
	{MENU, "上一页", TPMENU+0x80,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0xb0]={--雷霆崖
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--中心区",			1,		-1210.163, -62.944, 157.750,	4.70,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--贸易区",			1,		-1128.278, 41.420, 142.697,	2.445,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--猎人高地",			1,		-1401.77, -77.5806, 158.935,	2.80623,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--灵魂高地",			1,		-1010.96, 225.954, 134.569,	2.80623,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--预见之池",			1,		-1028.54, 214.873, 109.887,	2.80623,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_PortalThunderBluff:35:35|t|cffff0000雷霆崖--长者高地",			1,		-1057.91, -232.39, 159.03,	2.80623,	TEAM_HORDE},
	{MENU, "上一页", TPMENU+0x80,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0xc0]={--银月城
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--银月废墟",			530,	9638.87, -6691.56, 5.72187,	0.043914,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--日怒尖塔",			530,	9985.24, -7059.49, 45.3638,	0.043914,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--皇家贸易区",			530,	9639.21, -7428.7, 13.298,	0.1,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--花园街市",			530,	9706.76, -7134.31, 13.91,	4.32,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--谋杀小径",			530,	9677.34, -7370.02, 11.9342,	0.043914,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--逐日王庭",			530,	9823.64, -7262.41, 26.167,	0.94,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportSilvermoon:35:35|t|cffff0000银月城--远行者广场",			530,	9851.11, -7466.91, 14.956,	0.043914,	TEAM_HORDE},
	{MENU, "上一页", TPMENU+0x80,GOSSIP_ICON_TAXI},
	},

    [TPMENU+0x10]={--中立城市
			{MENU, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城",		TPMENU+0xd0,	GOSSIP_ICON_TAXI,TEAM_NONE,60,0},--增加显示此菜单等级，传送使用金币
			{MENU, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然",	TPMENU+0xe0,	GOSSIP_ICON_TAXI,TEAM_NONE,TEAM_NONE,	70,	0},
			{TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t藏宝海湾",	0,		-14429.44,	451.738,	15.4077,	3.734,	TEAM_NONE,	35,	0},
			{TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t棘齿城",	1,		-955.219,	-3678.92,	8.29946,	0,			TEAM_NONE,	10,	0},
			{TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t加基森",	1,		-7168.77,	-3786.97,	8.499,	2.964,			TEAM_NONE,	30,	0},
			{TP, "|cFF006400[中立]|r |TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t永望镇",	1,		6714.520,	-4667.69,	720.951,	0.232,	TEAM_NONE,	55,	0},--永望镇这么重要也不加一个？
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},

	   [TPMENU+0x220]={--东部王国
			{MENU, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林",		TPMENU+0x230,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林",		TPMENU+0x240,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗",			TPMENU+0x250,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地",	TPMENU+0x260,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹",		TPMENU+0x270,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地",		TPMENU+0x280,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野",		TPMENU+0x290,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林",		TPMENU+0x2a0,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山",		TPMENU+0x2b0,	GOSSIP_ICON_TAXI,TEAM_NONE,	15,	0},--官服坐飞机都是2G起，所以并不贵
			{MENU, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林",		TPMENU+0x2c0,	GOSSIP_ICON_TAXI,TEAM_NONE,	18,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地",			TPMENU+0x2d0,	GOSSIP_ICON_TAXI,TEAM_NONE,	20,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵",	TPMENU+0x2e0,	GOSSIP_ICON_TAXI,TEAM_NONE,	20,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t奥特兰克山脉",	TPMENU+0x2f0,	GOSSIP_ICON_TAXI,TEAM_NONE,	25,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地",		TPMENU+0x300,	GOSSIP_ICON_TAXI,TEAM_NONE,	30,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷",			TPMENU+0x310,	GOSSIP_ICON_TAXI,TEAM_NONE,	30,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地",		 	TPMENU+0x320,	GOSSIP_ICON_TAXI,TEAM_NONE,	35,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽",		TPMENU+0x330,	GOSSIP_ICON_TAXI,TEAM_NONE,	35,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰",		TPMENU+0x340,	GOSSIP_ICON_TAXI,TEAM_NONE,	40,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷",		TPMENU+0x350,	GOSSIP_ICON_TAXI,TEAM_NONE,	43,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地",		TPMENU+0x360,	GOSSIP_ICON_TAXI,TEAM_NONE,	45,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原",		TPMENU+0x370,	GOSSIP_ICON_TAXI,TEAM_NONE,	50,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地",		TPMENU+0x380,	GOSSIP_ICON_TAXI,TEAM_NONE,	51,	0},
			{MENU, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径",	TPMENU+0x390,	GOSSIP_ICON_TAXI,TEAM_NONE,	50,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地",		TPMENU+0x3a0,	GOSSIP_ICON_TAXI,TEAM_NONE,	53,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛",	TPMENU+0x3b0,	GOSSIP_ICON_TAXI,TEAM_NONE,		TEAM_NONE,	68,	0},
			{MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x230]={--艾尔文森林
        {TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--北郡修道院",	0,	    -8910.17, -143.49, 81.9505,	3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--北郡山谷",		0,		-9048.08, -45.9935, 88.3187,3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--北郡农场",		0,		-9033.93, -316.535, 73.6597,3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--回音山矿洞",	0,		-8691.03, -111.557, 89.1971,3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--闪金镇",		0,		 -9485.43, 65.196, 56.1381,3.0704,		TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--狮王之傲旅店",		0,       -9469.45, 34.1281, 56.9646,3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--水晶湖",		0,       -9384.82, -139.124, 58.0447,3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--玉石矿洞",		0,       -9198.71, -613.721, 60.8583,0.51,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--阿祖拉之塔",		0,       -9526.13, -687.554, 62.1681,3.92,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--石碑湖",		0,       -9331.18, -986.291, 66.5465, 0.46,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--英雄哨岗",		0,       -9199.76, -1059.47, 71.0206, 0.46,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--东谷伐木场",		0,       -9521.28, -1260.2, 42.1762, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--山巅之塔",		0,      -9754.71, -1369.49, 57.2391, 3.95,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--布莱克威尔南瓜田",		0,      -9820.73, -850.879, 39.7964, 5.42,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--杰罗德码头",		0,      -9963.71, -201.313, 23.8022, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--马科伦农场",		0,      -9970.5, 132.639, 33.7481, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--法戈第矿洞",		0,      -9903.12, 217.363, 15.45, 5.92,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--斯通菲尔德农场",		0,      -9935.7, 444.247, 34.6192, 5.28,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--林边空地",		0,      -9814.93, 672.447, 32.3748, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--西泉要塞",		0,       -9672.84, 690.107, 36.4591, 5.80,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--明镜湖果园",		0,       -9501.06, 509.879, 54.2739, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--明镜湖",		0,       -9410.95, 362.657, 50.9335, 3.0704,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_ElwynnForest:35:35|t艾尔文森林--雷霆瀑布",		0,       -9294.095, 669.544, 131.447, 3.61,		TEAM_NONE,	1,	0},
		{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x240]={--永歌森林
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--逐日岛",		530,10348.99,	-6358.147,33.53,5.71,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--法瑟林学院",		530,10175.803,	-6049.037,25.54,2.28,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--黎明之路",		530,9987.094,	-6477.653,0.88,3.18,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--匿影小径",		530,9543.422,	-6495.639,22.668,5.37,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--北部圣殿",		530,9309.404,	-6542.747,34.67,5.07,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--死亡之痕",		530,9242.218,	-6975.123,6.150,2.13,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--萦语水池",		530,9248.758,	-7229.117,15.269,5.791294,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--苏伦的养殖场",		530,9259.984,	-7481.326,35.529,4.74,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--达斯维瑟广场",		530,9315.467,	-7854.48,63.86,5.35,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--碧风海岸",		530,9595.45,	-8049.521,0.566,1.58,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--托尔瓦萨",		530,8677.848,	-7877.272,157.05,4.53,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--远行者居所",		530,8985.825,	-7452.612,86.68,4.58,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--东部圣殿",		530,8747.325,	-7080.959,37.243,4.26,		TEAM_NONE,	1,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	{MENU, "下一页", TPMENU+0x1240,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x1240]={--永歌森林
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--生命森林",		530,8695.930,	-7426.197,111.77,1.78,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--塞布瓦萨",		530,8460.078,	-7532.85,155.732,4.365,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--杉多尔符文石",		530,8270.534,	-7217.131,138.272,0.05,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--艾伦达尔桥",		530,8118,	-6901.529,70.427,1.32,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--法利萨斯符文石",		530,8228.418,	-6665.501,84.626,1.14,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--焦痕谷",		530,8208.949,	-6338.1079,64.511,2.8,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--金枝小径",		530,8413.791,	-6143.654,58.84,4.75,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--阳帆港",		530,8739.582,	-6059.690,11.05,0.132,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--金色沙滩",		530,8847.201,	-5759.622,3.125,2.01,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--晴风村",		530,8716.112,	-6664.79,70.24,2.13,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--萨瑟利尔庄园",		530,8655.783,-6375.75,53.36,2.63,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--西部圣殿",		530,9119.143,-6235.340,19.008,2.48,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EversongWoods:35:35|t永歌森林--静谧海岸",		530,9002.092,	-5868.208,1.78,0.208,		TEAM_NONE,	1,	0},
	{MENU, "上一页", TPMENU+0x240,GOSSIP_ICON_TAXI},
	{MENU, "返回东部王国地图选择", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x250]={--丹莫罗
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--北门哨岗",			0,		-5164.96, -2294.1, 400.491,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--北门小径",			0,		-5282.82, -2189.23, 425.187,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---霜鬃巨魔要塞",			0,		 -5558.64, 442.1, 389.121, 	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--冻石农场",			0,		-5550.24, -1314.51, 398.528,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--冻土岭",			0,		-5798.54, -1240.01, 378.512,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--钢架补给站",			0,		-5474.62, -665.893, 392.674,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--古博拉采掘场",			0,		-5687.61, -1541.58, 390.306,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--古博拉矿场",			0,		-5702.78, -1691.55, 360.795,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--寒风峡谷",			0,		-5629.04, -40.6986, 412.21,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--寒脊山小径",			0,		-6230.48, 126.602, 430.848,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--灰色洞穴",			0,		-5676.64, -291.255, 370.042,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--卡拉诺斯",			0,		-5547.77, -478.144, 397.491,		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--盔枕湖",			0,		-5596.18, -2000, 396.157, 		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--雷酒酿制厂",			0,		-5581.22, -510.668, 404.374, 		5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--烈酒村",			0,		-5405.8, 312.087, 396.2,	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--南门哨岗",			0,		-5515.86, -2420.99, 400.491,	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--南门小径",			0,		-5637.25, -2242.13, 424.764,	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗--涌冰湖山洞",			0,		 -5272.71, -61.7998, 399.464,	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---闪光岭",			0,		 -5046.54, -262.597, 441.277, 	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---铁环营地",			0,		 -5823.98, -1994.6, 403.254, 	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---雾松避难所",			0,		 -5389.11, -1052.17, 391.904,	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---涌冰湖",			0,		-5208.06, 60.1717, 386.111, 	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---安威玛尔",			0,		-6131.74, 384.029, 395.542, 	5.2349,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DunMorogh:35:35|t丹莫罗---寒脊山谷",			0,		-6484.24, 492.811, 386.781, 	5.2349,		TEAM_NONE,	1,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x260]={--提瑞斯法林地
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--丧钟镇",	0,		1882.949, 1590.80, 89.83,	5.8,		TEAM_HORDE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--夜行蜘蛛洞穴",	0,		2055.32, 1795.39, 95.8375,	5.8,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--阿加曼德磨房",	0,		2732.37, 842.676, 114.566,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--巴尼尔农场",	0,		1970.61, -434.815, 35.4506,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--北部海岸",	0,		3006.800, 283.05, 1.039,3.5,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--布瑞尔",	0,		2206.23, 247.798, 34.125,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--布瑞尔城镇大厅",	0,		2294.73, 277.885, 37.3094,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--澈水湖",	0,		2468.37, 15.4213, 23.9054,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--毒蛛峡谷",	0,		2513.05, -845.44, 56.4605,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--噩梦谷",	0,		1859.32, 948.548, 34.305,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--耳语海岸",	0,		2513.228, 1365.681,11.813,	1.05,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--耳语花园",	0,		2768.81, -703.469, 126.771,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--法奥之墓",	0,		2578.79, -563.218, 86.2075,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--飞空艇乘坐塔",	0,		2042.29, 282.534, 55.5462,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--冈瑟尔的居所",	0,		2514.30, -39.72, 26.26,	-0.078,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--加伦鬼屋",	0,		2877.805, 343.097,26.856,	0.58,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--静水池",	0,		2231.92, 790.232, 32.6604,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--恐惧之末旅店",	0,		2248.09, 240.101, 34.2599,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--炉灰庄园",	0,		2175.805, 594.083, 42.461,	2.68,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--十字军前哨(西)",	0,		1792.05, 674.044, 42.3283,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--十字军前哨(北)",	0,	2403.00, 1567.55, 31.43,0.57,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--十字军前哨(东)",	0,		  2173.94, -471.096, 75.5407,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--索利丹农场",	0,		  2373.84, 1473.03, 34.1086,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--亡灵壁垒",	0,		 1691.46, -720.27, 57.02,	4.05,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--血色修道院休息区",	0,		 2878.05, -652.653, 137.817,	4.2436,		TEAM_NONE,	1,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_TirisfalGlades_01:35:35|t提瑞斯法林地--血色十字军哨岗",	0,		3020.994, -562.47, 118.918,	0.077,		TEAM_NONE,	1,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x270]={--洛克莫丹
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--奥加兹岗哨",		0,		-4803.33, -2713.25, 327.189,	5.4823,		TEAM_ALLIANCE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--北门小径",		0,		-4800.96, -2532.21, 353.777,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--丹奥加兹",		0,		-4685.43, -2698.23, 318.714,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--国王谷",		0,		-6022.09, -2500.89, 309.111,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--灰爪山",		0,		-5632.416, -3027.278, 387.268,	0.86,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--巨石水坝",		0,		-4739.26, -3516.56, 310.238,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--烈酒旅店",		0,		-5367.01, -2961.6, 326.502,	5.4823,		TEAM_ALLIANCE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--洛克湖",		0,		-5039.32, -3383.18, 296.848,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--旅行者营地",		0,		-5626.27, -4317.92, 401.091,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--莫格罗什要塞西北洞",		0,		-4842.643, -3885.547, 301.511,	0.49,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--莫格罗什要塞东北洞",		0,		 -4855.33, -4038.23, 314.352,	5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--莫格罗什要塞东南洞",		0,		-4931.568, -4015.885, 299.878,	3.3,TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--南门小径",		0,		-5642.43, -2535.74, 375.265, 5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--塞尔萨玛",		0,		-5393.45, -2908.79, 338.126, 5.4823,		TEAM_ALLIANCE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--山洞(奥加兹岗哨南边)",		0,		-5019.152, -2674.323, 321.756, 0.941,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--山洞(旅行者营地北边)",		0,		-5434.703, -4167.48, 389.313, 4.46,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--山洞(铁环挖掘场西北)",		0,		-5828.25, -3685.16, 362.625, 5.5,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--碎石怪之谷",		0,		-5941.321, -2983.84, 389.514,3.33,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--铁环挖掘场",		0,		-5629.02, -3786.15, 322.453, 5.4823,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Lochmodan:35:35|t洛克莫丹--银泉矿洞",		0,		-4801.86, -2930.12, 328.755, 5.4823,		TEAM_NONE,	10,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x280]={--幽魂之地
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--塔奎林",		530,	7560.310,	-6785.310,	89.162,	2.05,		TEAM_HORDE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--太阳圣殿",		530,	7164.516,	-7080.713,	55.71,5.65,		TEAM_HORDE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--远行者营地",		530,	7572.505,	-7670.295,	151.269,6.27,		TEAM_HORDE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--日冕村",		530,	7990.554,	-7354.326,	139.609,6.25,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--阿曼尼墓穴",		530,	7657.845,	-7505.342,	153.11,2.39,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--金雾村",		530,	7905.163,	-6153.658,	18.69,4.88,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--沙兰蒂斯岛",		530,	7698.00,	-5680.159,	2.38,5.77,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--风行村",		530,	7338.548,	-5825.00,	11.2134,3.81,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--幽光矿洞",		530,	7241.434,	-6275.376,	19.681,5.89,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--月亮圣殿",		530,	7605.078,	-6447.696,	16.19,2.68,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--安欧维恩",		530,	6797.572,	-7140.156,	43.168,4.8,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--风行者之塔",		530,	6982.977,	-5883.903,	31.36,1.53,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--安迪尔林庄园",		530,	7016.047,	-6816.97,	41.98,5.95,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--鲜血通灵塔",		530,	7166.991,	-6417.978,	50.241,6.25,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--死亡之痕",		530,	7145.743,	-6530.398,	10.978,3.34,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--鬼嚎通灵塔",		530,	7199.669,	-6622.934,	63.658,2.71,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--塞布努瓦",		530,	7016.084,	-7492.541,	45.84,2.32,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--塞布提拉",		530,	7314.686,	-7800.706,	148.913,5.6,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--晨星之塔",		530,	7807.008,	-7850.799,	168.665,5.17,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--塞布索雷",		530,	8070.273,	-7842.235,	177.115,2.74,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--苦难岛",		530,	8101.202,	-7559.188,	168.172,0.21,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--戴索姆",		530,	6648.243,	-6453.875,	29.25,2.62,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Ghostlands:35:35|t幽魂之地--萨拉斯小径",		530,	6343.048,	-6849.277,	100.672,3.36,		TEAM_NONE,	10,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x290]={--西部荒野
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--哨兵岭",		0,		-10520.612, 1075.42, 53.542,5.017,		TEAM_ALLIANCE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--贾森农场",		0,		-9829.89, 936.602, 29.3164,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--长滩",		0,		 -9814.52, 2084.18, 0.271074, 6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--佛布隆南瓜农场",		0,		-9969.05, 1264.1, 41.0096,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--詹戈洛德矿洞",		0,		-10032.855, 1456.80, 43.256, 6.12,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--萨丁农场",		0,		-10107.2, 1183.89, 36.2125,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--摩尔森农场",		0,		-10191, 1378.7, 37.4271,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--金海岸矿洞",		0,		-10387.597, 1955.911, 9.87,	4.1,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--阿历克斯顿农场",		0,		-10665.5, 1600.45, 42.2439,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--斯特登的池塘",		0,		-10745.5, 1461.57, 51.4079,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--死亡农地",		0,		-10856.2, 882.583, 32.6952,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--月溪镇",		0,		-11008.4, 1428.72, 43.0337, 6.0738,		TEAM_NONE,	10,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--迪蒙特荒野",		0,		-11117.2, 1836.29, 41.3413,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--尘埃平原",		0,		-11142.093, 814.501, 35.01,	2.64,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--塔",		0,		-11117.1, 585.009, 34.329,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--匕首岭",		0,		-11254.7, 1454.83, 89.1885,	6.0738,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WestFall_01:35:35|t西部荒野--西部荒野灯塔",		0,		-11407.09, 1966.150, 10.51, 3.14,		TEAM_NONE,	10,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2a0]={--银松森林
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--瑟伯切尔",		0,		509.034, 1624.109, 125.511, 1.68,		TEAM_HORDE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--埃利姆矿洞",		0,		372.561, 1088.49, 106.305,	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--安伯米尔",		0,		-132.03, 897.898, 65.9807, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--奥森农场",		0,		206.235, 1454.544, 114.475, 	3.01,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--北海流谷",		0,		797.124, 1653.62, 26.2847, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--北流海岸",		0,		900.253, 1904.28, 0.517566, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--博伦的巢穴",		0,		 -372.71, 887.288, 132.42, 	1.02,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--芬里斯城堡",		0,		 955.952, 688.358, 59.7364, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--芬里斯岛",		0,		  737.609, 720.825, 36.5505, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--焚木村",		0,		  -346.641, 1406.53, 30.1703, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--格雷迈恩之墙",		0,		   -685.64, 1490.95, 7.087, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--黎明岛",		0,		 813.404, 216.191, 34.281, 3.8625,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--洛丹米尔湖",		0,		709.349, 934.534, 34.7558, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--玛尔丁果园",		0,		1359.36, 1079.54, 52.5681, 	1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--南流海岸",		0,		-477.755, 1678.92, 0.541589, 1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--破旧渡口",		0,		711.987, 1015.4, 49.3766, 1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--闪光湖岸",		0,		1170.752, 1047.511, 33.815, 3.52,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--瓦尔甘牧场",		0,		885.394, 1289.2, 50.4665, 1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--亡者农场",		0,		1106.45, 1516.91, 30.9695, 1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--伊瓦农场",		0,		1202.64, 1231.85, 52.632, 1.7798,		TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t银松森林--粘丝洞",		0,		1275.577, 1931.681, 16.32, 0.51,		TEAM_NONE,	10,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2b0]={--赤脊山
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--湖畔镇",			0,		-9272.32, -2245.68, 64.0475,	0.28385,	TEAM_ALLIANCE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--湖畔镇大厅",			0,		-9232.9, -2212.32, 66.1785,	0.28385,	TEAM_ALLIANCE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--湖畔镇旅店",			0,		-9243.14, -2149.35, 64.3408,	0.28385,	TEAM_ALLIANCE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--奥瑟尔伐木场",			0,		-9182.73, -2797.67, 92.2083,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--赤脊峡谷",			0,		-9056.64, -2439.66, 127.519,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--湖边大道",			0,		-9690.49, -2125.11, 57.7727,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--加拉德尔山谷",			0,		-9187.82, -3185.94, 100.94,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--瑞斯班洞穴",			0,		-9044.44, -1995.41, 141.155,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--三角路口",			0,		-9607.12, -1887.35, 58.4738,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--山洞",			0,		-9058.817, -3218.829, 104.36,	0.15,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--石堡",			0,		-9314.861, -3022.569, 129.699,	3.36,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--石堡高塔",			0,		-9289.20, -2971.50, 127.866,	1.82,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--石堡瀑布",			0,		-9481.49, -3326.92, 8.86435,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--石堡要塞",			0,		-9407.903, -3057.738, 140.67,	4.75,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--撕裂者山谷",			0,		-9800.856, -3238.243, 59.97,	0.59,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--撕裂者营地",			0,		-8778.411, -2393.631, 156.023,	0.47,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--撕裂者之石",			0,		-8678.5, -2302.96, 155.916,	0.28385,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--伊尔加拉之塔",			0,		-9240.255, -3326.0324, 101.84,	4.19,	TEAM_NONE,	15,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t赤脊山--止水湖",			0,		-9353.53, -2289.55, 71.6271,	0.28385,	TEAM_NONE,	15,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2c0]={--暮色森林
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--血鸦旅店",		0,		 -10540.4, -1159.57, 28.0865, 1.5695,		TEAM_ALLIANCE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--夜色镇",		0,		-10476.8, -1181.04, 27.6369,1.5695,		TEAM_ALLIANCE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--夜色镇大厅",		0,		-10560.2, -1127.28, 30.067,1.5695,		TEAM_ALLIANCE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--暗色河滩",		0,		-10033.3, -1077.52, 27.8783,	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--腐草农场",		0,		-10985.6, 202.408, 28.0767, 	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--荒弃鬼屋",		0,		-10325.6, 332.561, 59.0455, 	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--寂静河岸",		0,		-10390.5, 662.113, 30.1389, 	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--静谧花园墓场",		0,		-10959.8, -1269.14, 51.994, 	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--烂果园",		0,		-10928.4, -887.637, 67.5959, 	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--晨光之林墓穴",		0,	-10189.601, 144.588, 2.78,  	2.79,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--黎明森林",		0,		-10582.9, -447.854, 67.1926,  	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--阳光树林",		0,		-10373.6, -883.15, 47.3118,1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--罗兰之墓",		0,		-11056.41, -1156.068, 44.39,  	1.76,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--密斯特曼托庄园",		0,		 -10334, -1240.66, 35.0453,	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--乞丐鬼屋",		0,		-10382.9, -1523.2, 86.964,	1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--山洞",		0,		-10634.106, -1514.047, 90.506, 0.53,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--沃古尔食人魔山东北",		0,		-10998.5, -215.234, 13.8165, 1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--沃古尔食人魔山山洞",		0,		-11063.284, -94.284, 15.808, 2.84,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--乌鸦岭",		0,		-10754.1, 305.236, 38.7451, 1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--乌鸦岭墓地",		0,		-10534.2, 296.85, 30.9004, 1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--小屋",		0,		-10777.7, -1360.48, 38.2683, 1.5695,		TEAM_NONE,	18,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Duskwood:35:35|t暮色森林--约根农场",		0,		-11016.8, -453.718, 30.59, 1.5695,		TEAM_NONE,	18,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2d0]={--湿地
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--米奈希尔城堡",			0,		-3696.47, -817.125, 10.241, 	2.607,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--米奈希尔港",			0,		-3770.9, -739.063, 8.04348, 	2.607,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--米奈希尔海湾",			0,		 -3592.11, -871.159, 12.9841, 	2.607,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--深水旅店",			0,		 -3804.28, -825.833, 10.0938, 	2.607,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--巴拉丁海湾",			0,		-3887.89, -612.492, 5.25833,	2.607,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--丹奥加兹",			0,		-4086.46, -2654.89, 37.3048,	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--丹莫德",			0,		-2612.35, -2442.92, 79.2276,	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--恶铁岭",			0,		-2907.14, -2910.19, 32.1938,	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--格瑞姆巴托",			0,		-4073.65, -3459.18, 281.387, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--黑水沼泽",			0,		-3423.95, -1430.13, 9.18884, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--恐龙岭",			0,		-3133.91, -3243.96, 63.3975, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--蓝腮沼泽",			0,		-3214.85, -1300.18, 8.43216, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--龙喉大门",			0,		-3421.89, -3583.3, 47.0302, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--绿带草地",			0,		-3169.58, -2558.71, 9.7217, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--怒牙营地",			0,		 -3613.03, -2546.77, 50.8978, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--日落沼泽",			0,		 -2892.27, -1504.08, 9.50941, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--萨多尔大桥",			0,		 -2510.22, -2491.67, 82.9861, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--瑟根石",			0,		 -3908.86, -2604.18, 41.7735, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--山洞",			0,		 -4259.34, -2978.98, 11.1885, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--山洞口",			0,		 -3544.94, -1976.28, 116.915, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--铁须之墓",			0,		 -2910.938, -2238.50, 20.899, 	0.30,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--维尔加挖掘场",			0,		 -3528.75, -1916.56, 39.2434, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--藓皮沼泽",			0,		-3766.43, -2877.3, 11.2509, 	2.607,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Wetlands_01:35:35|t湿地--盐沫沼泽",			0,		-2809.14, -1695.59, 10.1155, 	2.607,		TEAM_NONE,	20,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2e0]={--希尔布莱德丘陵
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--塔伦米尔",	0,		-32.116, -925.810, 54.47, 	5.64,		TEAM_HORDE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--南海镇",	0,		-860.03, -491.818, 13.3542, 	1.0392,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--碧玉矿洞",	0,		 -874.565, 177.513, 17.4726, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--达隆山",	0,		 -297.552, -429.615, 63.642, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--丹加洛克",	0,		 -1204.616, -1151.985, 39.299, 	3.81,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--东部海滩",	0,		 -1051.72, -779.284, 0.867466, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--敦霍尔德城堡",	0,		-616.193, -1354.98, 62.9045, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--奈杉德哨岗",	0,		 -884.78, -1078.75, 45.6664, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--南点哨塔",	0,		-688.522, 406.628, 75.7176, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--奈杉德哨岗哨塔",	0,		-649.117, -1045.39, 60.4148, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--达隆山哨塔",	0,		-324.73, -681.029, 54.5491, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--南海镇哨塔",	0,		-713.022, -429.89, 26.977, 2.36,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--赎罪岛",	0,		-1237.984, 405.257, 1.988, 	0.94,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--索拉丁之墙",	0,		-804.01, -1542.64, 54.2824, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--西部海岸",	0,		-1030.54, -97.8997, 6.66787, 	1.0392,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--希尔斯布莱德",	0,		-499.863, 102.039, 59.0568, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t希尔斯布莱德丘陵--希尔斯布莱德农场",	0,		-571.185, -2.26067, 47.0998, 	1.0392,		TEAM_NONE,	20,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x2f0]={--奥特兰克山脉
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--奥特兰克山谷部落",	0,		396.472, -1006.23, 111.719, 	1.0392,		TEAM_HORDE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--奥特兰克山谷联盟",	0,		5.5994, -308.738, 132.267, 	1.0392,		TEAM_ALLIANCE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--奥特兰克废墟北部",	0,		731.189, -338.435, 138.084, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--奥特兰克废墟城堡",	0,		518.815, -267.438, 151.703, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--冰风岗",	0,		277.471, -1430.68, 50.1448, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--达拉然巨坑",	0,		327.315, 223.283, 46.466, 	5.085,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--达伦德农场",	0,		1180.92, -368.611, 48.8737, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--高地",	0,		880.96, -803.823, 129.501, 	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--加文高地",	0,		-111.713, -87.187, 140.872,	0.23,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--绞刑场",	0,		464.018, -622.939, 169.46,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--考兰之匕",	0,		-79.4181, -576.857, 156.844,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--洛丹米尔湖",	0,		1395.74, -26.2069, 32.2045,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--洛丹米尔收容所",	0,		-66.897, 151.333, 55.536,	1.71,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--破碎岭城堡",	0,		670.328, -598.95, 163.920,	3.88,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--山头营地",	0,		-131.255, -310.239, 147.02,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--斯坦恩布莱德",	0,		640.605, -954.88, 164.556,	5.45,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--索菲亚高地",	0,		249.799, -808.255, 143.43,	4.53,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--屠杀谷",	0,		844.763, -560.007, 141.96,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--无草洞",	0,		208.593, -266.817, 145.226,	1.0392,		TEAM_NONE,	20,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HillsbradFoothills:35:35|t奥特兰克山脉--雾气湖岸",	0,		604.069, 190.985, 34.783,	1.0392,		TEAM_NONE,	20,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x300]={--阿拉希高地
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--落锤镇",		0,		 -1057.19, -3552.94, 53.3065,	0.490373,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--阿拉希战场入口",		0,		  -838.443, -3521.98, 72.7373,	0.490373,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--避难谷地",		0,		-1229.86, -2545.08, 21.1801,	0.490373,	TEAM_ALLIANCE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--博德戈尔",		0,		-1194.9, -2191.46, 55.0464,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--达比雷农场",		0,		-1134.46, -2858.89, 42.3535,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--东部禁锢法阵",		0,		-895.554, -3183.05, 67.0569,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--法迪尔海湾",		0,		-2071.51, -2125.53, 19.2058,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--格沙克农场",		0,		-1608.308, -3108.272, 15.747,	0.06,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--激流堡",		0,		-1589.761, -1803.703, 71.13,	3.17,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--阿拉索之塔",		0,		-1781.353, -1508.357, 64.92,	5.061450,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--枯木村",		0,		 -1758.12, -3400.55, 46.1542,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--枯须峡谷",		0,		 -1016.3, -3826.89, 144.977,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--圣殿",		0,		 -1528.3308, -1860.889, 69.57,	4.73,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--墓穴",		0,		-1549.662, -1925.028, 67.0048,	4.71,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--内禁锢法阵",		0,		  -1555.451, -2248.002, 34.173,	1.37,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--诺斯弗德农场",		0,		  -869.912, -2106.28, 45.0901,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--萨多尔大桥",		0,		  -2236.33, -2460.66, 81.4135,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--石拳大厅",		0,		  -1975.63, -2792.95, 81.1974,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--石拳岗哨",		0,		  -1193.46, -2112.09, 55.441,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--水下暗礁",		0,		  -2206.57, -1653.16, -2.07276,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--索拉丁之墙",		0,		  -875.068, -1626.73, 51.2503,	0.490373,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--外禁锢法阵",		0,		  -1353.636, -2706.405, 64.973,	4.74,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ArathiHighlands_01:35:35|t阿拉希高地--西部禁锢法阵",		0,		 -902.028, -1862.08, 70.134,	0.490373,	TEAM_NONE,	30,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x310]={--荆棘谷
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--格罗姆高营地",			0,		-12383.089, 168.305, 2.99,	4.83,		TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--阿博拉兹废墟",			0,		-13578.7, -220.415, 27.8028,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--奈辛瓦里远征队营地",			0,		-11684.7, -86.6643, 18.218,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--暗礁海",			0,		-12224.898, 647.986, -1.58,	1.16,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--巴拉尔废墟",			0,		-11994.9, 375.629, 2.28262,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--巴里亚曼废墟",			0,		-12535.4, -679.431, 40.593,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--薄雾山谷",			0,		-13910.296, 52.74, 16.149,	1.18,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--藏宝海湾",			0,		-14319.8, 444.777, 23.0319,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--港务局",			0,		-14356.1, 414.063, 6.6264,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--水手之家旅店",			0,		-14462.2, 489.315, 15.1198,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--储藏室",			0,		 -11519, -693.927, 35.8053,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--反抗军营地",			0,		-11374.4, -217.062, 75.2248,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--风险投资公司工作中心",			0,		 -11912.9, -507.963, 12.615,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--风险投资公司营地",			0,		-12073.5, -495.631, 12.5329,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--伽什废墟",			0,		-11840.9, 116.759, 15.6164,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--古拉巴什竞技场",			0,		-13289.4, 118.628, 24.4149,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--大竞技场",			0,		-13214.5, 248.443, 21.8586,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--哈圭罗岛",			0,		-14528.1, -110.312, 1.18759,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--加尼罗哨站",			0,		-14155.8, 684.119, 10.816,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--荆棘谷海角",			0,		-13024.1, -214.137, -10.4372,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--卡莱废墟",			0,		-12130.4, 22.6707, -4.29538,	3.7357,		TEAM_NONE,	30,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	{MENU, "下一页", TPMENU+0x1310,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x1310]={--荆棘谷
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--库尔森的营地",			0,		 -11619.2, -557.093, 32.4928,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--灵魂之穴",			0,		-13771.4, -6.7145, 42.6313,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--蛮荒海岸",			0,		-14439.1, 95.3057, 5.8246,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--米扎废墟",			0,		 -12473, -99.2694, 16.5907,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--莫什奥格食人魔山",			0,		-12335.6, -945.457, 10.2975,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--纳菲瑞提湖",			0,		-11997.7, -357.975, 10.6906,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--纳克迈尼圣泉",			0,		-13806.624, 377.059, 94.05,	5.17,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--南野人海岸",			0,		-13294.3, 524.82, 2.73296,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--风险投资公司山洞",			0,		-13102.019, -469.407, 50.694,	2.79,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--水晶海岸",			0,		-13824.9, -235.205, 0.497648, 3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--水晶矿洞",			0,		-13294.727, -459.194, 16.098,	5.44,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--血帆营地",			0,		-13506.97, 786.37, 1.928,	5.42,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--野人海岸",			0,		-12000, 805.784, 1.31086,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--尤亚姆巴岛",			0,		-11840.9, 1287.45, 2.16426,3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--赞塔加废墟",			0,		-12729.9, -501.066, 28.7785,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--朱布瓦尔废墟",			0,		-13296.7, 26.1369, 20.4809,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--祖丹亚废墟",			0,		-11661.22, 884.244, 5.275,	1.999,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--祖昆达废墟",			0,		-11650.1, 480.999, 42.7557,	3.7357,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--祖玛维废墟",			0,		-12899.34, -582.644, 58.85,3.90,		TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Stranglethorn_01:35:35|t荆棘谷--祖玛维废墟山洞",			0,		-13046, -626.91, 53.3838,	3.7357,		TEAM_NONE,	30,	0},
	{MENU, "上一页", TPMENU+0x310,GOSSIP_ICON_TAXI},
	{MENU, "返回东部王国地图选择", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x320]={--荒芜之地
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--奥达曼遗迹入口",		0,		-6092.07, -3181.8, 256.05,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--博夫营地",		0,		-7064.21, -3585.54, 241.666,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--尘风峡谷",		0,		-6368.62, -3636.92, 241.736,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--火山洞穴",		0,		-7302.1074, -2291.793, 246.50,		1.02,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--巨牙谷",		0,		-6760.189, -3135.550, 241.24,		3.71,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--卡格营地",		0,		-7106.184, -2389.258, 241.666,		3.306,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--卡加斯",		0,		-6720.11, -2213.26, 257.921,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--柯什营地",		0,		-6294.8230, -3664.969, 247.124,		4.905,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--苦痛堡垒",		0,		-6412.731, -3147.276, 301.335,		5.63,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--莱瑟罗峡谷",		0,		-6524.69, -4109.37, 263.942,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--漫尘盆地",		0,		-6661.14, -2920.36, 241.484,		5.6591,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--圣者之陵",		0,		-6943.24, -2459.41, 240.744,		5.6591,		TEAM_NONE,	35,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--铁趾挖掘场",		0,		 -6396.55, -3365.7, 241.665,		5.6591,		TEAM_NONE,	35,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--瓦格营地",		0,		-6770.67, -2782.69, 242.861,		5.6591,		TEAM_NONE,	35,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--雾气平原",		0,		-7055.467, -2820.4008, 241.731,		2.92,		TEAM_NONE,	35,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Badlands_01:35:35|t荒芜之地--造物者遗迹",		0,		-6097.59, -3292.86, 258.801,		5.6591,		TEAM_NONE,	35,	0},
    {MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x330]={--悲伤沼泽
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--避难营",		0,		-10150.8, -2843.03, 21.7105,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--迷雾谷",		0,		-10244.3, -2612.9, 28.6157,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--迷雾谷洞穴",		0,		-10109.5, -2401.51, 30.0049,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--断矛路口",		0,		-10388.3, -2702.24, 21.6777,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--禁忌之海",		0,		-10916.6, -4414.88, 12.5868,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--泪水之池",		0,		-10519.8, -3636.43, 20.2419,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--流沙泥潭",		0,		-10252.9, -2982.21, 21.1855,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--芦苇岗哨",		0,		-10838.2, -4037.26, 22.439,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--芦苇海滩",		0,		-10265.8, -4374.58, 2.26551,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--农田避难所",		0,		-10021.6, -3522.69, 21.6886,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--斯通纳德",		0,		-10459.200, -3279.760, 21.544,	0.73,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--雄鹿沼泽",		0,		-10759.916, -3738.522, 22.463,	3.94,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--雄鹿沼泽洞穴",		0,		-10944.389, -3629.768,22.665,	3.58,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--伊萨里奥斯的洞穴",		0,		 -10653.9, -2528.79, 25.7051,	5.2923,		TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SwampSorrows_01:35:35|t悲伤沼泽--忧伤湿地",		0,		-10320.929, -4122.933, 22.669,	1.35,		TEAM_NONE,	35,	0},
	 {MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x340]={--辛特兰
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--恶齿村",			0,		-586.44171, -4617.715, 9.35, 	0.85,	TEAM_HORDE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--蛮锤城堡",			0,		294.408, -2125.96, 121.623,  	0.981903,	TEAM_ALLIANCE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--毒雾峡谷",			0,		341.18, -2522.66, 191.912, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--禁忌之海",			0,		-863.289, -4429.64, 5.91616, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--奎尔丹尼小屋",			0,		157.8229, -2834.057, 106.576, 	0.59,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--拉普索迪营地",			0,		246.596, -2577.19, 160.165, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--爬虫废墟",			0,		173.211, -3441.907, 115.201, 	3.79,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--沙德拉洛",			0,		-181.265, -2950.41, 114.697, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--沙尔瓦萨",			0,		158.425, -4338.85, 120.023, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--瓦罗温湖",			0,		-90.8832, -3073.39, 117.772, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--望海崖",			0,		81.901, -4722.34, 8.8187, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--西利瓦萨",			0,		13.7737, -2852.918, 119.670, 	2.05,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--辛萨罗西南部",			0,		 -575.534, -3859.623, 238.449, 	0.34,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--辛萨罗西部山洞",			0,		-282.658, -3727.838, 239.751, 	1.03,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--辛萨罗北部入口",			0,		-213.579, -4132.855, 117.90, 	-0.42,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--亚戈瓦萨",			0,		396.627, -3430.79, 117.788, 	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--隐匿石",			0,		489.223, -3778.478, 115.74,  	3.79,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--鹰巢山",			0,		227.661, -2121.99, 117.098,	0.981903,	TEAM_NONE,	40,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰--祖尔祭坛",			0,		-242.833, -3379.933, 143.72,  	4.18,	TEAM_NONE,	40,	0}, 
    {TP, "|TInterface/ICONS/Achievement_Zone_Hinterlands_01:35:35|t辛特兰---祖瓦沙",			0,		-10.5685, -2499.5, 119.489,   	0.981903,	TEAM_NONE,	40,	0}, 
	 {MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x350]={--灼热峡谷
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--尘火谷",		0,		-6641.83, -1919.35, 244.15,	0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--大熔炉",		0,		-6767.51, -1539.14, 195.086,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--观火岭",		0,		-6635.514, -863.662, 244.142,	1398,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--黑石山",		0,		-7321.03, -1081.43, 277.069,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--黑炭谷",		0,		-7255.68, -800.879, 297.135,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--灰烬之海",		0,		-7091.48, -1395.36, 241.676,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--煤渣挖掘场",		0,		-7005.16, -1699.27, 243.267,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--溶渣之池",		0,		-6894.23, -1245.76, 178.854,0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--瑟银哨塔",		0,		-6529.569, -1168.536, 309.549,0.11,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--山洞",		0,		 -7271.7, -1940.6, 295.83,	0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--石坝小径",		0,		-6352.2, -2084.42, 243.507,	0.91688,	TEAM_NONE,	43,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_SearingGorge_01:35:35|t灼热峡谷--制皮匠营地",		0,		-7172.61, -1719.01, 244.233,0.91688,	TEAM_NONE,	43,	0},
	 {MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x360]={--诅咒之地
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--守望堡",		0,		-10993.837, -3446.292, 63.595,	1.59,	TEAM_ALLIANCE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--风暴祭坛",		0,		-11338.2, -2554.59, 87.4927,	3.20542,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--腐烂之痕",		0,		-11813.8, -2761.23, 7.37535,	3.20542,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--黑暗之门",		0,		-11849, -3201.17, -28.8851, 	3.20542,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--巨槌岗哨",		0,		-11508.098, -2792.494, -0.426,	4.532,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--巨槌要塞",		0,		-10985.9, -2775.21, 4.75033,	3.20542,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--盘蛇谷",		0,		-11305.593, -3375.509, 7.86,	4.23,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--污染者高地",		0,		-11353.405, -2970.617,4.74,	4.09,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BlastedLands_01:35:35|t诅咒之地--要塞军械库",		0,		 -10904, -3173.03, 49.5924,	3.20542,	TEAM_NONE,	45,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x370]={--燃烧平原
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--摩根的岗哨",		0,		 -8361.483, -2751.437, 185.376,	2.96,	TEAM_ALLIANCE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--德拉考达尔",		0,		-8187.56, -1086.34, 149.453,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--风暴祭坛",		0,		-7623.33, -719.591, 182.751,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--黑石山山脚",		0,		-8018.69, -1211.62, 141.614,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--黑石山南正门",		0,		-7810.54, -1133.29, 214.553,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--黑石小径",		0,		-8539.13, -2560.64, 133.148,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--黑石要塞",		0,		-7725.798, -1563.326, 132.333,	1.68,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--滑石",		0,		-7661.99, -2998.04, 137.77,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--灰烬之柱",		0,		-8083.06, -1814.51, 141.146,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--巨槌石东北洞",		0,		-7788.70, -2692.01, 175.185,	2.16,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--巨槌石中部山顶洞",		0,		-7918.54, -2627.61, 221.168,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--烈焰峰",		0,		-7499.819, -2177.60, 165.75,	5.6,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--龙翼小径",		0,		-7516.28, -2763.49, 172.965,	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--山洞",		0,		-8401.9, -1201.53, 187.228, 	5.10148,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BurningSteppes_01:35:35|t燃烧平原--索瑞森废墟",		0,		-7893.07, -2264.86, 137.227, 	5.10148,	TEAM_NONE,	50,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x380]={--西瘟疫之地
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--亡灵壁垒",		0,		1691.46, -720.27, 57.02,	4.05,	TEAM_HORDE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--寒风营地",		0,		989.128, -1463.42, 60.6358,	5.23722,	TEAM_ALLIANCE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--费尔斯通农场",		0,		1798.171, -1129.252, 60.028,	3.85,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--安多哈尔废墟",		0,		1382.750, -1529.900, 59.73,4.72,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--达尔松之泪",		0,		1923.978, -1523.565, 61.90,	3.83,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--嚎哭鬼屋",		0,		1506.561, -1796.209, 60.079,	5.01,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--盖罗恩农场",		0,		1769.82, -2275.77, 59.6117,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--北山伐木场",		0,		2406.31, -1629.41, 106.304,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--壁炉谷",		0,		2827.901, -1481.400, 146.087,	5.87,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--达隆米尔湖",		0,		1454.83, -2034.95, 51.5348,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--悔恨岭",		0,		1161.68, -1761.59, 60.5599,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--乌瑟尔之墓",		0,		1016.28, -1811.38, 77.2663,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--哭泣之洞",		0,		2255.52, -2403.15, 60.1134,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--玛登霍尔德城堡",		0,		2923.44, -1429.73, 150.782,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--墓穴",		0,		1062.49, -1920.18, 53.7634,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--哨塔",		0,		2669.99, -1907.17, 65.7472,	5.23722,	TEAM_NONE,	51,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_WesternPlaguelands_01:35:35|t西瘟疫之地--索多里尔河",		0,		1925.54, -2567.93, 61.9953,	5.23722,	TEAM_NONE,	51,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x390]={--逆风小径
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--沉睡峡谷",	0,-10678, -2064.12, 120.313, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--埃瑞丁营地",	0,-10485.1, -2136.68, 90.8279, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--格罗高克营地",	0,-11109.8, -2330.71, 118.074, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--摩根墓场",	0,-11117.1, -1832.04, 71.8642, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--墓穴",	0,-11068.9, -1828.46, 60.2565, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--逆风谷",	0,-10567.44, -1815.164, 102.93, 1.19,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--罪恶谷",	0,-10822.3, -2140.99, 121.964, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--罪恶谷东山洞",	0,-10888.7, -2292.54, 117.131, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--罪恶谷西山洞",	0, -10901, -2164.57, 117.131, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--死者十字",	0,-10461.1, -1720.56, 84.1097, 3.18,		TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t逆风小径--麦迪文的酒窖",	0,-11172.1, -2028.43, 48.0854, 3.18,		TEAM_NONE,	50,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x3a0]={--东瘟疫之地
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--北池哨塔",		0,		3164.35, -4330.66, 133.284,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--北谷",		0,		3026.97, -4897.57, 101.03,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--病木林",		0,		 2995.95, -3486.56, 149.419,	4.747,		TEAM_NONE,	53,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--布洛米尔",		0,		2431.336, -5114.044, 79.547,	5.84,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--达隆郡",		0,		1485.21, -3675.61, 80.0312,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--东墙大门",		0,		3168.6, -4041.16, 104.809,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--东墙哨塔",		0,		 2533.95, -4765.68, 103.947,4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--恶蛛隧道西口",		0,		2743.79, -2468.12, 74.3867,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--恶蛛隧道东口",		0,		3047.43, -2780.94, 104.113,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--黑木湖",		0,		2515.25, -4239.97, 76.2265,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--皇冠哨塔",		0,		1867.18, -3680.51, 155.674,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--剧毒林地",		0,		2671.34, -5297.7, 151.86,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--考林路口",		0,		1987.319, -4458.649, 73.742,	1.57,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--恐惧谷",		0,		2946.87, -2904.73, 102.282,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--奎尔林斯小屋",		0,		3389.97, -4224.36, 155.793,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--玛瑞斯农场",		0,		1864.99, -3236.07, 125.656,	4.747,		TEAM_NONE,	53,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	{MENU, "下一页", TPMENU+0x13a0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x13a0]={--东瘟疫之地
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--玛兹拉罗",		0,		3440.47, -4982.67, 195.747,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--米雷达尔湖",		0,		1828.16, -4476.69, 73.1965,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--蘑菇谷",		0,		2318.34, -3598.88, 165.453,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--魔刃之痕",		0,		1908.64, -4096.22, 75.2948,	4.747,		TEAM_NONE,	53,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--墓室",		0,		1615.21, -3233.69, 82.2691,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--圣光之愿礼拜堂",		0,		2276.75, -5284.66, 82.5472,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--索多里尔河",		0,		1925.51, -2650.8, 59.6223,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--提尔之手",		0,		1684.447, -5217.47, 73.8286,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--提尔之手修道院",		0,		1738.7, -5325.165, 73.611,	4.05,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--瘟疫之痕",		0,		2037.62, -4969.62, 72.3304,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--血色十字军教堂",		0,		1627.197, -5497.511, 100.833,	4.16,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--血色十字军营地",		0,		1666.68, -4895.77, 84.625,	4.747,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--血色领地废墟",		0,		1602.6308, -5753.735, 119.41,	2.03,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--死亡裂口",		0,		2355.733, -5708.075, 153.92,	2.35,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--阿彻鲁斯:黑锋要塞",		0,		2348.629, -56693290, 382.324,	0.64,		TEAM_NONE,	53,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_EasternPlaguelands:35:35|t东瘟疫之地--祖玛沙尔",		0,		3287.57, -4851.19, 170.111,	4.747,		TEAM_NONE,	53,	0},
	{MENU, "上一页", TPMENU+0x3a0,GOSSIP_ICON_TAXI},
	{MENU, "返回东部王国地图选择", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x3b0]={--奎尔丹纳斯岛
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--阳湾圣殿",	530,	12786.917,	-6886.908,	13.388,	1.34,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--阳湾港口旅店",	530,	12841.525,	-7012.20,	18.593,	0.02,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--银月之傲",	530,	12810.488,	-7092.764,	6.986,	2.48,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--阳湾军械库",	530,	12682.514,	-6957.949,	36.251,	5.81,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--黎明广场",	530,	12600.997,	-6916.858,	4.602,	3.11,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--晨星村",	530,	12654.0947,	-6762.905,	4.942,	0.462,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--破碎残阳基地",	530,	12889.707,	-6875.440,	9.06,	3.57,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--阳湾港口",	530,	13008.809,	-6913.562,	9.58,	5.74,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--辛洛雷号",	530,	13221.346,	-7061.528,	2.896,	1.38,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--血誓号",	530,	13332.062,	-6999.533,	3.470,	1.54,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--曙光追寻者号",	530,	13285.800,	-7137.118,	4.186,	4.71,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--绿鳃海岸",	530,	12588.162,	-7314.491,	0.63,	3.98,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--死亡之痕",	530,	12289.298,	-7057.200,	50.783,3.67,		TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_IsleOfQuelDanas:35:35|t奎尔丹纳斯岛--魔导师平台",	530,	12889.564,	-7299.229,	65.36,	5.387,		TEAM_NONE,	68,	0},
	{MENU, "上一页", TPMENU+0x220,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x3c0]={--卡利姆多
			{MENU, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛",			TPMENU+0x3d0,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛",			TPMENU+0x3e0,	GOSSIP_ICON_TAXI,TEAM_NONE,		1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔",		TPMENU+0x3f0,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔",		TPMENU+0x400,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷",			TPMENU+0x410,	GOSSIP_ICON_TAXI,TEAM_NONE,	1,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸",			TPMENU+0x420,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地",		TPMENU+0x430,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉",		TPMENU+0x440,	GOSSIP_ICON_TAXI,TEAM_NONE,	15,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷",		TPMENU+0x450,	GOSSIP_ICON_TAXI,TEAM_NONE,	18,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林",	TPMENU+0x460,	GOSSIP_ICON_TAXI,TEAM_NONE,	30,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地",		TPMENU+0x470,	GOSSIP_ICON_TAXI,TEAM_NONE,	30,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽",		TPMENU+0x480,	GOSSIP_ICON_TAXI,TEAM_NONE,	35,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯",			TPMENU+0x490,	GOSSIP_ICON_TAXI,TEAM_NONE,	40,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯",	TPMENU+0x4a0,	GOSSIP_ICON_TAXI,TEAM_NONE,	40,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉",		TPMENU+0x4b0,	GOSSIP_ICON_TAXI,TEAM_NONE,	45,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林",		TPMENU+0x4c0,	GOSSIP_ICON_TAXI,TEAM_NONE,	48,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山",	TPMENU+0x4d0,	GOSSIP_ICON_TAXI,TEAM_NONE,	48,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯",		TPMENU+0x4e0,	GOSSIP_ICON_TAXI,TEAM_NONE,	50,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷",			TPMENU+0x4f0,	GOSSIP_ICON_TAXI,TEAM_NONE,	55,	0},
			{MENU, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地",			TPMENU+0x500,	GOSSIP_ICON_TAXI,TEAM_NONE,	10,	0},
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},
		
		[TPMENU+0x3d0]={--秘蓝岛
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--坠毁点",			530,	-4137.058,	-13759.769,	74.60,	1.155,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--碧蓝岗哨",			530,	-4190.816,	-12501.346,	44.36,	4.76,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--止松要塞",			530,	-3353.360,	-12400.500,	26.078,	2.35,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--奥德修斯营地",			530,	-4712.963,	-12409.886,	11.915,	0.632,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--月痕林地",			530,	-4105.259,	-12835.548,	7.532,	0.249,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--灰烬林地",			530,	-3338.766,	-12855.503,	15.508,	5.3,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--兽笼残骸",			530,	-3229.424,	-12632.843,	38.628,	4.75,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--玉桥海滩",			530,	-2937.430,	-12644.055,	1.855,	5.368,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--淤泥海岸",			530,	-3248.549,	-11900.041,	1.235,	1.335,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--完整的逃生舱",			530,	-4425.738,	-11913.686,	18.213,	6.18,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--刺臂村",			530,	-4499.1284,	-11650.463,13.592,	1.57,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--怒鳞岗哨",			530,	-4934.911,	-11631.134,	12.482,	4.50,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--海潮洞窟",			530,	-4805.460,	-11582.084,	-8.04,	-1.55,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--埃门海滩",			530,	-4225.7109,	-13047.081,	0.88,	1.10,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--埃门谷",			530,	-3963.588,	-13608.293,	55.735,	1.31,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--埃门平原",			530,	-4236.486,	-13472.496,	45.532,	0.249,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--木巢山",			530,	-4445.213,	-13869.699,	98.81,	3.68,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--暗影山",			530,	-4540.940,	-13320.466,	77.83,	2.85,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--吉兹尔的营地",			530,	-4609.878,	-12833.855,	4.086,	5.11,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_AzuremystIsle_01:35:35|t秘蓝岛--残破的逃生舱",			530,	-4451.4669,	-12672.124,	19.169,	2.01,	TEAM_NONE,	1,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		
		[TPMENU+0x3e0]={--秘血岛
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--秘血岗哨",			530,	-1968.251,	-11878.464,	48.75,	6.13,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--守备官营地",			530,	-1770.654,	-11063.800,	76.583,	5.64,	TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--凯尔希路口",			530,	-2663.717,	-12134.757,16.97,1.18,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--贝里尔海湾",			530,	-2609.826,	-12368.727,	2.495,	3.30,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--刺臂领地",			530,	-2552.638,	-12290.398,	13.878,	5.46,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--损坏的兽笼",			530,	-2570.4624,	-11996.682,	24.847,	1.31,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--怒鳞巢穴",			530,	-2239.574,	-12296.196,	55.226,	4.83,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--红砂海滩",			530,	-2141.956,	-12456.967,	2.174,	4.72,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--血咒岛",			530,	-1934.309,	-12876.523,	85.793,	3.61,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--龙痕岛",			530,	-1331.785,	-12383.831,	19.928,	5.23,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--龙爪丘陵",			530,	-1218.20,	-12448.206,	95.102,	5.80,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--绿龙尖岬",			530,	-1038.254,	-12572.649,	23.157,	5.86,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--血咒暗礁",			530,	-1250.383,	-12793.612,	0.245,	0.174,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--跳跃引擎",			530,	-1146.599,	-11835.113,	2.22,	2.72,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--血浪海滩",			530,	-1188.541,	-11697.57,	3.261,	0.50,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--阿克萨林",			530,	-1543.143,	-11289.314,	68.757,	3.75,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--贝里尔海湾",			530,	-2609.826,	-12368.727,	2.495,	3.30,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--污淤之池",			530,	-1604.996,	-11019.166,	61.524,	5.85,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--琥珀蛛网小径",			530,	-1597.791,	-10801.729,	61.165,	4.69,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--藏帆暗礁",			530,	-1167.841,	-11135.582,-1.54,	1.08,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--怒羽山",			530,	-1476.590,	-11891.750,	23.905,	4.93,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--洛雷萨兰废墟",			530,	-1731.396,	-12086.129,	21.42,	3.08,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--刀林",			530,	-1728.321,	-11668.316,	36.833,	1.124,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--塔希恩的营地",			530,	-1647.947,	-10918.294,	58.931,	4.10,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--矢量感应器",			530,	-1958.695,	-10690.940,	111.222,	4.23,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--冷却核心",			530,	-2025.1088,	-113361.472,66.264,	2.62,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--纳兹维安",			530,	-2399.900,	-11343.967,	28.39,	1.30,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--黑沙海岸",			530,	-2781.541,	-11232.532,	4.49,	2.82,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--神木林",			530,	-2630.907,	-11567.380,	21.406,	5.17,	TEAM_NONE,	1,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_BloodmystIsle_01:35:35|t秘血岛--废墟谷",			530,	-2382.3618,	-11771.08,18.302,	1.49,	TEAM_NONE,	1,	0},
        {MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x3f0]={--泰达希尔
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--多兰纳尔",		1,		9870.3, 945.384, 1307.11,	1.9336,		TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--鲁瑟兰村",		1,		8698.87, 944.392, 13.5059,	1.9336,		TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--奥达希尔",		1,		10388, 755.961, 1319.61,	1.9336,		TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--幽影谷",		1,		10237.1, 703.708, 1353.1,	1.9336,		TEAM_ALLIANCE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--阿里斯瑞恩之池",		1,		9567.29, 1738.23, 1292.55,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--奥拉密斯湖",		1,		9490.28, 1089.95, 1251.56,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--班奈希尔兽穴",		1,		9865.04, 1557.22, 1329.29,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--班尼希尔山谷",		1,		10036.5, 1453.66, 1274.97,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--大断崖",		1,		10312.4, 1197.55, 1457.73,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--地狱石",		1,		10045.9, 1031.06, 1329.81,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--脊骨堡",		1,		9213.83, 1651.5, 1330.27,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--神谕林地",		1,		10674.1, 1955.94, 1340.36,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--星风村",		1,		9884.67, 449.893, 1302.66,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--涌泉河",		1,		10919.2, 1604.9, 1273.15,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--涌泉湖",		1,		10379.6, 1627.63, 1288.72,	1.9336,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t泰达希尔--黑丝洞",		1,		10756.8, 920.99, 1338.61,	1.9336,		TEAM_NONE,	1,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x400]={--杜隆塔尔
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--大兽穴",		1,		 -604.279, -4197.09, 41.0992,0.416883,	TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--森金村",		1,		-829.442, -4921.48, 19.926,	0.416883,	TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--剃刀岭",		1,		310.202, -4731.23, 9.71725,	0.416883,	TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--剃刀岭兵营",		1,		308.813, -4787.97, 10.5226,	0.416883,	TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--试炼谷",		1,		-398.7311, -4314.903, 43.491,	0.73,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--火刃集会所",		1,		-176.18, -4359.71, 68.3903, 0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--暗矛海滩",		1,		-999.737, -4895.38, 1.67484,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--回音群岛",		1,		-1196.047, -5566.691, 8.927,3.28,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--科卡尔峭壁",		1,		-981.493, -4635.78, 25.5947,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--钢鬃营地",		1,		121.787, -4333.36, 64.3818,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--提拉加德城堡",		1,		-246.195, -5062.02, 21.2401,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--流亡海岸",		1,		8.37607, -5146.48, 1.4659,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--枯水谷",		1,		 841.221, -4706.86, 11.8417,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--托克雷农场",		1,		710.866, -4267.22, 17.8388,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--烈风峡谷",		1,		684.472, -4637.77, -2.23712,	0.416883,	TEAM_NONE,	1,	0},		
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--雷霆山",		1,		670.336, -4035.84, -2.29906,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--东部王国飞艇乘坐点",		1,		1341.14, -4642.33, 24.6173,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--诺森德飞艇乘坐点",		1,		1167.255, -4162.741, 22.71,2.15,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--石牙农场",		1,		1255.08, -4194.97, 26.8562,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--骷髅石",		1,		1455.69, -4873.83, 12.4024,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--刃拳海湾",		1,		1243.79, -5042.27, 2.27115,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--死眼海岸",		1,		802.211, -5068.46, 3.26741, 0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--野猪农场",		1,		1213.25, -4517.23, 20.881,	0.416883,	TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Durotar:35:35|t杜隆塔尔--怒水河",		1,		 315.273, -3799.12, 25.8972,	0.416883,	TEAM_NONE,	1,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x410]={--莫高雷
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t红云台地--纳拉其营地",			1,		-2918.93, -269.403, 53.9155,	0.6525,		TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--血蹄村",			1,		-2313.435, -375.763, -9.381,	4.03,		TEAM_HORDE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t红云台地--红云台地",			1,		 -3064.68, 93.6216, 77.908,	0.6525,		TEAM_NONE,	1,	0},	
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t红云台地--刺刃峡谷山洞",			1,		-3179.25, -946.314, 50.4207, 	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t红云台地--刺刃峡谷",			1,		-3064.69, -1218.22, 82.9231,	0.6525,		TEAM_NONE,	1,	0},	
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t红云台地--水井",			1,		-3036.41, -524.268, 31.5372,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--草海平原",			1,		-2623.906, -1152.288, -3.11,	1.70,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--冰蹄水井",			1,		-2563.626, -673.308, -7.576,	5.12,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--石牛湖",			1,		-2070.93, -380.471, -10.1679,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--白鬃石",			1,		-2396.52, 300.346, 65.8646,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--被破坏的货车",			1,		-1948.12, -778.582, -6.91577,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--巴尔丹挖掘场",			1,		-1944.56, 386.175, 133.882,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--风险投资公司矿洞南入口",			1,		-1918.395 -1094.195, 74.93,	5.68,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--雷角水井",			1,		-1817.747, -203.85, -9.42486,	4.46,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--山洞",			1,		-1522.06, 331.117, 63.3597,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--风险投资公司矿洞北出口",			1,		-1499.37, -1032.45, 151.313,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--金色平原",			1,		-1103.43, -679.532, -56.4998,	0.6525,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--蛮鬃水井",			1,		-720.734, -178.523, -25.02,	2.28,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--赤色石",			1,		-970.685, -1014.486, 14.992,	4.63,		TEAM_NONE,	1,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Mulgore_01:35:35|t莫高雷--狂风山",			1,		-665.153, -664.534, -4.70651, 	0.6525,		TEAM_NONE,	1,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x420]={--黑海岸
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--奥伯丁",			1,		6388.4726, 495.754,7.94,4.02,	TEAM_ALLIANCE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸-长桥码头",			1,		 6423.76, 816.426, 5.48901,	4.33534,	TEAM_ALLIANCE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--暮光谷",			1,		4397.01, 210.904, 52.2822,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--主宰之剑",			1,		4549.8, 341.911, 48.9418,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--黑木洞穴",			1,		4662.401, 73.783, 60.802,	3.95,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--雷姆塔维尔挖掘场",			1,		4680.35, 572.982, 23.8605,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--古树之林",			1,		 4944.97, 108.54, 55.8681,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--急弯河",			1,		 5051.97, 237.133, 31.4498,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--暮光海岸",			1,		5309.84, 559.166, 3.31412,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--亚米萨兰",			1,		5787.85, 180.039, 41.5586,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--亚米萨东侧山洞",			1,		5983.52, 38.7474, 28.4178,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--奥伯丁东侧山洞",			1,		6364.58, -30.3912, 28.5898,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--薄雾海",			1,		6543.71, 923.879, 5.99562,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--巴莎兰东侧山洞",			1,		6712.79, -452.383, 73.2985,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--巴莎兰",			1,		6779.68, 24.8477, 26.0042,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--峭壁之泉",			1,		6876.707, -655.405, 84.619,	0.58,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--奥萨拉克斯之塔",			1,		7196.085, -735.342, 59.64,	2.93,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--壁泉河",			1,		7255.38, -359.084, 24.9089,	4.33534,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Darkshore_01:35:35|t黑海岸--玛塞斯特拉废墟",			1,		 7323.1376, -780.203, 16.128,	4.88,	TEAM_NONE,	10,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x430]={--贫瘠之地
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--前沿哨所",		1,		234.748, -3641.01, 30.3901,	5.83412,	TEAM_HORDE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--荣耀岗哨",		1,		-400.1668, -1378.849, 91.7004,	2.233,	TEAM_HORDE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--十字路口",		1,		-459.441, -2650.06, 95.5753,	5.83412,	TEAM_HORDE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--陶拉祖营地",		1,		-2343.78, -1942.4, 95.7936,	5.83412,	TEAM_HORDE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--莫尔杉营地",		1,		1035.33, -2100.24, 122.945,	5.83412,	TEAM_HORDE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--石矿洞",		1,		1358.791, -3595.561, 93.790,	3.37,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--摩尔沙农场",		1,		1109.03, -2280.6, 100.516,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--淤泥沼泽",		1,		972.456, -3042.379, 91.038,	0.39,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--无水岭",		1,		642.974, -1277.9, 97.987,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--怒水河",		1,		412.204, -3740.8, 24.9756,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--鬼雾峰",		1,		 334.449, -2263.118, 243.419,	3.04,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--鬼雾兽穴",		1,		322.914, -2225.942, 227.669,1.91,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--格罗多姆农场",		1,		259.405, -3056.2, 97.1408,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--黄金之路",		1,		112.104, -2708.353, 91.693,	0.17,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--遗忘之池",		1,		-4.30604, -1955.27, 92.253,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--荆棘岭",		1,		-133.545, -3052.01, 118.275,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--甜水绿洲",		1,		 -957.581, -2164.28, 127.675,	5.83412,	TEAM_NONE,	10,	0},
		{MENU, "上一页", TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	    {MENU, "下一页", TPMENU+0x1430,GOSSIP_ICON_TAXI},
	},
	    [TPMENU+0x1430]={--贫瘠之地
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--哀嚎洞穴",		1,		-828.626, -2033.86, 80.7732,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--棘齿城",		1,		-955.219, -3678.92, 8.29946,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--死水绿洲",		1,		-1197.05, -2999.02, 91.3633,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--提度斯阶梯",		1,		-1357.94, -4018.48, 16.8351,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--阿迦玛戈",		1,		-1518.59, -1621.06, 107.263,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--勇士岛",		1,		-1647.44, -4287.25, 17.1012,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--南黄金之路",		1,		-1703.1, -2555.15, 91.6676, 	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--商旅海岸",		1,		-1755.76, -3767.08, 7.67804,5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--南贫瘠之地",		1,		-1839.01, -2377.99, 96.5065,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--北方城堡",		1,		-1947.709, -3650.495, 25.141,	3.81,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--迅猛龙巢穴",		1,		 -1990.6, -3199.69, 92.2844,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--迅猛龙平原",		1,		-2166.37, -2480.64, 95.4701,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--巨人旷野",		1,		-3175.77, -2149.88, 92.6629,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--黑棘山",		1,		-3638.81, -1780.67, 133.64,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--巴尔丹城堡",		1,		-4038.684, -2255.787, 106.830,	4.23,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--巴尔莫丹",		1,		-4133.143, -2111.035, 68.550,	5.44,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--剃刀高地",		1,		 -4450.16, -2000.44, 84.9918,	5.83412,	TEAM_NONE,	10,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Barrens_01:35:35|t贫瘠之地--剃刀沼泽",		1,		-4482.85, -1734.37, 86.6755,	5.83412,	TEAM_NONE,	10,	0},
		{MENU, "上一页", TPMENU+0x430,GOSSIP_ICON_TAXI},
	{MENU, "返回卡利姆多地图选择", TPMENU+0x3c0,GOSSIP_ICON_TAXI},	
	},	
		
		[TPMENU+0x440]={--石爪山脉
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--石爪峰",		1,		2656.1, 1468.04, 229.039,	3.8013,		TEAM_ALLIANCE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--烈日石居",		1,		960.578, 916.128, 104.81,	3.8013,		TEAM_HORDE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--玛拉卡金",		1,		-194.035, -329.877,10.52,5.03,		TEAM_HORDE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--滚岩峡谷",		1,		-197.514, 109.449, 96.7385,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--滚岩洞穴",		1,		-97.099, 222.730, 102.58,	2.67,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--阿柏拉耶营地",		1,		-14.9681, -533.455, -37.1936,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--巨木谷",		1,		11.3342, -236.579, 7.64951,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--恐怖图腾岗哨",		1,		93.5799, -582.161, 6.32167,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--希塞尔山谷",		1,		427.308, 476.849, 98.123,	1.26,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--蛛网小径",		1,		594.099, 325.205, 46.2178,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--焦炭谷",		1,		713.287, 1407.26, -10.3684,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--狂风峭壁小屋",		1,		906.99, 360.34, 23.0412,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--狂风矿洞",		1,		999.720, -341.220, 1.930,	2.226,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--黑狼河",		1,		1180.13, -194.363, -6.80962,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--狂风峭壁",		1,		1315.760, -49.987, 6.06,	4.73,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--石爪小径",		1,		1535.8, -577.729, 68.0464,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--峭壁湖",		1,		1615.866, 116.601, 99.140,	1.154,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--暗色湖",		1,		1647.64, 883.784, 132.693,	3.8013,		TEAM_NONE,	15,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Stonetalon_01:35:35|t石爪山脉--猛禽洞穴",		1,		2429.580, 1774.677,380.287,	2.06,		TEAM_NONE,	15,	0},
		{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
		},
		
		[TPMENU+0x450]={--灰谷
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--阿斯特兰纳",		1,		2721.66, -381.38, 107.089, 	6.14177,	TEAM_ALLIANCE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--银风避难所",		1,		2145.19, -1189.1, 95.5624, 	6.14177,	TEAM_ALLIANCE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--林歌神殿",		1,		2963.55, -3220.36, 168.753, 	6.14177,	TEAM_ALLIANCE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--迈斯特拉岗哨",		1,		3229.6, 164.194, 8.12506, 	6.14177,	TEAM_ALLIANCE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--银翼树林(战歌峡谷入口）",		1,		1437.69, -1856.04, 133.462, 	6.14177,	TEAM_ALLIANCE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--碎木岗哨",		1,		2373.04, -2528.62, 108.634, 	6.14177,	TEAM_HORDE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--佐拉姆加前哨站",		1,		3361.468, 1007.753, 3.74, 	3.22,	TEAM_HORDE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--卡加希亚要塞",		1,		2440.75, -3495.79, 97.2133, 	6.14177,	TEAM_HORDE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--坠星湖",		1,		1461.02, -2163.02, 91.8942, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--战歌劳工营地",		1,		1545.39, -2416.03, 98.2762, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--血牙营地",		1,		1631.94, -1444.07, 149.466,  	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--屠魔峡谷",		1,		1692.25, -3416.36, 144.901, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--银翼哨站",		1,		1748.025, -2087.603, 100.31, 	0.2,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--朵丹尼尔兽穴",		1,		1777.93, -2662.77, 109.426, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--密斯特拉湖",		1,		1789.338, -1273.916, 140.266, 	1.68,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--南部月亮井",		1,		1882.4, -1751.8, 59.1552, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--夜歌森林",		1,		1929.01, -2172.01, 93.8349, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--石爪小径",		1,		1940.35, -782.189, 101.34, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--弗伦河",		1,		1980.26, -1966.77, 99.3068, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--冥火岭",		1,		2036.296, -2971.980, 105.952, 	1.25,	TEAM_NONE,	18,	0},
		{MENU, "上一页", TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	    {MENU, "下一页", TPMENU+0x1450,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x1450]={--灰谷
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--星尘废墟",		1,		2111.49, -257.274, 97.4842, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--火痕神殿",		1,		2200.001, 211.678, 144.763, 	0.75,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--绿爪村",		1,		2265.044, -1404.268, 84.68, 	4.97,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--林荫小径",		1,		2321.906, -1898.228, 70.198, 	2.73,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--战歌伐木场",		1,		2363.2, -3364.48, 125.701,  	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--夜道谷",		1,		2517.746, -2181.959, 199.952, 	0.95,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--林中树居",		1,		2671.97, -1858.71, 187.993, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--艾森娜神殿",		1,		2688.78, 369.109, 67.3201, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--萨提纳尔",		1,		2741.040, -2943.735, 140.87, 	4.91,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--伊瑞斯湖",		1,		2816.17, -981.012, 197.678, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--怒水河",		1,		2829.43, -3773.83, 86.2927, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--萨维亚",		1,		2852.1726, -2794.87, 203.233, 	6.25,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--北部月亮井",		1,		2893.06, -1353.32, 207.853, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--法拉希姆湖",		1,		3110.86, 556.434, 12.9981, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--蓟皮村",		1,		3304.86, -435.652, 149.879, 6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--蓟皮要塞",		1,		3495.56, -525.356, 188.428, 6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--奥迪拉兰废墟",		1,		 3531.79, -84.751, 14.9957, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--巴斯兰鬼屋",		1,		3826.69, -119.142, -0.23258, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--佐拉姆海岸",		1,		3953.11, 769.74, 7.84724, 	6.14177,	TEAM_NONE,	18,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Ashenvale_01:35:35|t灰谷--黑暗深渊",		1,		 4125.04, 866.534, 9.7461, 	6.14177,	TEAM_NONE,	18,	0},
		{MENU, "上一页", TPMENU+0x450,GOSSIP_ICON_TAXI},
	    {MENU, "返回卡利姆多地图选择", TPMENU+0x3c0,GOSSIP_ICON_TAXI},	
	},	
	
	[TPMENU+0x460]={--千针石林
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--乱风岗",		1,		-5437.73, -2442.85, 89.8018,	2.41885,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--白沙岗哨",		1,		-4904.34, -1376.79, -52.6124,	2.41885,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--铁石营地",		1,		-5847.9, -3434.2, -50.9581, 	2.41885,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--升降梯",		1,		-4613.49, -1862.69, 86.0467,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--伊索克营地",		1,		-4671.751, -1277.856, -44.524,	1.09,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--裂蹄峭壁",		1,		-5061.15, -2237.41, -54.1066,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--裂蹄堡",		1,		-5066.04, -2369.7, -53.3816,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--风巢",		1,		-5125.63, -1084.16, 48.3204,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--黑云峰",		1,		-5130.508, -1897.210, 87.36,	5.45,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--老屋",		1,		-5217.68, -2793.56, -7.21544,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--风裂峡谷",		1,		-5391.4, -2877.7, -57.2471,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--尖啸峡谷",		1,		 -5484.129, -1911.436,-52.55,	2.94,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t千针石林--飞羽洞穴",		1,		-5505.2133, -1566.839, 26.550,	4.07,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t闪光平原--闪光平原",		1,		-5523.19, -4044.42, -57.8831,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t闪光平原--维吉尔之坑",		1,		-5793, -3909.05, -91.1991,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t闪光平原--沙漠赛道",		1,		-6216.6, -3930.09, -58.75,	2.41885,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t闪光平原--塔霍达废墟",		1,		-6478.534, -3894.212, -58.749,	3.27,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ThousandNeedles_01:35:35|t闪光平原--锈锤挖掘场",		1,		-6541.391, -3532.039, -58.749,	0.345,	TEAM_NONE,	30,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x470]={--凄凉之地
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--尼耶尔前哨站",		1,		 189.305, 1309.46, 190.317,	3.29553,	TEAM_ALLIANCE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--葬影村",		1,		 -1649.737, 3090.521, 30.605,4.55,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--幽灵岗哨",		1,		-1205.52, 1725.21, 90.4607,	3.29553,	TEAM_HORDE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--拉纳加尔岛",		1,		 125.929, 2972.17, 1.99125, 3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--塔迪萨兰",		1,		56.9561, 1836.58, 113.298,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--萨格隆",		1,		-150.532, 995.289, 93.2392,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--萨瑟里斯海岸",		1,		-243.86, 2400.85, 22.044,3.709,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--雷斧堡垒",		1,		 -425.846, 1733.859, 133.806,	5.13,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--艾瑟雷索",		1,		 -440.84, 2474.8, 107.764,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--考米克小屋",		1,		 -696.644, 1475.67, 90.6087,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--科卡尔村",		1,		 -1026.88, 935.079, 92.17,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--长矛谷北部村落",		1,		-1205.67, 2705.4, 111.183, 	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--科多兽坟场",		1,		-1221.04, 1906.2, 60.7416,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--瑟卡布斯库的营地",		1,		  -1380.98, 1518.1, 59.0562,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--长矛谷中部村落",		1,		 -1387.4, 2800.36, 111.667,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--玛拉顿",		1,		 -1420.94, 2909.99, 137.43,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--玛格拉姆村",		1,		 -1727.64, 961.339, 90.5805,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--玛诺洛克集会所",		1,		 -1827.36, 1975.19, 59.5676,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--破影峡谷",		1,		-1880.537, 674.721, 110.611,4.99,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--白骨之谷",		1,		-2229.45, 1379.8, 95.2124,	3.29553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--吉尔吉斯村",		1,		 -2232.082, 2671.743, 60.248,	3.59553,	TEAM_NONE,	30,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t凄凉之地--波尔甘的洞穴",		1,		 -2457.293, 2479.256, 83.818,	0.248,	TEAM_NONE,	30,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},	
	
	[TPMENU+0x480]={--尘泥沼泽
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--蕨墙村",		1,		-3137.84, -2847.05, 34.5373,	5.12666,	TEAM_HORDE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--塞拉摩堡垒",		1,		-3685.93, -4527.7, 10.6715,	5.12666,	TEAM_ALLIANCE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--塞拉摩岛港口",		1,		-3984.39, -4707.3, 4.36503,	5.12666,	TEAM_ALLIANCE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--北点哨塔",		1,		-2848.74, -3417.02, 34.2351,	5.12666,	TEAM_ALLIANCE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--警戒哨岗",		1,		-3451.17, -4142.56, 11.3043,	5.12666,	TEAM_ALLIANCE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--水光庄园",		1,		-2967.8, -3881.94, 30.7493,	5.12666,	TEAM_ALLIANCE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--恐惧海岸",		1,		 -2587.57, -4068.71, 17.8572,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--蓝色沼泽",		1,		-2657.55, -3105.61, 46.4396, 	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--奥卡兹岛",		1,		-2682.277, -4780.732, 15.357, 	2.15,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--女巫岭",		1,		-2821.94, -3968.81, 36.5295,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--黑雾洞穴",		1,		-2827.76, -2741.14, 34.5504,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--泥潭沼泽",		1,		-3685.77, -3236.7, 31.5411,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--尘泥海湾",		1,		-3697.84, -4065.27, 11.4531,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--树荫旅店",		1,		-3719.82, -2530.47, 69.5757,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--废弃哨塔",		1,		-3922.641, -2804.277, 36.88,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--比吉尔的飞艇残骸",		1,		-4014, -3768.19, 42.1233,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--鲜血沼泽墓穴",		1,		-4304.784, -2638.167, 39.614,	4.23,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--火焰洞穴",		1,		-4335.35, -3004.43, 34.491,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--石槌废墟",		1,		-4342.052, -3225.301, 34.709,	4.88,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--狂潮湾",		1,		-4413.72, -4100.18, 6.41646,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--黑龙谷",		1,		-4551.66, -2963.08, 30.625,	5.12666,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--泥链镇",		1,		-4584.320, -3173.608, 34.144,	3.15,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--巨龙沼泽",		1,		-4649.397, -3499.340, 32.198, 	3.457,	TEAM_NONE,	35,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t尘泥沼泽--埃博斯塔夫的巢穴",		1,		-4998.81, -3837.26, 44.1781,	5.12666,	TEAM_NONE,	35,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x490]={--菲拉斯
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--羽月要塞",			1,		-4414.92, 3284.24, 11.8211,	2.90655,	TEAM_ALLIANCE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--萨兰纳尔",			1,		-4480.52, -766.299, -36.6721,	2.90655,	TEAM_ALLIANCE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--莫沙彻营地",			1,		-4390.3, 210.672, 25.4133,	2.90655,	TEAM_HORDE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--鸦风废墟",			1,		-2966.16, 2679.63, 64.1015,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--加德米尔湖",			1,		-2984.51, 2074.04, 29.2104,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--奥奈罗斯",			1,		-3116.73, 1758.81, 40.4765,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--双塔山",			1,		-3331.35, 2225.73, 30.9877,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--戈杜尼前哨站北山洞",			1,		 -3653.95, 243.418, 142.947,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--怒痕堡",			1,		-3851.1857, 1840.750, 115.592,	5.23,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--戈杜尼前哨站南山洞",			1,		 -3950.675, 149.96, 113.51,	0.89,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--拉瑞斯小亭",			1,		-4159.41, 121.231, 55.4345,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--恐怖图腾北营地",			1,		-4210.100, 620.477, 65.854,	1.13,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--低地荒野",			1,		-4303.95, -447.877, 31.1955,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--被遗忘的海岸",			1,		-4347.16, 2298.17, 6.47156,	2.90655,	TEAM_NONE,	40,	0},
	{MENU, "上一页", TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	    {MENU, "下一页", TPMENU+0x1490,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x1490]={--菲拉斯
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--恐怖图腾南营地",			1,		-4492.569, 766.771, 67.728,	2.42,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--萨尔多岛",			1,		-4725.48, 3269.58, 20.2792,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--沃丹提斯河",			1,		-4764.39, 1022.62, 114.892,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--木爪巢穴(木爪洞穴)",			1,		-4856.260, 849.787, 140.368,	5.63,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--木爪岭",			1,		 -4905.99, 356.728, 21.9665,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--索兰萨尔废墟",			1,		-4915.57, 3597.81, 12.1619,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--深痕谷",			1,		-4954.264, 1728.519, 62.400,	2.31,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--痛苦深渊东洞",			1,		-5189.58, 172.676, 50.7054,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--痛苦深渊西洞",			1,		-5278.02, 353.709, 61.5543,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--伊斯迪尔废墟",			1,		-5306.2, 1334.02, 48.181,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--恐怖之岛",			1,		-5309.78, 3630.4, 8.85849,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--高原荒野",			1,		-5326.3, 1587.76, 45.0212,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--沙尔扎鲁的巢穴(恐怖之岛)",			1,		-5458.0751, 3626.868, 2.81,	3.47,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--伊斯迪尔废墟南部大殿",			1,		-5514.07, 1365.71, 35.012,	2.90655,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t菲拉斯--乱羽高地",			1,		-5793.63, 1671.37, 88.2587,	2.90655,	TEAM_NONE,	40,	0},
	{MENU, "上一页", TPMENU+0x490,GOSSIP_ICON_TAXI},
	{MENU, "返回卡利姆多地图选择", TPMENU+0x3c0,GOSSIP_ICON_TAXI},	
	},	
	
	[TPMENU+0x4a0]={--加基森
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--加基森",	1,		-7122.8, -3704.82, 14.0526,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--热砂港",	1,		-6955.1, -4780.88, 7.13431,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--热影废墟",	1,		 -6995.554, -4382.120, 11.22,	3.49,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--破浪海滩",	1,		-7220.19, -4878.65, 0.56857,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--流沙岗哨",	1,		-7263.04, -2955.84, 9.88173, 	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--萨拉辛之穴",	1,		-7354.77, -4889.02, 0.640751,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--清泉平原",	1,		-7604.18, -4350.05, 10.1388, 	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--深沙平原",	1,		-7762.99, -3301.7, 66.4296,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--腐化之巢北洞",	1,		-7792.91, -2617.3, -5.0719,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--破碎石柱",	1,		 -7954.07, -3854.1, 33.9089,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--落帆海湾",	1,		-7979.71, -5320.93, 12.5553,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--腐化之巢南洞",	1,		-8103.97, -2499.75, -30.6654,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--时光之穴",	1,		-8173.93, -4737.46, 33.7774,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--砂槌营地",	1,		-8436.043, -3073.270, 8.625,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--灌木谷",	1,		-8729.29, -2267.76, 8.87675,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--塔纳利斯南海",	1,		-8808.83, -4749.08, 1.73332, 	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--东月废墟",	1,		-8902.08, -3543.27, 13.9362,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--大裂口",	1,		-9095.28, -4097.02, 9.8897,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--南月废墟",	1,		 -9293.27, -3016.41, 11.0568,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--守卫之谷",	1,		-9469.516, -2779.143, 12.54, 	3.15,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--奥丹姆",	1,		-9631.82, -2786.12, 7.85646,	3.11174,	TEAM_NONE,	40,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t塔纳利斯--天涯海滩",	1,		-9851.62, -3608.47, 8.93973, 	3.11174,	TEAM_NONE,	40,	0},
    {MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x4b0]={--艾萨拉
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--塔伦迪斯营地",			1,		2703.3, -3884.81, 106.282,	5.49897,	TEAM_ALLIANCE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--瓦罗莫克",			1,		3609.638, -4410.854, 113.787,	2.31,	TEAM_HORDE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--废墟海岸",			1,		2087.24, -6613.49, 7.22943,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--雷瑟斯圣所",			1,		2230.05, -6452.9, 4.77836,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--拉文凯斯雕像",			1,		2456.73, -6803.51, 116.684,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--门纳尔湖",			1,		2736.57, -5425.19, 111.948,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--凄凉山",			1,		 2748.93, -4570.28, 182.187,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--影歌神殿",			1,		2905.39, -4034.29, 144.916,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--哈达尔营地",			1,		3318.399, -4317.705, 130.37,	2.97,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--南山海滩",			1,		3379.59, -5663.15, 5.39417,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--埃达拉斯废墟",			1,		3469.83, -4913.87, 140.854,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--辛玛洛神殿",			1,		3545.82, -5277.56, 106.481,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--赫塔拉的巢穴",			1,		3589.71, -6137.99, 3.39647, 	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--鳞须洞穴",			1,		 3703.92, -6039.5, 2.72518,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--破碎海岸",			1,		3730.36, -5559.16, 15.1767,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--熊头",			1,		3771.52, -4886.14, 143.827,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--风暴海湾",			1,		3885.32, -6245.65, 5.2051,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--亚考兰神殿",			1,		3941.07, -7207.41, 26.482,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--木喉要塞",			1,		4203.47, -5246.51, 112.358,	5.49897,	TEAM_NONE,	45,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--埃达拉之塔",			1,		4263.41, -7774.43, 12.563,	5.49897,	TEAM_NONE,	45,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--萨拉斯营地",			1,		4360.56, -6088.45, 114.576,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--乌索兰",			1,		4409.665, -5601.268, 117.25,	1.49,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--痛苦海岸",			1,		4454.24, -7310.31, 93.0525,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--雷加什营地",			1,		4659.76, -5941.53, 128.405,	5.49897,	TEAM_NONE,	45,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t艾萨拉--锯齿暗礁",			1,		4893.98, -7508.43, 17.6662, 5.49897,	TEAM_NONE,	45,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x4c0]={--费伍德森林
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--刺枝林地",		1,		6203.492, -1927.487, 569.635,	3.9,	TEAM_ALLIANCE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--血毒岗哨",		1,		5119.339, -354.590, 356.559,	3.36,	TEAM_HORDE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--死木村",		1,		 3721.392, -1196.600, 208.45,	2.0294,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--摩罗萨兰",		1,		3787.46, -1571.59, 214.026,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--翡翠圣地",		1,		3968.26, -1290.04, 240.327,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--碧火谷",		1,		3924.22, -616.157, 340.563,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--克斯特拉斯废墟",		1,		4528.877, -538.828,302.346,	2.673,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--加德纳尔",		1,		4805.584, -392.957, 348.96,	3.92,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--欺诈者神祠",		1,		4852.17, -606.994, 308.91,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--血毒瀑布",		1,		5210.51, -896.201, 359.782,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--血毒河",		1,		5281.72, -655.198, 324.754,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--碎痕谷",		1,		5554.1147, -854.481, 369.747,	6.16,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--铁木森林",		1,		6265.61, -1085.5, 373.44,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--碧火小径",		1,		6377.160, -775.751, 461.341,0.44,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--铁木山洞",		1,		6404.516,-1643.479, 435.043,	3.39,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--魔爪村",		1,		6715.54, -1945.79, 549.639,	6.24307,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Felwood:35:35|t费伍德森林--木喉要塞",		1,		 6787.72, -2077.13, 623.356,	6.24307,	TEAM_NONE,	48,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x4d0]={--安戈洛环形山
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--马绍尔营地",	1,		 -6148.42, -1082.44, -199.403,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--蘑菇石",	1,		-6375.06, -1812.91, -262.48,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--拉卡利油沼",	1,		 -6781.86, -1440.54, -269.228,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--铁石高原",	1,		-6980.36, -2462.99, -200.559,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--葛拉卡温泉",	1,		 -7207.62, -653.212, -234.698,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--火羽山",	1,		 -7267.690, -1406.063, -241.405,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--沼泽地",	1,		 -7385.3, -1980.07, -270.551,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--恐惧小道",	1,		 -7779.8, -880.534, -270.439,	0.457099,	TEAM_NONE,	48,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山--巨痕谷",	1,		  -7889.57, -1337.7, -281.093,	0.457099,	TEAM_NONE,	48,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	
	[TPMENU+0x4e0]={--希利苏斯
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--暮光营地废墟",		1,		 -6212.29, 1772.56, 15.6141,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--暮光小径",		1,		-6293.529, 115.806, 14.97,	4.45,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--水晶谷",		1,		-6358.14, 1674.66, 48.2514,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--勇士之墓",		1,		-6373, -280.081, -4.72388,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--亚什虫巢北洞",		1,		-6439.5, 997.684, 4.08102,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--鹿盔岗哨",		1,		-6527.043, 99.306, 128.930,	3.49,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--亚什虫巢南洞",		1,		-6603.6, 854.854, 0.287326,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--暮光岗哨",		1,		 -6797.82, 1614.11, 3.87849,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--塞纳里奥要塞",		1,		-6816.925, 814.060, 50.532,	0.32,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--暮光营地",		1,		-6939.23, 1193.1, 8.6362,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--虫群之柱",		1,		-7076.350, 857.588, 10.974,	1.38,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--南风村",		1,		-7099.16, 400.596, 9.54857,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--格拉卡隆之骨",		1,		-7206.42, 930.267, -1.42268,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--佐拉虫巢北洞",		1,		-7282.79, 1678.96, -41.9482,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--佐拉虫巢西南",		1,		-7426.58, 1777.75, -37.58,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯---佐拉虫巢东南洞",		1,		-7436.18, 1656.77, -30.7027,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--奥泰尔隐藏处",		1,		-7577.2246, 200.533, 10.91,	4.25,	TEAM_NONE,	50,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--雷戈虫巢东洞",		1,		-7853.69, 403.883, -37.1285,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--暮光前哨站",		1,		-7896.972, 1829.068, 1.066,	2.64,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--雷戈虫巢西南洞",		1,		-7981.04, 544.812, -30.1579,	2.39066,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--铜须营地",		1,		-8010.411, 1108.657, -0.546,	3.47,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--甲虫之台",		1,		-8011.092, 1528.307, 2.23,	2.50,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--甲虫之墙(安其拉)",		1,		-8116.261, 1524.967, 3.61,	3.08,	TEAM_NONE,	50,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Silithus_01:35:35|t希利苏斯--雷戈虫巢东南洞",		1,		-8049.995, 469.691, -26.1829,	4.09,	TEAM_NONE,	50,	0},
    {MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x4f0]={--冬泉谷
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--坠星村",			1,		7153.52, -3905.56, 762.999,	5.18088,	TEAM_ALLIANCE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--永望镇",			1,		6724.02, -4653.21, 720.846,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--海加尔山",			1,		4603.95, -3879.25, 944.183,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--暗语峡谷",			1,		4825.520, -4599.178, 862.826,	4.09,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--霜语峡谷",			1,		5390.19, -4773.47, 809.701,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--枭翼树丛",			1,		5504.11, -4943.06, 849.374,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--丹曼达尔",			1,		5742.696, -4545.401, 760.267,	2.57,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--麦索瑞尔",			1,		6168.21, -4446.11, 660.795,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--木喉岗哨",			1,		6423.070, -3148.615, 588.451,0.158,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--凯斯利尔废墟",			1,		 6510.905, -4278.551, 663.183,	3.276,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--冰蓟岭",			1,		 6519.0845, -5087.678, 750.89,3.62,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--凯斯利尔湖",			1,		6545.893, -4082.085, 658.631,4.27,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--寒水村",			1,		6718.71, -5226.45, 776.012,	5.18088,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--冰火温泉",			1,		 6812.746, -2515.837, 553.293, 	0.51,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--惨月洞穴",			1,		7130.211, -4588.527, 635.376,4.29,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--隐秘小林",			1,		7691.852, -4898.195, 695.544,3.77,	TEAM_NONE,	55,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬泉谷--霜刀石",			1,		7998.59, -3940.77, 690.415,	5.18088,	TEAM_NONE,	55,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x500]={--月光林地
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--永夜港",			1,		7963.61, -2500.27, 487.496,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--木喉要塞",			1,		7415.28, -2189.3, 530.956,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--月神湖",			1,		 7539.34, -2475.39, 452.734,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--怒风兽穴南洞",			1,		7546.02, -3022.6, 462.646,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--怒风兽穴东洞",			1,		7620.2, -3016.28, 480.018,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--怒风兽穴北洞",			1,		7674.69, -2969.42, 464.321,	3.6,	TEAM_NONE,	10,	0},
	{TP, "|TInterface/ICONS/spell_arcane_teleportmoonglade:35:35|t月光林地--雷姆洛斯神殿",			1,		7835.41, -2233.81, 465.871,	3.6,	TEAM_NONE,	10,	0},
	{MENU, "上一页",TPMENU+0x3c0,GOSSIP_ICON_TAXI},
	},
		[TPMENU+0x1a0]={--外域
			{MENU, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛",		TPMENU+0x1b0,	GOSSIP_ICON_TAXI,	TEAM_NONE,	58,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽",		TPMENU+0x1c0,	GOSSIP_ICON_TAXI,	TEAM_NONE,	62,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林",		TPMENU+0x1d0,	GOSSIP_ICON_TAXI,	TEAM_NONE,	64,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰",			TPMENU+0x1e0,	GOSSIP_ICON_TAXI,	TEAM_NONE,	64,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山",			TPMENU+0x1f0,	GOSSIP_ICON_TAXI,	TEAM_NONE,	66,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴",		TPMENU+0x200,	GOSSIP_ICON_TAXI,	TEAM_NONE,	68,	0},
			{MENU, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷",			TPMENU+0x210,	GOSSIP_ICON_TAXI,	TEAM_NONE,	68,	0},
			 {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x1b0]={--地狱火半岛
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--萨尔玛",		530,	139.96, 2671.51, 85.509,		1.59676,	TEAM_HORDE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--猎鹰岗哨",		530,	-617.59, 4165.13, 62.9, 		1.59676,	TEAM_HORDE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--断背岗哨",		530,	-1327.63, 2367.51, 88.95,		0.95,	TEAM_HORDE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--机甲残骸",		530,	-18.834, 2140.58, 114.169,		3.47,	TEAM_HORDE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--玛格汉岗哨",		530,	510.14, 3872.23, 192.41, 		1.59676,	TEAM_HORDE,	58,	0},
	    {TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--荣耀堡",		530,	-683.05, 2657.57, 91.04,		1.59676,	TEAM_ALLIANCE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--荣耀岗哨",		530,	509.154, 1993.64, 110.87,	4.64,	TEAM_ALLIANCE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--远征军岗哨",		530,	-677.682, 1861.2, 66.86,		3.50,	TEAM_ALLIANCE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--塔哈玛特神殿",	530, 145.41, 4332.53, 106.42,		1.59676,	TEAM_ALLIANCE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--黑暗之门",		530,	-250.97, 1031.75, 54.32,		1.59676,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--魔火峡谷",    530,	108.73, 2336.645, 61.742,		5.55,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--地狱火半岛（荣耀堡前）",530,	-364.809, 2582.65, 48.77,		6.07,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--荣耀之路（地狱火堡垒前）",530,	-267.37, 2829.95, -43.49,		1.54,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--石墙峡谷",    530,	434.94, 2883.079, 52.47,  2.38,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--军团前线",		530,	-455.56, 1889.76, 87.251,		4.88,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--登陆场:歼灭",    530,	494.955, 2703.086, 202.971,		1.35,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--铸魔营地:狂乱",    530,	401.875, 2449.548, 145.184,		1.23,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--铸魔营地:暴虐",    530,	460.742, 2183.941, 118.85,		3.05,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--碎石岭",		530,	-615.775, 3308.94, 18.30,		4.1,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--碎石岭（占塔）",		530,	-471.10, 3450.10, 36.03,		1.36,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--瞭望台（占塔）",		530,	-186.83, 3476.10, 39.144,		0.36,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--竞赛场（占塔）",		530,	-287.87, 3702.9, 58.20,		3.41,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--南部城墙",		530,	-928.987, 3398.22, 84.86,		4.16,TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--远征军物资库",		530,	-1237.54, 2717.25, -9.46,		5.4,TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--尘羽峡谷",		530,	-723.60, 4404.94, 79.92,		-0.0015,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--哈尔什巢穴",		530,	-1138.058, 4188.41, 18.80,		1.72,	TEAM_NONE,	58,	0},
		{MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
	    {MENU, "下一页", TPMENU+0x11b0,GOSSIP_ICON_TAXI},
		},
		[TPMENU+0x11b0]={--地狱火半岛
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--大裂隙",		530,	-653.59, 3949.309, 28.995,		0.254,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--荆棘小径",		530,	-1423.94, 3412.205, 37.67,		2.5,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--阿苟纳之池",    530,	198.783, 3470.290, 63.949,  1.34,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--克伦·断脊者",    530,	-19.622, 3805.120, 92.93,  5.79,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--塞纳里奥哨站",		530,	-318.44, 4715.75, 18.46,		0.4,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--坠星山",    530,	120.145, 4824.99, 77.90,  0.5,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--沙纳尔废墟",		530,	-520.35, 4802.28, 32.57,		3.51,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--迁跃平原",		530, -1368.983, 2918.26, -17.74,		4.63,TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--塞斯高",		530,	-1066.24, 2096.67, 60.64,		4.27,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--虚空山脉",		530,	-739.48, 1473.00, 15.51,		1.98,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--飞艇坠毁点",    530,	-1087.303, 3002.7, 8.254,  3.55,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--荆棘高地",    530,	-1504.00, 4029.497, 214.38,  0.23,	TEAM_NONE,	58,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_HellfirePeninsula_01:35:35|t地狱火半岛--棘牙岭",    530,	-259.594, 5074.206, 72.475,  4.63,	TEAM_NONE,	58,	0},
        {MENU, "上一页", TPMENU+0x1b0,GOSSIP_ICON_TAXI},
		{MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
		},
        [TPMENU+0x1c0]={--赞加沼泽
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--泰雷多尔(树上)",		530,	280.32, 6040.97, 130.28, 	1.61718,	TEAM_ALLIANCE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--泰雷多尔(树下)",		530,	285.22, 5943.69, 26.48, 	1.61718,	TEAM_ALLIANCE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--奥雷伯尔营地",		530,	1006.08, 7375.83, 36.27,	1.61718,	TEAM_ALLIANCE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--沼泽鼠岗哨",		530,	105.44, 5206.799, 21.717, 	4.18,	TEAM_HORDE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--萨布拉金",		530,	258.51, 7854.97, 23.44, 	1.61718,	TEAM_HORDE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--塞纳里奥避难所",		530,	-210.69, 5509.96, 21.57,	1.61718,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--暗潮营地",		530, -224.183,6312.96, 22.05,5.3, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--暗泽湖",		530,	-336.0497, 5860.47, 20.11,	4.67,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--暗潮湖岸",		530,	-590.899, 5932.1057, 20.264,4.2,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--血鳞领地",		530, 519.833, 8186.86, 22.18,2.19, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--血鳞浅滩",		530,    505.762, 6220.394, 22.51,	0.77, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--蘑菇洞",		530,	-1311.33, 5753.43, 32.03,	6.02,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--暗泽村",		530,	-1057.52, 5205.64, 23.63,	1.48,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--死亡泥潭",		530,	684.71, 5300.66, -14.47,	2.26,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--双塔废墟",		530,    239.613, 7084.321, 35.264,	3.09 ,   TEAM_NONE,	62,	0},
        {MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        {MENU, "下一页", TPMENU+0x11c0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x11c0]={--赞加沼泽
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--蛮沼村",		530,   -91.82, 7064.24, 19.467,	4.05,  TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--博哈姆废墟",		530,   -303.029, 7249.97, 31.55,2.91,TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--泥泞山",		530,   -204.077, 7977.926, 18.65,3.2, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--塞纳里奥岗哨",		530,   -281.295, 8306.65, 19.87,4.09,TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--孢子村",		530,	239.36, 8512.15, 22.96,	1.61718,	TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--孢殖林",		530,   -25.469, 8684.07, 23.51,3.69, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--孢子湖",		530,  197.604, 8798.094, 20.5,4.53, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--荒弃传送门",		530,  560.76, 8651.64, 19.13,1.2, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--韶光湖",		530, 403.135, 8316.27, 22.32,1.7, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--菌杆沼泽",		530, 787.867, 7946.572, 21.68,4.21, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--匕潭村",		530, 1073.052, 8225.296, 22.98,2.4, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--安葛洛什营地",		530, 968.453, 8528.34, 19.91,0.24, TEAM_NONE,	62,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Zangarmarsh:35:35|t赞加沼泽--安葛洛什要塞",		530, 1601.90, 8501.75, -14.22,0.19, TEAM_NONE,	62,	0},
        {MENU, "上一页", TPMENU+0x1c0,GOSSIP_ICON_TAXI},
        {MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },

        [TPMENU+0x1d0]={--泰罗卡森林
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--裂石堡",		530,	-2620.31, 4403.25, 34.3,	3.68426,	TEAM_HORDE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--奥蕾莉亚要塞",		530,	-2942.08, 3974.57, -0.59,	3.68426,	TEAM_ALLIANCE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--塞纳里奥树林",		530,	-1880.665, 4638.687, 10.629,	0.133,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--噬骨废墟",		530,	-2992.83, 3568.72, 1.477,	5.6,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--图雷姆",		530,	-1999.91, 4202.936, 15.4,	1.49,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--火翼岗哨",		530,	-2377.40, 3276.39, 0.11,	5.25,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--血环废墟",		530,	-3357.035, 6034.682, 0.06,5.55,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--奥金顿",		530,	-3605.48, 4941.38, -22.9,6.26,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--被遗弃的篷车",		530,	-3748.106, 4737.88, -19.139,5.48,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--灵网山脊",		530,	-3961.359, 4368.786, -16.993,3.91,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--痛苦之丘",		530,	-3396.56,4427.51,-12.38,2.23,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--腐臭山",		530,	-2887.41,4752.069,-7.09,6.81,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--奥金尼废墟",		530,	-3567.85,5252.98,-20.626,5.58,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--暗影阶梯",		530,	-3118.46,4914.71,-22.70,2.88,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--暗影墓穴",		530,	-2894.715, 5414.177, -18.59,6.28,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--圣光之墓",		530,	-2974.86,4543.06,-31.34,4.65,	TEAM_NONE,	64,	0},       
        {MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        {MENU, "下一页", TPMENU+0x11d0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x11d0]={--泰罗卡森林
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--难民车队",		530,	 -2845.13, 5055.6, -18.2,	3.68426,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--沙塔尔营地",		530,	-3746.97, 5400.66, -3.34,	3.68426,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--里斯克鸦巢",		530,	-1649.747, 4444.929, 17.97,	4.12,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--基斯鸦巢",		530,	-2467.86, 5363.55, 1.85,1.96,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--西诺鸦巢",		530,	-1972.8, 3889.39, -0.68,	5.25,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--黑风码头",		530,	-3399.92, 3583.59, 276.74,	3.52,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--奥拉克鸦巢",		530,	-3898.831, 3273.70, 294.38,	3.23,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--下层夏尔克鸦巢",		530,	-4130.972, 3149.39, 324.75,	3.3,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--哈雷克鸦巢",		530,	-3834.45, 3741.91, 281.05,	0.85,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--泰罗克之墓",		530,	-3773.29, 3496.68, 286.69,	2.4,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--沙拉斯鸦巢",		530,	-3618.763,4160.92,2.63,0.89,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--哈兹鸦巢",		530,	-3045.61, 5615.85, -5.13,0.64,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--雷希鸦巢",		530,	-3625.054, 5720.36, -3.96,0.47,	TEAM_NONE,	64,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Terrokar:35:35|t泰罗卡森林--韦恩的避难所",			530,    -2394.208, 2898.635, -55.608,5.10,	TEAM_NONE,	68,	0},
        {MENU, "上一页", TPMENU+0x1d0,GOSSIP_ICON_TAXI},
        {MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },
        
         [TPMENU+0x1e0]={--纳格兰
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--塔拉",			530,	-2558.55, 7295.72, 15.17,	1.33522,	TEAM_ALLIANCE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--加拉达尔",			530,	-1262.51, 7183.22, 57.2,	1.33522,	TEAM_HORDE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--元素王座",			530,	-782.68,6944.74, 33.37,	6.23,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--奈辛瓦里狩猎队营地",			530,	-1452.589,6351.193, 37.27,	3.4,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--灵魂平原",			530,	-2329.191, 8314.07, -36.46,	0.68,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--沃舒谷",			530,	-2578.441, 8308.129, -50.861,	2.5,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--基尔索罗堡垒",			530,	-2924.81, 6531.932, 69.74,	4.2,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--氏族岗哨",			530,	-2314.165, 6836.708, -4.65,	4.48,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--火刃废墟",			530,	-2607.67, 6282.22, 31.57,	6.1,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--风茅村",			530,	-1829.37, 6357.24, 46.31,	3.02,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--试炼竞技场",			530,	-2102.33, 6742.02, -3.12,	1.33522,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--嘲颅废墟",			530,	-786.987,7642.815, 49.51,	3.58,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--日泉岗哨",			530,	-1458.45,8497.26, 4.41,3.33,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--哈兰盆地",			530,	-1340.609,8086.17, -96.48,5.04,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--南风裂谷",			530,	-2040.78,7614.88, -79.35,0.26,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--塔拉盆地",			530,	-2395.128,7369.234, -168.10,2.69,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--哈兰",			530,	-1586.599, 7944.870, -23.882,	2.82,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--星界财团营地",			530,	-2064.61, 8560.49, 23.78,	1.33522,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--鲜血竞技场",			530,	-721.91,7935.61, 58.226,4.77,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--战槌山",			530,	-1054.46,8880.59, 124.02,5.24,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--铸魔营地:仇恨",			530,	-1410.722,8933.41, 54.38,0.21,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--铸魔营地:畏惧",			530,	-1862.094,9133.674, 66.64,1.17,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--暮光岭",			530,	-1279.670,9577.5576, 208.42,1.85,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--废弃的军械库",			530,	-2068.72,7466.384, -19.96,5.2,	TEAM_NONE,	64,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t纳格兰--壁垒山",			530,	-1521.369,5964.96, 193.150,2.33,	TEAM_NONE,	64,	0},
        {MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x1f0]={--刀锋山
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--希尔瓦纳",			530,	2061.85, 6862.65, 174.57,	5.42,	TEAM_ALLIANCE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--雷神要塞",			530,	2292.57, 6036.69, 142.4,	1.30395,	TEAM_HORDE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--莫克纳萨村",			530,	 2200.37, 4759.83, 157.47,	1.30395,	TEAM_HORDE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--常青林",			    530,	 2975.69, 5503.33, 143.65, 	1.30395,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--德拉诺晶矿",			530,	 1390.87, 6540.642, 11.66, 	3.12,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--晶歌山脉",			530,	1586.023, 5513.93, 276.77,5.33,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--拉什鸦巢",			530,	 1612.348, 6934.51, 159.055, 	5.63,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--血槌哨站",			530,	 1650.95, 6402.47, -10.29, 	4.44,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--铸魔营地:恐怖",	    530,	1679.21, 7277.46, 363.78, 	2.85,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--维克鸦巢",			530,	 1707.766, 4624.33, 144.29, 0.84,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--鳞翼岩床",			530,	 1771.269, 5139.53, 266.32, 3.5,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--锯齿山",			    530,	1823.095, 6023.69, 138.76, 	2.4,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--维克哈营地",			530,	 1881.934, 4824.26, 152.28, 	3.99,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--活木林",			    530,	 1864.21, 6827.094, 143.179, 	3.3,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--血槌峡谷",			530,	 1910.50, 6477.109, 2.02, 	5.25,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--漩涡峰",			    530,	 2081.325, 7228.81, 364.75, 	2.4,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--死亡之门",			530,	 2261.171, 5467.39, 149.10, 	3.7,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--奥格瑞拉",			530,	2330.81, 7296.78, 365.61, 	1.30395,	TEAM_NONE,	66,	0},
        {MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        {MENU, "下一页", TPMENU+0x11f0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x11f0]={--刀锋山
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--剃刀山",			    530,	 2393.68, 5348.567, 260.44, 	3.42,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--刀塔平原",			530,	 2547.91, 6395.905, -10.33, 	2.33,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--刀塔要塞",			530,	 2568.41, 6641.40, 16.64, 	5.8,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--拉扎安码头",			530,	 2680.56, 5300.99, 267.20, 	0.24,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--沙图尔的传送器",	    530,	 2711.260, 7103.14, 364.96, 	1.02,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--铸魔营地:天罚",		530,	 2881.71, 7098.11, 365.54, 	5.55,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--铸魔营地:怒火",		530,	 2924.86, 4866.77, 274.809, 	4.78,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--龙颅小径",			530,	 3105.80, 6128.41, 136.57, 	1.3,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--卢安鸦巢",			530,	 3210.88, 5396.324, 144.53, 	4.43,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--刀刃峡谷",			530,	 3270.815,4982.796, 264.47, 	3.1,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--维姆高尔的法阵",		530,	 3292.66, 4605.793, 217.71, 	1.83,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--乌鸦林",			    530,	 3333.51, 6806.85, 167.88, 	1.3,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--血槌营地",			530,	 3464.53, 5790.859, 4.5658, 	1.43,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--磨魂者之穴",			530,	 3535.149, 5590.77, 0.179, 	3.89,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--焦火荒野",			530,	 3625.28, 4950.13, 267.24, 	2.05,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--格里施纳",			530,	 3683.488, 6727.125, 132.377, 	5.2,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--巴什伊尔码头",		530,	 3863.91, 5977.55, 290.64, 1.30395,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--弗雷文栖木",			530,	 3874.73, 5222.797, 271.02, 0.1,	TEAM_NONE,	66,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_AlteracMountains_01:35:35|t刀锋山--水晶之脊",			530,	 3944.39, 5518.420, 267.47, 	6,	TEAM_NONE,	66,	0},
        {MENU, "上一页", TPMENU+0x1f0,GOSSIP_ICON_TAXI},
        {MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x200]={--虚空风暴
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--52区",		530,	3046.26, 3645.96, 142.98,	3.44101,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--中央圆顶哨站",		530,	3356.76, 2874.45, 143.69,	3.44101,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--风暴尖塔",		530,	4193.01, 3088.42, 335.82,	3.44101,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--维序派哨站",		530,	4273.78, 2177.77, 136.3, 3.44101,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--砰砰博士的营地",		530,	3233.20, 3587.325,126.24,1.24,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--恩卡特废墟",		530,	3387.98, 3703.10, 144.39, 5.9,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法力熔炉:布纳尔",		530,	2980.397, 4010.065, 146.67, 1.54,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--机甲废场",		530,	2640.728, 3786.168, 147.10, 0.35,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--阿尔科隆废墟",		530,	2726.88, 3173.41, 147.48, 0.42,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法力熔炉:库鲁恩",		530,	2482.951, 2883.852, 133.253, 3.8808,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--肯瑞瓦村:巫师街",		530,	2239.82, 2395.64, 113.567, 3.90,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--肯瑞瓦村:城镇广场",		530,	2294.86, 2270.06, 94.67, 4.68,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--肯瑞瓦村:礼拜堂广场",		530,	2476.00, 2184.69, 99.0, 5.03,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--日怒堡",		530,	2491.577, 2419.93, 133.64, 5.6,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--扳钳镇",		530,	2958.723, 1785.256, 139.121,3.88,	TEAM_NONE,	68,	0},
        {MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        {MENU, "下一页", TPMENU+0x1200,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x1200]={--虚空风暴
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法力熔炉:杜隆",		530,	2959.435, 2304.37, 161.64,5.78,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--废料场",		530,	3257.135, 2704.36, 150,0.85,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--旋涡平原",		530,	3321.81, 2482.517, 82.977,2.3,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--中央生态圆顶",		530,	3540.729, 2980.518,145.20,4.38,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--瑟安竖井",		530,	3750.89, 2082.34, 149.04,6.10,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法力熔炉:乌提斯",		530,	3848.06, 2105.90, 241.32,4.48,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法力熔炉:艾拉",		530,	3879.40, 3749.46, 118.858,0.53,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--复仇记前沿基地",		530,	4018.05, 2315.83, 115.24,1.63,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--苍穹之脊",		530,	4150.99, 1512.55, -108.06,4.01,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--虚风高原",		530,	4214.76, 1882.096, 140.97,4.41,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--铸魔基地:湮灭",		530,	4473.86, 3258.64, 144.66,1.175,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--铸魔基地:炼狱",		530,	4544.21, 3175.37, 145.63,0.3,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--法兰伦废墟",		530,	4592.96, 2546.143, 199.92,0.26,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--虚空石",		530,	4787.266, 2670.52,102.83,1.67,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--索克雷萨之座",		530,	4946.93, 3849.20, 211.498,4.15,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Netherstorm_01:35:35|t虚空风暴--边缘生态圆顶",		530,	4988.92, 2887.07, 99.43,0.83,	TEAM_NONE,	68,	0},
        {MENU, "上一页", TPMENU+0x200,GOSSIP_ICON_TAXI},
        {MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },
        [TPMENU+0x210]={--影月谷
        {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--影月村",			530,	-3031.24, 2593.14, 76.03,	4.25995,	TEAM_HORDE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--登陆场:灾难",			530,    -2727.470, 2720.058, 122.35,4.9,	TEAM_HORDE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--蛮锤要塞",			530,	-4021.89, 2213.02, 109.84,	4.25995,	TEAM_ALLIANCE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--登陆场:灾难",			530,    -2763.746, 1976.832, 167.441,1.64,	TEAM_ALLIANCE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--熔岩平原",			530,	-2990.68, 2337.80, 60.64,	0.87,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--斯克瑟隆废墟",			530,	-3081.46, 2208.44, 65.74,	2.98,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--军团要塞",			530,    -3355.209, 2818.84, 141.424,0.71,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--伊利达雷岗哨",			530,    -3788.46, 2488.26, 79.47,1.66,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--诅咒祭坛",			530,    -3599.628, 1893.005, 47.24,4.83,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--死亡熔炉",			530,    -3288.56, 1984.70, 52.084,2.20,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--斯克瑟隆营地",			530,    -4104.488, 1783.147, 103.89,5.83,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--日蚀岗哨",			530,    -4322.987, 1600.416, 146.229,2.26,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--征服之路",			530,    -4150.404, 1355.080, 109.69,6.51,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--火红岗哨",			530,    -4596.381, 1396.911, 137.829,4.11,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--暗影祭坛",			530,    -4542.35, 1023.86, 9.65,3.80,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--卡拉波废墟",			530,    -3804.575, 504.438, 87.208,4.7,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--阿卡玛平台",			530,    -3329.90, 512.014, 84.826,4.71,	TEAM_NONE,	68,	0},
		{MENU, "上一页", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        {MENU, "下一页", TPMENU+0x1210,GOSSIP_ICON_TAXI},
        },
		[TPMENU+0x1210]={--影月谷
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--巴尔里废墟",			530,    -3231.45, 931.052, 47.47,2.4566,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--守望者牢笼",			530,    -3686.74, 1063.429, 68.42,2.79,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--魔能熔池",			530,    -3368.51, 1567.259, 48.39,3.1,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--库斯卡岗哨",			530,    -3100.86, 1641.16, 60.56,0.33,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--库斯卡水池",			530,    -2909.542, 1423.839, 11.589,4.7,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--欧鲁诺克农场",			530,    -2808.599, 1261.490, 75.030,4.0,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--伯拉克,欧鲁诺克之子",			530,    -4044.389, 1609.46, 94.72,4.0,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--格洛姆托,欧鲁诺克之子",			530,    -2816.217, 1774.085, 59.66,-1.31,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--阿托尔,欧鲁诺克之子",			530,    -3795.830, 2595.229, 90.118,1.66,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--灵翼小径",			530,    -4370.198, 853.53, 14.681,2.77,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--灵翼平原",			530,    -4014.996, 877.549, 4.76,4.32,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--龙喉要塞",			530,    -4200.890, 382.463, 118.05,1.3,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--破碎平原",			530,    -2562.543, 1280.085, 80.97,2.63,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--群星圣殿(占星)",			530,	-4094.62, 1122.09, 42.3,	4.25995,	TEAM_NONE,	68,	0},
        {TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--沙塔尔祭坛(奥尔多)",			530,	-3029.98, 808.17, -10.32,	4.25995,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--龙喉营地(灵翼浮岛)",			530,    -5118.115, 587.068, 85.206,0.3,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--龙吼空港(灵翼浮岛)",			530,    -4715.79, 115.342, 82.191,0.5,	TEAM_NONE,	68,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Shadowmoon:35:35|t影月谷--灵翼矿洞",			530,    -5106.529, 662.150, 34.247,2.44,	TEAM_NONE,	68,	0},
        {MENU, "上一页", TPMENU+0x210,GOSSIP_ICON_TAXI},
        {MENU, "返回外域地图选择", TPMENU+0x1a0,GOSSIP_ICON_TAXI},
        },
		[TPMENU+0xf0]={--诺森德
		{MENU, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原",		TPMENU+0x100,	GOSSIP_ICON_TAXI,	TEAM_NONE,	68,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾",		TPMENU+0x110,	GOSSIP_ICON_TAXI,	TEAM_NONE,	68,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野",		TPMENU+0x120,	GOSSIP_ICON_TAXI,	TEAM_NONE,	71,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵",		TPMENU+0x130,	GOSSIP_ICON_TAXI,	TEAM_NONE,	73,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克",			TPMENU+0x140,	GOSSIP_ICON_TAXI,	TEAM_NONE,	74,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地",		TPMENU+0x150,	GOSSIP_ICON_TAXI,	TEAM_NONE,	75,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林",	    TPMENU+0x160,	GOSSIP_ICON_TAXI,	TEAM_NONE,	74,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁",		TPMENU+0x170,	GOSSIP_ICON_TAXI,	TEAM_NONE,	76, 0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川",		TPMENU+0x180,	GOSSIP_ICON_TAXI,		TEAM_NONE,	77,	0},
	    {MENU, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖",			TPMENU+0x190,	GOSSIP_ICON_TAXI,		TEAM_NONE,	77,	0},
	    {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},

        [TPMENU+0x100]={--北风苔原
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--无畏要塞",		571,	2314.69, 5258.58, 11.6, 5.32,	TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原----死亡营地",		571,	  3108, 3834, 22.3, 3.27,TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原----裂鞭海岸",		571,	 1948.601, 6098.65, 20.92,4.14,TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原----裂鞭废墟",		571,	 1363, 5819, 41.3,3.27,TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原----致远郡",		571,	 2593.38, 5286.48,36.81, 2.13,TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---菲兹兰克机场",		571,	4140, 5261, 25.66, 3.27,TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--战歌堡",		571,	2827.1, 6176.8, 122, 5.32,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---牦牛村",		571,	 3432, 4107, 16.07, 3.27,TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--回音海岸",		571,	2812.05, 6713.41, 9.886, 5.87,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--博古洛克前哨站",		571,	4479, 5715, 81.284, 3.27,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--蓝玉营地",		571,	3322.1987, 6178.834, 74.57,6.01,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--血孢平原",		571,	2525.01, 5992.24, 99.184,4.27,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--迦莫斯",		571,	2514.277, 5853.41, 124.62,1.02,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--考达拉",		571,	3884.3, 6690.03, 151.51,3.27,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--圣城恩其拉",		571,	3713.92, 3713.069, 47.217, 3.27,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---喷泉平原",		571,	 3812.84, 4728.64, -12.97, 0.79,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---亡者之穴",		571,	 4305.029, 4290.47, 98.86, 2.53,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---塔尔拉玛斯",		571,	 4273.055, 4683.355,22.436, 4.9217,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原--冬鳞避难所",		571,   4375, 6069, 0.788, 3.27,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---永生之盾",		571,	3581.39, 6654.68, 195.44, 3.5,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---琥珀崖",		571,	3606, 5939, 136.21, 3.27,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---仁德会营地(塞纳里奥)",		571,  3216, 5292, 47.88,3.27,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---乌努比",		571,	 2931, 4032, 2.1, 3.27,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---卡斯卡拉",		571,	 3070, 4776, 1.06, 3.27,TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_01:35:35|t北风苔原---尼约德海湾",		571,	 2752.91, 4636.073, 2.23, 0.98,TEAM_NONE,	68,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x110]={--嚎风峡湾
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--瓦尔加德",		571,	592.33, -5095.5, 6,	1.54207,	TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--维德瓦堡垒",		571,	  2471.3, -5031.1, 284, 	1.54207,	TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--西部卫戎要塞",		571,	  1368, -3341, 175, 	1.54207,	TEAM_ALLIANCE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--冬蹄营地",		571,	  2651, -4392, 283, 	1.54207,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---幽刃岗哨",		571,	 669, -5473, 238, 	1.54207,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--新阿加曼德",		571,	  383, -4610, 244, 	1.54207,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--复仇港",		571,	  1922.9, -6171.1, 24, 	1.54207,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---哈尔格林德",		571,	1084.12, -4498.59, 191.18, 0.38,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--药剂师营地",	571,   2128.344, -2971.983, 148.61,  	1.758,	TEAM_HORDE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---龙颅村",		571,	 943.4, -4933, 2, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--卡玛古",		571,	772.7, -2880.6, 4,	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---冰雪林地",		571,	2146.37, -5102.96, 236.832, 5.95,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---巨人平原",		571,	1978.72, -5514.79, 211.215, 2.64,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---拜尔海姆",		571,	1536.006, -5419.27, 189.39, 2.58,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---尼弗莱瓦",		571,	1031.222, -5519.89, 193, 2.88,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---盾牌岭",		571,	71.61, -4963.36, 315.26, 2.68,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---灰烬龙巢",		571,	1152.90, -3909.599, 143.505, 2.4,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---低语峡谷",		571,	1642.357, -3526.32, 95.505, 1.53,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---切米尔海岸",		571,	1777.11, -2796.072,4.08, 0.858,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--亚勒伯龙",		571,	 2655.89, -3526.88, 205.25, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--斯克恩",		571,	  1959, -4277, 210, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--巴尔古挖掘场",		571,	  167.6, -5854.5, 8, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--托尔瓦德营地",		571,	  343, -4210, 254, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾--西风升降梯",		571,	  424, -3980, 267, 	1.54207,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---探险者协会前哨",		571,	458.255, -5904.49, 309.07, 	1.155,	TEAM_NONE,	68,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_HowlingFjord_01:35:35|t嚎风峡湾---无赖港",		571,	-136.242, -3541, 3.06, 0.42,	TEAM_NONE,	68,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x120]={--龙骨荒野1
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--暮冬要塞",		571,	3671.51, -875.52, 162.54,	1.33,	TEAM_ALLIANCE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--群星之墓",		571,	3487.6, 1996.68, 65,	0.101121,	TEAM_ALLIANCE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--第七军团前线",		571,	 4524,5.4, 72.43, 	6.1,	TEAM_ALLIANCE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--弗塔根要塞",		571,	 4608, 1491, 199, 	0.101121,	TEAM_ALLIANCE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--阿格玛之锤",		571,	3774.66, 1529.51, 87.12,	0.47,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--水晶裂痕",		571,	4895.22, 295.91, 131.72,	6.61,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--西风避难营",		571,	 3755, 2865, 92.73, 	1.83,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--库卡隆先锋营地",		571,	 4952.26, 1261.44,226.55, 	6.09,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--诺兹拉斯哨站",		571,	 4695, 552, 121, 	0.101121,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--猎龙营地",		571,	 4342, 977, 91, 	0.101121,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--怨毒镇",		571,	3216, -682, 167, 	0.101121,	TEAM_HORDE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--龙眠神殿（底层）",		571,	3546.6, 276.10, 45,	4.65,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--龙眠神殿（中层）",		571,	3543.326, 307.41,116.90,4.77,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--龙眠神殿（顶层）",		571,	356.65, 273.44,342.72,3.12,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--新壁炉谷",		571,	3130.75, -578.88, 114.91,	2.04,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--翡翠巨龙圣地",		571,	2747.7, 75.7, 4,	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--天谴之门安加萨",		571,	4909.64, 1532.44, 220,	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--邪恶之旋",		571,	4398.146, 586.43, 112.49,	1.63,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--冷风高地",		571,	4828.175, 773.023, 164.21,	1.08,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--腐臭平原",		571,	3737.24, -1066, 119,	2.72,	TEAM_NONE,	71,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	{MENU, "下一页", TPMENU+0x1120,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x1120]={--龙骨荒野2
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--奈萨里奥之喉",		571,	 4385.56, 1558.39, 135.766,	3.05,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--遗忘海岸",		571,	 2997.914, -1165.815, 7.67,	1.28,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--圣光之望礼拜堂",		571,	4585, -1022, 159,	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--纳克萨玛斯",		571,	3668, -1267, 243,	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--碧蓝巨龙圣地",		571,	3012.638, 556.82, 27.33,  	5.72,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--莫亚基港口",		571,	 2725, 923, 0,  	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--因度雷村",		571,	 2880, 1460, 158, 	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--纳尔苏深渊",		571,	 3702.75, 2126.59, 59.42, 	3.82,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--冰雾村",		571,	 3854, 2207, 122, 	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--血色哨站",		571,	 4562.67, -535.51, 155,	5.48,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--黑曜石巨龙圣地",		571,	 4378.53, 1286.55, 155.87, 	1.46,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--眠月花园",		571,	 3336.48, 2365.20, 30.29, 	5.1,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--罗萨洛尔森林",		571,	 3171.49, 1781.95, 131.27, 	1.5,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--飘雪林地",		571,	 3016.59, 1108.79, 120.95, 	1.47,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--巨龙废土",		571,	 3291.74, -82.27, 72.46, 	1.37,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--黎明之镜",		571,	 3610.59, -115.27, 59.65, 	4.46,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--红玉巨龙圣地",		571,	 3901, 963, 56, 	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--青铜巨龙圣地",		571,	 4206, -463, 124, 	0.101121,	TEAM_NONE,	71,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_DragonBlight_03:35:35|t龙骨荒野--埃尔德齐断崖",		571,	 3062, -1476, 43.64, 	0.29,	TEAM_NONE,	71,	0},
	{MENU, "上一页", TPMENU+0x120,GOSSIP_ICON_TAXI},
	{MENU, "返回诺森德地图选择", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},

	[TPMENU+0x130]={--灰熊丘陵
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--月溪旅营地",		571,4537.11, -4219.63, 170.525,4.55,	TEAM_ALLIANCE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--琥珀松木营地",		571,3443.97, -2759.43, 199.36,4.06,	TEAM_ALLIANCE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--黑水伐木场",		571,3257.88, -2533.92, 54.20,5.09,	TEAM_ALLIANCE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--征服堡",		571,3246.37, -2251.93, 114.64,1.09,	TEAM_HORDE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--欧尼瓦营地",		571,3847.8, -4526.74, 209.5,4.7,	TEAM_HORDE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--蓝天伐木场",		571,4299.55, -2813.61, 287.91,0.602,	TEAM_HORDE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--常青商栈",		571,3207.76, -1960.65, 86.114,3.776,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--白杨商栈",		571,3590.399, -2946.84, 228.40,6.03,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--林边哨站",		571,3140.86, -2990.91, 126.68,0.71,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--灰木哨站",		571,3676.577, -4246.32, 193.22,0.016,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--遗忘峭壁",		571,3264, -4587.4, 304,0.74,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--岩石之泉",		571,3842.47 -1961.63, 208.60,2.23,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--达克辛废墟",		571,3385.56, -1810.17, 114.16,4.97,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--怒牙神殿",		571,3619.94, -3910.9, 191.02,1.885,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--心血神殿",		571,3588.60, -4594.94, 193.30,0.99,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--丹厄古尔",		571,3589.07, -5052.36, 195.46,3.87,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--风险湾",		571,2497.3, -1909.3,8.38,2.012440,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--沃达希尔之臂",		571,3764.34, -2875.93,234.25,6.05,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--沃达希尔之心",		571,3768.88, -3223.63, 281.67,3.26,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--塞布哈拉克",		571,4300.98, -1908.37, 196.45,3.17,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--达基尔金废墟",		571,4448.97, -4865.95, 27.27,6.12,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--东风海岸",		571,4481.31, -4683.91, 72.44,1.27,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--泰塞斯废墟",		571,4274, -5222.7, 4.15,2.7,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--冬至村",		571,3957.11, -4481.89,271.97,0.143,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--达克阿塔小径",		571,4520.26, -3476.49, 226.93,0.74,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--沃德伦",		571,2883.61, -2483.93, 65.20,5.37,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--乌索克之巢",		571,4673.59, -3870.54, 330.23,4.94,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--银溪镇",		571,4213.91, -2475.39, 230.37,5.89,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--灰喉堡",		571,3869.83, -3778.45, 178.60,1.55,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--索尔莫丹",		571,4802.5, -4524, 199,2.012440,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--血月岛（影牙之塔）",		571,4588.91, -5689.92, 126.07,0.53,	TEAM_NONE,	73,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_GrizzlyHills_01:35:35|t灰熊丘陵--达克萨隆要塞",		571,4514.1, -2026, 161,2.012440,	TEAM_NONE,	73,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},

	[TPMENU+0x140]={--祖达克
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--圣光据点",			571,	5158.85, -2206.68, 236.66,	3.10,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--银色前沿",			571,	5449.38, -2629.343, 306,	3.18,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--希姆托加",			571,	5763.514, -3559, 386.9,	4.65,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--黑锋哨站",			571,	5211, -1310, 242, 	5.53055,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--达加斯的行刑场",			571,	5950.046, -1674.163, 231.36, 	4.74,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--折磨之匣",			571,	5157.43, -1643.43, 243.09, 	2.08,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--痛苦之匣",			571,	6036.95, -1997.68, 234.36, 	6.60,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--痛苦斗兽场",			571,	5792.439, -3018.39, 286.38, 	2.02,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--希姆埃巴",			571,	5250.45, -2455.149, 289.644, 	4.72,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--达克索塔农田",			571,	5066.953, -2742.74, 289.644, 	4.72,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--科尔拉玛斯",			571,	4909.821, -3340.41, 290.42, 	5.4,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--冰冷裂口",			571,	6547, -2245, 313.91, 	3.78,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--塞穆之末",			571,	5862.18, -1553.11, 234.08, 	3.9,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--怒爪巢穴",			571,	4980.719, -2265.32, 253.392, 	6.16,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--哈克亚祭坛",			571,	5349.3857, -3759.21, 369.33, 	3.83,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--奎丝鲁恩祭坛",			571,	5720.209, -4255.27, 372.95, 	4.66,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--犸托斯巨坑",			571,	6033.79, -4417.393, 361.65, 	1.32,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--犸托斯祭坛",			571,	6341.266, -4265.28, 459.66, 	3.08,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--赫布达卡",			571,	5957.758, -3842.693, 373.818, 	5.39,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--希姆鲁克",			571,	6211.48, -3526.261, 383.72, 	5.39,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--伦诺克祭坛",			571,	6299.804, -3285.402, 377.165, 	6.26,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--佐尔玛兹要塞",			571,	6452.62, -3899.64, 483.124, 	6.26,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--佐尔赫布",			571,	6362.59, -4417.358, 450.61, 	5.43,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--杜布拉金",			571,	6904.09, -4110.48, 467.35, 	3.99,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--达克玛瓦",			571,	6209.49, -3314.69, 363.958, 	5.71,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_ZulDrak_01:35:35|t祖达克--西莱图斯祭坛",			571,	6187.20, -2620.38, 293.162, 	6.257,	TEAM_NONE,	74,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},

	[TPMENU+0x150]={--索拉查盆地
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--迷失之地",		571, 6167.48, 4208.717, -43.41,5.57,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--锐矛营地",		571, 6628.95, 5176.28, -41.20,1.7,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--奈辛瓦里营地",		571, 5572.7, 5747.09, -75,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--雨声树屋",		571, 5676, 4576, -136,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--斯温迪格林挖掘场",		571, 5925.7807, 5477.04, -87.08,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--湖边着陆场",		571, 5506, 4750, -194,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--狂心岭",		571, 5257.58, 4519.46, -84.77,5.08,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--蓝玉虫巢",		571, 4994, 4312, -85,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--灵鳍湾",		571, 5239.375, 5551.27, -98.93,4.287655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--雾雨村",		571, 6175.12, 4968.07, -97.77,4.487655,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--卡塔克要塞",		571, 4972.34, 5856.50, -64.17,3.0,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--多里安前哨",		571, 6449.35, 5087.442, -63.96,1.78,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--诺兹隆之骨",		571, 5245.172, 5778.02, -71.77,4.07,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--界门",		571, 4891.365, 5178.00, -87.39,3.48,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--硬皮旷野",		571, 5116.04, 4028.93, -61.85,0.03,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--雨声河",		571, 5877.87, 4114.39, -85.51,2.3,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--崩裂碎片",		571, 5585.53, 3854.30, -96.56,4.6,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--苔行村",		571, 5709.53, 3538.09, -4.52,1.77,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--死亡之手营地",		571, 6069.097, 4472.64, -85.09,0.66,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--造物者之座",		571, 6110.897, 5655.63, 5.77,0.64,	TEAM_NONE,	75,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_Sholazar_01:35:35|t索拉查盆地--造物者悬台",		571, 5701.11, 3470.69, 301.707,4.78,	TEAM_NONE,	75,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},

	[TPMENU+0x160]={--晶歌森林
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--风行者观察站",	571,5056, -560, 220,4.018178,	TEAM_ALLIANCE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--夺日者指挥站",	571,5599, -671, 206,4.018178,	TEAM_HORDE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--杉达拉废墟",	571,5370.253, -619.63, 161.512,4.3,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--碧蓝前线",	571,5340.317, -603.29, 184.233,0.62,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--紫罗兰哨站",	571,5685.77, 1007.36, 174.48,5.86,	TEAM_NONE,	74,	0},
	{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t晶歌森林--符印巨树",	571,5888.41, 1127.94, 208.66,4.51,	TEAM_NONE,	74,	0},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x170]={--风暴峭壁
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--冰霜堡",		571,6663, -257, 961.90, 6.0422,	TEAM_ALLIANCE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---唐卡洛营地",		571, 7792, -2812, 1216.72, 6.0422,	TEAM_HORDE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--格罗玛什坠毁点",		571,7873, -738.875, 1175.94, 6.0422,	TEAM_HORDE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---K3",		571,6122.24, -1063.37, 402.566, 4.63,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--布德克拉格庇护所",		571,8409.74, -374.30, 903.321, 6.0422,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---斯巴索克雷区",		571, 6061.128, -659.60, 369.87,2.69,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---加姆雷区",		571, 6332.259, -1322.78, 428.35,4.7,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---加姆高地",		571, 6305.51, -1746.077, 457.577,5.7,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---托赛格的营地",		571, 6262.81, -481.730, 413.157,1.9,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--瓦基里安",		571,7475, 311, 771.05, 6.0422,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---枯萎之池（瓦基里安）",		571, 7427.93, 123.361, 770.196,1.4,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---希弗列尔达村",		571,6822.02, -985.27, 774.91, 3.85,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---布伦希尔达村",		571,7044.52, -1746.46, 819.37, 2.39,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---利齿之坑(布伦希尔达村)",		571,6954, -1657, 810.82, 6.0422,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---荒弃矿洞(布伦希尔达村)",		571, 6949.196, -1447.63, 841.49,1.71,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--尼达维里尔",		571,7944, 120, 1028.033, 6.0422,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---丹尼芬雷",		571, 7381.71, -2634.76, 815.01,4.36,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---弗约恩之砧",		571,7180.48, -3538.70, 826.90, 3.42,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---落雷谷",		571, 7879.052, -3251.80, 850.169, 3.74,	TEAM_NONE,	76, 0},
	{MENU, "下一页", TPMENU+0x1170,GOSSIP_ICON_TAXI},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},
    [TPMENU+0x1170]={--风暴峭壁
    {TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁--被废弃的营地",		571,7173.04, -739.03, 897.36,3.77,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---奥迪斯",		571,7308.992, -734.15, 791.60, 1.58,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---洛肯的宝库",		571,7653.55, -2134.511, 779.65, 5.8,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---霜握的洞穴",		571, 7033.895, -22.89, 840.08,2.4,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---冰霜洞穴",		571, 7785.199, -37.83, 879.44,5.37,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---水晶蛛网洞穴",		571, 6525.74, -1015.78, 434.71,5.6,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---严寒墓穴",		571, 7136.16, -1222.95, 923.31,2.7,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---冬眠洞穴",		571,7193.69, -2086.099, 765.49, 1.52,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---凛风洞穴",		571, 8310, -2906, 1063.95, 3.2,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---奥杜尔",		571,8869, -1331, 1032.12, 2.07,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---布莱恩的营地",		571,7465, -2460, 759.52, 6.0422,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---雪盲岭旁边一无名营地",		571,6240.57, -618.90, 417.11, 4.1,	TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---造物者引擎",		571, 7375.32, -1040.99, 909.64,3.11,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---造物者圣台",		571, 7812.025, -1717.858, 1275.28,5.99,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---米米尔的车间",		571, 8334.92, -57.02, 1275.982,2.16,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---创世神殿",		571, 7875.604, -1351.078, 1534.704,4.54,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---创世者的图书馆",		571, 8081.11, -849.89, 971.72,6.099,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---风暴神殿",		571, 7428.950, -535.688, 1896.85,6.2,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---生命神殿",		571, 7984.40, -2792.511, 1137.99,1.93,TEAM_NONE,	76, 0},
	{TP, "|TInterface/ICONS/Achievement_Zone_StormPeaks_01:35:35|t风暴峭壁---智慧神殿",		571, 8578.30, -591.60, 925.55,2.56,TEAM_NONE,	76, 0},
    {MENU, "上一页", TPMENU+0x170,GOSSIP_ICON_TAXI},
    {MENU, "返回诺森德地图选择", TPMENU+0xf0,GOSSIP_ICON_TAXI},
    },
    
    [TPMENU+0x180]={--冰冠冰川
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---夺日者大帐",		571,	8418.49, 659.40, 550.34, 6.05,	TEAM_HORDE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---银色盟约大帐",		571,	8612.05, 658.75, 550.25, 2.28,	TEAM_ALLIANCE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川--银色前线基地",		571,	6253.30, -38.42, 421.41,4.75,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川--北伐军之峰",		571,	6413.88, 444.69, 511.28,2.86,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---邪魔之坑",		571,	7181, 693, 496,1.823712,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---死亡之门莫德雷萨",		571,	6938.91, 1357.61, 396.30,2.45,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---铁墙大坝",		571,	6342.91, 1099.77, 324.95,3.72,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---依米海姆",		571,	7173.40, 1726.177, 477.33,2.2,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---玛雷卡里斯:邪恶城堡",		571,	6569.82, 1778.99, 629.92,3.03,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---白骨之庭",		571,	6436.74, 2360.92, 466.50,4.7,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---黑暗大教堂",		571,	6170.81, 2683.83, 573.91,1.98,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川--恐怖之门科雷萨",		571,	6803, 2228, 577.606, 2.53,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---缝合场",		571,	6390, 3243, 653.73, 6.0,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---复生密室(缝合场)",		571,	6595.127, 3247.55, 671.51, 5.6,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---巴拉加德堡垒",	571,	7057.95, 4256.63, 676.85, 4.47,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---死亡高地",		571,	7417, 4215, 314.147, 5.33,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---先锋军港口",		571,	7478, 4747, 55.22, 0.3,	TEAM_NONE,	77,	0},
    {MENU, "下一页", TPMENU+0x1180,GOSSIP_ICON_TAXI},
	{MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
	},
	[TPMENU+0x1180]={--冰冠冰川
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---约尔达村",		571,	7680, 3701, 650.136,5.1823712,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---先祖大厅(约尔达村)",		571,	7390.26, 3749.40,619.57, 2.47,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---战痕尖塔",		571,	7225, 3639, 809.21, 0.16,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---地下大厅(尤顿海姆)",		571,	7944.26, 3253.98, 676.136, 0.49,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---瓦哈拉斯(尤顿海姆)",		571,	8221, 3532, 625.43, 3.94,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---野蛮之台",		571,	8491, 3127, 588.14,  3.93,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---暗影拱顶",		571,	8395.15, 2680.64, 657.62, 4.69,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---荒凉之门奥尔杜萨",		571,	8116, 1940, 500.31,2.47,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---沉默墓地",		571,	7885, 718, 519.26, 1.08,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---银色比武场",		571,	8435.47,791.827,558.24, 3.11,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---破海者航道",		571,	9602.759,932.12,1.35, 2.92,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---银锋号",		571,	9084.25,1250.77,4.198,2.4,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---炎鹰号",		571,	9471.517,1231.30,6.62,4.38,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---浪巅号",		571,	9565.86,960.52,4.65,3.9,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---洛斯加尔登陆点",		571,	9971.37,1076.82,22.34,5.68,	TEAM_NONE,	77,	0},
    {TP, "|TInterface/ICONS/Achievement_Zone_IceCrown_05:35:35|t冰冠冰川---唤雾者的洞穴",		571,	10144.125,1205.26,81.34,5.9,	TEAM_NONE,	77,	0},
    {MENU, "上一页", TPMENU+0x180,GOSSIP_ICON_TAXI},
    {MENU, "返回诺森德地图选择", TPMENU+0xf0,GOSSIP_ICON_TAXI},
    },
    
     [TPMENU+0x190]={--冬拥湖
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--冰冷湿地",			571,	5025, 3683,362.95,5.9,	TEAM_HORDE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--联盟起始点",			571,	5100, 2181, 365.62,5.9,	TEAM_ALLIANCE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--东部火花车间",			571,	4370, 2351, 376.31,5.9,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--西部火花车间",			571,	4377, 3301, 372.42,5.9,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--破碎神殿",			571,	4928.43, 3341.9, 376.35,4.6,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--冬拥堡垒",			571,	5366.129, 2833.39, 409.32,3.14,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--沉降之环",			571,	4953.146, 2419.37, 320.177,1.49,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--中部桥梁",			571,	4608.425, 2851.256, 396.897,0.12,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--冬缘塔楼",			571,	4423.779, 2822.98, 409.93,0.12,	TEAM_NONE,	77,	0},
     {TP, "|TInterface/ICONS/Achievement_Zone_Winterspring:35:35|t冬拥湖--火光塔楼",			571,	4469.722, 1967.64, 439.29,1.08,	TEAM_NONE,	77,	0},
     {MENU, "上一页", TPMENU+0xf0,GOSSIP_ICON_TAXI},
     },
     
        [TPMENU+0x510]={--风景传送
		{TP, "|TInterface/ICONS/Mail_GMIcon:35:35|tGM之岛",		                        	1, 16222.1,		16252.1,	12.5872,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Tanaris_01:35:35|t时光之穴",		          1,-8173.93018,	-4737.46387,33.77735,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Desolace:35:35|t世界之树",			      1,5377.86, -3374.48, 1655.67,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Feralas:35:35|t梦境之树",		           1,-2914.7561,	1902.19934,	34.74103,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_DustwallowMarsh:35:35|t恐怖之岛",		  1, -5975.3,	3260.3,	41.7,	4.65},
		{TP, "|TInterface/ICONS/Achievement_Zone_BoreanTundra_09:35:35|t天涯海滩",		      1,-9851.61719,	-3608.47412,8.93973,	0},
		{TP, "|TInterface/ICONS/achievement_zone_darkshore_01:35:35|t南海岛礁",		      1,-11839, -4759, 6.2,	4.4},
		{TP, "|TInterface/ICONS/Achievement_Zone_UnGoroCrater_01:35:35|t安戈洛环形山",	  1,-8562.09668,	-2106.05664,8.85254,	0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Redridgemountains:35:35|t石堡瀑布",		0,-9481.49316,	-3326.91528,8.86435,	0},
		{TP, "|TInterface/ICONS/achievement_zone_wetlands_01:35:35|t格瑞姆巴托",		0,-4053.99, -3450.62, 283.383,	0},
		{TP, "|TInterface/ICONS/INV_Misc_Toy_10:35:35|t暴雪建设公司路障",          1, 5478.06006,	-3730.8501,	1593.44,	0},
		{TP, "|TInterface/ICONS/inv_helmet_52:35:35|t血色图书馆",         189, 162.5, -429, 18.5, 3.12},
		{TP, "|TInterface/ICONS/ability_mage_brainfreeze:35:35|t埃雷萨拉斯图书馆",       429, 125.31, 459.14, -48.46, 3.16},
		{TP, "|TInterface/ICONS/Trade_alchemy:35:35|t通灵学院炼金台",          289,  38.85, 159.04, 83.55, 1.4},
		{TP, "|TInterface/ICONS/trade_blacksmithing:35:35|t暗炉城黑铁砧",           230,891.8, -270.1, -71.9, 5.46},
		{TP, "|TInterface/ICONS/spell_fire_flameblades:35:35|t熔火之心门外黑熔炉",           230,1206.083130,-432.294861,-100.043015,5.092973},
		{TP, "|TInterface/ICONS/inv_drink_03:35:35|t黑铁酒吧",          230, 884.9, -179.6, -44, 1.51},
		{TP, "|TInterface/ICONS/inv_drink_05:35:35|t旧南海镇酒馆",           560,1815.23, 1034.54, 11.07, 5.32},
		{TP, "|TInterface/ICONS/Achievement_Zone_CrystalSong_01:35:35|t达拉然楼顶露台",  		571,5854.834961,829.670593,846.338196,3.768488},
		{TP, "|TInterface/ICONS/achievement_boss_bazil_akumai:35:35|t|cff3F636C地铁水怪",   369,-74.528526,1245.836914,-123.909348,3.161240},
		{TP, "|TInterface/ICONS/achievement_zone_duskwood:35:35|t|cff3F636C翡翠梦境",  169,2737.508057,-3318.57959,101.88282,3.07},
		{TP, "|TInterface/ICONS/Achievement_Zone_Azshara_01:35:35|t|cff3F636C积雪平原",  37,323,173,235,1.03},
		{TP, "|TInterface/ICONS/achievement_zone_hellfirepeninsula_01:35:35|t|cff3F636C旧外域",   0,-14903, 12898, 10,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Nagrand_01:35:35|t|cff3F636C纳格兰雏形",   36,-1594, 480, 1,0},
		{TP, "|TInterface/ICONS/Achievement_Zone_Silverpine_01:35:35|t|cff3F636C吉尔尼斯",   0,-987.449,1585.69,53.4298,0},
		{TP, "|TInterface/ICONS/achievement_zone_deadwindpass:35:35|t|cff3F636C卡拉赞墓穴",   0,-11087.746094,-1780.355103,52.609112,1.794595},
		{TP, "|TInterface/ICONS/achievement_leader_king_magni_bronzebeard:35:35|t|cff3F636C旧铁炉堡",0,-4823.773438,-978.103943,464.708923,3.864171   },
        {MENU, "上一页", TPMENU,GOSSIP_ICON_TAXI},
		},

	
	[TPMENU+0xd0]={--沙塔斯城
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--圣光广场",	530,	-1851.32, 5430.32, -10.4625,	4.40435,	TEAM_NONE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--贫民窟",	530,	-1680.4, 5223.28, -49.0123,	4.40435,	TEAM_NONE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--占星者银行",	530,	-2010.88, 5356.45, -9.35047,	5.935,	TEAM_NONE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--奥尔多银行",	530,	-1717.73, 5502.47, -9.79939,	4.40435,	TEAM_NONE},
    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--占星者之台",	530,    -2186.08, 5538.08, 64.0724,         5.935,	TEAM_NONE},
    {TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportShattrath:35:35|t沙塔斯城--奥尔多高地",	530,    -1746.27, 5782.12, 146.44,         4.40435,	TEAM_NONE},
    {MENU, "上一页", TPMENU+0x10,GOSSIP_ICON_TAXI},
    },
	[TPMENU+0xe0]={--达拉然
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--克拉苏斯平台",	571,	5813.87,	448.76,	658.75,	1.641,	TEAM_NONE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--夺日者圣殿",	571,	5937.39,	504.51,	650.26,	2.04,	TEAM_HORDE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--鲁因广场",	571,	5810.56,	634.39,	647.49,	2.45,	TEAM_NONE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--魔法商业区",	571,	5899.09, 724.42,	639.91,	3.0588,	TEAM_NONE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--达拉然商业银行",	571,	5966.95, 613.91,	650.62,	5.91,	TEAM_HORDE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--银色领地",	571,	5764.04, 715.24,	641.84, 5.61,	TEAM_ALLIANCE},
	{TP, "|TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--达拉然商业银行",	571,	564.036, 687.446,	651.99,2.696,	TEAM_ALLIANCE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--紫罗兰城堡",	571,	5797.43, 793.88,	661.86,	1.43,	TEAM_NONE},
	{TP, "|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t达拉然--紫罗兰监狱",	571,	5726.06,543.42,	652.82,	4.027,	TEAM_NONE},
	{MENU, "上一页", TPMENU+0x10,GOSSIP_ICON_TAXI},
	},
--天蓝传送菜单结束

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
