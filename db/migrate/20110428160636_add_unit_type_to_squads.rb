class AddUnitTypeToSquads < ActiveRecord::Migration
  def self.up
    add_column :squads, :unit_type_id, :integer
  end

  def self.down
    remove_column :squads, :unit_type_id
  end
end
