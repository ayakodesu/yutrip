class User::FavoritesController < ApplicationController


  def index
    @favorites = current_user.favorites
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @favorite = current_user.favorites.find_by(spot_id: @spot.id)
    @favorite.destroy
    redirect_to user_spots_path
  end

  def create
    @favorite = current_user.favorites.create(spot_id: params[:spot_id])
  end

  private
    def favorite_params
      params.require(:favorite).permit(:category_id, :spot_id, :name, :quality, :introduction, :image)
    end
end
