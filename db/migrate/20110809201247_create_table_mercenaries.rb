class CreateTableMercenaries < ActiveRecord::Migration
  def self.up
    create_table :mercenaries do |t|
      t.integer :model_id
      t.integer :faction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mercenaries
  end
end
