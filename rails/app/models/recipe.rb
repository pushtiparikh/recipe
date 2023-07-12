class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :recipeType, presence: true
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
  validates :serving, presence: true
  validates :difficulty, presence: true
  validates :image, presence: true

  MAX_IMAGE_SIZE = 10.megabytes
  before_validation :format_title_description
  validate :correct_image_type
  validate :correct_image_size

  private

    # Validates, Formats description before presisting to db.
    def format_title_description
      if description.present? && title.present?
        self.description = description.strip.capitalize
        self.title = title.strip.capitalize
      end
    end

    def correct_image_type
      if image.attached?
        if !image.content_type.in?(%w[image/jpeg image/png])
          errors.add(:image, 'must be of content types: jpg/jpeg, png')
        end
      end
    end

    def correct_image_size
      if image.attached?
        if image.byte_size > MAX_IMAGE_SIZE
          errors.add(:image, 'is too large, max file size is 10mb')
        end
      end
    end
end
