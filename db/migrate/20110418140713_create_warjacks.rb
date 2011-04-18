class CreateWarjacks < ActiveRecord::Migration
  def self.up
    create_table :warjacks do |t|
      t.integer :left_hand
      t.integer :right_hand

      t.timestamps
    end
  end

  def self.down
    drop_table :warjacks
  end
end
