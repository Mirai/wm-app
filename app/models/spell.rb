class Spell < ActiveRecord::Base
  include DashToNull

  has_and_belongs_to_many :models
end
