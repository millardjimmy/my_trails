class Trail < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    belongs_to :user
    accepts_nested_attributes_for :comments, :user

    validates :name, presence: true, uniqueness: true
    validates :city, presence: true
    validates :skill_level, presence: true
    validates :description, presence: true, uniqueness: true

    #scope :search, -> {where(name: params[:search])}


    def self.most_pop
        #self.joins(:comments).group(:trail_id).order("count("trail_id") DESC")
        self.all.sort_by{|t|t.comments.count}.reverse[0]
    end 
    def self.search(params)
        self.where("name LIKE ?", "%#{params[:search]}%")
    end 


end
