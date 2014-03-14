class SitemapsController < ApplicationController

  def index
    respond_to do |format|
      @static_paths = [
        root_path
      ]

      format.xml { render :layout => false }
    end
  end

end