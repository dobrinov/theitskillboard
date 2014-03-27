require 'spec_helper'

describe User do

  context 'when there is no suitable user' do
    before do
      User.destroy_all
    end

    it '.random_demo_user' do
      expect(User.demo_sample).to eq(nil)
    end
  end

end