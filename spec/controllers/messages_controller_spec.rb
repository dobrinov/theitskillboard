require 'spec_helper'

describe MessagesController do

  fixtures :users

  context 'when authenticated' do

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: simple_user.id }
        expect(response).to be_success
      end
    end

    describe 'POST create' do

      it "redirects to receiver profile" do
        post :create, { profile_id: simple_user.id,
                        message: {
                          receiver_id: simple_user.id
                        }
                      }
        expect(response).to redirect_to(profile_path(simple_user.id))
      end

      it "sends a message to the receiver" do
        skip
      end

    end

  end

  context 'when NOT authenticated' do

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: simple_user.id }
        expect(response).to be_success
      end
    end

    describe 'POST create' do

      it "redirects to receiver profile" do
        post :create, { profile_id: simple_user.id,
                        message: {
                          receiver_id: simple_user.id
                        }
                      }
        expect(response).to redirect_to(profile_path(simple_user.id))
      end

      it "sends a message to the receiver" do
        skip
      end

    end

  end

end
