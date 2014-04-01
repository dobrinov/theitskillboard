require 'spec_helper'

describe My::SettingsController do

  before { login(simple_user) }

  describe "GET show" do
    it 'has 200 status code' do
      get :show
      expect(response).to be_success
    end
  end

  describe "PATCH update" do
    it 'redirects to show action' do
      patch :update
      expect(response).to redirect_to my_settings_path
    end
  end

end