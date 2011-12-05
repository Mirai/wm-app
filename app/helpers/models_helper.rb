module ModelsHelper
  def model_title model
    html = ""

    html += model.faction.name + ' ' if !model.sub_model?
    html += 'Epic ' if model.epic
    html += model.sub_type.name + ' ' if !model.sub_type.nil?
    html += 'Character ' if model.character? && !model.warcaster?
    html += model.dragoon? ? 'Dragoon ' : 'Cavalry ' if model.cavalry?

    if model.sub_model? && model.field_allowance.to_i > 1
      html += model.model_type.name.pluralize
    else
      if model.warcaster?
        html += warcasterlock model.faction
      elsif model.warjack?
        html += warjackbeast_title model.model_type.name, model.faction
      else
        html += model.model_type.name
      end
    end

    model.sub_models.each do |sub|
      html += ' & ' + model_title(sub) if !model.dragoon?
    end

    html
  end

  def model_focus model
    return sanitize "Focus: #{model.warcaster.focus}<br />" if model.warcaster? && model.warmachine?
    return sanitize "Fury: #{model.warcaster.focus}<br />" if model.warcaster? && model.hordes?
    return sanitize "Fury: #{model.warjack.fury}<br />" if model.warjack? && model.hordes?
  end

  def model_threshold model
    return sanitize "Threshold: #{model.warjack.threshold}<br />" if model.warjack? && model.hordes?
  end

  def model_damage model
    if model.dragoon?
      html = ""

      html += "Mounted Damage: #{model.damage}<br />\n"
      html += "Dismounted Damage: #{model.sub_models.first.damage}<br />" if !model.sub_models.empty?

      return sanitize html
    end

    sanitize "Damage: #{model.damage}<br />" if !model.damage.nil? && model.damage > 1
  end

  def model_base model
    if model.dragoon?
      html = ""

      html += "#{model.base} Base Mounted<br />\n"
      html += "#{model.sub_models.first.base} Base Dismounted<br />" if !model.sub_models.empty?

      return sanitize html
    end

    sanitize "#{model.base} Base"
  end

  def extra_stat model
    sanitize "#{model.add_name}: #{model.add_stat}<br />" if !model.add_name.empty?
  end

  def model_allowance model
    sanitize "Field Allowance: #{model.field_allowance}<br />" if !model.warcaster? && !model.sub_model?
  end

  def model_cost model
    if model.dragoon? && !model.sub_models.first.cost.nil?
      html = ""

      html += "Without Dismount: #{model.cost}<br />\n"
      html += "With Dismount: #{model.sub_models.first.cost}<br />"

      return sanitize html
    end

    sanitize "Point Cost: #{model.cost}<br />" if !model.warcaster? && !model.sub_model?
  end

  def model_wjpoints model
    return sanitize "Warjack Points: +#{model.warcaster.wj_points}<br />" if model.warcaster? && model.warmachine?
    return sanitize "Warbeast Points: +#{model.warcaster.wj_points}<br />" if model.warcaster? && model.hordes?
  end

  def model_wjdamage model
    render :partial => 'damage_grids/grid', :locals => { :grid => model.warjack.damage_grid } if model.warjack?
  end

  def model_feat model
    sanitize "<h2>#{model.warcaster.feat_name}</h2><p>#{model.warcaster.feat_desc}</p>" if model.warcaster?
  end

  def model_spd model
    html = model.spd.to_s

    html += "/#{model.sub_models.first.spd}" if model.dragoon? && !model.sub_models.empty?

    html
  end

  def model_arm model
    html = model.arm.to_s

    html += "/#{model.sub_models.first.arm}" if model.dragoon? && !model.sub_models.empty?

    html
  end

  def warcasterlock faction, plural=false
    unless faction.nil?
      if faction.game == 'Warmachine'
        return plural ? 'Warcasters' : 'Warcaster'
      elsif faction.game == 'Hordes'
        return plural ? 'Warlocks' : 'Warlock'
      end
    end

    plural ? 'Warcasters/Warlocks' : 'Warcaster/Warlock'
  end

  def warjackbeast faction, plural=false
    unless faction.nil?
      if faction.game == 'Warmachine'
        return plural ? 'Warjacks' : 'Warjack'
      elsif faction.game == 'Hordes'
        return plural ? 'Warbeasts' : 'Warbeast'
      end
    end

    plural ? 'Warjacks/Warbeasts' : 'Warjack/Warbeast'
  end

  def warjackbeast_title type, faction
    if faction.game == 'Warmachine'
      return type.split(' ')[0] + ' Warjack'
    elsif faction.game == 'Hordes'
      return type.split(' ')[0] + ' Warbeast'
    end
  end

  def model_mercs model
    html = ""

    unless model.merc_factions.warmachine.empty?
      html += "<p><strong>Mercenary - </strong>This model will work for "
      html += model.merc_factions.warmachine.collect{ |x| x.name }.join(', ') + '.</p>'
    end
    unless model.merc_factions.hordes.empty?
      html += "<p><strong>Minion - </strong>This model will work for "
      html += model.merc_factions.hordes.collect{ |x| x.name }.join(', ') + '.</p>'
    end

    sanitize html
  end

end
