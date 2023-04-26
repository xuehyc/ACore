C_TransmogSets = C_TransmogSets or { };

local _usableCacheEntry = { };
local _usableCacheEnchant = { };
local _usableCacheSlotMask = nil;
local _usableCache = { };
local CACHED_SLOTS =
{
    (GetInventorySlotInfo("HEADSLOT")),
    (GetInventorySlotInfo("SHOULDERSLOT")),
    (GetInventorySlotInfo("BACKSLOT")),
    (GetInventorySlotInfo("CHESTSLOT")),
    (GetInventorySlotInfo("TABARDSLOT")),
    (GetInventorySlotInfo("SHIRTSLOT")),
    (GetInventorySlotInfo("WRISTSLOT")),
    (GetInventorySlotInfo("HANDSSLOT")),
    (GetInventorySlotInfo("WAISTSLOT")),
    (GetInventorySlotInfo("LEGSSLOT")),
    (GetInventorySlotInfo("FEETSLOT")),
    (GetInventorySlotInfo("MAINHANDSLOT")),
    (GetInventorySlotInfo("SECONDARYHANDSLOT")),
    (GetInventorySlotInfo("RANGEDSLOT")),
};

local function NeedsCacheRefresh()
    for _, slot in ipairs(CACHED_SLOTS) do
        local _, id, enchant = strsplit(":", GetInventoryItemLink("player", slot) or "");
        local slotMask = tonumber(ezCollections:GetCVar("transmogrifySetsSlotMask")) or 0;
        if _usableCacheEntry[slot] ~= (tonumber(id) or 0) or _usableCacheEnchant[slot] ~= (tonumber(enchant) or 0) or _usableCacheSlotMask ~= slotMask then
            table.wipe(_usableCacheEntry);
            table.wipe(_usableCacheEnchant);
            _usableCacheSlotMask = slotMask;
            _usableCache = nil;
            for _, slot in ipairs(CACHED_SLOTS) do
                _, id, enchant = strsplit(":", GetInventoryItemLink("player", slot) or "");
                _usableCacheEntry[slot] = tonumber(id) or 0;
                _usableCacheEnchant[slot] = tonumber(enchant) or 0;
            end
            return true;
        end
    end
    return false;
end

local _hide = { };
local _classMask = 0;
local _classMaskAny = 0;
local _raceMask = 0;
local _raceMaskAlliance = 0;
local _raceMaskHorde = 0;
local _raceMaskAny = 0;
local function PrepareFilter()
    for i = 1, NUM_LE_TRANSMOG_SET_FILTERS do
        _hide[i] = ezCollections:GetCVarBitfield("wardrobeSetsFilters", i);
    end
    _classMask = bit.bnot(ezCollections:GetCVar("wardrobeSetsClassFilters"));
    _classMaskAny = bit.lshift(1, ezCollections.ClassNameToID["ANY"] - 1);
    _raceMask = bit.bnot(ezCollections:GetCVar("wardrobeSetsRaceFilters"));
    _raceMaskAlliance = 0;
    _raceMaskHorde = 0;
    _raceMaskAny = 0;
    for race, raceFaction in pairs(ezCollections.RaceNameToFaction) do
        if raceFaction == FACTION_ALLIANCE then _raceMaskAlliance = bit.bor(_raceMaskAlliance, bit.lshift(1, ezCollections.RaceNameToID[race] - 1)); end
        if raceFaction == FACTION_HORDE then _raceMaskHorde = bit.bor(_raceMaskHorde, bit.lshift(1, ezCollections.RaceNameToID[race] - 1)); end
        if raceFaction == FACTION_OTHER then _raceMaskAny = bit.bor(_raceMaskAny, bit.lshift(1, ezCollections.RaceNameToID[race] - 1)); end
    end
end

local function MatchesCollectedFilter(set)
    if _hide[LE_TRANSMOG_SET_FILTER_COLLECTED] and set.collected then return false; end
    if _hide[LE_TRANSMOG_SET_FILTER_UNCOLLECTED] and not set.collected then return false; end

    return true;
end

local function MatchesFilter(set)
    if set.flags then
        local raceMask = 0;
        if bit.band(set.flags, 0x4) ~= 0 then raceMask = bit.bor(raceMask, _raceMaskAlliance); end
        if bit.band(set.flags, 0x8) ~= 0 then raceMask = bit.bor(raceMask, _raceMaskHorde); end
        if bit.band(set.flags, 0xC) == 0 then raceMask = _raceMaskAny; end
        if bit.band(raceMask, _raceMask) == 0 then return false; end
        if bit.band(set.flags, 0x80000) ~= 0 then
            if _hide[LE_TRANSMOG_SET_FILTER_STORE] then return false; end
        else
            if _hide[LE_TRANSMOG_SET_FILTER_PVE] and bit.band(set.flags, 0x10) == 0 then return false; end
            if _hide[LE_TRANSMOG_SET_FILTER_PVP] and bit.band(set.flags, 0x10) ~= 0 then return false; end
        end
        if _hide[LE_TRANSMOG_SET_FILTER_CORE] and bit.band(set.flags, 0x1000) == 0 then return false; end
        if _hide[LE_TRANSMOG_SET_FILTER_WOWHEAD] and bit.band(set.flags, 0x1000) ~= 0 then return false; end
        local armorMask = 0x3E000;
        if bit.band(set.flags, armorMask) ~= 0 then
            if _hide[LE_TRANSMOG_SET_FILTER_CLOTH] then armorMask = bit.band(armorMask, bit.bnot(0x2000)); end
            if _hide[LE_TRANSMOG_SET_FILTER_LEATHER] then armorMask = bit.band(armorMask, bit.bnot(0x4000)); end
            if _hide[LE_TRANSMOG_SET_FILTER_MAIL] then armorMask = bit.band(armorMask, bit.bnot(0x8000)); end
            if _hide[LE_TRANSMOG_SET_FILTER_PLATE] then armorMask = bit.band(armorMask, bit.bnot(0x10000)); end
            if _hide[LE_TRANSMOG_SET_FILTER_MISC] then armorMask = bit.band(armorMask, bit.bnot(0x20000)); end
            if bit.band(set.flags, armorMask) == 0 then return false; end
        end
    end

    if set.classMask and set.classMask ~= 0 and bit.band(set.classMask, _classMask) == 0 then
        return false;
    end

    if (not set.classMask or set.classMask == 0) and bit.band(_classMaskAny, _classMask) == 0 then
        return false;
    end

    return true;
end

local function GetSearchedBaseSets()
    local search = C_TransmogCollection.GetSearchData(LE_TRANSMOG_SEARCH_TYPE_BASE_SETS);
    if search then
        if type(search.Results[1]) == "number" then
            for i, id in ipairs(search.Results) do
                search.Results[i] = ezCollections.Cache.Sets[id];
            end
            search.Results.Loaded = nil;
        end
        return search.Results;
    end
    return ezCollections.Cache.Sets;
end

local function GetSearchedUsableSets()
    if not C_TransmogCollection.GetLastSearchText() then
        if NeedsCacheRefresh() then
            C_TransmogCollection.SetSearch(LE_TRANSMOG_SEARCH_TYPE_USABLE_SETS, nil);
            return { };
        end

        if _usableCache then
            return _usableCache;
        end
    end

    local search = C_TransmogCollection.GetSearchData(LE_TRANSMOG_SEARCH_TYPE_USABLE_SETS);
    if search then
        if not search.Results then
            return { };
        end
        if type(search.Results[1]) == "number" then
            for i, id in ipairs(search.Results) do
                search.Results[i] = { Set = ezCollections.Cache.Sets[id] };
            end
            search.Results.Loaded = nil;
        elseif type(search.Results[1]) == "string" then
            for i, dataString in ipairs(search.Results) do
                local data =
                {
                    Set = nil,
                    Sources = { },
                };
                search.Results[i] = data;
                for j, id in ipairs({ strsplit(",", dataString) }) do
                    local id = tonumber(id);
                    if not id then
                        error("Malformed Usable Sets search data");
                    end
                    if j == 1 then
                        data.Set = ezCollections.Cache.Sets[id];
                    else
                        data.Sources[id] = true;
                    end
                end
            end
            search.Results.Loaded = nil;
        end
        if not C_TransmogCollection.GetLastSearchText() and not _usableCache then
            _usableCache = { };
            for _, set in ipairs(search.Results) do
                table.insert(_usableCache, set);
            end
        end
        return search.Results;
    end

    --error("GetSearchedUsableSets() reached the end. This should never happen.");
    return { };
end

function C_TransmogSets.ReportSetSourceCollectedChanged() -- Custom
    table.wipe(_usableCacheEntry);
    table.wipe(_usableCacheEnchant);
end

-- Sets

function C_TransmogSets.GetAllSets()
    local sets = { };
    for _, set in pairs(ezCollections.Cache.Sets) do
        table.insert(sets, ezCollections:GetSetInfo(set.setID));
    end
    return sets;
end

function C_TransmogSets.GetBaseSets()
    local baseSets = { };
    PrepareFilter();
    for _, set in pairs(GetSearchedBaseSets()) do
        if MatchesFilter(set) then
            if set.baseSetID and not _hide[LE_TRANSMOG_SET_FILTER_GROUP] then
                baseSets[set.baseSetID] = true;
            else
                baseSets[set.setID] = true;
            end
        end
    end
    local sets = { };
    for setID in pairs(baseSets) do
        local info = ezCollections:GetSetInfo(setID);
        if MatchesCollectedFilter(info) then
            table.insert(sets, info);
        end
    end
    return sets;
end

function C_TransmogSets.GetBaseSetsCounts()
    local numCollected = 0;
    local numTotal = 0;
    PrepareFilter();
    for _, set in pairs(ezCollections.Cache.Sets) do
        if not set.baseSetID or _hide[LE_TRANSMOG_SET_FILTER_GROUP] then
            if MatchesFilter(set) then
                local info = ezCollections:GetSetInfo(set.setID);
                numTotal = numTotal + 1;
                if info.collected then
                    numCollected = numCollected + 1;
                end
            end
        end
    end
    return numCollected or 0, numTotal or 0;
end

function C_TransmogSets.GetVariantSets(transmogSetID)
    local sets = { };
    if _hide[LE_TRANSMOG_SET_FILTER_GROUP] then return sets; end
    local baseSet = ezCollections.Cache.Sets[transmogSetID];
    while baseSet and baseSet.baseSetID do
        baseSet = ezCollections.Cache.Sets[baseSet.baseSetID];
    end
    if baseSet and baseSet.Variants then
        if baseSet and MatchesFilter(baseSet) then
            table.insert(sets, ezCollections:GetSetInfo(baseSet.setID));
        end
        for _, setID in ipairs(baseSet.Variants) do
            local variantSet = ezCollections.Cache.Sets[setID];
            if variantSet and MatchesFilter(variantSet) then
                table.insert(sets, ezCollections:GetSetInfo(variantSet.setID));
            end
        end
    end
    return sets;
end

function C_TransmogSets.GetUsableSets()
    local sets = { };
    for _, data in pairs(GetSearchedUsableSets()) do
        table.insert(sets, ezCollections:GetSetInfo(data.Set.setID));
    end
    return sets;
end

function C_TransmogSets.HasUsableSets()
    return next(GetSearchedUsableSets()) ~= nil;
end

function C_TransmogSets.GetSetInfo(transmogSetID)
    return ezCollections:GetSetInfo(transmogSetID);
end

function C_TransmogSets.GetSetSources(transmogSetID)
    local set = ezCollections:GetSetInfo(transmogSetID);
    if set then
        -- Sort all sources by slot
        local slots = { };
        local incompatibleSlots = { };
        for _, source in ipairs(set.sources) do
            source.collected = ezCollections:HasAvailableSkin(source.id);
            local info = ezCollections:GetSkinInfo(source.id);
            local slot = info and info.InventoryType and C_Transmog.GetSlotForInventoryType(info.InventoryType);
            if slot then
                slots[slot] = slots[slot] or { };
                if info and (info.ClassMask and bit.band(info.ClassMask, _classMask) == 0 or info.RaceMask and bit.band(info.RaceMask, _raceMask) == 0) then
                    incompatibleSlots[slot] = incompatibleSlots[slot] or { };
                    table.insert(incompatibleSlots[slot], source);
                else
                    table.insert(slots[slot], source);
                end
            end
        end

        local sources = { };
        for slot, slotSources in pairs(slots) do
            local primarySource;
            local collectedPrimarySource;
            local collectedSecondarySource;
            for _, source in ipairs(slotSources) do
                if bit.band(source.flags, 0x1) ~= 0 then
                    primarySource = source;
                    if source.collected then
                        collectedPrimarySource = source;
                    end
                elseif source.collected and not collectedSecondarySource then
                    collectedSecondarySource = source;
                end
            end
            local source = collectedPrimarySource or collectedSecondarySource or primarySource or slotSources[1];
            if source then
                sources[source.id] = source.collected;
            else
                source = incompatibleSlots[slot][1];
                sources[source.id] = false;
            end
        end
        return sources;
    end
end

function C_TransmogSets.GetUsableSetSources(transmogSetID) -- Custom
    for _, data in ipairs(GetSearchedUsableSets()) do
        if data.Set.setID == transmogSetID then
            if data.Sources then
                return data.Sources;
            end
            break;
        end
    end
    return C_TransmogSets.GetSetSources(transmogSetID);
end

function C_TransmogSets.GetSetNewSources(transmogSetID)
    -- Function not used
    -- return sourceIDs;
end

function C_TransmogSets.GetAllSourceIDs(transmogSetID)
    local set = ezCollections:GetSetInfo(transmogSetID);
    local sources = { };
    for _, source in ipairs(set.sources) do
        table.insert(sources, source.id);
    end
    return sources;
end

function C_TransmogSets.GetSourceIDsForSlot(transmogSetID, slot)
    local set = ezCollections:GetSetInfo(transmogSetID);
    if set then
        local sources = { };
        for _, source in ipairs(set.sources) do
            local info = ezCollections:GetSkinInfo(source.id);
            if info and info.InventoryType and C_Transmog.GetSlotForInventoryType(info.InventoryType) == slot then
                table.insert(sources, source.id);
            end
        end
        return sources;
    end
end

function C_TransmogSets.GetSourcesForSlot(transmogSetID, slot)
    local set = ezCollections:GetSetInfo(transmogSetID);
    if set then
        local sources = { };
        for _, source in ipairs(set.sources) do
            local info = ezCollections:GetSkinInfo(source.id);
            local name, _, quality = GetItemInfo(source.id);
            if quality ~= nil and quality > 6 then quality = 6; end
            if info and info.InventoryType and C_Transmog.GetSlotForInventoryType(info.InventoryType) == slot then
                table.insert(sources,
                {
                    isCollected = ezCollections:HasAvailableSkin(source.id),
                    name = name,
                    quality = quality,
                    sourceID = source.id,
                    visualID = source.id,
                    useError = not ezCollections:CanTransmogrify(source.id),
                    sourceType = info and info.SourceMask and bit.band(info.SourceMask, bit.lshift(1, TRANSMOG_SOURCE_BOSS_DROP - 1)) ~= 0 and info.SourceBosses and TRANSMOG_SOURCE_BOSS_DROP or 0,
                    sourceText = (function()
                        if info and info.SourceMask then
                            local result = "";
                            for i = 1, C_TransmogCollection.GetNumTransmogSources() do
                                if bit.band(info.SourceMask, bit.lshift(1, i - 1)) ~= 0 then
                                    result = result .. (result ~= "" and ", " or "") .. _G["TRANSMOG_SOURCE_"..i];
                                end
                            end
                            return result;
                        end
                    end)();
                });
            end
        end
        return sources;
    end
end

function C_TransmogSets.GetSetsContainingSourceID(sourceID)
    local setIDs = { };
    local skin = ezCollections:GetSkinInfo(sourceID);
    if skin and skin.Sets then
        return skin.Sets;
    end
    return setIDs;
end

function C_TransmogSets.GetBaseSetID(transmogSetID)
    if _hide[LE_TRANSMOG_SET_FILTER_GROUP] then return transmogSetID; end
    local set = ezCollections.Cache.Sets[transmogSetID];
    return set and MatchesFilter(set) and set.baseSetID or transmogSetID;
end

function C_TransmogSets.IsBaseSetCollected(transmogSetID)
    local set = ezCollections:GetSetInfo(transmogSetID);
    return set and set.collected;
end

function C_TransmogSets.IsSetCollected(transmogSetID)
    local set = ezCollections:GetSetInfo(transmogSetID);
    return set and set.collected;
end

function C_TransmogSets.IsSetUsable(transmogSetID)
    -- TODO:
end

function C_TransmogSets.GetCameraIDs()
    local detailsCameraID = ezCollections:GetCharacterCameraID("SetsDetails");
    local vendorCameraID = ezCollections:GetCharacterCameraID("SetsVendor");
    return detailsCameraID, vendorCameraID;
end

-- Favorites

function C_TransmogSets.SetIsFavorite(transmogSetID, isFavorite)
    ezCollections:GetSetFavoritesContainer()[transmogSetID] = isFavorite and true or nil;
    ezCollections:RaiseEvent("TRANSMOG_SETS_UPDATE_FAVORITE");
end

function C_TransmogSets.GetIsFavorite(transmogSetID)
    local set = ezCollections.Cache.Sets[transmogSetID];
    return ezCollections:GetSetFavoritesContainer()[transmogSetID], set and set.baseSetID and not _hide[LE_TRANSMOG_SET_FILTER_GROUP];
end

-- New

function C_TransmogSets.IsNewSource(sourceID)
    return ezCollections.Config.TransmogCollection.NewSetSources[sourceID];
end

function C_TransmogSets.SetHasNewSources(transmogSetID)
    local set = ezCollections.Cache.Sets[transmogSetID];
    if set then
        for _, source in ipairs(set.sources) do
            if C_TransmogSets.IsNewSource(source.id) then
                return true;
            end
        end
    end
    return false;
end

function C_TransmogSets.ClearNewSource(sourceID)
    ezCollections.Config.TransmogCollection.NewSetSources[sourceID] = nil;
end

function C_TransmogSets.SetHasNewSourcesForSlot(transmogSetID, slot)
    local set = ezCollections.Cache.Sets[transmogSetID];
    if set then
        for _, source in ipairs(set.sources) do
            if C_TransmogSets.IsNewSource(source.id) then
                local info = ezCollections:GetSkinInfo(source.id);
                if info and info.InventoryType and C_Transmog.GetSlotForInventoryType(info.InventoryType) == slot then
                    return true;
                end
            end
        end
    end
    return false;
end

function C_TransmogSets.ClearSetNewSourcesForSlot(transmogSetID, slot)
    local set = ezCollections.Cache.Sets[transmogSetID];
    if set then
        for _, source in ipairs(set.sources) do
            if C_TransmogSets.IsNewSource(source.id) then
                local info = ezCollections:GetSkinInfo(source.id);
                if info and info.InventoryType and C_Transmog.GetSlotForInventoryType(info.InventoryType) == slot then
                    C_TransmogSets.ClearNewSource(source.id);
                end
            end
        end
    end
end

function C_TransmogSets.GetLatestSource()
    return ezCollections.Config.TransmogCollection.LatestSetSource or NO_TRANSMOG_SOURCE_ID;
end

function C_TransmogSets.ClearLatestSource()
    ezCollections.Config.TransmogCollection.LatestSetSource = nil;
end

-- Filter

function C_TransmogSets.SetBaseSetsFilter(index, isChecked)
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", index, not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.GetBaseSetsFilter(index)
    return not ezCollections:GetCVarBitfield("wardrobeSetsFilters", index);
end

function C_TransmogSets.SetAllBaseSetsArmorTypeFilter(isChecked)
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_CLOTH, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_LEATHER, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_MAIL, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_PLATE, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_MISC, not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.SetAllBaseSetsSourcesFilter(isChecked)
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_PVE, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_PVP, not isChecked);
    ezCollections:SetCVarBitfield("wardrobeSetsFilters", LE_TRANSMOG_SET_FILTER_STORE, not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.SetAllBaseSetsClassFilter(isChecked)
    for _, class in ipairs(CLASS_SORT_ORDER) do
        ezCollections:SetCVarBitfield("wardrobeSetsClassFilters", ezCollections.ClassNameToID[class], not isChecked);
    end
    ezCollections:SetCVarBitfield("wardrobeSetsClassFilters", ezCollections.ClassNameToID["ANY"], not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.SetBaseSetsClassFilter(index, isChecked)
    ezCollections:SetCVarBitfield("wardrobeSetsClassFilters", index, not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.GetBaseSetsClassFilter(index)
    return not ezCollections:GetCVarBitfield("wardrobeSetsClassFilters", index);
end

function C_TransmogSets.SetAllBaseSetsRaceFilter(isChecked)
    for _, race in ipairs(ezCollections.RaceSortOrder) do
        ezCollections:SetCVarBitfield("wardrobeSetsRaceFilters", ezCollections.RaceNameToID[race], not isChecked);
    end
    ezCollections:SetCVarBitfield("wardrobeSetsRaceFilters", ezCollections.RaceNameToID["ANY"], not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.SetBaseSetsRaceFilter(index, isChecked)
    ezCollections:SetCVarBitfield("wardrobeSetsRaceFilters", index, not isChecked);
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.GetBaseSetsRaceFilter(index)
    return not ezCollections:GetCVarBitfield("wardrobeSetsRaceFilters", index);
end

function C_TransmogSets.SetBaseSetsFactionFilter(faction, isChecked)
    for race, raceFaction in pairs(ezCollections.RaceNameToFaction) do
        if raceFaction == faction then
            ezCollections:SetCVarBitfield("wardrobeSetsRaceFilters", ezCollections.RaceNameToID[race], not isChecked);
        end
    end
    ezCollections:RaiseEvent("TRANSMOG_COLLECTION_UPDATED");
end

function C_TransmogSets.GetBaseSetsFactionFilter(faction)
    for race, raceFaction in pairs(ezCollections.RaceNameToFaction) do
        if raceFaction == faction and not C_TransmogSets.GetBaseSetsRaceFilter(ezCollections.RaceNameToID[race]) then
            return false;
        end
    end
    return true;
end
