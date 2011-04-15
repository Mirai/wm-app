module WeaponsHelper
  def weaponType ranged
    if ranged
      "Ranged"
    else
      "Melee"
    end
  end
end
