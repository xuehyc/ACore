
---by 有爱 ljq5555
----自动加入工会
local guildid = {
    --自动加入的工会名称
    [0] = '客官不可以自撸要撸我帮你',--联盟
    [1] = '客官不可以自撸要撸我帮你'--部落
}
local guildrank={--默认加入的等级，等级可以在guild_rank表查看字段rid，一般默认为会长、官员、精英、会员、新人，依次为0，1，2，3，4
    [0] = 4,--联盟 
    [1] = 4 --部落
}
--注册玩家登陆事件，其中player代表的是玩家变量
function AutoJoinGuildOnLogin(event, player)
--判断玩家是否加入了工会IsInGuild() ,not是反向的意思，就是未加入
    if not player:IsInGuild() then
--GetGuildByName(工会名字) 通过工会名称获取工会对象 lua的命令特别常见的都是 对象:方法  这种方法需要确定对象必须不能为nil就是不能为空
        local newguild = GetGuildByName(guildid[player:GetTeam()]) 
        if newguild == nil then
        else
            newguild:AddMember(player, guildrank[player:GetTeam()])  --AddMember(玩家,等级)像工会添加成员
            player:SendBroadcastMessage('你已加入工会['..guildid[player:GetTeam()]   ..']'        )--在客户端打印一行提示，这个比较常用，可以用来输出很多东西
        end
    end
end
RegisterPlayerEvent(3, AutoJoinGuildOnLogin)                  
--注册玩家登陆事件,在玩家登陆角色的时候触发，3代表是登陆，AutoJoinGuildOnLogin 代表需要出发的具体代码
print('loading AutoJoinGuildOnLogin.lua...ok by ljq5555 ')   --控制台打印一行文字，调试的时候经常用 print(xxx)
