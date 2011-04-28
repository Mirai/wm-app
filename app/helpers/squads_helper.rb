module SquadsHelper
  def squad_type squad
    html = squad.unit_type.name
    
    if squad.unit_attachment
      if html == "Unit"
        html += " Attachment"
      else
        html += " Unit Attachment"
      end
    else
      if squad.weapon_attachment
        if html == "Unit"
          html = " Weapon Attachment"
        else
          html += " Weapon Attachment"
        end
      else    
        html += " Unit" if html != "Unit"
      end
    end
    
    html
  end
  
  def squad_damage squad
    html = ""
    prev_unit = ""
    prev_damage = 0
    multi_unit = false
    
    squad.units.each do |unit|
      if unit.damage == prev_damage
        multi_unit = true
      else
        if multi_unit
          html += "Damage: #{prev_damage}ea<br />"
        else
          if !prev_unit.empty?
            html += "#{prev_unit}'s Damage: #{prev_damage}<br />"
          end
        end
      end
      
      prev_unit = unit.short_name
      prev_damage = unit.damage
    end
    
    if multi_unit
      html += "Damage: #{prev_damage}ea<br />"
    else
      html += "#{prev_unit}'s Damage: #{prev_damage}<br />" if prev_damage > 1
    end
    
    sanitize html
  end
end
