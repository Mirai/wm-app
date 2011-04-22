class AddUnitIdToWarjacks < ActiveRecord::Migration
  def self.up
    change_table :warjacks do |t|
      t.references :unit
    end
  end

  def self.down
    remove_column :warjacks, :unit_id
  end
end
