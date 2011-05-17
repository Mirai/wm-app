class Unit < ActiveRecord::Base
  include DashToNull
  
  belongs_to :faction
  belongs_to :unit_type
  belongs_to :sub_type
  has_many :equips
  has_many :weapons, :through => :equips
  has_and_belongs_to_many :spells
  has_one :warcaster, :dependent => :destroy
  accepts_nested_attributes_for :warcaster
  has_one :warjack, :dependent => :destroy
  accepts_nested_attributes_for :warjack
  has_and_belongs_to_many :squads
  has_many :rules
  accepts_nested_attributes_for :rules, :allow_destroy => true
  has_many :unit_orders
  has_many :orders, :through => :unit_orders
  accepts_nested_attributes_for :unit_orders
  
  def warcaster?
    return true if self.unit_type_id == 1
    return false
  end
  
  def warjack?
    return true if self.unit_type_id == 2 || self.unit_type_id == 3
    return false
  end
  
  def cavalry?
    return true if self.cavalry
    return false
  end
  
  def character?
    return true if self.field_allowance == 'C'
    return false
  end
  
  def unique_weapons
    unique_weapons = []
    
    self.weapons.each do |weapon|
      unique_weapons << weapon
    end
    
    unique_weapons.uniq
  end
  
  def multi_orders
    orders = Order.find_all_by_id_and_multi(self.order_ids, true)
    UnitOrder.find_all_by_order_id(orders)
  end
  
  def parent_orders
    #order_ids = []
    
    #orders = UnitOrder.find_all_by_unit_id_and_parent_id(self.id, nil)
    
    #orders.each do |order|
     # order_ids << order.order_id
    #end
    
    #Order.find(order_ids)
    UnitOrder.find_all_by_unit_id_and_parent_id(self.id, nil)
  end
end
