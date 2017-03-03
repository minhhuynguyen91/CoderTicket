class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def log_in?
    !current_user.nil?
  end
  
  def require_login
    unless log_in?
      flash[:error] = "You must sign in"
      redirect_to new_session_path
    end
  end

  def check_user_permission
    @event = Event.find_by_id(params[:id])
    unless current_user.id == @event.user_id
      flash[:error] = "You don't have permissions to conduct this action"
      redirect_to root_path
    end
  end
  
end
