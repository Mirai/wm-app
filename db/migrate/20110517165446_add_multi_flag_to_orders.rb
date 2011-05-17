class AddMultiFlagToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :multi, :boolean
  end

  def self.down
    remove_column :orders, :multi
  end
end
