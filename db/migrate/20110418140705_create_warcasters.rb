class CreateWarcasters < ActiveRecord::Migration
  def self.up
    create_table :warcasters do |t|
      t.string :focus
      t.integer :wj_points

      t.timestamps
    end
  end

  def self.down
    drop_table :warcasters
  end
end
