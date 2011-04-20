class Unit < ActiveRecord::Base
  belongs_to :faction
  belongs_to :unit_type
  has_and_belongs_to_many :weapons
  has_and_belongs_to_many :spells
  has_one :warcaster, :conditions => :dependent => :destroy
  has_one :warjacks
  
  def warcaster?
    return true if self.unit_type_id == 1
    return false
  end
  
  def warjack?
    return true if self.unit_type_id == 2 || self.unit_type_id == 3
    return false
  end
end
