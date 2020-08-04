class SessionsController < ApplicationController
    def new 
    end 

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to trails_path
        else 
            flash[:alert] = "invalid username or password. please try again."
            redirect_to '/login'
        end 

    end 
    def omniauth  #log users in with omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to trails_path
        else
            flash[:alert] = user.errors.full_messages.join(", ")
            redirect_to root_path, alert: "Invalid username or password. Please try again."
        end
    end


    def destroy
        session.clear
        redirect_to root_path
    end
    private
    def auth
        request.env['omniauth.auth']
    end
end 