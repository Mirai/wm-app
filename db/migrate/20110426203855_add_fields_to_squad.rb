class AddFieldsToSquad < ActiveRecord::Migration
  def self.up
    add_column :squads, :min_models, :integer
    add_column :squads, :min_cost, :integer
    add_column :squads, :max_models, :integer
    add_column :squads, :max_cost, :integer
    remove_column :squads, :cost
  end

  def self.down
    remove_column :squads, :min_models
    remove_column :squads, :min_cost
    remove_column :squads, :max_models
    remove_column :squads, :max_cost
    add_column :squads, :cost, :integer
  end
end
