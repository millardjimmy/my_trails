class TrailsController < ApplicationController
    def index
        redirect_if_not_logged_in 
        @trails = Trail.all
    end 
end
