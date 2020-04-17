class ClientsController < ApplicationController

    before_action :is_logged_in?
    before_action :session_already_set, only: %i[new create]

    def index
    end
 
    def new 
        @client = Client.new
    end 
 
    def create 
        @client = Client.new(client_params)
        if @client.save 
            session[:client_id] = @client.id
        binding.pry
            redirect_to @client
        else 
            flash[:message] = "Invalid registration info, please try again"
            render :new 
        end 
    end

    def show 
        @client = Client.find_by_id(params[:id])
        if current_client != @client
            redirect_to '/'
        end 
    end 

    private

    def client_params
        params.require('client').permit(:first_name, :last_name, :password, :phone, :email)
    end
end
