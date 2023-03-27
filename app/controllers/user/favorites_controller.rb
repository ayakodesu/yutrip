class User::FavoritesController < ApplicationController
  def index
    @favorite = current_user.favorites
  end

  def destroy
  end

  def create
  end
  private
    def favorite_params
      params.require(:favorite).permit(:category_id, :spot_id, :name, :quality, :introduction, :image)
    end
end
