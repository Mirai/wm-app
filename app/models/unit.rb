class Unit < ActiveRecord::Base
  belongs_to :faction
  belongs_to :unit_type
  has_and_belongs_to_many :weapons
  has_and_belongs_to_many :spells
  has_and_belongs_to_many :warcasters
  has_and_belongs_to_many :warjacks
end
