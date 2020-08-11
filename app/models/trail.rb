class Trail < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    belongs_to :user
    accepts_nested_attributes_for :comments, :user

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :length, presence: true
    validates :skill_level, presence: true
    validates :description, presence: true, uniqueness: true

    #scope :search, -> {where(name: params[:search])}


    def self.search(params)
        self.where("name LIKE ?", "%#{params[:search]}%")
    end 


end
