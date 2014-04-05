require 'spec_helper'

describe MessagesController do

  fixtures :users

  let(:message) do
    Message.new(
                sender_name:  "#{simple_user.name} #{simple_user.surname}",
                sender_email: simple_user.email,
                subject:      'Testing hi',
                body:         'Hi just testing',
                receiver_id:  simple_user_two.id
              )
  end

  context 'when authenticated' do

    before { login(simple_user) }

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: simple_user_two.id }
        expect(response).to be_success
      end
    end

    describe 'POST create' do

      context "when valid form data" do

        it "redirects to receiver profile" do
          post :create, { profile_id: simple_user_two.id,
                          message: {
                            sender_name:  message.sender_name,
                            sender_email: message.sender_email,
                            subject:      message.subject,
                            body:         message.body
                          }
                        }

          expect(response).to redirect_to(profile_path(simple_user_two.id))
        end

        it "sends a message to the receiver" do
          expect do
            post :create, { profile_id: simple_user_two.id,
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
          post :create, { profile_id: simple_user_two.id,
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
          post :create, { profile_id: simple_user_two.id,
                          message: {
                            receiver_id: simple_user_two.id
                          }
                        }

          expect(response).to be_success
          expect(response).to render_template(:new)
        end

        it "doesn't create a message" do
          expect do
            post :create, { profile_id: simple_user_two.id,
                            message: {
                              receiver_id: simple_user_two.id
                            }
                          }
          end.to change(Message, :count).by(0)

        end

        it "shows an error message" do
          post :create, { profile_id: simple_user_two.id,
                          message: {
                            receiver_id: simple_user_two.id
                          }
                        }

          expect(flash[:error]).to be_present
        end

      end

    end

  end

  context 'when NOT authenticated' do

    describe 'GET new' do

      it "has a 200 status code" do
        get :new, { profile_id: simple_user_two.id }
        expect(response).to be_success
      end
    end

    describe 'POST create' do

      it "redirects to receiver profile" do
        post :create, { profile_id: simple_user_two.id,
                        message: {
                          sender_name:  message.sender_name,
                          sender_email: message.sender_email,
                          subject:      message.subject,
                          body:         message.body
                        }
                      }

        expect(response).to redirect_to(profile_path(simple_user_two.id))
      end

      it "sends a message to the receiver" do
        expect do
          post :create, { profile_id: simple_user_two.id,
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