--print('levelup_reward module loading...')






function levelup_reward(event, player, oldLevel)    --升级奖励金币
--player:ModifyMoney(10000) --奖励1金,原版

--oldLevel=getuint32(oldLevel)--报错
--尝试更换数据类型,之前会报字符串转数值错误(错误如下:)
--lua_scripts/UIWoW/levelup_reward.lua:14(行号): attempt to perform arithmetic on a string value
local maxlevel_talentpoints = 2                     --满级后升级奖励天赋点

if(oldLevel==80) then
    freeTalentPointAmt = player:GetFreeTalentPoints()
    player:SetLevel("80")   --重置为80级    --此处有BUG,一旦用命令升级到80,就无法回退其他等级
    player:SetFreeTalentPoints(freeTalentPointAmt+maxlevel_talentpoints)
    player:SendBroadcastMessage("恭喜你满级后再次升级,奖励你"..maxlevel_talentpoints.."点天赋点.")

else if(oldLevel==81) then
    --此处为预防81级回退80级出现多余提示
    --此功能使用于满级升级奖励天赋点模块
else
    player:ModifyMoney(oldLevel*1000)

    --奖励上一级*1000银币,如1级升到2级,则奖励1*1000银币,即0.1金.
    --2级升3级,则奖励2*1000银币,即0.2金.
    --不奖励固定值的原因是,前期给1金是很庞大的数值,虽然对玩家来说是便利了些,但也丧失了积攒金币的乐趣.
    --后期给1金币,又太少了,所以给了个变动值.
    --player:SendBroadcastMessage("You owned "..((oldLevel*1000)/10000).."Gold for your levelup.")--好像没起作用,试试下句
    --player:SendBroadcastMessage("You owned some Gold for your levelup
    --player:SendBroadcastMessage("恭喜你升级了,奖励你一些金币.")
    player:SendBroadcastMessage("恭喜你升级了,奖励你"..((oldLevel*1000)/10000).."金币.")
    --player:SendBroadcastMessage("升级奖励1金")
end
end
end
RegisterPlayerEvent(13, levelup_reward)
print('levelup_reward module loaded.') 
