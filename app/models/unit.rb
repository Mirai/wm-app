class Unit < ActiveRecord::Base
  belongs_to :unit_type
  has_many :weapons
end
