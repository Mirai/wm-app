class RulesUnitJoinTable < ActiveRecord::Migration
  def self.up
    create_table :rules_units, :id => false do |t|
      t.integer :rule_id
      t.integer :unit_id
    end
  end

  def self.down
    drop_table :rules_units
  end
end
