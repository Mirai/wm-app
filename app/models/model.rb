class Model < ActiveRecord::Base
  include DashToNull

  belongs_to :faction
  belongs_to :model_type
  belongs_to :sub_type
  has_many :equips, :dependent => :destroy
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
  has_many :mercenaries
  has_many :merc_factions, :through => :mercenaries, :class_name => "Faction"

  def warmachine?
    return true if self.faction.game == 'Warmachine'
    return false
  end

  def hordes?
    return true if self.faction.game == 'Hordes'
    return false
  end

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

  def dragoon?
    return true if self.cavalry && self.solo?
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

  def mercenary?
    return true if self.faction.name == "Mercenaries" || self.faction.name == "Minions"
    return false
  end

  def unique_weapons
    unique_weapons = []

    self.weapons.each do |weapon|
      unique_weapons << weapon
    end

    unique_weapons.uniq
  end

  def unit
    self.units.first
  end

  def parent_orders
    orders = []

    ModelOrder.find_all_by_model_id(self.id).each do |model_order|
      if !model_order.parent_id.nil?
        orders << model_order.parent_order unless orders.include? model_order.parent_order
      else
        orders << model_order.order
      end
    end

    orders
  end
end
