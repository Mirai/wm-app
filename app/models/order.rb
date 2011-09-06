class Order < ActiveRecord::Base
  has_many :model_orders
  has_many :models, :through => :model_orders
  has_many :sub_orders, :class_name => "ModelOrder", :foreign_key => "parent_id"

  scope :multi_orders, :conditions => { :multi => true }

  def sub_orders model_id
    orders = []

    ModelOrder.find_all_by_model_id_and_parent_id(model_id, self.id).each do |model_order|
      orders << model_order.order
    end

    orders
  end

  def get_attribute model_id, attribute
    ModelOrder.find_by_model_id_and_order_id(model_id, self.id).send(attribute) rescue nil
  end
end