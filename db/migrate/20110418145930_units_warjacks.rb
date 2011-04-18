class UnitsWarjacks < ActiveRecord::Migration
  def self.up
    create_table :units_warjacks, :id => false do |t|
      t.integer :unit_id
      t.integer :warjack_id
    end
  end

  def self.down
    drop_table :units_warjacks
  end
end
