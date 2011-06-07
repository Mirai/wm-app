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

  def faction_link faction, text=nil
    text ||= faction

    link_to text, '/' + faction.downcase.gsub(/\s+/, "")
  end

  def model_link model, action=nil
    model_type = model.model_type.name if !model.model_type.nil?

    case model_type
    when "Warcaster"
      case action
      when 'edit'
        link_to 'edit', edit_warcaster_path(model.id)
      else
        link_to model.name, warcaster_path(model.id)
      end
    when "Heavy Warjack"
    when "Light Warjack"
      case action
      when 'edit'
        link_to 'edit', edit_warjack_path(model.id)
      else
        link_to model.name, warjack_path(model.id)
      end
    when "Solo"
      case action
      when 'edit'
        link_to 'edit', edit_model_path(model.id)
      else
        link_to model.name, model_path(model.id)
      end
    else
      case action
      when 'edit'
        link_to 'edit', edit_unit_path(model.unit.id)
      else
        link_to model.unit.name, unit_path(model.unit.id)
      end
    end
  end
end
