class ChangeCloumnsNotnullAddCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column :cart_items, :item_id, :integer, null: false
    change_column :cart_items, :customer_id, :integer, null: false
    change_column :cart_items, :amount, :integer, null: false
  end
end
