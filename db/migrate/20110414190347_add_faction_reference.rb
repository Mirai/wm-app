class AddFactionReference < ActiveRecord::Migration
  def self.up
    change_table :units do |t|
      t.references :faction
    end    
  end

  def self.down
    remove_column :units, :faction_id
  end
end
