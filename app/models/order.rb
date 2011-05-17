class Order < ActiveRecord::Base
  has_many :unit_orders
  has_many :units, :through => :unit_orders
end