class ProfilesController < ApplicationController

  before_filter :require_login, only: ['show', 'edit', 'update']

  def show
  end

  def edit

    if params[:section].nil? || !valid_edit_sections.include?(params[:section])
      params[:section] = 'allsections'
    end

  end

  def update
  end

  private

  def valid_edit_sections
    [
      'profilepictureandname'
    ]
  end
end