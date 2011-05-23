module UnitsHelper
  def unit_focus unit
    sanitize "Focus: #{unit.warcaster.focus}<br />" if unit.warcaster?
  end

  def unit_damage unit
    sanitize "Damage: #{unit.damage}<br />" if !unit.damage.nil?
  end

  def extra_stat unit
    sanitize "#{unit.add_name}: #{unit.add_stat}<br />" if !unit.add_name.empty?
  end

  def unit_allowance unit
    sanitize "Field Allowance: #{unit.field_allowance}<br />" if !unit.warcaster?
  end

  def unit_cost unit
    sanitize "Point Cost: #{unit.cost}<br />" if !unit.warcaster?
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
