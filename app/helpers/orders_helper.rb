module OrdersHelper
  def order_name model_order
    html = ""

    html += "#{model_order.source}: " if !model_order.source.empty?

    order_name = model_order.order.name
    html += order_name

    if !model_order.skill_check.nil?
      orderArr = order_name.split('(')

      html += " #{orderArr[0]} [#{model_order.skill_check}] (#{orderArr[1]}"
    end

    html
  end
end
