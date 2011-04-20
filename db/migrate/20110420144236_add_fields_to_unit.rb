class AddFieldsToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :damage, :integer
    add_column :units, :field_allowance, :string
    add_column :units, :base, :string
  end

  def self.down
    remove_column :units, :base
    remove_column :units, :field_allowance
    remove_column :units, :damage
  end
end
