
---------------------------------------------------------------------------宠物系统------------------------------------------------------------------------------------------------

local display1={503,
381,
3027,
377,
8871,
389,
3035,
607,
607,
381
}
local display2={6084,6076,4442,2710,4473,1253,4643,4643,1056,1284,9443,9442,10918,9448,1537,295,1917,11012,3022,2168,17149,17153,18628,19279,20201,20419,19397,19682,19299,19410,21174,21357,21262,21490,21443,21135,21252,10115,14308,14367,15346,15347,15360,15656,15743,15739,15778,15761,15376,15432,16035,15931,15928,16137,16064,16154,16155,10729,16110,16174,31119,30893,31165,30521,30721,31286,29524,31089,28777,28743,28954,28953,28053,22657,24874,26740,26715,28040,28045,28043}
local display10={11380,
26752,
27569,
19270,
24808,
31952,
16033,
27035,
20510,
15366
}
local display11={6084,6076,4442,2710,4473,1253,4643,4643,1056,1284,9443,9442,10918,9448,1537,295,1917,11012,3022,2168,17149,17153,18628,19279,20201,20419,19397,19682,19299,19410,21174,21357,21262,21490,21443,21135,21252,10115,14308,14367,15346,15347,15360,15656,15743,15739,15778,15761,15376,15432,16035,15931,15928,16137,16064,16154,16155,10729,16110,16174,31119,30893,31165,30521,30721,31286,29524,31089,28777,28743,28954,28953,28053,22657,24874,26740,26715,28040,28045,28043,11380,
26752,
27569,
19270,
24808,
31952,
16033,
27035,
20510,
15366}


local spell2={90919,200060,200061,200062,200063}

local spell3={90999,90999,90999,90999,90999}
local spell4={91019,91019,91019,91019,91019}

local spell5={21868,172310,41431,21868,50774,13589,19726}
local spell6={93569,93299,93269,92639,92909}

local spell7={58567,24453,26064,35346,50541}

local spell8={200055,52016,16551,23931,40029}

local spell9={15636,42917,40100,40585,40827}
local spell10={13880,65949,35159,40636,31442}



local pet= {}
local petlevel={}
function addpet(event, player, item, target)
	
	local pGuid = player:GetGUIDLow()
	pet[pGuid]=CharDBQuery("select PetType from character_pet where `owner`="..pGuid.." and slot=0 and PetType=1")
		
	if pet[pGuid]~=nil then
		player:SendBroadcastMessage("|cFF00FFFF 你已经有宠物|r")

	else
		
		local sschong= CharDBQuery("select PetType from character_pet where `owner`="..pGuid.." and slot=0 and PetType=0")
		if sschong~=nil then
			player:SendBroadcastMessage("|cFF00FFFF 解散你的术士宠物再使用卷轴|r")
		else
			player:LearnSpell(883)
			player:LearnSpell(982)
			player:LearnSpell(2641)
			player:LearnSpell(6991)
			player:LearnSpell(53270)
			local maxid= CharDBQuery("select max(id)+1 from character_pet WHERE id<500000")
			--CharDBExecute("INSERT INTO `character_pet` VALUES ("..tostring(maxid:GetInt32(0))..", '3100', '"..tostring(player:GetGUIDLow()).."', '"..display1[math.random(0,9)].."', '0', '1', '80', '0', '0', '野猪', '0', '0', '351104', '38400', '166500', '1484906060', '7 2 7 1 7 0 129 52474 129 61676 129 35295 129 1742 6 2 6 1 6 0 ', '0')")
			
			CharDBExecute("INSERT INTO `character_pet` VALUES ("..tostring(maxid:GetInt32(0))..", '11673', '"..tostring(player:GetGUIDLow()).."', '"..display1[math.random(1,10)].."', '17164', '1', '80', '0', '0', '宠物', '0', '0', '72707', '68055', '0', '1486576431', '7 2 7 1 7 0 129 61676 129 53575 129 52474 129 1742 6 2 6 1 6 0 ', '0')")
			
			--CharDBExecute("INSERT INTO `character_pet` VALUES ("..tostring(maxid:GetInt32(0))..", '11673', '"..tostring(player:GetGUIDLow()).."', '"..display1[math.random(0,9)].."', '0', '1', '80', '0', '0', '宠物', '1', '100', '71552', '0', '151090', '1486970339', '7 2 7 1 7 0 129 61676 129 52474 129 58611 129 1742 6 2 6 1 6 0 ', '0')")
			
			CharDBExecute("delete from `character_pet_level` where  id="..tostring(maxid:GetInt32(0)).." and owner="..tostring(player:GetGUIDLow()).."")

			CharDBExecute("insert into `character_pet_level` values("..tostring(maxid:GetInt32(0))..","..tostring(player:GetGUIDLow())..",0)")
			
			player:SendBroadcastMessage("|cFF00FFFF 你获得一级宠物。使用召唤宠物技能召唤.|r") ;
			
				
			player:RemoveItem(100014, 1)
		end	
				
		
		
		
	end
	
	
	
end


RegisterItemEvent(100014, 2, addpet);



function shengjichongwu(event, player, item, target,intid)
	
	local pGuid = player:GetGUIDLow()
	
	--pet[pGuid]=CharDBQuery("select `name` from character_pet where `owner`="..pGuid)
	pet[pGuid]=CharDBQuery("select * from character_pet where `owner`="..pGuid.." and slot=0 and PetType=1")
	if pet[pGuid]~=nil then
		local curpetlevel=CharDBQuery("select dengji from character_pet_level where id="..tostring(pet[pGuid]:GetInt32(0)).." and owner="..pGuid)
		if curpetlevel==nil then
			CharDBExecute("insert into `character_pet_level` values("..tostring(pet[pGuid]:GetInt32(0))..","..pGuid..",0)")
			petlevel[pGuid]=0
		else
			petlevel[pGuid]=curpetlevel:GetInt32(0)
		end
		
	end
	
	
	if pet[pGuid]==nil then
		player:SendBroadcastMessage("|cFF00FFFF 你没有可升级的宠物在身边|r")
	else
		
		player:GossipClearMenu()
		player:GossipMenuAddItem(4,"宠物名称："..tostring(pet[pGuid]:GetString(9)).."\n宠物等级："..tostring(petlevel[pGuid]+1).."级宠物",1,10001)
		
		if petlevel[pGuid]<4 then
			
		
			player:GossipMenuAddItem(4,"升级材料："..GetItemLink(49426).."*20",1,10001)
		end
		
		if petlevel[pGuid]>3 and petlevel[pGuid]<9 then
			
		
			player:GossipMenuAddItem(4,"升级材料："..GetItemLink(6522).."*100\n升级材料："..GetItemLink(11387).."*1",1,10001)
		end
		
		if  petlevel[pGuid]<9 then
			player:GossipMenuAddItem(4,"成功几率：95%",1,10001)
			player:GossipMenuAddItem(4,"升级宠物",1,998)
		else
			player:GossipMenuAddItem(4,"已经最高级，无法升级",1,10001)
			player:GossipMenuAddItem(4,"随机重铸宠物外形:"..GetItemLink(6522).."*100",1,10001)
			player:GossipMenuAddItem(4,"确认重铸外形",1,1919)
		end
		
		player:GossipSendMenu(2,player,201001)			
		
		
		
		
	end
	

	
			
end

function shengji2(event, player, item, target,intid)
	local pGuid = player:GetGUIDLow()
	
	if pet[pGuid]==nil then
		pet[pGuid]=CharDBQuery("select * from character_pet where `owner`="..pGuid.." and slot=0")
		
	end
	
	if petlevel[pGuid]==nil then
			local curpetlevel=CharDBQuery("select dengji from character_pet_level where id="..tostring(pet[pGuid]:GetInt32(0)).." and owner="..pGuid)
			if curpetlevel==nil then
				CharDBExecute("insert into `character_pet_level` values("..tostring(pet[pGuid]:GetInt32(0))..","..pGuid..",,0)")
				petlevel[pGuid]=0
			else
				petlevel[pGuid]=curpetlevel:GetInt32(0)
			end
		
	end
	
	if intid==1919 then
		if player:GetItemCount(6522) >=100 then
			player:RemoveItem(6522, 100)
			player:SendBroadcastMessage("|cFF00FFFF 三秒后小腿完成重铸！|r")
			sleep(1)
			player:SendBroadcastMessage("|cFF00FFFF 3|r")
			sleep(1)
			player:SendBroadcastMessage("|cFF00FFFF 2|r")
			sleep(1)
			player:SendBroadcastMessage("|cFF00FFFF 1|r")
			player:LogoutPlayer(true)
			CharDBExecute("update character_pet set modelid="..display11[math.random(1,90)].." where id="..tostring(pet[pGuid]:GetInt32(0)))
		else
			player:SendBroadcastMessage("|cFF00FFFF 材料不足！|r")
		end
	elseif intid == 998 then
		
		local disid
		local active
		local spellid
		
		if petlevel[pGuid]==0 then
			disid=display2[math.random(1,80)]
			spellid=spell2[math.random(1,5)]
			
			active=129
		end
		if petlevel[pGuid]==1 then
			disid=display2[math.random(1,80)]
			spellid=spell3[math.random(1,5)]
			active=1
		end
		if petlevel[pGuid]==2 then
			disid=display2[math.random(1,80)]
			spellid=spell4[math.random(1,5)]
			active=1
		end
		if petlevel[pGuid]==3 then
			disid=display2[math.random(1,80)]
			spellid=spell5[math.random(1,5)]
			active=129
		end
		if petlevel[pGuid]==4 then
			disid=display2[math.random(1,80)]
			spellid=spell6[math.random(1,5)]
			active=1
		end
		if petlevel[pGuid]==5 then
			disid=display2[math.random(1,80)]
			spellid=spell7[math.random(1,5)]
			active=129
		end
		if petlevel[pGuid]==6 then
			disid=display2[math.random(1,80)]
			spellid=spell8[math.random(1,5)]
			active=129
		end
		if petlevel[pGuid]==7 then
			disid=display2[math.random(1,80)]
			spellid=spell9[math.random(1,5)]
			active=129
		end
		if petlevel[pGuid]==8 then
			disid=display10[math.random(1,10)]
			spellid=spell10[math.random(1,5)]
			active=129
		end

		
		
		
		
		if petlevel[pGuid]<5 then
			if player:HasItem(49426,20)  then
				
				
				
				player:RemoveItem(49426, 20)
				
				--sleep(1)
				
				
				player:SendBroadcastMessage("|cFF00FFFF 三秒后小腿完成宠物升级！|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 3|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 2|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 1|r")
				player:LogoutPlayer(true)
				CharDBExecute("update character_pet set PetType=1,`level`=80,modelid="..disid.." where id="..tostring(pet[pGuid]:GetInt32(0)))
				CharDBExecute("update character_pet_level set dengji=dengji+1 where id="..tostring(pet[pGuid]:GetInt32(0)).." and owner="..pGuid)
				
				CharDBExecute("insert into pet_spell values("..tostring(pet[pGuid]:GetInt32(0))..","..spellid..","..active..")")
			else
				player:SendBroadcastMessage("|cFF00FFFF 升级材料不足！|r")
			end
			
			player:GossipComplete()	
		end
		
		if petlevel[pGuid]>4 and petlevel[pGuid]<10 then
			if player:HasItem(6522,100) and player:HasItem(11387,1) then
				player:RemoveItem(6522, 100)
				player:RemoveItem(11387, 1)
				--sleep(1)
				
				player:SendBroadcastMessage("|cFF00FFFF 三秒后小腿完成宠物升级！|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 3|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 2|r")
				sleep(1)
				player:SendBroadcastMessage("|cFF00FFFF 1|r")
				player:LogoutPlayer(true)
				CharDBExecute("update character_pet set `level`=80,modelid="..disid.." where id="..tostring(pet[pGuid]:GetInt32(0)))
				CharDBExecute("update character_pet_level set dengji=dengji+1 where id="..tostring(pet[pGuid]:GetInt32(0)).." and owner="..pGuid)
				CharDBExecute("insert into pet_spell values("..tostring(pet[pGuid]:GetInt32(0))..","..spellid..","..active..")")
			else
				player:SendBroadcastMessage("|cFF00FFFF 升级材料不足！|r")
			end
			
			player:GossipComplete()	
			
		end
		
		
		
		
		
	else
		return shengjichongwu(event, player, item, target,intid)		
	end
end

function sleep(n)
    if n > 0 then
        os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") 
    end
end


function getdisplayid(dengjiid)
	
end


RegisterItemEvent(60019, 2, shengjichongwu)
RegisterPlayerGossipEvent(201001,2,shengji2)
