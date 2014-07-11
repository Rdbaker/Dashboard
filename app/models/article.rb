class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :source, presence: true
  validates :feed, presence: true
end
