class ReviewsController < ApplicationController

  before_action :login_required

  def index 
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

  private

  def review_params
    params.require(:review).permit(:comment, :treatment_id, :appointment_id)
  end
end
