class ChangeTitleToTextField < ActiveRecord::Migration
  def change
    remove_column :articles, :title, :string
    add_column :articles, :title, :text
  end
end
