require "spec_helper"

describe ProfilesController do

  before do
    allow(User).to receive(:demo_sample).and_return(simple_user)
  end

  describe "GET show" do

    context "when regular domain" do
      it "renders a user by id" do
        get :show, { id: simple_user.id }
        expect(response).to be_success
      end

      it "renders a demo user" do
        get :show, { id: 'demo' }
        expect(response).to be_success
      end
    end

    context "when custom domain" do
      let(:custom_host){ "custom.host" }

      before do 
        request.host = custom_host
        simple_user.update_attributes(domain: custom_host)
      end

      it "should be 200" do
        get :show
        expect(response).to be_success
      end

      it "redirects to regular domain url" do
        get :show, { id: simple_user.id }
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/profiles/#{simple_user.id}")
      end

      it "redirects to regular domain url" do
        get :show, { id: 'demo' }
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/profiles/demo")
      end

    end

  end

end