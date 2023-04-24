class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.save
    redirect_to spot_path(@review.spot_id)
    #@spot = Spot.find(params[:spot_id])
    #comment = current_user.spots.new(review_params)
    #comment.spot_id = spot.id
    #comment.save
    #redirect_to user_spots_path(spot)
  end

  def index
  end

  def show
  end

  def edit
  end

   private

  def review_params
    params.require(:review).permit(:comment, :spot_id, :user_id)
  end
end
