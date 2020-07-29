class User < ApplicationRecord
    has_many :comments 
    has_many :trail_comments, through: :comments, source: :trails
    has_many :trails 
    has_secure_password
end
