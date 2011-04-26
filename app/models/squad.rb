class Squad < ActiveRecord::Base
  belongs_to :faction
  has_and_belongs_to_many :units
  
  def unique_weapons
    unique_weapons = []
    
    self.units.each do |unit|
      unit.weapons.each do |weapon|
        unique_weapons << weapon
      end
    end
    
    unique_weapons.uniq
  end
end
