class Category < ApplicationRecord
  has_many :skills
  validates :category_id, presence: true
end
