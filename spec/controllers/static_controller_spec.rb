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

      it 'redirects to regular domain url' do
        get :landingpage
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/")
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

      it 'redirects to regular domain url' do
        get :about
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/about")
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

      it 'redirects to regular domain url' do
        get :contact
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/contact")
      end
    end

  end

  describe "GET bye" do

    context "when regular domain" do
      it 'has a 200 status code' do
        get :bye
        expect(response).to be_success
      end
    end

    context "when custom domain" do
      before { request.host = custom_host }

      it 'redirects to regular domain url' do
        get :bye
        expect(response).to redirect_to("http://#{APP_CONFIG['domain']}/bye")
      end
    end

  end
  
end