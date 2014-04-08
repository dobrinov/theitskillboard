# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load application configuration
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

# Load Mandrill mail delivery configuration
MANDRILL = YAML.load_file("#{Rails.root}/config/mandrill.yml")[Rails.env]

# Initialize the Rails application.
Theitskillboard::Application.initialize!