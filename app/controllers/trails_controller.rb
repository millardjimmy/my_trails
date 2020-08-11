class TrailsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_trail, only: [:edit, :update, :destroy, :show]
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]
    def index
        if params[:search] == nil || params[:search] == ''
            @trails = Trail.all
        else 
            @trails = Trail.search(params)
        end 
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

    end 
    def update
        @trail.update(trail_params)
        redirect_to trail_path(@trail)
    end
 
    def show 
    end 

    
    def destroy
        trail.destroy
        redirect_to trails_path
    end

    

    private
    def trail_params
        params.require(:trail).permit(:name, :city, :length, :skill_level, :description)
    end 
    def set_trail
        @trail = Trail.find(params[:id])
    end 

end
