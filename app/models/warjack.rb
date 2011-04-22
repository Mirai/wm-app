class Warjack < ActiveRecord::Base
  belongs_to :unit
  belongs_to :left_hand, :class_name => "Weapon", :foreign_key => "left_hand_id"
  belongs_to :right_hand, :class_name => "Weapon", :foreign_key => "right_hand_id"
end
