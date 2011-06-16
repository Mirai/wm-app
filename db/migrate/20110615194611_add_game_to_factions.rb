class AddGameToFactions < ActiveRecord::Migration
  def self.up
    add_column :factions, :game, :string
  end

  def self.down
    remove_column :factions, :game
  end
end
