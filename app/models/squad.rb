class Squad < ActiveRecord::Base
  include DashToNull
  
  belongs_to :faction
  belongs_to :unit_type
  belongs_to :sub_type
  has_and_belongs_to_many :units
  accepts_nested_attributes_for :units, :allow_destroy => true
  belongs_to :attachment, :class_name => 'Squad'
  has_many :attachments, :class_name => 'Squad'
  
  before_destroy :destroy_units
  
  def unique_weapons
    unique_weapons = []
    
    self.units.each do |unit|
      unit.weapons.each do |weapon|
        unique_weapons << weapon
      end
    end
    
    unique_weapons.uniq
  end
  
  def cavalry?
    return true if self.cavalry
    return false
  end
  
  def character?
    return true if self.field_allowance == 'C'
    return false
  end
  
  def attachment?
    return true if self.unit_attachment || self.weapon_attachment
    return false
  end
  
  def in_faction
    Squad.order(:name).find_all_by_faction_id(self.faction_id)
  end
  
  private
    def destroy_units
      self.units.each do |unit|
        unit.destroy
      end
    end
end
