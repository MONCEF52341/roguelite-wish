local combat_system = {}

-- Fonction pour afficher la barre de vie
local function afficherBarreDeVie(vieActuelle, vieMaximale)
  local proportion = math.floor(vieActuelle / vieMaximale * 10)
  local barre = ""
  for i = 1, 10 do
    if i <= proportion then
      barre = barre .. "█"
    else
      barre = barre .. " "
    end
  end
  return "[" .. barre .. "]"
end

function combat_system.demarrerCombat(Player, ennemi)
  print("\n⚔️ Le combat commence contre " .. ennemi.nom .. " !")
  print("Ennemi HP: " .. ennemi.hp .. " | ATK: " .. ennemi.atk .. " | DEF: " .. ennemi.def)

  while Player.hp > 0 and ennemi.hp > 0 do
    -- === TOUR DU JOUEUR ===

    print("\nVotre HP: " ..
      afficherBarreDeVie(Player.hp, Player.max_hp) .. " | Ennemi HP: " .. afficherBarreDeVie(ennemi.hp, 16))
    print("Que voulez-vous faire ?")
    print("1. Attaquer")
    print("2. Utiliser la chance (tentative d'esquive ou coup critique)")
    print("3. Fuir")

    local choix = tonumber(io.read())

    if choix == 1 then
      local critique = math.random(1, 100) <= (5 + Player.luck * 2) -- Base 5% + luck
      local degats = Player.atk - ennemi.def
      if degats < 1 then degats = 1 end
      if critique then
        degats = degats * 2
        print("💥 COUP CRITIQUE !")
      end
      ennemi.hp = ennemi.hp - degats
      print("👊 Vous infligez " .. degats .. " dégâts à " .. ennemi.nom)
    elseif choix == 2 then
      local chance = math.random(1, 100)
      if chance <= (10 + Player.luck * 3) then
        print("💨 Vous esquivez la prochaine attaque de l'ennemi !")
        ennemi.ignoreNextAttack = true
      else
        print("😬 Échec de la tentative d'esquive...")
      end
    elseif choix == 3 then
      local fuite = math.random(1, 100)
      if fuite <= (30 + Player.luck * 5) then
        print("🏃 Vous avez réussi à fuir le combat !")
        return
      else
        print("❌ Fuite échouée !")
      end
    else
      print("⛔ Choix invalide.")
    end

    -- === TOUR DE L'ENNEMI ===
    if ennemi.hp > 0 then
      if ennemi.ignoreNextAttack then
        print("🙅 Vous esquivez l'attaque de l'ennemi !")
        ennemi.ignoreNextAttack = false
      else
        local critique = math.random(1, 100) <= 5
        local degats = ennemi.atk - Player.def
        if degats < 1 then degats = 1 end
        if critique then
          degats = degats * 2
          print("💥 L'ennemi fait un COUP CRITIQUE !")
        end
        Player.hp = Player.hp - degats
        print("⚔️ " .. ennemi.nom .. " vous inflige " .. degats .. " dégâts.")
      end
    end
  end

  -- === FIN DU COMBAT ===
  if Player.hp <= 0 then
    print("💀 Vous êtes mort au combat CHEH.")
  elseif ennemi.hp <= 0 then
    print("🏆 Vous avez vaincu " .. ennemi.nom .. " !")
    local xpGagnee = ennemi.xp * Player.xp_multiplier
    Player.xp = Player.xp + xpGagnee
    print("✨ Vous gagnez " .. xpGagnee .. " XP.")
  end
end

return combat_system
