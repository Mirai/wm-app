class ModelOrder < ActiveRecord::Base
  belongs_to :model
  belongs_to :order

  def order_name
    self.order.name
  end

  def sub_orders
    ModelOrder.find_all_by_parent_id(self.id)
  end

  def name
    self.order.name
  end

  def desc
    self.order.desc
  end
end