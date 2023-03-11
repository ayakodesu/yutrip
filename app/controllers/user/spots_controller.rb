class User::SpotsController < ApplicationController
  def new
  end

  def index
    @spots = Spot.all
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def update
  end

  def spot_params
    params.require(:spot).permit(:name, :category_id, :quality, :introduction)
  end
end
