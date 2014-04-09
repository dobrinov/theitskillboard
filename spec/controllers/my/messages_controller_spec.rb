require 'spec_helper'

describe My::MessagesController do

  fixtures :users, :messages

  let(:user) { users(:simple_user) }
  let(:message) do
    message = messages(:simple_message)
    message.receiver = user
    message.save!

    message
  end

  before { login(user) }

  describe 'GET index' do

    it "has a 200 status code" do
      get :index
      expect(response).to be_success
    end

    it "has title" do
      get :index
      expect(assigns(:title)).to be_present
    end
  end

  describe 'GET show' do

    it "has a 200 status code" do
      get :show, { id: message.id }
      expect(response).to be_success
    end

    it "has title" do
      get :show, { id: message.id }
      expect(assigns(:title)).to be_present
    end

    it "marks a message as read" do
      skip
    end

  end

  describe 'DELETE destroy' do

    it "redirects to messages index" do
      delete :destroy, { id: message.id }
      expect(response).to redirect_to(my_messages_path)
    end

    it "deletes requested message" do
      expect do
        delete :destroy, { id: message.id }
      end.to change(Message, :count).by(-1)
    end

    it "shows success message" do
      delete :destroy, { id: message.id }
      expect(flash[:notice]).to be_present
    end

  end

end
