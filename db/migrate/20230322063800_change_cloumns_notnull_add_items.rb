class ChangeCloumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :genre_id, :integer, null: false
    change_column :items, :is_active, :boolean, null: false
    change_column :items, :name, :string, null: false
    change_column :items, :introduction, :text, null: false
    change_column :items, :price, :integer, null: false
  end
end
