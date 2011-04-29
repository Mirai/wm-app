class AddDamageGridIdToWarjacks < ActiveRecord::Migration
  def self.up
    add_column :warjacks, :damage_grid_id, :integer
  end

  def self.down
    remove_column :warjacks, :damage_grid_id
  end
end
