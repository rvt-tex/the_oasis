class ApplicationController < ActionController::Base

    protect_from_forgery

    helper_method :current_client, :is_logged_in?, :redirect_if_not_logged_in, :login_required, :session_already_set
    
    def current_client
       @current_client ||= Client.find_by_id(session[:client_id]) if session[:client_id]
    end

    def session_already_set
        redirect_to appointments_path if is_logged_in?
    end

    def is_logged_in?
        !!session[:client_id]
    end

    def login_required
        unless is_logged_in?
            flash[:error] = "You must be logged inorder to make an appointment"
            redirect_to login_path
        end
    end
   
    def redirect_if_not_logged_in
        redirect_to '/' if !is_logged_in? 
    end 
end
