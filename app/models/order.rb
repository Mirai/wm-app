class Order < ActiveRecord::Base
  has_many :model_orders
  has_many :models, :through => :model_orders
end