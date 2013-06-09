require 'spec_helper'


class DummyController < ActionController::Base
  include AuthorizationSystem
  after_filter :validate_authorization_checked

  def authorized
    authorize! { true }
    render :nothing => true
  end

  def unauthorized
    authorize! { false }
    render :nothing => true
  end

  def not_checked
    render :nothing => true
  end
end



describe DummyController do
  before do
    Rails.application.routes.draw do
      get 'dummy/authorized'
      get 'dummy/unauthorized'
      get 'dummy/not_checked'
    end
  end

  after do
    Rails.application.reload_routes!
  end

  describe 'authorized' do
    it "should not raise an exception" do
      expect { get :authorized }.not_to raise_error
    end
  end

  describe 'unauthorized' do
    it "should raise an exception" do
      expect { get :unauthorized }.to raise_error(AuthorizationSystem::NotAuthorized)
    end
  end

  describe 'not_checked' do
    it "should raise an exception" do
      expect { get :not_checked }.to raise_error(AuthorizationSystem::AuthorizationNotChecked)
    end
  end
end
