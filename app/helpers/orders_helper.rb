module OrdersHelper
  def model_order order, model_id
    html = ""

    puts order.name

    case order.get_attribute(model_id, "source")
    when "Granted"
      html += "<strong>Granted: #{order.name} - </strong>While this model is in play, models in its unit gain #{order.name}."
      html += "  (#{order.desc})" if !order.desc.empty?
    when "Tactics"
      html += "<strong>Tactics: #{order.name} - </strong>Models in this unit gain #{order.name}."
      html += "  (#{order.desc})" if !order.desc.empty?
    else
      skill_check = order.get_attribute(model_id, "skill_check")

      if !skill_check.nil?
        orderArr = order.name.split('(')

        html += "<strong>#{orderArr[0]} [#{skill_check}] (#{orderArr[1]}</strong>"
      else
        html += "<strong>#{order.name}</strong>"
      end

      html += " - #{order.desc}" if !order.desc.empty?
    end

    sanitize html
  end
end
