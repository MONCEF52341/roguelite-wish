-- Initialisation des stats du joueur
Experience = 0
Level = 1
XP_Multiplier = 1 -- Par défaut en mode normal

Player = {
  name = "ogUser",
  hp = 20,
  atk = 5,
  def = 5,
  luck = 5
}


-- Fonction simple pour afficher les stats du joueur
function afficherStats()
  print("\n--- Stats du joueur ---")
  print("Nom: " .. Player.name)
  print("Niveau: " .. Level)
  print("XP: " .. Experience)
  print("HP: " .. Player.hp)
  print("ATK: " .. Player.atk)
  print("DEF: " .. Player.def)
  print("Chance: " .. Player.luck)
  print("Multiplicateur XP: x" .. XP_Multiplier)
  print("-----------------------\n")
end

-- ==== LANCEMENT DU JEU ====
afficherStats()
