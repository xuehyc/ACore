local stats_gen = {}

stats_gen[1] = function(class, subclass, type, max)

  stats_gen.temp = {}

  if max == 0 or max == nil or max == false then max = 5 end

  local _ = {
    [2] = {
      [0] = {
        [3] = {20, 100},
        [4] = {20, 100},
        [5] = {20, 100},
        [6] = {20, 100},
        [7] = {20, 100}
      },
      [1] = {},

    },

    [4] = {
      [0] = {
        [1] = {
          -- stat_id = {min, max}
          [3] = {20, 100},
          [4] = {20, 100},
          [5] = {20, 100},
          [6] = {20, 100},
          [7] = {20, 100}
        },
        [2] = {'', ''},
        [3] = {'', ''},
      }
    }
  }

  local setMaxStat = math.random(1, max)

  for i = 1, setMaxStat do
    stats_gen.temp[i] = math.random(3, 7)

    if class == 4 and subclass == 0 then
      local statValue = math.random(_[class][subclass][type][stats_gen.temp[i]][1], _[class][subclass][type][stats_gen.temp[i]][2])
      stats_gen.temp[i] = {stats_gen.temp[i], statValue}
    else
      local statValue = math.random(_[class][subclass][stats_gen.temp[i]][1], _[class][subclass][stats_gen.temp[i]][2])
      stats_gen.temp[i] = {stats_gen.temp[i], statValue}
    end
  end

  return stats_gen.temp
end

stats_gen[2] = function(class, subclass, type, max)

  stats_gen.temp = {}

  if max == 0 or max == nil or max == false then max = 3 end

  local _ = {
    [12] = {100, 200}, -- ITEM_MOD_DEFENSE_SKILL_RATING
    [13] = {100, 200}, -- ITEM_MOD_DODGE_RATING
    [14] = {100, 200}, -- ITEM_MOD_PARRY_RATING
    [15] = {100, 200}, -- ITEM_MOD_BLOCK_RATING
    [16] = {100, 200}, -- ITEM_MOD_HIT_MELEE_RATING
    [17] = {100, 200}, -- ITEM_MOD_HIT_RANGED_RATING
    [18] = {100, 200}, -- ITEM_MOD_HIT_SPELL_RATING
    [19] = {100, 200}, -- ITEM_MOD_CRIT_MELEE_RATING
    [20] = {100, 200}, -- ITEM_MOD_CRIT_RANGED_RATING
    [21] = {100, 200}, -- ITEM_MOD_CRIT_SPELL_RATING
    [22] = {100, 200}, -- ITEM_MOD_HIT_TAKEN_MELEE_RATING
    [23] = {100, 200}, -- ITEM_MOD_HIT_TAKEN_RANGED_RATING
    [24] = {100, 200}, -- ITEM_MOD_HIT_TAKEN_SPELL_RATING
    [25] = {100, 200}, -- ITEM_MOD_CRIT_TAKEN_MELEE_RATING
    [26] = {100, 200}, -- ITEM_MOD_CRIT_TAKEN_RANGED_RATING
    [27] = {100, 200}, -- ITEM_MOD_CRIT_TAKEN_SPELL_RATING
    [28] = {100, 200}, -- ITEM_MOD_HASTE_MELEE_RATING
    [29] = {100, 200}, -- ITEM_MOD_HASTE_RANGED_RATING
    [30] = {100, 200}, -- ITEM_MOD_HASTE_SPELL_RATING
    [31] = {100, 200}, -- ITEM_MOD_HIT_RATING
    [32] = {100, 200}, -- ITEM_MOD_CRIT_RATING
    [33] = {100, 200}, -- ITEM_MOD_HIT_TAKEN_RATING
    [34] = {100, 200}, -- ITEM_MOD_CRIT_TAKEN_RATING
    [35] = {100, 200}, -- ITEM_MOD_RESILIENCE_RATING
    [36] = {100, 200}, -- ITEM_MOD_HASTE_RATING
    [37] = {100, 200}, -- ITEM_MOD_EXPERTISE_RATING
    [38] = {100, 200}, -- ITEM_MOD_ATTACK_POWER
    [39] = {100, 200}, -- ITEM_MOD_RANGED_ATTACK_POWER
    [40] = {100, 200}, -- ITEM_MOD_FERAL_ATTACK_POWER
    [41] = {100, 200}, -- ITEM_MOD_SPELL_HEALING_DONE
    [42] = {100, 200}, -- ITEM_MOD_SPELL_DAMAGE_DONE
    [43] = {100, 200}, -- ITEM_MOD_MANA_REGENERATION
    [44] = {100, 200}, -- ITEM_MOD_ARMOR_PENETRATION_RATING
    [45] = {100, 200}, -- ITEM_MOD_SPELL_POWER
    [46] = {100, 200}, -- ITEM_MOD_ HEALTH_REGEN
    [47] = {100, 200}, -- ITEM_MOD_SPELL_PENETRATION
    [48] = {100, 200}, -- ITEM_MOD_BLOCK_VALUE
  }

  local setMaxStat = math.random(1, max)

  for i = 1, setMaxStat do
    stats_gen.temp[i] = math.random(12, 48)

    local statValue = math.random(_[stats_gen.temp[i]][1], _[stats_gen.temp[i]][2])
    stats_gen.temp[i] = {stats_gen.temp[i], statValue}
  end
  
  return stats_gen.temp
end

return stats_gen
