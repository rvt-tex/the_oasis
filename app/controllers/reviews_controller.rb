class ReviewsController < ApplicationController

  before_action :login_required, except: [:index]

  def index   
    @reviews = Review.all
  end 

  def new 
    @review = Review.new
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
