module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to '/login' if !logged_in?
        flash[:alert] = "Oops! You must sign in first!"
    end 
end
