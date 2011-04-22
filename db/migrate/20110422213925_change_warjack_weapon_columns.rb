class ChangeWarjackWeaponColumns < ActiveRecord::Migration
  def self.up
    rename_column :warjacks, :left_hand, :left_hand_id
    rename_column :warjacks, :right_hand, :right_hand_id
  end

  def self.down
    rename_column :warjacks, :left_hand_id, :left_hand
    rename_column :warjacks, :right_hand_id, :right_hand
  end
end
