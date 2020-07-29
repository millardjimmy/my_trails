class User < ApplicationRecord
    has_many :comments 
    has_many :trail_comments, through: :comments, source: :trails
    has_many :trails 
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
