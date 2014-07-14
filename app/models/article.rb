class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :source, presence: true
  validates :feed, presence: true
  validates :link, presence: true
end
