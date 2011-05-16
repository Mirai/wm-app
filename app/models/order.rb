class Order < ActiveRecord::Base
  has_many :unit_orders
  has_many :units, :through => :unit_orders
  
  def sub_orders
    #if !self.parent_id.nil?
      order_ids = []
      
      sub_orders = UnitOrder.find_all_by_parent_id(self.id)
      
      sub_orders.each do |sub|
        order_ids << sub.order_id
      end
      
      Order.find(order_ids)
    #end
  end
end