class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @weathers = @user.weathers.order(id: :desc).page(params[:page])
    counts(@user)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    
    if @user.update(user_params_update)
      flash[:success] = "情報が更新されました"
      redirect_to @user
    else
      flash[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "アカウントが作成されました"
      redirect_to @user
    else
      flash[:danger] = "アカウント作成に失敗しました"
      render "users/new"
    end
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_params_update
    params.require(:user).permit(:name, :email, :image, :remove_image)
  end
  
end
