class AddCategoryToSkills < ActiveRecord::Migration[7.0]
  def change
    add_reference :skills, :category, foreign_key: true
  end
end
