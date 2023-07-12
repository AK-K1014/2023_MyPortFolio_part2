class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @categories = Category.includes(:skills).all
  end
end