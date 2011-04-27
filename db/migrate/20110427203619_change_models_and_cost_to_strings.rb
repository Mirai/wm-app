class ChangeModelsAndCostToStrings < ActiveRecord::Migration
  def self.up
    change_column :squads, :min_models, :string
    change_column :squads, :min_cost, :string
    change_column :squads, :max_models, :string
    change_column :squads, :max_cost, :string
  end

  def self.down
    change_column :squads, :min_models, :integer
    change_column :squads, :min_cost, :integer
    change_column :squads, :max_models, :integer
    change_column :squads, :max_cost, :integer
  end
end
