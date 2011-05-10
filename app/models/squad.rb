class Squad < ActiveRecord::Base
  include DashToNull
  
  belongs_to :faction
  belongs_to :unit_type
  belongs_to :sub_type
  has_and_belongs_to_many :units
  accepts_nested_attributes_for :units, :allow_destroy => true
  
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
  
  private
    def destroy_units
      self.units.each do |unit|
        unit.destroy
      end
    end
end
