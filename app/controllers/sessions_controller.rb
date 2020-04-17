class SessionsController < ApplicationController

    def home
    end 

    def new 
    end 

    def create 
        @client = Client.find_by(email:params[:client][:email])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            #binding.pry
            redirect_to  @client
        else 
            flash[:message] = "Incorrect login info, please try again"
            redirect_to "/login"
        end 
    end 
end
