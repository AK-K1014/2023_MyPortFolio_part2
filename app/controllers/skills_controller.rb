class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @category = Category.all
    @user = User.find_by(params[:user_id])
    @skill = @user.skills
  end
end