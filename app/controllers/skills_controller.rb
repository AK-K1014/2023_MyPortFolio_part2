class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :create, :update, :delete]
  before_action :set_skill, only: [:update, :destroy]

  def index
    @categories = Category.includes(:skills).all
  end

  def new
    @category = Category.find_by(id: params[:category_id])
  end 

  def create
    @category = Category.find_by(id: params[:skill][:category_id])
    @skills = @category.skills.build(skill_params.merge(user_id: current_user.id))
    if @skills.save
      redirect_to category_skills_path(@category)
      flash.now[:success] = "スキルが追加されました"
    else
      render :new
    end
  end

  def update
    if @skill.update(skill_params)
      flash[:success] = "スキルが更新されました"
      redirect_to index_skill_path
    else
      render :index
    end
  end

  def destroy
    @skill.destroy
    redirect_to index_skill_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :level, :category_id)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end