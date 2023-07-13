class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create]

  def index
    @categories = Category.includes(:skills).all
  end

  def new
    @category = Category.find_by(params[:id])
  end

  def create
    @category = Category.find_by(id: params[:skill][:category_id])
    @skills = @category.skills.build(skill_params.merge(user_id: current_user.id))
    if @skills.save
      redirect_to skills_index_path(@category)
      flash.now[:success] = "スキルが追加されました"
    else
      render :new
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level, :category_id)
  end
end