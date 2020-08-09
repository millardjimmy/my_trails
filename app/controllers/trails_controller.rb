class TrailsController < ApplicationController
    before_action :redirect_if_not_logged_in
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
        @trail = Trail.find(params[:id])

    end 
    def update
        trail = Trail.find(params[:id])
        trail.update(trail_params)
        redirect_to trail_path(trail)
    end
    def most_popular
        @trail = Trail.most_pop
    end  
    def show 
        @trail = Trail.find_by(id: params[:id])
    end 

    
    def destroy
        trail = Trail.find(params[:id])
        trail.destroy
        redirect_to trails_path
    end 

    #SCOPE METHOD 

    

    private
    def trail_params
        params.require(:trail).permit(:name, :city, :length, :skill_level, :description)
    end 

end
