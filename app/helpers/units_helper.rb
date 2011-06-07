module UnitsHelper
  def unit_type unit
    html = ""
    html += "Cavalry" if unit.cavalry?

    if unit.unit_attachment
       html += " Unit Attachment"
    else
      if unit.weapon_attachment
        html += " Weapon Attachment"
      else
        html += " Unit"
      end
    end

    html
  end

  def unit_damage unit
    html = ""
    prev_model = ""
    prev_damage = 0
    multi_model = false

    unit.models.each do |model|
      if model.damage == prev_damage
        multi_model = true
      else
        if multi_model
          html += "Damage: #{prev_damage}ea<br />"
        else
          if !prev_model.empty?
            html += "#{prev_model}'s Damage: #{prev_damage}<br />"
          end
        end
      end

      prev_model = model.short_name
      prev_damage = model.damage
    end

    if multi_model
      html += "Damage: #{prev_damage}ea<br />"
    else
      html += "#{prev_model}'s Damage: #{prev_damage}<br />" if prev_damage > 1
    end

    sanitize html
  end

  def unit_base unit
    html = ""
    prev_model = ""
    prev_base = ""
    multi_model = false

    unit.models.each do |model|
      if !prev_model.empty?
        if model.base != prev_base
          multi_model = true

          if multi_model
            html += "#{prev_model.singularize} #{prev_base} Base<br />"
          else
            if !prev_model.empty?
              html += "#{prev_base} Base<br />"
            end
          end
        end
      end

      prev_model = model.short_name
      prev_base = model.base
    end

    if multi_model
      html += "#{prev_model.singularize} #{prev_base} Base<br />"
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
