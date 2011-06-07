class Warjack < ActiveRecord::Base
  include DashToNull

  belongs_to :model
  belongs_to :damage_grid
end
