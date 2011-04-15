class RedesignWeapons < ActiveRecord::Migration
  def self.up
    remove_column :weapons, :hand
    remove_column :weapons, :wtype
    add_column :weapons, :ranged, :boolean
  end

  def self.down
    add_column :weapons, :hand, :string
    add_column :weapons, :wtype, :integer
    remove_column :weapons, :ranged
  end
end
