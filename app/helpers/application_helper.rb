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
end
