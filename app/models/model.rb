class Model < ActiveRecord::Base
  include DashToNull

  belongs_to :faction
  belongs_to :model_type
  belongs_to :sub_type
  has_many :equips
  has_many :weapons, :through => :equips
  has_and_belongs_to_many :spells
  has_one :warcaster, :dependent => :destroy
  accepts_nested_attributes_for :warcaster
  has_one :warjack, :dependent => :destroy
  accepts_nested_attributes_for :warjack
  has_and_belongs_to_many :units
  has_many :rules
  accepts_nested_attributes_for :rules, :allow_destroy => true
  has_many :model_orders
  has_many :orders, :through => :model_orders
  accepts_nested_attributes_for :model_orders
  has_many :sub_models, :foreign_key => :parent_id, :class_name => 'Model'
  belongs_to :parent, :class_name => 'Model'

  def warcaster?
    #return true if self.model_type.name == "Warcaster"
    return true if !self.warcaster.nil?
    return false
  end

  def warjack?
    #return true if self.model_type.name == "Light Warjack" || self.model_type.name == "Heavy Warjack"
    return true if !self.warjack.nil?
    return false
  end

  def solo?
    return true if self.model_type.name == "Solo"
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

  def sub_model?
    return true if !self.parent.nil?
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
    ModelOrder.find_all_by_order_id(orders)
  end

  def unit
    self.units.first
  end

  def parent_orders
    #order_ids = []

    #orders = ModelOrder.find_all_by_model_id_and_parent_id(self.id, nil)

    #orders.each do |order|
     # order_ids << order.order_id
    #end

    #Order.find(order_ids)
    ModelOrder.find_all_by_model_id_and_parent_id(self.id, nil)
  end
end
