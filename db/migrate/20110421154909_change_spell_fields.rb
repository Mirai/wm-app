class ChangeSpellFields < ActiveRecord::Migration
  def self.up
    change_column :spells, :cost, :string
    change_column :spells, :rng, :string
    change_column :spells, :aoe, :string
  end

  def self.down
    change_column :spells, :cost, :integer
    change_column :spells, :rng, :integer
    change_column :spells, :aoe, :integer
  end
end
