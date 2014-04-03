describe "CustomDomain" do

  fixtures :users

  describe "GET root_path" do

    context "when regular domain" do
      it 'leads to the landing page' do
        expect(get: root_path).to route_to(controller: "static", action: "landingpage")
      end
    end

    context "when custom domain" do
      let(:domain) { 'custom.host' }

      before { simple_user.update_attributes(domain: domain) }

      it 'leads to the profile page' do
        expect(get: "http://#{domain}#{root_path}").to route_to(controller: "profiles", action: "show")
      end
    end

  end
end