class AddUnitReferenceToWarcaster < ActiveRecord::Migration
  def self.up
    change_table :warcasters do |t|
      t.references :unit
    end
  end

  def self.down
    remove_column :warcasters, :unit_id
  end
end
