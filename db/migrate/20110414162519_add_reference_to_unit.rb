class AddReferenceToUnit < ActiveRecord::Migration
  def self.up
    change_table :units do |t|
      t.references :unit_type
    end    
  end

  def self.down
    remove_column :units, :unit_type_id
  end
end
