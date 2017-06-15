class Category < ActiveRecord::Base
  
  # association to article_categories and articles
  has_many :article_categories
  has_many :articles, through: :article_categories
  
  # database constains
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
  
end