local monster_parser = {}

function monster_parser.chargerMonstres()
  local monstres = {}

  -- Ouvrir le fichier en mode lecture
  local file = io.open("monsters.txt", "r")
  if not file then
    print("Erreur : impossible de charger les monstres depuis le fichier.")
    return {}
  end

  -- Lire chaque ligne du fichier
  for line in file:lines() do
    local nom, hp, atk, def, xp = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")

    -- Convertir les valeurs en nombres lorsque nécessaire
    hp = tonumber(hp)
    atk = tonumber(atk)
    def = tonumber(def)
    xp = tonumber(xp)

    -- Ajouter le monstre à la table
    table.insert(monstres, { nom = nom, hp = hp, atk = atk, def = def, xp = xp })
  end

  -- Fermer le fichier
  file:close()

  return monstres
end

return monster_parser
