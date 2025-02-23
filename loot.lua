local loot = {}

function loot.ouvrirCoffre(Player)
  print("\n🎁 Vous ouvrez le coffre...")

  -- Calcul des chances basées sur la stat de luck
  local chance = math.random(1, 100) + Player.luck * 2   -- La chance pondère le tirage

  if chance >= 90 then
    -- 💎 Objet rare
    print("✨ Vous trouvez un objet RARE ! (+3 ATK, +3 DEF)")
    Player.atk = Player.atk + 3
    Player.def = Player.def + 3
  elseif chance >= 70 then
    -- 🛡️ Armure
    print("🛡️ Vous trouvez une armure robuste (+2 DEF)")
    Player.def = Player.def + 2
  elseif chance >= 50 then
    -- ⚔️ Arme
    print("⚔️ Vous trouvez une nouvelle épée (+2 ATK)")
    Player.atk = Player.atk + 2
  elseif chance >= 30 then
    -- 🧪 Potion
    local heal = math.random(5, 15) + Player.luck
    Player.hp = Player.hp + heal
    print("🧪 Vous trouvez une potion et récupérez +" .. heal .. " HP")
  else
    -- 💥 Piège
    local damage = math.random(5, 15) - Player.luck     -- La luck réduit les dégâts
    if damage < 0 then damage = 0 end
    Player.hp = Player.hp - damage
    print("💥 Un piège explose ! Vous perdez " .. damage .. " HP")
  end
end

return loot
