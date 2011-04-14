class Faction < ActiveRecord::Base
  has_many :units
end
