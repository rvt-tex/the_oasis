class ReviewsController < ApplicationController

    before_action :login_required
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_not_review_owner, only: [:edit, :update]


    def index 
      #binding.pry
        if params[:appointment_id] && @appointment = Appointment.find_by_id(params[:appointment_id])
            @reviews = @appointment.reviews
        else
           @error = "That review doesn't exist" if params[:appointment_id]
           @reviews = Review.all
        end
    end 

    def new 
       if params[:appointment_id] && @appointment = Appointment.find_by_id(params[:appointment_id])
         @review = @appointment.reviews.build
       else
         @error = "That appointment doesn't exist" if params[:appointment_id]
         @review = Review.new
       end	
    end 
   
   def create
        @review = current_client.reviews.build(review_params)
       if @review.save
         redirect_to reviews_path
       else
         render :new
       end
   end 

   def show 
    # @review = Review.find(params[:id])
   end 
   
   def edit
   end		

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end
   

    def destroy 
        @review = Review.find_by_id(params[:id])
        if is_logged_in? 
          @review = current_client.reviews.find_by_id(params[:id])
          if @review
            @review.destroy
            flash[:message] = "Your review was deleted."
            redirect_to reviews_path(current_client)  
          else
            flash[:message] = "Unable to delete this appointment since it doesn't belong to you."
            redirect_to "/"
          end
        else
          flash[:message] = "You need to be logged in first to access this page."
          redirect_to "/login"
        end
    end

    private

    def review_params
        params.require(:review).permit(:comment, :treatment_id, :appointment_id)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
        if !@review
            flash[:message] = "Review was not found"
            redirect_to reviews_path
        end
    end
			

    def redirect_if_not_review_owner
        redirect_to reviews_path if @review.client != current_client
    end
end
