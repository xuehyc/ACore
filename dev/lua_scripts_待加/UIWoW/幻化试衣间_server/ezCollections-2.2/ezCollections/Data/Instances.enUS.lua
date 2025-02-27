﻿-- Load enUS localization regardless of client locale, so that if localization for client's locale is missing, we won't get plenty of Lua errors
-- if GetLocale() ~= "enGB" and GetLocale() ~= "enUS" then
--     return;
-- end
require("ezCollections")
ezCollections.Instances =
{
    [33] = "1,0,Shadowfang Keep",
    [34] = "1,0,Stormwind Stockade",
    [36] = "1,0,Deadmines",
    [43] = "1,0,Wailing Caverns",
    [44] = "1,0,<unused> Monastery",
    [47] = "1,0,Razorfen Kraul",
    [48] = "1,0,Blackfathom Deeps",
    [70] = "1,0,Uldaman",
    [90] = "1,0,Gnomeregan",
    [109] = "1,0,Sunken Temple",
    [129] = "1,0,Razorfen Downs",
    [169] = "2,0,Emerald Dream,5",
    [189] = "1,0,Scarlet Monastery",
    [209] = "1,0,Zul'Farrak",
    [229] = "1,0,Blackrock Spire",
    [230] = "1,0,Blackrock Depths",
    [249] = "2,0,Onyxia's Lair",
    [269] = "1,1,Opening of the Dark Portal",
    [289] = "1,0,Scholomance",
    [309] = "2,0,Zul'Gurub,6",
    [329] = "1,0,Stratholme",
    [349] = "1,0,Maraudon",
    [389] = "1,0,Ragefire Chasm",
    [409] = "2,0,Molten Core,5",
    [429] = "1,0,Dire Maul",
    [469] = "2,0,Blackwing Lair,5",
    [509] = "2,0,Ruins of Ahn'Qiraj,6",
    [531] = "2,0,Ahn'Qiraj Temple,5",
    [532] = "2,1,Karazhan",
    [533] = "2,2,Naxxramas",
    [534] = "2,1,The Battle for Mount Hyjal,2",
    [540] = "1,1,Hellfire Citadel: The Shattered Halls",
    [542] = "1,1,Hellfire Citadel: The Blood Furnace",
    [543] = "1,1,Hellfire Citadel: Ramparts",
    [544] = "2,1,Magtheridon's Lair,2",
    [545] = "1,1,Coilfang: The Steamvault",
    [546] = "1,1,Coilfang: The Underbog",
    [547] = "1,1,Coilfang: The Slave Pens",
    [548] = "2,1,Coilfang: Serpentshrine Cavern,2",
    [550] = "2,1,Tempest Keep,2",
    [552] = "1,1,Tempest Keep: The Arcatraz",
    [553] = "1,1,Tempest Keep: The Botanica",
    [554] = "1,1,Tempest Keep: The Mechanar",
    [555] = "1,1,Auchindoun: Shadow Labyrinth",
    [556] = "1,1,Auchindoun: Sethekk Halls",
    [557] = "1,1,Auchindoun: Mana-Tombs",
    [558] = "1,1,Auchindoun: Auchenai Crypts",
    [560] = "1,1,The Escape From Durnholde",
    [564] = "2,1,Black Temple,2",
    [565] = "2,1,Gruul's Lair,2",
    [568] = "2,1,Zul'Aman",
    [574] = "1,2,Utgarde Keep",
    [575] = "1,2,Utgarde Pinnacle",
    [576] = "1,2,The Nexus",
    [578] = "1,2,The Oculus",
    [580] = "2,1,The Sunwell,2",
    [585] = "1,1,Magister's Terrace",
    [595] = "1,2,The Culling of Stratholme",
    [598] = "1,1,Sunwell Fix (Unused)",
    [599] = "1,2,Halls of Stone",
    [600] = "1,2,Drak'Tharon Keep",
    [601] = "1,2,Azjol-Nerub",
    [602] = "1,2,Halls of Lightning",
    [603] = "2,2,Ulduar",
    [604] = "1,2,Gundrak",
    [608] = "1,2,Violet Hold",
    [615] = "2,2,The Obsidian Sanctum",
    [616] = "2,2,The Eye of Eternity",
    [619] = "1,2,Ahn'kahet: The Old Kingdom",
    [624] = "2,2,Vault of Archavon",
    [631] = "2,2,Icecrown Citadel",
    [632] = "1,2,The Forge of Souls",
    [649] = "2,2,Trial of the Crusader",
    [650] = "1,2,Trial of the Champion",
    [658] = "1,2,Pit of Saron",
    [668] = "1,2,Halls of Reflection",
    [724] = "2,2,The Ruby Sanctum",
};
