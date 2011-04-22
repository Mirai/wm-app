class AddShortNameToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :short_name, :string
  end

  def self.down
    remove_column :units, :short_name
  end
end
