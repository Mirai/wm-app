class DropFeatTable < ActiveRecord::Migration
  def self.up
    drop_table :feats
  end

  def self.down
    create_table :feats do |t|
      t.string :name
      t.text :desc
      t.references :unit
      
      t.timestamps
    end
  end
end
