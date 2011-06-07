module OrdersHelper
  def order_name model_order
    order_name = model_order.order.name

    if !model_order.skill_check.nil?
      orderArr = model_order.order.name.split('(')

      order_name = " #{orderArr[0]} [#{model_order.skill_check}] (#{orderArr[1]}"
    end

    order_name
  end
end
