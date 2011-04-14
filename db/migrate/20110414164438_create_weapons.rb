class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table :weapons do |t|
      t.string :name
      t.string :hand
      t.integer :wtype
      t.integer :rng
      t.integer :rof
      t.integer :aoe
      t.integer :pow

      t.timestamps
    end
  end

  def self.down
    drop_table :weapons
  end
end
