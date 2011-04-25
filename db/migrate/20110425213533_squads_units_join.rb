class SquadsUnitsJoin < ActiveRecord::Migration
  def self.up
    create_table :squads_units, :id => false do |t|
      t.integer :squad_id
      t.integer :unit_id
    end
  end

  def self.down
    drop_table :squads_units
  end
end
