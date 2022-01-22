class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました。ようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  #ストロングパラメーターズ
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end