class User < ApplicationRecord
    has_many :articles
    REGEX_PATTERN = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: {minimum: 3, maximum: 25}
    validates :email, presence: true, 
                      length: {maximum: 105},
                      format: { with: REGEX_PATTERN}
    has_secure_password
end