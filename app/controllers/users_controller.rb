class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = current_user
    @user.update(user_params)
    session[:user_id] = @user.id
    redirect_to users_url
  end

  def edit
  end
  
  def update
    binding.pry
    @user = current_user
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:description, :image)
  end
end
