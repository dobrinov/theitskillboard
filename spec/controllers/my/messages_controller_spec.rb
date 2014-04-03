require 'spec_helper'

describe My::MessagesController do

  fixtures :users

  before { login(simple_user) }

  describe 'GET index' do

    it "has a 200 status code" do
      get :index
      expect(response).to be_success
    end
  end

  describe 'DELETE destroy' do

    it "redirects to messages index" do
      delete :destroy, { id: 'dummy' }
      expect(response).to redirect_to(my_messages_path)
    end

    it "deletes requested message" do
      delete :destroy, { id: 'dummy' }
      expect(response).to redirect_to(my_messages_path)
    end

  end

end
