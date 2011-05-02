class CreateSubTypes < ActiveRecord::Migration
  def self.up
    create_table :sub_types do |t|
      t.string :name

      t.timestamps
    end
    
    add_column :units, :sub_type_id, :integer
    add_column :squads, :sub_type_id, :integer
  end

  def self.down
    drop_table :sub_types
    
    remove_column :units, :sub_type_id
    remove_column :squads, :sub_type_id
  end
end
