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
  -- Générer la salle
  local resultat = event_generator.genererSalle(Player, salle_actuelle, salles_totales)

  -- Actions du joueur après chaque salle
  local choix = nil
  repeat
    print("\nQue voulez-vous faire ?")
    print("1. Continuer")
    print("2. Vérifier les stats")
    print("3. Quitter le donjon")
    choix = tonumber(io.read())

    if choix == 2 then
      recap.afficherStats(Player)
    elseif choix == 3 then
      print("🏃 Vous quittez le donjon. À bientôt, " .. Player.name .. " !")
      return
    elseif choix ~= 1 then
      print("⛔ Choix invalide. Essayez encore.")
    end
  until choix == 1

  -- Avancer à la salle suivante uniquement si le joueur choisit "Continuer"
  salle_actuelle = salle_actuelle + 1
end

-- === Fin du jeu ===
if Player.hp <= 0 then
  print("💀 Vous êtes mort dans le donjon. RIP " .. Player.name)
else
  print("🎉 Félicitations, vous avez terminé le donjon !")
end
