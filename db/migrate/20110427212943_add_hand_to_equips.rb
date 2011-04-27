class AddHandToEquips < ActiveRecord::Migration
  def self.up
    add_column :equips, :hand, :string
    remove_column :warjacks, :left_hand_id
    remove_column :warjacks, :right_hand_id
  end

  def self.down
    remove_column :equips, :hand
    add_column :warjacks, :left_hand_id, :integer
    add_column :warjacks, :right_hand_id, :integer
  end
end
