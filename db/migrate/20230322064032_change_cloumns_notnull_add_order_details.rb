class ChangeCloumnsNotnullAddOrderDetails < ActiveRecord::Migration[6.1]
  def change
    change_column :order_details, :item_id, :integer, null: false
    change_column :order_details, :order_id, :integer, null: false
    change_column :order_details, :making_status, :integer, null: false
    change_column :order_details, :amount, :integer, null: false
    change_column :order_details, :price, :integer, null: false
  end
end
