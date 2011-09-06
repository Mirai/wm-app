class ModelOrder < ActiveRecord::Base
  belongs_to :model
  belongs_to :order
  belongs_to :parent_order, :class_name => "Order", :foreign_key => "parent_id"
end