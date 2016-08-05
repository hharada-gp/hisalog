class Article < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
end