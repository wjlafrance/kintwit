require 'spec_helper'

describe User do
  before(:all) do
    @user = Factory(:user)
  end
  before do
    @user.reload
  end

  describe "#login" do
    before do
      User.where(:token => "token", :secret => "secret").destroy_all
      @prior_user_count = User.count
    end
    context "when a token/secret pair has not been seen before" do
      before { User.login("token", "secret") }
      specify { User.count.should == @prior_user_count + 1 }
    end
    context "when a token/secret pair has been seen before" do
      before { 2.times { User.login("token", "other_secret") } }
      specify { User.count.should == @prior_user_count + 1 }
    end
  end

  describe "#api_client" do
    specify { @user.api_client.should be_a(Twitter::Client) }
    context "key configuration" do
      subject { @user.api_client }
      specify { subject.consumer_key.should       == ENV['CONSUMER_KEY'] }
      specify { subject.consumer_secret.should    == ENV['CONSUMER_SECRET'] }
      specify { subject.oauth_token.should        == @user.token }
      specify { subject.oauth_token_secret.should == @user.secret }
    end
  end

  describe "#username" do
    before do
      mock_api = Hashie::Mash.new
      mock_api.verify_credentials!.screen_name = 'test_user'
      @user.should_receive(:api_client).and_return(mock_api)
    end
    specify { @user.username.should == 'test_user' }
  end

end