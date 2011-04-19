class DropTableUnitsWarcastersAndUnitsWarjacks < ActiveRecord::Migration
  def self.up
    drop_table :units_warcasters
    drop_table :units_warjacks
  end

  def self.down
    create_table :units_warcasters, :id => false do |t|
      t.integer :unit_id
      t.integer :warcaster_id
    end
    
    create_table :units_warjacks, :id => false do |t|
      t.integer :unit_id
      t.integer :warjack_id
    end
  end
end
