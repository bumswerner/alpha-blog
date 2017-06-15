class Article < ActiveRecord::Base
  
  # associations to user
  belongs_to :user
  
  # associations to article_categories and categories
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  # database contains
  validates :title, presence: true, length: {minimum: 3, maximum: 50 }
  validates :description, presence: true, length: {minimum: 5, maximum: 500 }
  validates :user_id, presence: true
  
end