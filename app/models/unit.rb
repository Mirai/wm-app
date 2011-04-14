class Unit < ActiveRecord::Base
  belongs_to :faction
  belongs_to :unit_type
  has_many :weapons
  has_one :feat
  has_and_belongs_to_many :spells
end
