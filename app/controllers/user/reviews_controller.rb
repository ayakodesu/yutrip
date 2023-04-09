class User::ReviewsController < ApplicationController
  def new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    comment = current_user.spots.new(review_params)
    comment.spot_id = spot.id
    comment.save
    redirect_to user_spots_path(spot)
  end

  def index
  end

  def show
  end

  def edit
  end

   private

  def review_params
    params.require(:review).permit(:comment)
  end
end
