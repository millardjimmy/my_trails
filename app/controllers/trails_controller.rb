class TrailsController < ApplicationController
    before_action :redirect_if_not_signed_in
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
    
end
