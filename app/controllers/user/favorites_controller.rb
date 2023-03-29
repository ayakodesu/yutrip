class User::FavoritesController < ApplicationController


  def index
    @favorite = current_user.favorites

  end

  def destroy

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
