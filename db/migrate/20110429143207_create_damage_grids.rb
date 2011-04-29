class CreateDamageGrids < ActiveRecord::Migration
  def self.up
    create_table :damage_grids do |t|
      t.string :name
      t.string :one_1
      t.string :one_2
      t.string :one_3
      t.string :one_4
      t.string :one_5
      t.string :one_6
      t.string :two_1
      t.string :two_2
      t.string :two_3
      t.string :two_4
      t.string :two_5
      t.string :two_6
      t.string :three_1
      t.string :three_2
      t.string :three_3
      t.string :three_4
      t.string :three_5
      t.string :three_6
      t.string :four_1
      t.string :four_2
      t.string :four_3
      t.string :four_4
      t.string :four_5
      t.string :four_6
      t.string :five_1
      t.string :five_2
      t.string :five_3
      t.string :five_4
      t.string :five_5
      t.string :five_6
      t.string :six_1
      t.string :six_2
      t.string :six_3
      t.string :six_4
      t.string :six_5
      t.string :six_6

      t.timestamps
    end
  end

  def self.down
    drop_table :damage_grids
  end
end
