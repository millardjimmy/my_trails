module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!session[:user_id]
    end
    def redirect_if_not_logged_in
        flash[:error] = "Please Sign in."
        redirect_to root_path if !logged_in?
    end 


    def authorized?
        @trail.user == current_user
    end

    def redirect_if_not_authorized
        flash[:error] = "You can only edit your own trail."
        redirect_to trails_path if !authorized?
    end

end
