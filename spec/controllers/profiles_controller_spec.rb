require "spec_helper"

describe ProfilesController do

  fixtures :users

  before do
    allow(User).to receive(:demo_sample).and_return(simple_user)
  end

  describe "GET show" do

    context "when regular domain" do
      context "when user by id" do
        it "has a 200 status code" do
          get :show, { id: simple_user.id }
          expect(response).to be_success
        end
      end

      context "when demo user" do
        it "has a 200 status code" do
          get :show, { id: 'demo' }
          expect(response).to be_success
        end
      end
    end

    context "when custom domain" do
      let(:custom_host){ "custom.host" }

      before do 
        request.host = custom_host
        simple_user.update_attributes(domain: custom_host)
      end

      it "has a 200 status code" do
        get :show
        expect(response).to be_success
      end

      context "when user by id" do
        it "redirects to regular domain url" do
          get :show, { id: simple_user.id }
          expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/profiles/#{simple_user.id}")
        end
      end

      context "when demo user" do
        it "redirects to regular domain url" do
          get :show, { id: 'demo' }
          expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/profiles/demo")
        end
      end

    end

  end

end