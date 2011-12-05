class AddFuryAndThresholdToWarjacks < ActiveRecord::Migration
  def self.up
    add_column :warjacks, :fury, :integer
    add_column :warjacks, :threshold, :integer
  end

  def self.down
    remove_column :warjacks, :threshold
    remove_column :warjacks, :fury
  end
end
