class SitemapsController < ApplicationController

  def index
    respond_to do |format|
      @static_paths = [
        root_path,
        about_path
      ]

      @users = User.all

      format.xml { render :layout => false }
    end
  end

end