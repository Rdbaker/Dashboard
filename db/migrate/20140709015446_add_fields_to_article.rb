class AddFieldsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :source, :string
    add_column :articles, :feed, :string
    add_column :articles, :content, :string
  end
end
