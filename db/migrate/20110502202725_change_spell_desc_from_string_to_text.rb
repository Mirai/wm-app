class ChangeSpellDescFromStringToText < ActiveRecord::Migration
  def self.up
    change_column :spells, :desc, :text
  end

  def self.down
    change_column :spells, :desc, :string
  end
end
