class ChangeCloumnsNotnullAddOder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :customer_id, :integer, null: false
    change_column :orders, :status, :integer, null: false
    change_column :orders, :payment_method, :integer, null: false
    change_column :orders, :shipping_cost, :integer, null: false
    change_column :orders, :total_payment, :integer, null: false
    change_column :orders, :name, :string, null: false
    change_column :orders, :address, :string, null: false
    change_column :orders, :postal_code, :string, null: false
    
  end
end
