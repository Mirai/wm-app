class RedoUnitsWeaponsAsEquips < ActiveRecord::Migration
  def self.up
    drop_table :units_weapons
    
    create_table :equips do |t|
      t.references :unit
      t.references :weapon
      t.boolean :x2
      
      t.timestamps
    end
  end

  def self.down
    drop_table :equips
    
    create_table :units_weapons, :id => false do |t|
      t.integer :unit_id
      t.integer :weapon_id
    end
  end
end
