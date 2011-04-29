class Warjack < ActiveRecord::Base
  belongs_to :unit
  belongs_to :damage_grid
end
