class MoveEpicToModels < ActiveRecord::Migration
  def self.up
    remove_column :warcasters, :epic
    add_column :models, :epic, :boolean
  end

  def self.down
    remove_column :models, :epic
    add_column :warcasters, :epic, :boolean
  end
end
