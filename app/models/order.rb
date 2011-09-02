class Order < ActiveRecord::Base
  has_many :model_orders
  has_many :models, :through => :model_orders
  has_many :sub_orders, :class_name => "ModelOrder", :foreign_key => "parent_id"

  scope :multi_orders, :conditions => { :multi => true }
end