--print "---------- GM Login/Logout Module Loading---"

local function GMLogin (event, player)
    if player:GetGMRank() > 1 then
        print "GM log in..."
        SendWorldMessage("Lord |CFFFF0303"..player:GetName().."|r is among us.")
	end
end

local function GMLogout (event, player)
    if player:GetGMRank() > 1 then
        print "GM log out..."
        SendWorldMessage("Lord |CFFFF0303"..player:GetName().."|r gone.")
    end
end

RegisterPlayerEvent(3, GMLogin)
RegisterPlayerEvent(4, GMLogout)

print "---------- GM Login/Logout Module Loaded ---"
