class Warjack < ActiveRecord::Base
  include DashToNull
  
  belongs_to :unit
  belongs_to :damage_grid
end
