class TreatmentsController < ApplicationController

    def index 
        @treatment = Treatment.all
    end 

    def new 
        @treatment = Treatment.new  
    end 

    def create
        @treatment = Treatment.new(treatment_params)
        if @treatment.save 
            redirect_to @treatment
        else 
            render :new 
        end 
    end 

    def show
        @treatment = Treatment.find(params[:id])
    end 

   
    private 

    def treatment_params
        params.require('treatment').permit(:title, :price, :duration, :description)
    end
end
