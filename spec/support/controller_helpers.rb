module ControllerHelpers
  def login(user)
    allow(controller).to receive(:current_user).and_return(simple_user)
    session[:current_user_id] = simple_user.id
  end

  def simple_user
    @_simple_user ||= User.where(email: 'simple.user@example.com').first
  end

  def simple_user_two
    @_simple_user_two ||= User.where(email: 'simple.user.two@example.com').first
  end

end

RSpec.configure do |config|
  config.include ControllerHelpers
end