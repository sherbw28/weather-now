class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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
  
end
