-- Import des modules
local game_start = require("game_start")
local event_generator = require("event_generator")
local recap = require("recap")

-- === Initialisation du joueur ===
local Player = game_start.initPlayer()

-- === Boucle principale ===
local salle_actuelle = 1
local salles_totales = 10

while Player.hp > 0 and salle_actuelle <= salles_totales do
  local resultat = event_generator.genererSalle(Player, salle_actuelle, salles_totales)

  -- Actions du joueur après chaque salle
  print("\nQue voulez-vous faire ?")
  print("1. Continuer")
  print("2. Vérifier les stats")
  print("3. Quitter le donjon")
  local choix = tonumber(io.read())

  if choix == 2 then
    recap.afficherStats(Player)
  elseif choix == 3 then
    print("🏃 Vous quittez le donjon. À bientôt, " .. Player.name .. " !")
    return
  end

  salle_actuelle = salle_actuelle + 1
end

-- === Fin du jeu ===
if Player.hp <= 0 then
  print("💀 Vous êtes mort dans le donjon. RIP " .. Player.name)
else
  print("🎉 Félicitations, vous avez terminé le donjon !")
end
