--非常夸张的登录公告
print(">>myscript: huanying...OK   .my fang139842")
local lm                = 0
local bl                = 1
local zy_zs  	        = 1
local zy_qs			    = 2
local zy_lr		    	= 3
local zy_dz			    = 4
local zy_ms             = 5
local zy_dk             = 6
local zy_sm			    = 7
local zy_fs			    = 8
local zy_ss			    = 9
local zy_xd			    = 11
local gonghui_0         = 0
local my_zy = {
[zy_zs] = "|cFFFF6600战士",
[zy_qs] = "|cFFCC9966圣骑士",
[zy_lr] = "|cFFFFCCCC猎人",
[zy_dz] = "|cFF996666盗贼",
[zy_ms] = "|cFFFF66FF牧师",
[zy_dk] = "|cFFCC99FF死亡骑士",
[zy_sm] = "|cFF330099萨满",
[zy_fs] = "|cFF663333法师",
[zy_ss] = "|cFFFF33FF术士",
[zy_xd] = "|cFF9933CC德鲁伊"
}
local  zz_rl                = 1		    --人类
local  zz_sr                = 2		    --兽人
local  zz_ar		    	= 3		    --矮人
local  zz_ayjl			    = 4		    --暗夜精灵
local  zz_wl                = 5		    --亡灵
local  zz_ntr               = 6		    --牛头人
local  zz_zr                = 7		    --侏儒
local  zz_jm			    = 8		    --巨魔
local  zz_xjl			    = 10		--血精灵
local  zz_dln			    = 11	    --德莱尼
local my_zz={
    [zz_rl]   = "|cFFFF6600人类",
    [zz_sr]   = "|cFFCC9966兽人",
    [zz_ar]   = "|cFFFFCCCC矮人",
    [zz_ayjl] = "|cFF996666暗夜精灵",
    [zz_wl]   = "|cFFFF66FF亡灵",
    [zz_ntr]  = "|cFFCC99FF牛头人",
    [zz_zr]   = "|cFF330099侏儒",
    [zz_jm]   = "|cFF663333巨魔",
    [zz_xjl]  = "|cFFFF33FF血精灵",
    [zz_dln]  = "|cFF9933CC德莱尼"

}
local function my_xinxi(Player)
    local fuhao = "〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓"  --框架符号
    local myname = Player:GetName()                 --获取玩家姓名
    local level = Player:GetLevel()                 --获取玩家等级
    local zhenying = ""
    local zhenying_zy = Player:GetTeam()            --获取阵营名称
    local ipdizhi = Player:GetPlayerIP()            --获取玩家IP地址
    local jjcdianshu = Player:GetArenaPoints()      --获取玩家竞技场积分
    if(zhenying_zy == lm) then                      --判断玩家阵营
        zhenying = "|cFFFF0033联盟"
    else
        zhenying = "|cFF0000FF部落"
    end
    local jinbi = Player:GetCoinage()               --获取玩家铜币
    local ghxx = ""
    local gonghui_00 = Player:GetGuildId()          --获取玩家工会ID
    if gonghui_00 == gonghui_0 then
        ghxx = "没有加入任何工会"
    else
        ghxx = Player:GetGuildName(gonghui_00)
    end
    return string.format("\n|cFFFF33FF%s\n|cFF33FF33DUANG,DUANG,DUANG....特大消息\n|cFF33FF33伟大的【|cFFFF0033%s】|cFF33FF33上线了\n|cFF33FF33他的等级是：|cFFFF0033【%s】\n|cFF33FF33他的IP地址是：|cFFFF0033【%s】\n|cFF33FF33他的阵营是：|cFFFF0033【%s】\n|cFF33FF33他的竞技场点数是：|cFFFF0033【%s】\n".."|cFF33FF33他的职业是："..my_zy[Player:GetClass()].."\n|cFF33FF33他的种族是："..my_zz[Player:GetRace()].."\n|cFF33FF33他的铜币数量是：|cFFFF0033【%s】\n|cFFFF33FF他的工会叫：|cFFFF0033【%s】\n|cFFFF33FF%s",fuhao,myname,level,ipdizhi,zhenying,jjcdianshu,jinbi,ghxx,fuhao)
end
local function shangxian(event,Player)
    SendWorldMessage(my_xinxi(Player))

end
RegisterPlayerEvent(3,shangxian)
