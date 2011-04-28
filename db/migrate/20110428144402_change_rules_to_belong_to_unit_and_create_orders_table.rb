class ChangeRulesToBelongToUnitAndCreateOrdersTable < ActiveRecord::Migration
  def self.up
    add_column :rules, :unit_id, :integer
    
    create_table :orders do |t|
      t.string :name
      t.text :desc
      
      t.timestamps
    end
    
    rename_table :rules_units, :orders_units
    rename_column :orders_units, :rule_id, :order_id
  end

  def self.down
    remove_column :rules, :unit_id
    drop_table :orders
    rename_table :orders_units, :rules_units
    rename_column :rules_units, :order_id, :rule_id
  end
end
