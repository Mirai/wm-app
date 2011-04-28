class UnitType < ActiveRecord::Base
  has_many :units
  has_many :squads
end