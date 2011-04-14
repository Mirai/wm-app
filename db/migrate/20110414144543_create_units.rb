class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :name
      t.integer :spd
      t.integer :str
      t.integer :mat
      t.integer :rat
      t.integer :def
      t.integer :arm
      t.integer :cmd
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
