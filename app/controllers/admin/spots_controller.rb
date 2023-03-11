class Admin::SpotsController < ApplicationController
  def new
    @spot = Spot.new  # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
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

  def create
     # １.&2. データを受け取り新規登録するためのインスタンス作成
    @spot = Spot.new(spot_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @spot.save
    # 4. トップ画面へリダイレクト
    redirect_to admin_homes_top_path
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :category_id, :quality, :introduction)
  end
end
