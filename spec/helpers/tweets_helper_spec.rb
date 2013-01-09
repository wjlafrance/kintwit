require 'spec_helper'

describe TweetsHelper do

  describe "#profile_image_for" do
    before do
      require 'ostruct'
      @user = OpenStruct.new :profile_image_url => "https://www.google.com/intl/en_com/images/srpr/logo3w.png" 
      @tweet = OpenStruct.new  :user => @user
    end

    subject { profile_image_for(@tweet) }
    it { should include 'height="100"' }
    it { should include 'width="100"' }
    it { should include 'alt="Profile image"' }
    it { should include "src=\"#{@tweet.user.profile_image_url}\"" }
    it { should match /^<img .+ \/>$/ }
  end

  describe "#navigation_bar" do
    context "when logged in" do
      before { @user = Object.new }
      context "for timeline" do
        before(:each) { params["action"] = "timeline" }
        subject { navigation_bar }
        it { should match(/<span class="current_page">Timeline<\/span>/) }
        it { should match(/Mentions/) }
        it { should match(/New Tweet/) }
        it { should match(/Log Out/) }
      end
      context "for mentions" do
        before { params["action"] = "mentions" }
        subject { navigation_bar }
        it { should match(/<span class="current_page">Mentions<\/span>/) }
        it { should match(/Timeline/) }
        it { should match(/New Tweet/) }
        it { should match(/Log Out/) }
      end
      context "for new tweet" do
        before { params["action"] = "new" }
        subject { navigation_bar }
        it { should match(/<span class="current_page">New Tweet<\/span>/) }
        it { should match(/Timeline/) }
        it { should match(/Mentions/) }
        it { should match(/Log Out/) }
      end
      context "for an unknown action" do
        before { params["action"] = "completely bogus action" }
        specify { navigation_bar.should == "Error: Unknown action" }
      end
    end
    context "when logged out" do
      before { session.delete(:user_id) }
      subject { navigation_bar }
      it { should match(/<span class="pages">/) }
      it { should match(/Log In/) }
    end
  end

end
