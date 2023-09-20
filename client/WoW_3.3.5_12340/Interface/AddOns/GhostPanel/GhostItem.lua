function Ghost_FetchData_ItemData(data)
    local itemId,des,heroText,daylimit,maxGems,
    exchange1,exchangeReqId1,exchange2,exchangeReqId2,unbindReqId,useReqId,equipReqId,buyReqId,
    sellRewId,recoveryRewId,gs = strsplit("^",data);

    Ghost.Data.Item.Entry[itemId] = {
        ["des"]                 = des,
        ["heroText"]            = heroText,
        ["daylimit"]            = tonumber(daylimit),
        ["maxGems"]             = tonumber(maxGems),
        ["exchange1"]           = tonumber(exchange1),
        ["exchangeReqId1"]      = tonumber(exchangeReqId1),
        ["exchange2"]           = tonumber(exchange2),
        ["exchangeReqId2"]      = tonumber(exchangeReqId2),
        ["unbindReqId"]         = tonumber(unbindReqId),
        ["useReqId"]            = tonumber(useReqId),
        ["equipReqId"]          = tonumber(equipReqId),
        ["buyReqId"]            = tonumber(buyReqId),
        ["sellRewId"]           = tonumber(sellRewId),
        ["recoveryRewId"]       = tonumber(recoveryRewId),
        ["gs"]                  = tonumber(gs),
    }
end

function Ghost_FetchData_ItemGUIDData(data)
	print(data)
    local guid,spells = strsplit(" ",data);
	Ghost.Data.Item.GUID[tonumber(guid)] = Split(spells,",");
end

function Ghost_FetchData_DayLimitData(data)
    local id,hascount = strsplit(" ",data);
    Ghost.Char.DayLimitItem[id]	= hascount;
end
