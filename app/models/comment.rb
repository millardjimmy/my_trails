class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :trail
    validates :reply, presence: true
    accepts_nested_attributes_for :trail, :user
end
