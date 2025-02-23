local loot_generator = require("loot")
local combat_system = require("combat_system")
local monster_parser = require("monster_parser")
local event_generator = {}

function event_generator.genererSalle(Player, salle_actuelle, salles_totales)
  print("\n🏰 Salle " .. salle_actuelle .. " sur " .. salles_totales)

  -- Générer une rencontre de monstre si nécessaire
  local monstres = monster_parser.chargerMonstres() -- Charger les monstres depuis le fichier monsters.txt
  local evenement = math.random(1, 100)

  if salle_actuelle == salles_totales then
    print("💀 Le BOSS FINAL vous attend ici !")
    -- Boss
    local boss = {
      nom = "LE SEINGEUR DU MAAAAAAAAAAAAAAAAAAAAAAAAAAL",
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
