class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully sign up"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:full_name, :password, :email)
    end
end
