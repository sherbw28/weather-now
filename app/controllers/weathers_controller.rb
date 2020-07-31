class WeathersController < ApplicationController
  def index
    @weathers = Weather.all
  end

  def show
    @weather = Weather.find(params[:id])
  end

  def new
    @weather = Weather.new
  end

  def create
    @weather = Weather.new(weather_params)
    
    if @weather.save
      flash[:success] = "投稿を完了しました"
      redirect_to @weather
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @weather = Weather.find(params[:id])
  end

  def update
    @weather = Weather.find(params[:id])
    
    if @weather.update(weather_params)
      flash[:success] = "編集しました"
      redirect_to @weather
    else
      flash[:danger] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @weather = Weather.find(params[:id])
    @weather.destroy
    
    flash[:success] = "天気を削除しました"
    redirect_to root_path
  end
  
  private
  
  def weather_params
    params.require(:weather).permit(:content)
  end
end
