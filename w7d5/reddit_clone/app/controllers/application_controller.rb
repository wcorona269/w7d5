class ApplicationController < ActionController::Base

    def current_user
        @current_user ||= User.find_by(session: session[:session_token])
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout
        self.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end
end