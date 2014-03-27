require "spec_helper"

describe ProfilesController do

  before do
    allow(User).to receive(:demo_sample).and_return(simple_user)
  end

  describe "GET show" do

    it "renders a user by id" do
      get :show, { id: simple_user.id }
      expect(response).to be_success
    end

    it "renders a demo user" do
      get :show, { id: 'demo' }
      expect(response).to be_success
    end

  end

end