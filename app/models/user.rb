class User < ActiveRecord::Base
  validates_uniqueness_of :token, :secret

  def self.login(token, secret)
    User.find_or_create_by_token_and_secret(token, secret)
  end

  def api_client
    Twitter::Client.new :oauth_token => token, :oauth_token_secret => secret
  end

  def username
    api_client.verify_credentials.screen_name
  end
end
