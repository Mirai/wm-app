class AddSprayFlagToWeapons < ActiveRecord::Migration
  def self.up
    add_column :weapons, :spray, :boolean
  end

  def self.down
    remove_column :weapons, :spray
  end
end
