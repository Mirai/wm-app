class AddSourceToModelOrders < ActiveRecord::Migration
  def self.up
    add_column :model_orders, :source, :string
  end

  def self.down
    remove_column :model_orders, :source
  end
end
