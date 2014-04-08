require 'spec_helper'

describe MessagesController do

  fixtures :users

  let(:user)       { users(:simple_user)}
  let(:other_user) { users(:other_simple_user)}

  let(:message) do
    Message.new(
                sender_name:  "#{user.name} #{user.surname}",
                sender_email: user.email,
                subject:      'Testing hi',
                body:         'Hi just testing',
                receiver_id:  other_user.id
              )
  end

  context 'when authenticated' do

    before { login(user) }

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: other_user.id }
        expect(response).to be_success
      end

      context "when sending message to yourself" do
        it "redirects to profile preview" do
          get :new, { profile_id: user.id }
          expect(response).to redirect_to(my_profile_path)
        end

        it "shows an alert message" do
          get :new, { profile_id: user.id }
          expect(flash[:alert]).to be_present
        end
      end
    end

    describe 'POST create' do

      context "when valid form data" do

        it "redirects to receiver profile" do
          post :create, { profile_id: other_user.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }

          expect(response).to redirect_to(profile_path(other_user.id))
        end

        it "sends a message to the receiver" do
          expect do
            post :create, { profile_id: other_user.id,
                            message: {
                              sender_name:  message.sender_name,
                              sender_email: message.sender_email,
                              subject:      message.subject,
                              body:         message.body
                            }
                          }
          end.to change(Message, :count).by(1)
        end

        it "shows a success message" do
          post :create, { profile_id: other_user.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }

          expect(flash[:notice]).to be_present
        end

      end

      context "when invalid form data" do

        it "renders new message form" do
          post :create, { profile_id: other_user.id,
                          message: {
                            receiver_id: other_user.id
                          }
                        }

          expect(response).to be_success
          expect(response).to render_template(:new)
        end

        it "doesn't create a message" do
          expect do
            post :create, { profile_id: other_user.id,
                            message: {
                              receiver_id: other_user.id
                            }
                          }
          end.to change(Message, :count).by(0)

        end

        it "shows an error message" do
          post :create, { profile_id: other_user.id,
                          message: {
                            receiver_id: other_user.id
                          }
                        }

          expect(flash[:error]).to be_present
        end

      end

      context "when sending message to yourself" do
        it "redirects to profile preview" do
          post :create, { profile_id: user.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }

          expect(response).to redirect_to(my_profile_path)
        end

        it "shows an alert message" do
          post :create, { profile_id: user.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }

          expect(flash[:alert]).to be_present
        end
      end

    end

  end

  context 'when NOT authenticated' do

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: other_user.id }
        expect(response).to be_success
      end
    end

    describe 'POST create' do

      it "redirects to receiver profile" do
        post :create, { profile_id: other_user.id,
                        message: {
                          sender_name:  message.sender_name,
                          sender_email: message.sender_email,
                          subject:      message.subject,
                          body:         message.body
                        }
                      }

        expect(response).to redirect_to(profile_path(other_user.id))
      end

      it "sends a message to the receiver" do
        expect do
          post :create, { profile_id: other_user.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }
        end.to change(Message, :count).by(1)
      end
    end
  end
end