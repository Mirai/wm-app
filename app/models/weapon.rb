class Weapon < ActiveRecord::Base
  has_and_belongs_to_many :units
  has_and_belongs_to_many :abilities
  
  has_many :warjacks
end
