class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(:email => params[:email]) and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Log in successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Singout successfully"
    redirect_to root_path
  end
  
  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      # log in user here
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now[:error] = "Invalid User"
    end
  end
  
end
