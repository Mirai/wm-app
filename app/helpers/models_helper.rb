module ModelsHelper
  def model_title model
    html = ""

    html += model.faction.name + ' ' if !model.sub_model?
    html += 'Epic ' if model.warcaster? && model.warcaster.epic
    html += model.sub_type.name + ' ' if !model.sub_type.nil?
    html += 'Character ' if model.character? && !model.warcaster?
    html += model.dragoon? ? 'Dragoon ' : 'Cavalry ' if model.cavalry?
    html += model.sub_model? && model.field_allowance.to_i > 1 ? model.model_type.name.pluralize : model.model_type.name

    model.sub_models.each do |sub|
      html += ' & ' + model_title(sub) if !model.dragoon?
    end

    html
  end

  def model_focus model
    sanitize "Focus: #{model.warcaster.focus}<br />" if model.warcaster?
  end

  def model_damage model
    if model.dragoon?
      html = ""

      html += "Mounted Damage: #{model.damage}<br />\n"
      html += "Dismounted Damage: #{model.sub_models.first.damage}<br />"

      return sanitize html
    end

    sanitize "Damage: #{model.damage}<br />" if !model.damage.nil? && model.damage > 1
  end

  def model_base model
    if model.dragoon?
      html = ""

      html += "#{model.base} Base Mounted<br />\n"
      html += "#{model.sub_models.first.base} Base Dismounted<br />"

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
    sanitize "Point Cost: #{model.cost}<br />" if !model.warcaster? && !model.sub_model?
  end

  def model_wjpoints model
    sanitize "Warjack Points: +#{model.warcaster.wj_points}<br />" if model.warcaster?
  end

  def model_wjdamage model
    render :partial => 'damage_grids/grid', :locals => { :grid => model.warjack.damage_grid } if model.warjack?
  end

  def model_feat model
    sanitize "<h2>#{model.warcaster.feat_name}</h2><p>#{model.warcaster.feat_desc}</p>" if model.warcaster?
  end

  def model_spd model
    html = model.spd.to_s

    html += "/#{model.sub_models.first.spd}" if model.dragoon?

    html
  end

  def model_arm model
    html = model.arm.to_s

    html += "/#{model.sub_models.first.arm}" if model.dragoon?

    html
  end

end
