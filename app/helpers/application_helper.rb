module ApplicationHelper
  def bool2Affirm bool
    if bool
      'YES'
    else
      'NO'
    end
  end
  
  def statDash stat
    if stat.to_s.empty?
      '-'
    else
      stat
    end
  end
  
  def link_to_add_fields(name, f, association, view)  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
      render(view + "/" + association.to_s.singularize + "_fields", :f => builder)  
    end  
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
  
  def faction_link faction
    link_to faction, '/' + faction.downcase.gsub(/\s+/, "")
  end
  
  def unit_link unit
    unit_type = unit.unit_type.name if !unit.unit_type.nil?
    
    case unit_type
    when "Warcaster"
      link_to unit.name, warcaster_path(unit.id)
    when "Heavy Warjack"
    when "Light Warjack"
      link_to unit.name, warjack_path(unit.id)
    when "Solo"
      link_to unit.name, unit_path(unit.id)
    else
      link_to unit.squad.name, squad_path(unit.squad.id)
    end
  end
end
