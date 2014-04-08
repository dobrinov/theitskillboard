require 'spec_helper'

describe UsersController do

  describe "GET new" do

    it 'has a 200 status code' do
      get :new
      expect(response).to be_success
    end

  end

  describe "POST create" do

    context "when valid form data" do
      before do
        post :create, { user: {
                          email: 'new.user@example.com',
                          password: 'qweqwe',
                          password_confirmation: 'qweqwe'
                        }
                      }
      end

      it 'redirects to the profile edit page' do
        expect(response).to redirect_to(edit_my_profile_path)
      end

      it 'shows success message' do
        expect(flash[:notice]).to be_present
      end

      it 'renders Facebook conversion pixel' do
        expect(flash[:fb_register_pixel]).to be true
      end

      it 'seeds some skills' do
        skip
      end

      it 'seeds some interests' do
        skip
      end
    end

    context "when invalid form data" do
      it 'shows error message' do
        post :create, { user: {
                          email: '',
                          password: '',
                          password_confirmation: ''
                        }
                      }

        expect(response).to be_success
        expect(response).to render_template(:new)
        expect(flash[:error]).to be_present
      end
    end

  end


end