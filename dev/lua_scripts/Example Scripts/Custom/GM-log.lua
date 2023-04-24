--print "---------- GM Login/Logout Module Loading---"

local function GMLogin (event, player)
    if player:GetGMRank() > 1 then
        print "GM log in..."
        SendWorldMessage("Lord |CFFFF0303"..player:GetName().."|r is among us.")
    else
        print "A player logged in."
    end
end

local function GMLogout (event, player)
    if player:GetGMRank() > 1 then
        print "GM log out..."
        SendWorldMessage("Lord |CFFFF0303"..player:GetName().."|r gone.")
    else
        print "A player logged out."
    end
end

RegisterPlayerEvent(3, GMLogin)
RegisterPlayerEvent(4, GMLogout)

--print "---------- GM Login/Logout Module Loaded ---"--org
print "[Eluna]:GM Login/Logout Module Loaded"
