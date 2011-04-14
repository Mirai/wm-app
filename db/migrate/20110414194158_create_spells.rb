class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :name
      t.integer :cost
      t.integer :rng
      t.integer :aoe
      t.integer :pow
      t.boolean :up
      t.boolean :off

      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
