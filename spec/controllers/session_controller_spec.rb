require 'spec_helper'

describe SessionController do

  describe "#login" do
    context "when logged in" do
      before do
        controller.sign_in mock_user
        get :login
      end
      specify { response.should redirect_to root_path }
    end
    context "when logged out" do
      before do
        controller.sign_out
        get :login
      end
      specify { response.should redirect_to root_path }
    end
  end

  describe "#finish_login" do
  end

end
