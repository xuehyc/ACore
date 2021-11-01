local name_gen = {}
name_gen.temp = {}

name_gen[1] = function(class, subclass, type)
  local _ = {
    [2] = {
      [0] = {"Découpeuse", "Etripeuse", "Labrys", "Hache", "Lame", "Plaie", "Croissant", "Fendoir", "Folie", "Réplique", "Tranche-tendons", "Appel-au-carnage", "Fendeur", "Devoir", "Tranchant", "Hansart", "Trancheuse", "Sorce-hache", "Hachette", "Le Brutaliseur", "Crul'shorukh", "Koloch'na", "Fureur", "Déchiqueteuse", "Coupe-Poignets", "Comète", "Mar'Kowa", "Scalpeur", "Elegion", "Eminceur", "Tranche-Boyaux", "Faucille", "Morsure", "Solutionneur"}, -- Hache 1M
      [1] = { }, -- Hache 2M
      [2] = { }, -- Arc
      [3] = { }, -- Arme à feu
      [4] = { }, -- Masse 1M
      [5] = { }, -- Masse 2M
      [6] = { }, -- Amre d'hast
      [7] = { }, -- Epée 1M
      [8] = { }, -- Epée 2M
      [10] = { }, -- Bâton
      [13] = { }, -- Arme de poing
      [15] = { }, -- Dague
      [16] = { }, -- Arme de jet
      [17] = { }, -- Lance
      [18] = { }, -- Arbalète
      [19] = { }, -- Baguette
    },

    [4] = {
      [0] = {
        [1] = {"Pendentif", "Amulette", "Collet", "Charme", "Sautoir", "Collerette", "Talisman", "Prydaz", "Collier", "Médaillon", "Chaîne", "Torque", "Orbe", "Broche", "Eclat", "Gorgerin", "Liens", "Corde"},
        [2] = {"", ""},
        [3] = {"", ""},
      }
    }
  }

  if class == 4 and subclass == 0 then
    name_gen.temp.name = _[class][subclass][type][math.random(1, #_[class][subclass][type])]
  else
    name_gen.temp.name = _[class][subclass][math.random(1, #_[class][subclass])]
  end

  name_gen[2]()
  return name_gen.temp.name
end

name_gen[2] = function()
  local _  = {
    "cramoisi", "d'ossements", "silencieuse", "cruelle", "incrusté", "vicié", "venin-azur", "en pierre", "en onyx", "à pointes", "ombrepeur", "vire-piste", "en laestrite", "en chaîne", "chef-d'oeuvre", "béni", "d'entraînement", "haut renforcé", "céleste", "combevoile", "vorpale", "éternel", "d'agathe", "forge-tripe", "gravée de peste", "barbue", "élémentaire", "dévoué", "de bataille", "du gardien", "maculé de sang", "de crânes", "de guerre", "de givre", "de l'effroi", "planaire", "cruel", "sanguinaire", "en forgeacier", "lié aux glaces", "sanglant", "vorace", "givrelame", "planaire noir", "à tranchant", "d'élémentium", "de force", "infléxible", "runique", "à dents", "d'expédition", "sanguinaire", 
  }

  name_gen.temp.name = name_gen.temp.name .. " " .. _[math.random(1, #_)]

  local chance = math.random(1, 10)
  if chance >= 8 then
    name_gen[3]()
  end

  return name_gen.temp.name
end

name_gen[3] = function()
  local _ = {
    "de pénombre", "de la sentinelle", "de malachite", "de l'oraison", "de bile", "du jour saint", "de la reine de sang", "de flagellation", "de Lana'thel", "de Baltharus", "de Sindragosa", "de l'hiver", "de naissance noble", "de Gaïazelle", "d'Azeroth", "impénitent", "magistrale", "de Xavaric", "de Karabor", "de l'aspirant", "du carillon", "du lié par le Dessein", "de l'horizon", "des Shal'dorei", "du volion royal", "de Nifflevar", "du général de pierre", "du néant", "du disciple", "du plongeur", "de garde de sang", "des rois de Lordaeron", "du Sans-piité", "de l'avant-garde de Garrosh", "de guerre fléauvenante", "de Grom'tor", "de combattant sacré", "de gardien des ossements", "du gladiateur impénitent", "du bosquet mort", "du roi givre-né", "du géant", "du vainqueur", "d'épandeur de chance", "du long-voyant", "du gladiateur courroucé", "d'écorcheur de Faë", "de la Légion", "du festin sanglant", "des plans", "de chantefroid", "de Phémos", "de Falric", "des volontés brisées", "de Brague", "du Boucher", "de la Mangueuse-d'âmes", "du destin", "de détermination renouvelée", "de Tomalin", "de troupier de choc", "des bois profonds", "de Hurlenfer", "du jour du jugement", "du jugement", "de Phil Defer", "du briseur", "de la Brigade de l'Honneur", "de tempête", "du protecteur", "du protecteur de Sen'jin"
  }


  name_gen.temp.name = name_gen.temp.name .. " " .. _[math.random(1, #_)]
  
  return name_gen.temp.name
end


return name_gen
