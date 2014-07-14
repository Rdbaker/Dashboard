class AddLinkDatePostedAndChangeContentType < ActiveRecord::Migration
  def change
    add_column :articles, :link, :string
    add_column :articles, :date_posted, :string
    remove_column :articles, :content, :string
    add_column :articles, :content, :text
  end
end
