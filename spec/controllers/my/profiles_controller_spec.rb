require 'spec_helper'

describe My::ProfilesController do

  fixtures :users

  before { login(simple_user) }

  describe "GET show" do

    it "has a 200 status code" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "has a 200 status code" do
      get :show
      expect(response).to be_success
    end
  end

  describe "PATCH update" do
    it "has a 200 status code" do
      patch :update, { user: { name: 'New', surname: 'Name' } }
      expect(simple_user.name).to eq("New")
      expect(simple_user.surname).to eq("Name")
      expect(response).to be_success
    end
  end

  describe "DELETE destroy" do
    it "deletes current user profile" do
      delete :destroy
      expect { User.find(simple_user.id) }.to raise_exception(ActiveRecord::RecordNotFound)
      expect(session[:current_user_id]).to be_nil
      expect(response).to redirect_to bye_path
    end
  end

end
