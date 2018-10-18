class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to controller: 'users', action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
