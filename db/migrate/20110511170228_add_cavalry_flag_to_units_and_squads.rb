class AddCavalryFlagToUnitsAndSquads < ActiveRecord::Migration
  def self.up
    add_column :units, :cavalry, :boolean
    add_column :squads, :cavalry, :boolean
  end

  def self.down
    remove_column :units, :cavalry
    remove_column :squads, :cavalry
  end
end
