class UnitsWarcasters < ActiveRecord::Migration
  def self.up
    create_table :units_warcasters, :id => false do |t|
      t.integer :unit_id
      t.integer :warcaster_id
    end
  end

  def self.down
    drop_table :units_warcasters
  end
end
