module OrdersHelper
  def order_name unit_order
    order_name = unit_order.order.name
    
    if !unit_order.skill_check.nil?
      orderArr = unit_order.order.name.split('(')
    
      order_name = " #{orderArr[0]} [#{unit_order.skill_check}] (#{orderArr[1]}"
    end
    
    order_name
  end
end
