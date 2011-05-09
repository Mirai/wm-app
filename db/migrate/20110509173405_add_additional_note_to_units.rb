class AddAdditionalNoteToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :add_name, :string
    add_column :units, :add_stat, :integer
  end

  def self.down
    remove_column :units, :add_stat
    remove_column :units, :add_name
  end
end
