class SessionController < ApplicationController
  before_filter :redirect_logged_in_users, :only => [:login]

  def login
    consumer = OAuth::Consumer.new \
      Twitter.consumer_key, \
      Twitter.consumer_secret, \
      :site => 'https://api.twitter.com'

    begin
      request_token = consumer.get_request_token(:oauth_callback => finish_login_url)
      session[:request_token] = request_token
      redirect_to request_token.authorize_url
    rescue
      redirect_to root_path
    end
  end

  def finish_login
    request_token = session[:request_token]
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    user = User.login(access_token.token, access_token.secret)
    sign_in(user)
    redirect_to root_path
  end

  def logout
    sign_out
    redirect_to root_path
  end

private
  def redirect_logged_in_users
    redirect_to root_path if current_user
  end
end
