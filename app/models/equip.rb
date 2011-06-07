class Equip < ActiveRecord::Base
  belongs_to :model
  belongs_to :weapon
end