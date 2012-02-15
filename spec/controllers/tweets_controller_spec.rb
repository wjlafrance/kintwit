require 'spec_helper'

describe TweetsController do
  before do
    controller.sign_in mock_user
  end

  describe "#timeline" do
    context "when logged in" do
      before { get :timeline }
      specify { (200..399).should === response.status }
      specify { assigns[:user].should be }
    end
    context "when logged out" do
      before do
        controller.sign_out
        get :timeline
      end
      specify { response.should redirect_to root_path }
    end
  end

  describe "#mentions" do
    context "when logged in" do
      before { get :mentions } 
      specify { (200..399).should === response.status }
      specify { assigns[:user].should be }
    end
    context "when logged out" do
      before do
        controller.sign_out
        get :mentions
      end
      specify { response.should redirect_to root_path }
    end
  end
  
  describe "#new" do
    context "when logged in" do
      before { get :new }
      specify { (200..399).should === response.status }
      specify { assigns[:user].should be }
    end
    context "when logged out" do
      before do
        controller.sign_out
        get :new
      end
      specify { response.should redirect_to root_path }
    end
    context "when tweet has been written" do
      before { get :new, :tweet => "testing!" }
      specify { response.should redirect_to root_path }
    end
  end

end
