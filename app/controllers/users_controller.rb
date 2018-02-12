class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_paramas)
    if @user.save
      # 保存成功の場合
    else
      render 'new'
    end
  end

  private
    def user_paramas
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
