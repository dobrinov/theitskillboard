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
      let(:domain) { 'custom.host' }

      before do 
        @request.host = domain
        simple_user.update_attributes(domain: domain)
      end

      it "should be 200" do
        get :show
        expect(response).to be_success
      end

      it "redirects to the regular domain" do
        get :show, { id: simple_user.id }
        expect(response).to redirect_to("http://test.host/profiles/#{simple_user.id}")
      end

      it "redirects to the regular domain" do
        get :show, { id: 'demo' }
        expect(response).to redirect_to("http://test.host/profiles/demo")
      end

    end

  end

end