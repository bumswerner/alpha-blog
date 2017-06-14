class User < ActiveRecord::Base
  
  # delete all articles if the user has been deleted
  has_many :articles, dependent: :destroy
  
  # action before a article has been saved
  before_save { self.email = email.downcase }
  
  validates :username, presence: true, 
            uniqueness: { case_senstive: false },
            length: { minimum: 3, maximum: 25 }
            
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_senstive: false },
            format: { with: VALID_EMAIL_REGEX }
            
  has_secure_password
  
end