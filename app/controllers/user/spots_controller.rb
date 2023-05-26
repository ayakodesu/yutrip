class User::SpotsController < ApplicationController
  def new
    @spot = Spot.new
  end

  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    @spot = Spot.new(spot_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @spot.save
    # 4. spotsのindexページへリダイレクト
    redirect_to user_spots_path
  end

  def index
    #@spots = Spot.page(params[:page]).per(5)
    if params[:search].present?
      @spots = Spot.search(params[:search]).order('id DESC').page(params[:page]).per(10)
    elsif params[:category_id].present?
      @spots = Spot.where(category_id: params[:category_id]).page(params[:page]).per(10)
    else
      @spots = Spot.all.order('id DESC').page(params[:page]).per(10)
    end
  end

  def edit
  end

  def destroy
  end

  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
    @reviews = @spot.reviews
  end

  def update
  end

  def spot_params
    params.require(:spot).permit(:name, :category_id, :quality, :introduction, :is_active, :image, :review)
  end
end
