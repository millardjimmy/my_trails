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
        if @trail.save 
            redirect_to trail_path(@trail)
        else 
            render :new
        end 
    end 
 
    def edit 
        @trail = Trail.find(params[:id])
    end 
    def update
        trail = Trail.find(params[:id])
        trail.update(trails_params)
        redirect_to tail_path(trail)
    end 
    def show 
        @trail = Trail.find_by(id: params[:id])
    end 

    private
    def trail_params
        params.require(:trail).permit(:name, :city, :length, :skill_level, :description)
    end 

end
