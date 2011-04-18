class AddFeatToWarcaster < ActiveRecord::Migration
  def self.up
    add_column :warcasters, :feat_name, :string
    add_column :warcasters, :feat_desc, :text
  end

  def self.down
    remove_column :warcasters, :feat_name
    remove_column :warcasters, :feat_desc
  end
end
