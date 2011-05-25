class AddParentIdToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :parent_id, :integer
  end

  def self.down
    remove_column :units, :parent_id
  end
end
