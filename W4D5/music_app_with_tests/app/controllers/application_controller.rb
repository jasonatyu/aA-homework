class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?
    before_action :require_login 

    def current_user 
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def logged_in?
        !!(current_user)
    end

    def log_in_user!(user)
        user.session_token = SecureRandom::urlsafe_base64
        session[:session_token] = user.session_token 
        user.save! 
        redirect_to user_url(user)
    end 

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to accesçs this section"
            redirect_to new_session_url
        end
    end

end
