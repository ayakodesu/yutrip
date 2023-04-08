class User::FavoritesController < ApplicationController


  def index
    @favorite = current_user.favorites
    @favorites = current_user.favorites.page(params[:page]).per(5)
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    @favorite = current_user.favorites.find_by(spot_id: @spot.id)
    @favorite.destroy
    redirect_back(fallback_location: user_spots_path)
  end

  def create
    @favorite = current_user.favorites.create(spot_id: params[:spot_id])
     redirect_back(fallback_location: user_spots_path)
  end

  private
    def favorite_params
      params.require(:favorite).permit(:category_id, :spot_id, :name, :quality, :introduction, :image)
    end
end
