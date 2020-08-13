class WeathersController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_weather, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @weathers = Weather.order(id: :desc).page(params[:page]).per(3)
  end

  def show
  end

  def new
    @weather = current_user.weathers.build
  end

  def create
    @weather = current_user.weathers.build(weather_params)
    
    if @weather.save
      flash[:success] = "投稿を完了しました"
      redirect_to @weather
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    
    if @weather.update(weather_params)
      flash[:success] = "編集しました"
      redirect_to @weather
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @weather.destroy
    
    flash[:success] = "天気を削除しました"
    redirect_to root_path
  end
  
  private
  
  def set_weather
    @weather = current_user.weathers.find_by(id: params[:id])
  end
  
  def weather_params
    params.require(:weather).permit(:content, :location)
  end
  
  def correct_user
    @weather = current_user.weathers.find_by(id: params[:id])
    unless @weather
      flash[:danger] = "あなたの投稿のみ編集できます"
      redirect_back(fallback_location: root_path)
    end
  end
end
