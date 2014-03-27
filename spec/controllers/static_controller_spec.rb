require "spec_helper"

describe StaticController do

  let(:custom_host){ "custom.host" }

  describe "GET landingpage" do

    context "when regular domain" do
      it 'has a 200 status code' do
        get :landingpage
        expect(response).to be_success
      end
    end

    context "when custom domain" do
      before { request.host = custom_host }

      it 'redirects to theitskillboard.com' do
        get :about
        skip "Implement check and redirect"
      end
    end

  end

  describe "GET about" do

    context "when regular domain" do
      it 'has a 200 status code' do
        get :about
        expect(response).to be_success
      end
    end

    context "when custom domain" do
      before { request.host = custom_host }

      it 'redirects to theitskillboard.com' do
        get :about
        skip "Implement check and redirect"
      end
    end

  end

  describe "GET contact" do

    context "when regular domain" do
      it 'has a 200 status code' do
        get :contact
        expect(response).to be_success
      end
    end

    context "when custom domain" do
      before { request.host = custom_host }

      it 'redirects to theitskillboard.com' do
        get :about
        skip "Implement check and redirect"
      end
    end

  end
  
end