class Comment < ApplicationRecord
    belongs_to :user 
    belongs_to :trail

    accepts_nested_attributes_for :user
end
