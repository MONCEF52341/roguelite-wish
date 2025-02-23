local recap = {}

function recap.afficherStats(Player)
  print("\n=== Stats du Joueur ===")
  print("Nom: " .. Player.name)
  print("Niveau: " .. Player.level)
  print("XP: " .. Player.xp)
  print("HP: " .. Player.hp)
  print("ATK: " .. Player.atk)
  print("DEF: " .. Player.def)
  print("CHANCE: " .. Player.luck)
  print("Multiplicateur XP: x" .. Player.xp_multiplier)
  print("=======================\n")
end

return recap
