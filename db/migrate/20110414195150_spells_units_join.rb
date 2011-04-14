class SpellsUnitsJoin < ActiveRecord::Migration
  def self.up
    create_table :spells_units, :id => false do |t|
      t.integer :spell_id
      t.integer :unit_id
    end
  end

  def self.down
    drop_table :spells_units
  end
end
