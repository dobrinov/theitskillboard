class Profile::CommonController < ApplicationController
  before_filter :require_authenticated
end