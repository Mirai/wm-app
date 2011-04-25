class Unit < ActiveRecord::Base
  belongs_to :faction
  belongs_to :unit_type
  has_and_belongs_to_many :weapons
  has_and_belongs_to_many :spells
  has_one :warcaster, :dependent => :destroy
  accepts_nested_attributes_for :warcaster
  has_one :warjack, :dependent => :destroy
  accepts_nested_attributes_for :warjack
  has_and_belongs_to_many :rules
  
  def warcaster?
    return true if self.unit_type_id == 1
    return false
  end
  
  def warjack?
    return true if self.unit_type_id == 2 || self.unit_type_id == 3
    return false
  end
end
