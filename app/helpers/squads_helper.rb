module SquadsHelper
  def squad_type squad
    html = ""
    html += "Cavalry" if squad.cavalry?
    
    if squad.unit_attachment
       html += " Unit Attachment"
    else
      if squad.weapon_attachment
        html += " Weapon Attachment"
      else    
        html += " Unit"
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
  
  def squad_base squad
    html = ""
    prev_unit = ""
    prev_base = ""
    multi_unit = false
    
    squad.units.each do |unit|
      if !prev_unit.empty?
        if unit.base != prev_base
          multi_unit = true
        
          if multi_unit
            html += "#{prev_unit.singularize} #{prev_base} Base<br />"
          else
            if !prev_unit.empty?
              html += "#{prev_base} Base<br />"
            end
          end
        end
      end
      
      prev_unit = unit.short_name
      prev_base = unit.base
    end
    
    if multi_unit
      html += "#{prev_unit.singularize} #{prev_base} Base<br />"
    else
      html += "#{prev_base} Base<br />"
    end
    
    sanitize html
  end
  
  def dragoon_damage damage
    html = ""
    
    damageArr = damage.split('/')
    
    html += "Mounted Damage: #{damageArr[0]}<br />"
    html += "Unmounted Damage: #{damageArr[1]}<br />"
    
    sanitize html
  end
end
