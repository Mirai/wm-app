module UnitsHelper
  def unit_title unit
    html = ""

    html += unit.faction.name + ' ' if !unit.sub_unit?
    html += 'Epic ' if unit.warcaster? && unit.warcaster.epic
    html += unit.sub_type.name + ' ' if !unit.sub_type.nil?
    html += 'Character ' if unit.character? && !unit.warcaster?
    html += unit.solo? ? 'Dragoon ' : 'Cavalry ' if unit.cavalry?
    html += unit.sub_unit? && unit.field_allowance.empty? ? unit.unit_type.name.pluralize : unit.unit_type.name

    unit.sub_units.each do |sub|
      html += ' & ' + unit_title(sub)
    end

    html
  end

  def unit_focus unit
    sanitize "Focus: #{unit.warcaster.focus}<br />" if unit.warcaster?
  end

  def unit_damage unit
    sanitize "Damage: #{unit.damage}<br />" if !unit.damage.nil? && unit.damage > 1
  end

  def extra_stat unit
    sanitize "#{unit.add_name}: #{unit.add_stat}<br />" if !unit.add_name.empty?
  end

  def unit_allowance unit
    sanitize "Field Allowance: #{unit.field_allowance}<br />" if !unit.warcaster? && !unit.sub_unit?
  end

  def unit_cost unit
    sanitize "Point Cost: #{unit.cost}<br />" if !unit.warcaster? && !unit.sub_unit?
  end

  def unit_wjpoints unit
    sanitize "Warjack Points: +#{unit.warcaster.wj_points}<br />" if unit.warcaster?
  end

  def unit_wjdamage unit
    render :partial => 'damage_grids/grid', :locals => { :grid => unit.warjack.damage_grid } if unit.warjack?
  end

  def unit_feat unit
    sanitize "<h2>#{unit.warcaster.feat_name}</h2><p>#{unit.warcaster.feat_desc}</p>" if unit.warcaster?
  end

end
