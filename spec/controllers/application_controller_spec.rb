require 'spec_helper'

describe ApplicationController do

  context "user storage" do
    before { @user = mock_user }
    context "in the session" do
      context "will store properly" do
        before do
          controller.sign_out
          controller.sign_in @user
        end
        specify { session[:user_id].should == @user.id }
      end
      context "will clear properly" do
        before do
          controller.sign_in @user
          controller.sign_out
        end
        specify { session[:user_id].should_not be }
      end
    end
    context "in an instance variable" do
      context "will store properly" do
        before do
          controller.sign_out
          controller.sign_in @user
        end
        specify { controller.current_user.should == @user }
      end
      context "will clear properly" do
        before do
          controller.sign_in @user
          controller.sign_out
        end
        specify { controller.current_user.should_not be }
      end
    end
  end

  context "#authenticate" do
    context "when logged in" do
      before { controller.sign_in mock_user }
      specify { controller.authenticate.should be }
    end
    context "when logged out" do
      before { controller.sign_out }
      specify { controller.authenticate.should_not be }
    end
  end

end
