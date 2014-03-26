class CustomDomain
  def initialize
  end
 
  def matches?(request)
    User.where(domain: request.domain).any?
  end
end