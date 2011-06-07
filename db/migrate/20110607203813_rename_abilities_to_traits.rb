class RenameAbilitiesToTraits < ActiveRecord::Migration
  def self.up
    rename_table :abilities, :traits
    rename_table :abilities_weapons, :traits_weapons

    rename_column :traits_weapons, :ability_id, :trait_id
  end

  def self.down
    rename_column :traits_weapons, :trait_id, :ability_id

    rename_table :traits, :abilities
    rename_table :traits_weapons, :abilities_weapons
  end
end
