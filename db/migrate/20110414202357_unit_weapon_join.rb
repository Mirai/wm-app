class UnitWeaponJoin < ActiveRecord::Migration
  def self.up
    create_table :units_weapons, :id => false do |t|
      t.integer :unit_id
      t.integer :weapon_id
    end
  end

  def self.down
    drop_table :units_weapons
  end
end
