require 'spec_helper'

describe SessionsController do

  fixtures :users

  describe "GET new" do

    context "when authenticated" do
      before { login(simple_user) }

      it "redirects to my_root_path" do
        get :new
        expect(response).to redirect_to my_root_path
      end
    end

    context "when NOT authenticated" do
      it "has a 200 status code" do
        get :new
        expect(response).to be_success
      end

      it "has a title" do
        get :new
        expect(assigns(:title)).to be_present
      end
    end

  end

  describe "POST create" do

    context "when authenticated" do
      before { login(simple_user) }

      it "redirects to my_root_path" do
        post :create
        expect(response).to redirect_to my_root_path
      end
    end

    context "when NOT authenticated" do
      context "when corect credentials" do
        it "creates a session" do
          post :create, { email: simple_user.email, password: 'qweqwe' }
          expect(session[:current_user_id]).to eql(simple_user.id)
        end

        it "redirects to my_root_path" do
          post :create, { email: simple_user.email, password: 'qweqwe' }
          expect(response).to redirect_to my_root_path
        end
      end

      context "when wrong credentials" do
        it "has a 200 status code" do
          post :create, { email: 'wrong', password: 'wrong' }
          expect(response).to render_template(:new)
          expect(response).to be_success
        end

        it "renders validation errors" do
          post :create, { email: 'wrong', password: 'wrong' }
          expect(flash[:error]).to be_present
        end

        it "has a title" do
          post :create, { email: 'wrong', password: 'wrong' }
          expect(assigns(:title)).to be_present
        end
      end
    end

  end

  describe "DELETE destroy" do
    context "when authenticated" do
      before { login(simple_user) }

      it "destroys the session" do
        delete :destroy
        expect(session[:current_user_id]).to be_nil
      end

      it "redirects to the login page" do
        delete :destroy
        expect(response).to redirect_to new_session_path
      end
    end

    context "when NOT authenticated" do
      it "redirects to the login page" do
        delete :destroy
        expect(response).to redirect_to new_session_path(referrer: session_path)
      end
    end
  end

end