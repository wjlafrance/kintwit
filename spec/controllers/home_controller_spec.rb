require 'spec_helper'

describe HomeController do

  describe "#index" do
    context "when signed out" do
      before do
        controller.sign_out
        get :index
      end
      specify { response.should redirect_to login_path }
    end
    context "when signed in" do
      before do
        controller.sign_in mock_user
        get :index
      end
      specify { response.should redirect_to timeline_path }
    end
  end

end
