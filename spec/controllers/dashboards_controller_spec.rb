require 'spec_helper'

describe DashboardsController do
  describe "logged in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      session[:user_id] = @user.id
    end

    describe "GET 'root'" do
      it "returns http success" do
        get 'root'
        response.should be_success
      end
    end
  end

  describe "logged out" do
    describe "GET 'root'" do
      it "returns http redirect" do
        get 'root'
        response.should redirect_to(login_path)
      end
    end
  end
end
