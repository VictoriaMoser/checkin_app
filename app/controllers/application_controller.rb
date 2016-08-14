class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :user_timeout

  private

  def current_user
    User.where(id: session[:user_id]).first
  end

  def user_timeout
    if current_user == nil
      redirect_to login_path # unless request.fullpath == '/login'
    else
      if session[:expires_at].nil?
        session[:expires_at] = Time.current + 15.minutes
      elsif session[:expires_at] < Time.current
        redirect_to timeout_path
      else
        session[:expires_at] = Time.current + 15.minutes
      end
    end
  end

  helper_method :current_user
end
