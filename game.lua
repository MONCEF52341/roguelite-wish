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

-- Demander le nom du joueur
io.write('Donnez un nom au joueur ? (default "ogUser"): ')
local inputName = io.read()

if inputName ~= "" then
  Player.name = inputName
end

io.write("Nice to meet you, " .. Player.name .. "!\n")

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

-- Fonction pour choisir un bonus et un malus
function choisirBonusMalus()
  local stats = { "atk", "def", "luck" }

  print("\nChoisissez une stat pour le BONUS (+2) :")
  for i, stat in ipairs(stats) do
    print(i .. ". " .. stat:upper())
  end

  local bonusChoice = tonumber(io.read())
  while bonusChoice < 1 or bonusChoice > #stats do
    io.write("Choix invalide. Réessayez : ")
    bonusChoice = tonumber(io.read())
  end

  Player[stats[bonusChoice]] = Player[stats[bonusChoice]] + 2
  print("+" .. 2 .. " en " .. stats[bonusChoice]:upper() .. " appliqué !")

  print("\nChoisissez une stat pour le MALUS (-2) :")
  for i, stat in ipairs(stats) do
    if i ~= bonusChoice then -- Empêche de choisir la même stat
      print(i .. ". " .. stat:upper())
    end
  end

  local malusChoice = tonumber(io.read())
  while malusChoice == bonusChoice or malusChoice < 1 or malusChoice > #stats do
    io.write("Choix invalide. Réessayez : ")
    malusChoice = tonumber(io.read())
  end

  Player[stats[malusChoice]] = Player[stats[malusChoice]] - 2
  print("-" .. 2 .. " en " .. stats[malusChoice]:upper() .. " appliqué !")
end

-- Fonction pour choisir le mode de difficulté
function choisirDifficulte()
  print("\nChoisissez un mode de difficulté :")
  print("1. Facile (XP * 1.5)")
  print("2. Normal (XP * 1)")
  print("3. Difficile (XP * 0.8)")

  local choix = tonumber(io.read())

  if choix == 1 then
    XP_Multiplier = 1.5
    print("Mode Facile activé !")
  elseif choix == 3 then
    XP_Multiplier = 0.8
    print("Mode Difficile activé !")
  else
    XP_Multiplier = 1
    print("Mode Normal activé !")
  end
end

-- ==== LANCEMENT DU JEU ====
choisirBonusMalus()
choisirDifficulte()
afficherStats()
