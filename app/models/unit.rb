class Unit < ActiveRecord::Base
  belongs_to :faction
  belongs_to :unit_type
  has_and_belongs_to_many :weapons
  has_and_belongs_to_many :spells
  has_one :warcaster, :dependent => :destroy
  has_one :warjacks
  
  def warcaster?
    return true if self.unit_type_id == 1
    return false
  end
end
