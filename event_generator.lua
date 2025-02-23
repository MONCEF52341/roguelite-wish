local loot_generator = require("loot")
local combat_system = require("combat_system")
local event_generator = {}

function event_generator.genererSalle(Player, salle_actuelle, salles_totales)
  print("\n🏰 Salle " .. salle_actuelle .. " sur " .. salles_totales)

  if salle_actuelle == salles_totales then
    print("💀 Le BOSS FINAL vous attend ici !")
    return "boss"
  end

  -- Événements aléatoires
  local evenement = math.random(1, 100)

  if evenement <= 40 then
    print("👹 Un monstre surgit des ténèbres !")
    local monstre = {
      nom = "Gobelin",
      hp = 2,
      atk = math.random(4, 7),
      def = math.random(2, 4),
      xp = 80
    }
    combat_system.demarrerCombat(Player, monstre)
    return "monstre"
  elseif evenement <= 70 then
    print("🎁 Vous trouvez un coffre mystérieux.")
    loot_generator.ouvrirCoffre(Player) -- Ouvre le coffre et gère le loot
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
