local json = require("dkjson") -- Une bibliothèque pour lire les fichiers JSON
local loot_generator = require("loot_generator")
local combat_system = require("combat_system")
local event_generator = {}

-- Charger les monstres depuis le fichier JSON
function event_generator.chargerMonstres()
  local file = io.open("monsters.json", "r")
  if not file then
    print("Erreur : impossible de charger les monstres depuis le fichier.")
    return {}
  end
  local contenu = file:read("*a")
  file:close()

  local monstres, pos, err = json.decode(contenu, 1, nil)
  if err then
    print("Erreur de parsing JSON : " .. err)
    return {}
  end

  return monstres
end

-- Fonction de génération de salle avec combat aléatoire
function event_generator.genererSalle(Player, salle_actuelle, salles_totales)
  print("\n🏰 Salle " .. salle_actuelle .. " sur " .. salles_totales)

  -- Générer une rencontre de monstre si nécessaire
  local monstres = event_generator.chargerMonstres()
  local evenement = math.random(1, 100)

  if salle_actuelle == salles_totales then
    print("💀 Le BOSS FINAL vous attend ici !")
    -- Boss
    local boss = {
      nom = "Boss",
      hp = 50,
      atk = 12,
      def = 6,
      xp = 50
    }
    combat_system.demarrerCombat(Player, boss)
    return "boss"
  end

  if evenement <= 40 then
    print("👹 Un monstre surgit des ténèbres !")

    -- Choisir un monstre aléatoire dans la liste des monstres
    local monstre = monstres[math.random(1, #monstres)]
    combat_system.demarrerCombat(Player, monstre)

    return "monstre"
  elseif evenement <= 70 then
    print("🎁 Vous trouvez un coffre mystérieux.")
    loot_generator.ouvrirCoffre(Player)
    return "coffre"
  elseif evenement <= 90 then
    print("⚡ Un événement étrange se produit...")
    return "evenement"
  else
    print("💨 Salle vide... Trop calme.")
    return "vide"
  end
end

return event_generator
