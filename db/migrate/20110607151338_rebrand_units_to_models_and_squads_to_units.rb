class RebrandUnitsToModelsAndSquadsToUnits < ActiveRecord::Migration
  def self.up
    rename_table :units, :models
    rename_table :squads, :units
    rename_table :unit_orders, :model_orders
    rename_table :unit_types, :model_types
    rename_table :spells_units, :models_spells
    rename_table :squads_units, :models_units

    rename_column :equips, :unit_id, :model_id
    rename_column :rules, :unit_id, :model_id
    rename_column :models_spells, :unit_id, :model_id
    rename_column :models_units, :unit_id, :model_id
    rename_column :models_units, :squad_id, :unit_id
    rename_column :model_orders, :unit_id, :model_id
    rename_column :warcasters, :unit_id, :model_id
    rename_column :warjacks, :unit_id, :model_id
    rename_column :models, :unit_type_id, :model_type_id
  end

  def self.down
    rename_column :equips, :model_id, :unit_id
    rename_column :rules, :model_id, :unit_id
    rename_column :models_spells, :model_id, :unit_id
    rename_column :models_units, :unit_id, :squad_id
    rename_column :models_units, :model_id, :unit_id
    rename_column :model_orders, :model_id, :unit_id
    rename_column :warcasters, :model_id, :unit_id
    rename_column :warjacks, :model_id, :unit_id
    rename_column :models, :model_type_id, :unit_type_id

    rename_table :units, :squads
    rename_table :models, :units
    rename_table :model_orders, :unit_orders
    rename_table :model_types, :unit_types
    rename_table :models_spells, :spells_units
    rename_table :models_units, :squads_units
  end
end
