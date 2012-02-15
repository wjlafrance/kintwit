class ApplicationController < ActionController::Base
  protect_from_forgery

  def sign_in(user)
    @current_user = user
    session[:user_id] = @current_user.id
  end

  def sign_out
    @current_user = nil
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authenticate
    # FIXME This is kind of ugly
    redirect_to root_path if @_response && !current_user
    @user = current_user
  end

end
