class Unit < ActiveRecord::Base
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
  has_and_belongs_to_many :orders
  
  def warcaster?
    return true if self.unit_type_id == 1
    return false
  end
  
  def warjack?
    return true if self.unit_type_id == 2 || self.unit_type_id == 3
    return false
  end
  
  def unique_weapons
    unique_weapons = []
    
    self.weapons.each do |weapon|
      unique_weapons << weapon
    end
    
    unique_weapons.uniq
  end
end
