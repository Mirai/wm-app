class AddEpicToWarcasters < ActiveRecord::Migration
  def self.up
    add_column :warcasters, :epic, :boolean
  end

  def self.down
    remove_column :warcasters, :epic
  end
end
