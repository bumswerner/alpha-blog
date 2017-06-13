class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # make current_user and logged_in? to helper methods
  # through that this methods are available in all views.
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
    flash[:danger] = "You must be logged in to perform that action (freak)"
    redirect_to root_path
    end
  end
  
end
