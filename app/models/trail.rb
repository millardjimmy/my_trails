class Trail < ApplicationRecord
    has_many :comments 
    has_many :users, through: :comments 
    belongs_to :user
    accepts_nested_attributes_for :comments, :user
end
