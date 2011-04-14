class AddDescToSpells < ActiveRecord::Migration
  def self.up
    add_column :spells, :desc, :string
  end

  def self.down
    drop_column :spells, :desc
  end
end
