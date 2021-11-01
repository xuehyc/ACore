local other_gen = {}

-- Durability
other_gen[1] = function()
  return math.random(60, 110)
end

-- Damage
other_gen[2] = function(subclass)
  local _ = {
    [0] = {722, 1790},-- Hache 1M
    [1] = {776, 2814}, -- Hache 2M
    [2] = {364, 1998}, -- Arc
    [3] = {364, 1998}, -- Arme à feu
    [4] = {722, 1790}, -- Masse 1M
    [5] = {776, 2814}, -- Masse 2M
    [6] = {776, 2814}, -- Arme d'hast
    [7] = {722, 1790}, -- Epée 1M
    [8] = {776, 2814}, -- Epée 2M
    [10] = {320, 1332}, -- Bâton
    [13] = {722, 1790}, -- Arme de poing
    [15] = {722, 1790}, -- Dague
    [16] = {356, 1274}, -- Arme de jet
    [17] = {776, 2814}, -- Lance
    [18] = {364, 1998}, -- Arbalète
    [19] = {456, 2154}, -- Baguette
  }

  return math.random(_[subclass][1], _[subclass][2])
end

-- Speed
other_gen[3] = function(subclass)
  local _ = {
    [0] = {1800, 3700},-- Hache 1M
    [1] = {2000, 3900}, -- Hache 2M
    [2] = {1500, 3300}, -- Arc
    [3] = {1500, 3300}, -- Arme à feu
    [4] = {1800, 3700}, -- Masse 1M
    [5] = {2000, 3900}, -- Masse 2M
    [6] = {2000, 3900}, -- Arme d'hast
    [7] = {1800, 3700}, -- Epée 1M
    [8] = {2000, 3900}, -- Epée 2M
    [10] = {320, 1332}, -- Bâton
    [13] = {1000, 2900}, -- Arme de poing
    [15] = {1000, 2500}, -- Dague
    [16] = {1000, 2400}, -- Arme de jet
    [17] = {2000, 3900}, -- Lance
    [18] = {1500, 3300}, -- Arbalète
    [19] = {1000, 2400}, -- Baguette
  }

  return math.random(_[subclass][1], _[subclass][2])
end

return other_gen
