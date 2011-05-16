class RedoOrdersUnitsJoinAsHasManyThrough < ActiveRecord::Migration
  def self.up
    drop_table :orders_units
    
    create_table :unit_orders do |t|
      t.references :unit
      t.references :order
      t.integer :skill_check
      t.integer :parent_id
      
      t.timestamps
    end
  end

  def self.down
    create_table :orders_units, :id => false do |t|
      t.integer :order_id
      t.integer :unit_id
    end
    
    drop_table :unit_orders
  end
end
