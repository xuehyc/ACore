--魔兽世界《天涯旅店》公益服
--QQ技术交流群：755082209

local oneLifePlayers = {}

--一命组队不加击杀经验
function OnAddXP(event, player, amount, victim)
	if player == nil then
		return amount
	end
	if oneLifePlayers[player:GetGUIDLow()] ~= nil and player:IsInGroup() and victim ~= nil then
		return 0
	end
	return amount
end

--开启一命模式
function OnChat(event, player, msg, Type, lang)
	if player == nil then
		return
	end
	if msg == "onelife" then 
		local guid = player:GetGUIDLow()
		if oneLifePlayers[guid] ~= nil then 
			player:SendBroadcastMessage("已经是一命模式了！")
			return
		end
		if player:GetLevel() == 1 then
			CharDBQuery("INSERT INTO character_one_life (GUID,DEAD) VALUES ("..guid..",0)")
			oneLifePlayers[guid] = 0
			player:SendBroadcastMessage("开启一命模式成功！")
			SendWorldMessage(getPlayerLink(player:GetName()).."开启了一命模式！")
			return
		else 
			player:SendBroadcastMessage("开启一命模式失败！只有1级角色才能开启一命模式！")
			return
		end
	end
end

--被玩家杀死
function OnPlayerKill(event, killer, killed)
	if killed == nil then 
		return
	end
	local guid = killed:GetGUIDLow()
	if oneLifePlayers[guid] == 0 then
		local killerInfo = ""
		if killer ~= nil then
			killerInfo = "击杀者："..getPlayerLink(killer:GetName())
		end
		onDeath(killed, killerInfo)
	end
end

--被怪物杀死
function OnCreatureKill(event, killer, killed)
	if killed == nil then 
		return
	end
	local guid = killed:GetGUIDLow()
	if oneLifePlayers[guid] == 0 then
		local killerInfo = ""
		if killer ~= nil then 
			--查询怪物中文名
			killed:SendBroadcastMessage("怪物entry"..killer:GetEntry())
			local name = getCreatureName(killer:GetEntry())
			if name ~= "" then 
				killerInfo = "击杀者："..name
			end
		end
		onDeath(killed,killerInfo)
	end
end

--死亡处理
function onDeath(player, killerInfo)
	SendWorldMessage(getPlayerLink(player:GetName()).."等级："..player:GetLevel().."，于"..GetAreaName(player:GetAreaId(),4).."不幸牺牲！"..killerInfo)
	local guid = player:GetGUIDLow()
	oneLifePlayers[guid] = 1
	CharDBQuery("UPDATE character_one_life SET DEAD=1 WHERE GUID="..guid)
end

--80解除一命
function OnLevelChange(event, player, oldLevel)
	if player == nil then
		return
	end
	if player:GetLevel() == 80 then
		local guid = player:GetGUIDLow()
		if oneLifePlayers[guid] ~= nil then
			oneLifePlayers[guid] = nil
			CharDBQuery("DELETE FROM character_one_life WHERE GUID="..guid)
			--发奖励
			SendMail("恭喜！一命挑战成功！","亲爱的"..player:GetName().."：\n\n  所有坎坷，终成坦途！愿你永远保持初心，热爱并享受这个世界！\n\n天涯旅店",guid,0,61,0,0,0,30609,1)
			SendWorldMessage(getPlayerLink(player:GetName()).."一命模式挑战成功！")
		end
	end
end

--上线检测
function OnLogin(event, player)
	if player == nil then
		return
	end
	if oneLifePlayers[player:GetGUIDLow()] == 1 then 
		player:KickPlayer()
	elseif oneLifePlayers[player:GetGUIDLow()] == 0 then
		player:SendBroadcastMessage("当前角色为一命模式！注意安全！")
	end
end

--玩家名字链接
function getPlayerLink(name)
	return "|cffffffff|Hplayer:"..name.."|h["..name.."]|h|r"
end

--获取怪物中文名字
function getCreatureName(entry)
	local result = WorldDBQuery("SELECT Name FROM creature_template_locale WHERE entry="..entry.." and locale='zhCN'")
	local name=""
	if result ~= nil then
		name = result:GetString(0)
	end
	return name
end

function OnResurrect(event, player)
	if player == nil then
		return
	end
	if oneLifePlayers[player:GetGUIDLow()] == 1 then
		player:KillPlayer()
		player:KickPlayer()
	end
end

--初始建表
CharDBQuery([[
CREATE TABLE IF NOT EXISTS `character_one_life` (
`GUID` INT(10) UNSIGNED NOT NULL COMMENT 'Player guidLow',
`DEAD` TINYINT(3) NOT NULL DEFAULT 0 COMMENT 'Is Dead',
PRIMARY KEY (`GUID`)
)
ENGINE=InnoDB;
]])

--初始加载
local result = CharDBQuery("SELECT GUID,DEAD FROM character_one_life")
if result then
	repeat 
		local guid = result:GetUInt32(0)
		local dead = result:GetUInt32(1)
		oneLifePlayers[guid] = dead
	until not result:NextRow()
end

--事件注册
RegisterPlayerEvent(12, OnAddXP) --加经验的时候
RegisterPlayerEvent(18, OnChat) --聊天的时候
RegisterPlayerEvent(13, OnLevelChange) --等级变化的时候
RegisterPlayerEvent(3, OnLogin) --上线的时候
RegisterPlayerEvent(6, OnPlayerKill) --被玩家杀死的时候
RegisterPlayerEvent(8, OnCreatureKill) --被怪杀死的时候
RegisterPlayerEvent(36, OnResurrect) --复活的时候
