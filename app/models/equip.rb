class Equip < ActiveRecord::Base
  belongs_to :unit
  belongs_to :weapon
end