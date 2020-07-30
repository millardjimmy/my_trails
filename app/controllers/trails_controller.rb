class TrailsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        @trails = Trail.all
    end 
    def new 
        @trail = Trail.new
    end 
    def create 
        @trail = current_user.trails.build(trail_params)
        redirect_to trail_path(@trail)
    end 
    def show 
        @trail = Trail.find(params[:id])
    end 

    private
    def trail_params
        params.require(:trail).permit(:name, :city, :length, :skill_level, :description)
    end 

end
