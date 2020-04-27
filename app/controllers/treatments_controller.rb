class TreatmentsController < ApplicationController

    def index 
        @treatment = Treatment.all.most_popular_treatment
    end 

    def show
        @treatment = Treatment.find(params[:id])
    end 

    private 

    def treatment_params
        params.require('treatment').permit(:title, :price, :duration, :description)
    end
end
