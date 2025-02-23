local game_start = {}

function game_start.initPlayer()
  math.randomseed(os.time())

  local Player = {
    name = "ogUser",
    hp = 20,
    atk = 5,
    def = 5,
    luck = 5,
    xp = 0,
    level = 1,
    xp_multiplier = 1
  }

  -- Demander le nom du joueur
  io.write('Donnez un nom au joueur ? (default "ogUser"): ')
  local inputName = io.read()
  if inputName ~= "" then
    Player.name = inputName
  end

  -- Choix du bonus/malus
  local stats = { "atk", "def", "luck" }

  print("\nChoisissez une stat à booster (+2) :")
  for i, stat in ipairs(stats) do
    print(i .. ". " .. stat:upper())
  end
  local bonusChoice = tonumber(io.read())
  Player[stats[bonusChoice]] = Player[stats[bonusChoice]] + 2
  print("+" .. 2 .. " en " .. stats[bonusChoice]:upper())

  print("\nChoisissez une stat à diminuer (-2) :")
  for i, stat in ipairs(stats) do
    if i ~= bonusChoice then
      print(i .. ". " .. stat:upper())
    end
  end
  local malusChoice = tonumber(io.read())
  Player[stats[malusChoice]] = Player[stats[malusChoice]] - 2
  print("-" .. 2 .. " en " .. stats[malusChoice]:upper())

  -- Choix de la difficulté
  print("\nChoisissez un mode de difficulté :")
  print("1. Facile (XP * 1.5)")
  print("2. Normal (XP * 1)")
  print("3. Difficile (XP * 0.8)")

  local choix = tonumber(io.read())
  if choix == 1 then
    Player.xp_multiplier = 1.5
    print("Mode Facile activé.")
  elseif choix == 3 then
    Player.xp_multiplier = 0.8
    print("Mode Difficile activé.")
  else
    Player.xp_multiplier = 1
    print("Mode Normal activé.")
  end

  return Player
end

return game_start
