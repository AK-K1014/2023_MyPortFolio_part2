class User < ApplicationRecord
  has_many :skills
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  # 自己紹介文が存在するかどうかのバリデーションと文字数が200文字以上、800文字以内のバリデーション
  validates :introduction, presence: true, length: { minimum: 200, maximum: 800 }
  # 画像が5MB以上は表示できないバリデーション
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message:   "should be less than 5MB" }
  has_secure_password
end
