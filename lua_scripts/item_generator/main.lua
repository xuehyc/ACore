local name_gen = require('name_gen')
local stats_gen = require('stats_gen')
local display_gen = require('display_gen')
local other_gen = require('other_gen')

math.randomseed(os.time())

function wait(time)
    local duration = os.time() + time
    while os.time() < duration do end
end

local item_gen = {
  config = {
    minimal_entry = 190000
  }
}

item_gen.item = {
  ['entry'] = 190000,
  ['class'] = 0,
  ['subclass'] = 0,
  ['name'] = "",
  ['displayId'] = 0,

  ['quality'] = 7,

  ['buyprice'] = 1,
  ['sellprice'] = 1,

  ['statsCount'] = 0,

  ['stat_type1'] = 0,
  ['stat_value1'] = 0,

  ['stat_type2'] = 0,
  ['stat_value2'] = 0,

  ['stat_type3'] = 0,
  ['stat_value3'] = 0,

  ['stat_type4'] = 0,
  ['stat_value4'] = 0,

  ['stat_type5'] = 0,
  ['stat_value5'] = 0,

  ['stat_type6'] = 0,
  ['stat_value6'] = 0,

  ['stat_type7'] = 0,
  ['stat_value7'] = 0,

  ['stat_type8'] = 0,
  ['stat_value8'] = 0,

  ['stat_type9'] = 0,
  ['stat_value9'] = 0,

  ['stat_type10'] = 0,
  ['stat_value10'] = 0,

  ['maxdurability'] = 60,
}

function item_gen.setStatNbr(entry, nbr)
  if not nbr then nbr = #item_gen.primaryStats end
  return math.random(1, nbr)
end

function item_gen.generate(nbr, class, subclass, type, armorType, max_PrimaryStats, max_SecondaryStats)
  if nbr > 0 then
     for i = 1 , nbr do
      local temp = {}

      local entry = item_gen.config.minimal_entry + i

      item_gen.item.name = name_gen[1](class, subclass, type)
      item_gen.item.primaryStats = stats_gen[1](class, subclass, type, max_PrimaryStats)
      item_gen.item.secondaryStats = stats_gen[2](class, subclass, type, max_SecondaryStats)
      item_gen.item.display = display_gen[1](class, subclass, type)
      item_gen.item.quality = 4
      item_gen.item.ilvl = 150
      item_gen.item.inventorytype = 2

      if class == 2 then
      item_gen.minDmg = other_gen[2](subclass)
      item_gen.maxDmg = other_gen[2](subclass)
        if item_gen.minDmg > item_gen.maxDmg then
          local temp = item_gen.maxDmg
          item_gen.maxDmg = item_gen.minDmg
          item_gen.minDmg = temp
        end

      item_gen.delay = other_gen[3](subclass)
      end

      
      item_gen.item['maxdurability'] = other_gen[1]()

      for i = 1, #item_gen.item.primaryStats do
        item_gen.item['stat_type'..i] = item_gen.item.primaryStats[i][1]
        item_gen.item['stat_value'..i] = item_gen.item.primaryStats[i][2]
      end

      local countSecondary = 0
      for k , v in pairs(item_gen.item.secondaryStats) do
        countSecondary = countSecondary +1
      end


      for i = 1, countSecondary do
        item_gen.item['stat_type'.. #item_gen.item.primaryStats + i] = item_gen.item.secondaryStats[i][1]
        item_gen.item['stat_value'.. #item_gen.item.primaryStats + i] = item_gen.item.secondaryStats[i][2]
      end

      item_gen.item['statsCount'] = #item_gen.item.primaryStats + countSecondary

      local sql = 'INSERT INTO item_template (entry, class, subclass, name, displayid, quality, inventorytype, itemlevel, statscount, stat_type1, stat_type2, stat_type3, stat_type4, stat_type5, stat_type6, stat_type7, stat_type8, stat_type9, stat_type10, stat_value1, stat_value2, stat_value3, stat_value4, stat_value5, stat_value6, stat_value7, stat_value8, stat_value9, stat_value10) VALUES ('..entry..', '..class..', '..subclass..', "'..item_gen.item.name..'", '..item_gen.item.display..', '..item_gen.item.quality..', '..item_gen.item.inventorytype..', '..item_gen.item.ilvl..', '..item_gen.item['statsCount']..', '..item_gen.item['stat_type1']..', '..item_gen.item['stat_type2']..', '..item_gen.item['stat_type3']..', '..item_gen.item['stat_type4']..', '..item_gen.item['stat_type5']..', '..item_gen.item['stat_type6']..', '..item_gen.item['stat_type7']..', '..item_gen.item['stat_type8']..', '..item_gen.item['stat_type9']..', '..item_gen.item['stat_type10']..', '..item_gen.item['stat_value1']..', '..item_gen.item['stat_value2']..', '..item_gen.item['stat_value3']..', '..item_gen.item['stat_value4']..', '..item_gen.item['stat_value5']..', '..item_gen.item['stat_value6']..', '..item_gen.item['stat_value7']..', '..item_gen.item['stat_value8']..', '..item_gen.item['stat_value9']..', '..item_gen.item['stat_value10']..')'

      print(item_gen.item.name..'')
     end
  end
end

item_gen.generate(50, 4, 0, 1, 0, 5, 4)
