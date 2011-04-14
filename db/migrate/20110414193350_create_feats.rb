class CreateFeats < ActiveRecord::Migration
  def self.up
    create_table :feats do |t|
      t.string :name
      t.text :desc
      t.references :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :feats
  end
end
