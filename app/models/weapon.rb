class Weapon < ActiveRecord::Base
  include DashToNull
  
  has_many :equips
  has_many :units, :through => :equips
  has_and_belongs_to_many :abilities
  
  has_many :warjacks
end
